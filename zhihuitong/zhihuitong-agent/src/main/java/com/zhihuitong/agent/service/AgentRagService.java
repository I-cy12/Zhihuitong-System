package com.zhihuitong.agent.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;
import java.util.List;
import java.util.Map;

/**
 * RAG 索引服务 — 代理转发 RAG 请求到 Python 服务
 */
@Slf4j
@Service
public class AgentRagService {

    private final WebClient webClient;

    public AgentRagService(@Qualifier("agentWebClient") WebClient webClient) {
        this.webClient = webClient;
    }

    /**
     * 索引单篇文章
     */
    public String indexArticle(String articleId, String title, String content) {
        Map<String, Object> body = Map.of(
                "article_id", articleId,
                "title", title,
                "content", content
        );
        return webClient.post()
                .uri("/rag/index")
                .bodyValue(body)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 删除文章索引
     */
    public String deleteArticleIndex(String articleId) {
        return webClient.delete()
                .uri("/rag/index/{id}", articleId)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 批量重建索引
     */
    public String reindexAll(List<Map<String, Object>> articles) {
        Map<String, Object> body = Map.of("articles", articles);
        return webClient.post()
                .uri("/rag/index/all")
                .bodyValue(body)
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }

    /**
     * 从 Java 后端索引校园知识库
     */
    public String indexKnowledge() {
        return webClient.post()
                .uri("/rag/index/knowledge")
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }
}
