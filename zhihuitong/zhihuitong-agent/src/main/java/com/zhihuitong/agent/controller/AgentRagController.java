package com.zhihuitong.agent.controller;

import com.zhihuitong.agent.dto.ArticleIndexDTO;
import com.zhihuitong.agent.service.AgentRagService;
import com.zhihuitong.common.annotation.Log;
import com.zhihuitong.common.core.controller.BaseController;
import com.zhihuitong.common.core.domain.AjaxResult;
import com.zhihuitong.common.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * RAG 知识库管理控制器
 */
@RestController
@RequestMapping("/agent/rag")
public class AgentRagController extends BaseController {

    @Autowired
    private AgentRagService ragService;

    /**
     * 索引单篇文章
     */
    @Log(title = "RAG 索引", businessType = BusinessType.INSERT)
    @PostMapping("/index")
    public AjaxResult indexArticle(@RequestBody ArticleIndexDTO dto) {
        try {
            String result = ragService.indexArticle(dto.getArticleId(), dto.getTitle(), dto.getContent());
            return AjaxResult.success("文章索引成功", result);
        } catch (Exception e) {
            return error("索引失败: " + e.getMessage());
        }
    }

    /**
     * 删除文章索引
     */
    @Log(title = "RAG 索引", businessType = BusinessType.DELETE)
    @DeleteMapping("/index/{articleId}")
    public AjaxResult deleteIndex(@PathVariable String articleId) {
        try {
            String result = ragService.deleteArticleIndex(articleId);
            return AjaxResult.success("索引已删除", result);
        } catch (Exception e) {
            return error("删除索引失败: " + e.getMessage());
        }
    }

    /**
     * 批量重建索引
     */
    @Log(title = "RAG 索引", businessType = BusinessType.UPDATE)
    @PostMapping("/reindex")
    public AjaxResult reindexAll(@RequestBody List<Map<String, Object>> articles) {
        try {
            String result = ragService.reindexAll(articles);
            return AjaxResult.success("批量索引完成", result);
        } catch (Exception e) {
            return error("批量索引失败: " + e.getMessage());
        }
    }

    /**
     * 从 Java 后端索引校园知识库
     */
    @Log(title = "RAG 索引", businessType = BusinessType.UPDATE)
    @PostMapping("/index/knowledge")
    public AjaxResult indexKnowledge() {
        try {
            String result = ragService.indexKnowledge();
            return AjaxResult.success("知识库索引完成", result);
        } catch (Exception e) {
            return error("知识库索引失败: " + e.getMessage());
        }
    }
}
