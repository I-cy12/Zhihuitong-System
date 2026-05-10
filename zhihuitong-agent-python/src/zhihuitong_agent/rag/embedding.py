"""自定义 Embedding 函数 — 基于 sentence-transformers，兼容 ChromaDB 接口"""

from zhihuitong_agent.core.logger import get_logger

logger = get_logger(__name__)

# BGE 系列模型的查询前缀，检索时添加以提升效果
BGE_QUERY_INSTRUCTION = "为这个句子生成表示以用于检索中文文档："


class SentenceTransformerEmbeddingFunction:
    """ChromaDB 兼容的 Embedding 函数，支持 sentence-transformers 模型"""

    def __init__(self, model_name: str, device: str = "cpu", trust_remote_code: bool = True):
        from sentence_transformers import SentenceTransformer

        self._model_name = model_name
        self._is_bge = "bge" in model_name.lower()
        logger.info(f"正在加载 Embedding 模型: {model_name} (device={device})")
        self._model = SentenceTransformer(model_name, device=device, trust_remote_code=trust_remote_code)
        logger.info(f"Embedding 模型加载完成: {model_name}, 维度: {self._model.get_embedding_dimension()}")

    def name(self) -> str:
        return self._model_name

    def _embed(self, texts: list[str], is_query: bool = False) -> list[list[float]]:
        if self._is_bge and is_query:
            texts = [BGE_QUERY_INSTRUCTION + t for t in texts]
        embeddings = self._model.encode(texts, normalize_embeddings=True)
        return embeddings.tolist()

    def __call__(self, input: list[str]) -> list[list[float]]:
        return self._embed(input, is_query=False)

    def embed_documents(self, documents: list[str]) -> list[list[float]]:
        return self._embed(documents, is_query=False)

    def embed_query(self, query: str) -> list[float]:
        return self._embed([query], is_query=True)[0]
