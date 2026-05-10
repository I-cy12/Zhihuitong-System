package com.zhihuitong.agent.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * AI 服务配置 DTO（映射 Python 端的配置项）
 */
@Data
public class AiConfigDTO {
    @JsonProperty("llm_api_key")
    private String llmApiKey;

    @JsonProperty("llm_base_url")
    private String llmBaseUrl;

    @JsonProperty("llm_model")
    private String llmModel;

    @JsonProperty("chunk_size")
    private Integer chunkSize;

    @JsonProperty("chunk_overlap")
    private Integer chunkOverlap;

    @JsonProperty("system_prompt")
    private String systemPrompt;
}
