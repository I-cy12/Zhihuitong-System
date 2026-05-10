package com.zhihuitong.agent.dto;

import lombok.Data;

/**
 * 文章索引请求 DTO
 */
@Data
public class ArticleIndexDTO {
    private String articleId;
    private String title;
    private String content;
}
