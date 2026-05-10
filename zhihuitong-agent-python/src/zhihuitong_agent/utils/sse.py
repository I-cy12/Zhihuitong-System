"""SSE (Server-Sent Events) 格式化工具 — 跨模块通用的流式输出辅助函数"""

import json
from typing import AsyncGenerator, Union

from zhihuitong_agent.core.logger import get_logger

logger = get_logger(__name__)


def format_sse_event(data: dict) -> str:
    """把 dict 序列化为 SSE 格式的 data 行"""
    return f"data: {json.dumps(data, ensure_ascii=False)}\n\n"


def is_sse_event(value: str) -> bool:
    """判断字符串是否已经是 SSE 格式（data: 开头的 JSON）"""
    return value.startswith("data: ")


async def sse_stream(
    generator: AsyncGenerator[Union[str, dict], None],
    error_msg: str = "Stream error",
) -> AsyncGenerator[str, None]:
    """遍历上游 async generator，将每个 chunk 包装为 SSE 事件并 yield，异常时 yield 错误事件

    支持两种 yield 格式：
    - str：普通文本 chunk，包装为 {"code":200,"msg":"success","data":"chunk"}
    - str（SSE 格式）：已是 "data: {...}" 的事件，直接透传
    - dict：原始字典，直接序列化为 SSE 事件
    """
    try:
        async for chunk in generator:
            if isinstance(chunk, dict):
                yield format_sse_event(chunk)
            elif isinstance(chunk, str) and is_sse_event(chunk):
                # 已是 SSE 格式，直接透传
                yield chunk
            else:
                event = {"code": 200, "msg": "success", "data": chunk}
                yield format_sse_event(event)
    except Exception as e:
        logger.error(f"{error_msg}: {e}")
        error = {"code": 500, "msg": str(e), "data": ""}
        yield format_sse_event(error)


def format_suggestions_event(suggestions: list) -> str:
    """将推荐问题列表包装为 SSE 事件（code 201）"""
    data = {"code": 201, "msg": "suggestions", "data": suggestions}
    return format_sse_event(data)
