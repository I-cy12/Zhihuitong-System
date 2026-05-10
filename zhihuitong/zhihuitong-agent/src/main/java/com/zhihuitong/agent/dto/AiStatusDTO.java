package com.zhihuitong.agent.dto;

import lombok.Data;

/**
 * AI 服务状态 DTO
 */
@Data
public class AiStatusDTO {
    private Boolean enabled;
    private Integer maxConcurrency;
    private Integer activeConnections;
    private Long totalRequests;
    private String message;
}
