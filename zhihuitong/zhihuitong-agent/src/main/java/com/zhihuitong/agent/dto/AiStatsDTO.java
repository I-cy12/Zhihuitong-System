package com.zhihuitong.agent.dto;

import lombok.Data;
import java.util.List;
import java.util.Map;

/**
 * AI 服务统计 DTO
 */
@Data
public class AiStatsDTO {
    private Long totalRequests;
    private Integer activeConnections;
    private Integer maxConcurrency;
    private Boolean enabled;
    private List<Map<String, Object>> activeThreads;
}
