package com.zhihuitong.agent.controller;

import com.zhihuitong.agent.dto.AiConfigDTO;
import com.zhihuitong.agent.dto.AiStatsDTO;
import com.zhihuitong.agent.dto.AiStatusDTO;
import com.zhihuitong.agent.dto.ConcurrencyDTO;
import com.zhihuitong.agent.service.AgentConcurrencyService;
import com.zhihuitong.agent.service.AgentConfigService;
import com.zhihuitong.agent.service.AgentStatusService;
import com.zhihuitong.common.annotation.Log;
import com.zhihuitong.common.core.controller.BaseController;
import com.zhihuitong.common.core.domain.AjaxResult;
import com.zhihuitong.common.enums.BusinessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * AI 管理控制器（管理员使用）
 */
@RestController
@RequestMapping("/agent/manage")
public class AgentManageController extends BaseController {

    @Autowired
    private AgentStatusService statusService;

    @Autowired
    private AgentConcurrencyService concurrencyService;

    @Autowired
    private AgentConfigService configService;

    /**
     * 获取 AI 服务状态
     */
    @GetMapping("/status")
    public AjaxResult getStatus() {
        AiStatusDTO status = new AiStatusDTO();
        status.setEnabled(statusService.isEnabled());
        status.setMaxConcurrency(concurrencyService.getMaxConcurrency());
        status.setActiveConnections((int) statusService.getActiveConnections());
        status.setTotalRequests(statusService.getTotalRequests());
        status.setMessage(statusService.isEnabled() ? "AI 服务运行中" : "AI 服务已关闭");
        return success(status);
    }

    /**
     * 切换 AI 服务开关
     */
    @Log(title = "AI 管理", businessType = BusinessType.UPDATE)
    @PutMapping("/status")
    public AjaxResult toggleStatus(@RequestParam(required = false) Boolean enabled) {
        if (enabled != null) {
            statusService.setEnabled(enabled);
        } else {
            statusService.toggleEnabled();
        }
        return success(statusService.isEnabled() ? "AI 服务已开启" : "AI 服务已关闭");
    }

    /**
     * 获取并发设置
     */
    @GetMapping("/concurrency")
    public AjaxResult getConcurrency() {
        ConcurrencyDTO dto = new ConcurrencyDTO();
        dto.setMaxConcurrency(concurrencyService.getMaxConcurrency());
        return success(dto);
    }

    /**
     * 设置最大并发数
     */
    @Log(title = "AI 管理", businessType = BusinessType.UPDATE)
    @PutMapping("/concurrency")
    public AjaxResult setConcurrency(@RequestBody ConcurrencyDTO dto) {
        concurrencyService.setMaxConcurrency(dto.getMaxConcurrency());
        return success("最大并发数已设置为 " + dto.getMaxConcurrency());
    }

    /**
     * 获取 AI 服务配置（从 Python 服务）
     */
    @GetMapping("/config")
    public AjaxResult getConfig() {
        try {
            String config = configService.getConfig();
            return success(config);
        } catch (Exception e) {
            return error("获取 AI 配置失败: " + e.getMessage());
        }
    }

    /**
     * 更新 AI 服务配置（热更新到 Python 服务）
     */
    @Log(title = "AI 配置", businessType = BusinessType.UPDATE)
    @PutMapping("/config")
    public AjaxResult updateConfig(@RequestBody AiConfigDTO config) {
        try {
            String result = configService.updateConfig(config);
            return AjaxResult.success("AI 配置已更新", result);
        } catch (Exception e) {
            return error("更新 AI 配置失败: " + e.getMessage());
        }
    }

    /**
     * 获取综合统计信息
     */
    @GetMapping("/stats")
    public AjaxResult getStats() {
        AiStatsDTO stats = new AiStatsDTO();
        stats.setEnabled(statusService.isEnabled());
        stats.setTotalRequests(statusService.getTotalRequests());
        stats.setActiveConnections((int) statusService.getActiveConnections());
        stats.setMaxConcurrency(concurrencyService.getMaxConcurrency());
        try {
            String threads = configService.getActiveThreads();
            com.alibaba.fastjson2.JSONObject json = com.alibaba.fastjson2.JSON.parseObject(threads);
            com.alibaba.fastjson2.JSONArray arr = json.getJSONArray("data");
            java.util.List<java.util.Map<String, Object>> threadList = new java.util.ArrayList<>();
            if (arr != null) {
                for (int i = 0; i < arr.size(); i++) {
                    threadList.add(arr.getJSONObject(i));
                }
            }
            stats.setActiveThreads(threadList);
        } catch (Exception e) {
            stats.setActiveThreads(java.util.Collections.emptyList());
        }
        return success(stats);
    }

    /**
     * 获取活跃会话列表
     */
    @GetMapping("/threads")
    public AjaxResult getThreads() {
        try {
            return success(configService.getActiveThreads());
        } catch (Exception e) {
            return error("获取会话列表失败: " + e.getMessage());
        }
    }

    /**
     * 清除所有会话记忆
     */
    @Log(title = "AI 管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/memory")
    public AjaxResult clearAllMemory() {
        try {
            String result = configService.clearAllMemory();
            return AjaxResult.success("所有会话记忆已清除", result);
        } catch (Exception e) {
            return error("清除失败: " + e.getMessage());
        }
    }

    /**
     * 删除单个会话
     */
    @Log(title = "AI 管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/thread/{threadId}")
    public AjaxResult deleteThread(@PathVariable String threadId) {
        try {
            String result = configService.deleteThread(threadId);
            return AjaxResult.success("会话已删除", result);
        } catch (Exception e) {
            return error("删除失败: " + e.getMessage());
        }
    }
}
