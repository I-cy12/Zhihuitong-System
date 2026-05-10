package com.zhihuitong.agent.service;

import com.zhihuitong.agent.dto.AiConfigDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;
import java.util.List;
import java.util.Map;

/**
 * AI 配置服务 — 代理转发配置请求到 Python 服务
 */
@Slf4j
@Service
public class AgentConfigService {

    private final WebClient webClient;

    public AgentConfigService(@Qualifier("agentWebClient") WebClient webClient) {
        this.webClient = webClient;
    }

    /**
     * 获取 AI 服务配置
     */
    public String getConfig() {
        return webClient.get()
                .uri("/config")
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 更新 AI 服务配置
     */
    public String updateConfig(AiConfigDTO config) {
        return webClient.put()
                .uri("/config")
                .bodyValue(config)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 获取活跃会话列表
     */
    public String getActiveThreads() {
        return webClient.get()
                .uri("/chat/threads")
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 清除所有会话记忆
     */
    public String clearAllMemory() {
        return webClient.delete()
                .uri("/chat/memory")
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 删除单个会话
     */
    public String deleteThread(String threadId) {
        return webClient.delete()
                .uri("/chat/thread/{threadId}", threadId)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }
}
