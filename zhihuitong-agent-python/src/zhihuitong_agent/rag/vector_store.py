"""ChromaDB 向量存储 — 管理子块的嵌入、存储和检索"""

import asyncio

import chromadb

from zhihuitong_agent.core.settings import settings
from zhihuitong_agent.core.logger import get_logger
from zhihuitong_agent.rag.embedding import SentenceTransformerEmbeddingFunction

logger = get_logger(__name__)

COLLECTION_NAME = "zhihuitong_articles"


def _build_embedding_fn() -> SentenceTransformerEmbeddingFunction:
    return SentenceTransformerEmbeddingFunction(
        model_name=settings.embedding_model,
        device=settings.embedding_device,
    )


class VectorStore:
    def __init__(self, persist_dir: str | None = None):
        self.persist_dir = persist_dir or settings.vector_store_path
        self.client = chromadb.PersistentClient(path=self.persist_dir)
        self.embedding_fn = _build_embedding_fn()
        self._init_collection()

    def _init_collection(self):
        try:
            self.collection = self.client.get_collection(
                name=COLLECTION_NAME,
                embedding_function=self.embedding_fn,
            )
            # 检查维度兼容性：如果集合中有数据，尝试一次查询验证
            if self.collection.count() > 0:
                try:
                    self.collection.query(query_texts=["test"], n_results=1)
                except Exception as dim_err:
                    logger.warning(f"Embedding 模型维度不匹配，将重建集合: {dim_err}")
                    self._recreate_collection()
        except Exception as e:
            if "embedding function" in str(e).lower() or "conflict" in str(e).lower():
                logger.warning(f"Embedding 函数冲突，将重建集合: {e}")
                self._recreate_collection()
            else:
                # 集合不存在，新建
                self.collection = self.client.get_or_create_collection(
                    name=COLLECTION_NAME,
                    metadata={"hnsw:space": "cosine"},
                    embedding_function=self.embedding_fn,
                )
                logger.info(f"VectorStore 新建集合: {COLLECTION_NAME}")

        logger.info(
            f"VectorStore 就绪: dir={self.persist_dir}, "
            f"model={settings.embedding_model}, "
            f"collection={COLLECTION_NAME}, count={self.collection.count()}"
        )

    def _recreate_collection(self):
        try:
            self.client.delete_collection(COLLECTION_NAME)
        except Exception:
            pass
        self.collection = self.client.get_or_create_collection(
            name=COLLECTION_NAME,
            metadata={"hnsw:space": "cosine"},
            embedding_function=self.embedding_fn,
        )
        logger.warning(f"集合已重建（旧数据已清除，需重新执行 POST /rag/index/all）")

    def _add_documents_sync(self, documents: list[dict]) -> int:
        if not documents:
            return 0
        ids = [d["chunk_id"] for d in documents]
        contents = [d["page_content"] for d in documents]
        metadatas = [d["metadata"] for d in documents]
        self.collection.upsert(ids=ids, documents=contents, metadatas=metadatas)
        return len(documents)

    async def add_documents(self, documents: list[dict]) -> int:
        return await asyncio.to_thread(self._add_documents_sync, documents)

    def _delete_by_article_id_sync(self, article_id: int):
        self.collection.delete(where={"article_id": article_id})

    async def delete_by_article_id(self, article_id: int):
        await asyncio.to_thread(self._delete_by_article_id_sync, article_id)

    def _similarity_search_sync(self, query: str, k: int) -> list[dict]:
        count = self.collection.count()
        if count == 0:
            return []
        actual_k = min(k, count)
        results = self.collection.query(query_texts=[query], n_results=actual_k)

        docs = []
        for i in range(len(results["ids"][0])):
            docs.append({
                "chunk_id": results["ids"][0][i],
                "page_content": results["documents"][0][i],
                "metadata": results["metadatas"][0][i],
                "distance": results["distances"][0][i] if results.get("distances") else None,
            })
        return docs

    # 按查询相似度检索子块
    # query: 查询文本
    # k: 返回的子块数量，默认5个
    async def similarity_search(self, query: str, k: int = 5) -> list[dict]:
        return await asyncio.to_thread(self._similarity_search_sync, query, k)
