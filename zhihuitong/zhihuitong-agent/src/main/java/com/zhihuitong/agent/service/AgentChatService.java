package com.zhihuitong.agent.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Flux;

import java.util.Map;

/**
 * AI 聊天服务 — 代理转发 SSE 流式请求到 Python 服务
 */
@Slf4j
@Service
public class AgentChatService {

    private final WebClient webClient;

    public AgentChatService(@Qualifier("agentWebClient") WebClient webClient) {
        this.webClient = webClient;
    }

    /**
     * 流式转发聊天请求到 Python 服务
     *
     * @param message   用户消息
     * @param threadId  会话 ID
     * @param username  用户名
     * @return SSE 事件流
     */
    public Flux<ServerSentEvent<String>> streamChat(String message, String threadId, String username) {
        Map<String, Object> body = Map.of(
                "message", message,
                "thread_id", threadId,
                "username", username
        );

        return webClient.post()
                .uri("/chat/stream")
                .bodyValue(body)
                .retrieve()
                .bodyToFlux(new ParameterizedTypeReference<ServerSentEvent<String>>() {})
                .onErrorResume(e -> {
                    log.error("AI 聊天流式请求异常: {}", e.getMessage());
                    ServerSentEvent<String> errorEvent = ServerSentEvent.<String>builder()
                            .event("error")
                            .data("{\"code\":500,\"msg\":\"AI 服务异常: " + e.getMessage() + "\",\"data\":\"\"}")
                            .build();
                    return Flux.just(errorEvent);
                });
    }

    /**
     * 删除会话记忆
     */
    public String deleteMemory(String threadId) {
        return webClient.delete()
                .uri("/chat/memory/{threadId}", threadId)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 获取会话历史
     */
    public String getHistory(String threadId) {
        return webClient.get()
                .uri("/chat/history/{threadId}", threadId)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }
}
