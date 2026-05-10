package com.zhihuitong.agent.dto;

import lombok.Data;

/**
 * AI 聊天请求
 */
@Data
public class ChatRequest {
    /** 用户消息 */
    private String message;

    /** 客户端会话 ID（可选，不传则由服务端生成） */
    private String threadId;

    /** 用户 ID（可选，不传则从 Token 中解析） */
    private Long userId;
}
