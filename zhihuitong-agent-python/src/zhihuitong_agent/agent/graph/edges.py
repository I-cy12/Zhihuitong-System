# 条件路由 — 三路分类：普通聊天 / 知识库相关 / 外部知识
def route_after_classify(state) -> str:
    route_type = state.get("route_type", "normal_chat")
    if route_type == "knowledge_info":
        return "retrieve"
    if route_type == "knowledge_search":
        return "retrieve_and_search"
    return "llm"
