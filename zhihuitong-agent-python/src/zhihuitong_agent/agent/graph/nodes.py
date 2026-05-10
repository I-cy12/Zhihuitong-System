"""LangGraph 节点工厂 — 分类 / RAG 检索 / LLM 调用 / 记忆压缩 / 联网搜索 / 推荐问题"""

import re

from langchain_core.messages import HumanMessage, RemoveMessage

from zhihuitong_agent.core.logger import get_logger

logger = get_logger(__name__)


def _extract_query(state) -> str:
    """从消息列表中提取最后一条用户消息"""
    for msg in reversed(state.get("messages", [])):
        if isinstance(msg, HumanMessage):
            return msg.content if isinstance(msg.content, str) else str(msg.content)
    return ""


def make_classify_node(chat_agent):
    """返回 classify_node：委托 ChatAgent 判断路由类型"""

    async def classify_node(state):
        query = _extract_query(state)
        route_type = await chat_agent.classify(query) if query else "normal_chat"
        logger.info(f"路由分类: route_type={route_type}, query={query[:50] if query else 'N/A'}")
        return {"route_type": route_type}

    return classify_node


def make_retrieve_node(rag_agent):
    """返回 retrieve_node：委托 RagAgent 执行 RAG 检索"""

    async def retrieve_node(state):
        query = _extract_query(state)
        if not query:
            return {"rag_context": "", "rag_sources": []}
        rag_context, rag_sources = await rag_agent.retrieve(query)
        return {"rag_context": rag_context, "rag_sources": rag_sources}

    return retrieve_node


def make_retrieve_and_search_node(rag_agent, search_agent):
    """返回 retrieve_and_search_node：同时执行 RAG 检索和联网搜索"""

    async def retrieve_and_search_node(state):
        query = _extract_query(state)
        if not query:
            return {"rag_context": "", "rag_sources": [], "search_results": ""}

        # 并行执行 RAG 和联网搜索
        import asyncio
        rag_task = rag_agent.retrieve(query)
        search_task = search_agent.run(query)

        (rag_context, rag_sources), search_results = await asyncio.gather(
            rag_task, search_task, return_exceptions=True
        )

        if isinstance(rag_context, Exception):
            logger.warning(f"RAG 检索失败: {rag_context}")
            rag_context, rag_sources = "", []
        if isinstance(search_results, Exception):
            logger.warning(f"联网搜索失败: {search_results}")
            search_results = ""

        return {
            "rag_context": rag_context,
            "rag_sources": rag_sources,
            "search_results": search_results,
        }

    return retrieve_and_search_node


def make_llm_node(chat_agent):
    """返回 llm_node：委托 ChatAgent 组装上下文并调用 LLM"""

    async def llm_node(state):
        from langchain_core.messages import AIMessage
        context_messages = chat_agent.build_context_messages(state)

        try:
            collected = None
            async for chunk in chat_agent.llm.astream(context_messages):
                if collected is None:
                    collected = chunk
                else:
                    collected = collected + chunk
            return {"messages": [collected]}
        except Exception as e:
            logger.error(f"LLM 调用失败: {e}")
            return {"messages": [AIMessage(content=f"抱歉，AI 服务连接失败，请稍后重试。错误: {str(e)}")]}

    return llm_node


def make_suggest_node(chat_agent):
    """返回 suggest_node：根据对话上下文生成推荐问题"""

    async def suggest_node(state):
        query = _extract_query(state)

        # 取最后一条 AI 回复
        ai_answer = ""
        for msg in reversed(state.get("messages", [])):
            if hasattr(msg, "content") and not isinstance(msg, HumanMessage):
                ai_answer = msg.content if isinstance(msg.content, str) else str(msg.content)
                break

        if not query or not ai_answer:
            return {"suggestions": []}

        suggestions = await chat_agent.generate_suggestions(query, ai_answer)
        logger.info(f"生成推荐问题: {suggestions}")
        return {"suggestions": suggestions}

    return suggest_node


def make_summarize_node(chat_agent):
    """返回 summarize_node：超过 16 条消息时委托 ChatAgent 压缩记忆"""

    async def summarize_node(state):
        messages = state.get("messages", [])
        if len(messages) <= 16:
            return {}

        old_messages = messages[:-16]
        old_summary = state.get("summary", "")

        new_summary = await chat_agent.generate_summary(old_messages, old_summary)

        remove_ops = [RemoveMessage(id=m.id) for m in old_messages]
        return {"messages": remove_ops, "summary": new_summary}

    return summarize_node



