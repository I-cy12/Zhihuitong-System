package com.zhihuitong.agent.controller;

import com.zhihuitong.agent.dto.ChatRequest;
import com.zhihuitong.agent.service.AgentChatService;
import com.zhihuitong.agent.service.AgentConcurrencyService;
import com.zhihuitong.agent.service.AgentStatusService;
import com.zhihuitong.common.annotation.Log;
import com.zhihuitong.common.core.controller.BaseController;
import com.zhihuitong.common.core.domain.AjaxResult;
import com.zhihuitong.common.core.domain.model.LoginUser;
import com.zhihuitong.common.enums.BusinessType;
import com.zhihuitong.framework.web.service.TokenService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * AI 聊天控制器
 */
@Slf4j
@RestController
@RequestMapping("/agent/chat")
public class AgentChatController extends BaseController {

    @Autowired
    private AgentChatService agentChatService;

    @Autowired
    private AgentConcurrencyService concurrencyService;

    @Autowired
    private AgentStatusService statusService;

    @Autowired
    private TokenService tokenService;

    /**
     * SSE 流式聊天
     */
    @PostMapping(value = "/stream", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<ServerSentEvent<String>> streamChat(@RequestBody ChatRequest request, HttpServletRequest httpRequest) {
        // 检查 AI 服务是否启用
        if (!statusService.isEnabled()) {
            return errorSseEvent(503, "AI 服务已关闭");
        }

        // 获取当前登录用户
        LoginUser loginUser = tokenService.getLoginUser(httpRequest);
        if (loginUser == null) {
            return errorSseEvent(401, "未授权访问");
        }

        // 获取并发许可
        if (!concurrencyService.tryAcquire()) {
            return errorSseEvent(429, "AI 服务繁忙，请稍后重试");
        }

        // 记录统计
        statusService.incrementRequests();
        statusService.incrementConnections();

        // 构建 threadId: user_{userId}_{clientThreadId}
        String username = loginUser.getUsername();
        Long userId = request.getUserId() != null ? request.getUserId() : loginUser.getUserId();
        String clientThreadId = request.getThreadId() != null ? request.getThreadId() : "default";
        String threadId = "user_" + userId + "_" + clientThreadId;

        return agentChatService.streamChat(request.getMessage(), threadId, username)
                .doFinally(signal -> {
                    concurrencyService.release();
                    statusService.decrementConnections();
                });
    }

    /**
     * 删除会话记忆
     */
    @Log(title = "AI 聊天", businessType = BusinessType.DELETE)
    @DeleteMapping("/memory/{threadId}")
    public AjaxResult deleteMemory(@PathVariable String threadId, HttpServletRequest httpRequest) {
        LoginUser loginUser = tokenService.getLoginUser(httpRequest);
        if (loginUser == null) {
            return error("未授权访问");
        }
        String fullThreadId = "user_" + loginUser.getUserId() + "_" + threadId;
        String result = agentChatService.deleteMemory(fullThreadId);
        return success(result);
    }

    /**
     * 获取会话历史
     */
    @GetMapping("/history/{threadId}")
    public AjaxResult getHistory(@PathVariable String threadId, HttpServletRequest httpRequest) {
        LoginUser loginUser = tokenService.getLoginUser(httpRequest);
        if (loginUser == null) {
            return error("未授权访问");
        }
        String fullThreadId = "user_" + loginUser.getUserId() + "_" + threadId;
        String result = agentChatService.getHistory(fullThreadId);
        return success(result);
    }

    /**
     * 构建错误 SSE 事件流（单个事件后完成）
     */
    private Flux<ServerSentEvent<String>> errorSseEvent(int code, String msg) {
        ServerSentEvent<String> event = ServerSentEvent.<String>builder()
                .event("error")
                .data("{\"code\":" + code + ",\"msg\":\"" + msg + "\",\"data\":\"\"}")
                .build();
        return Flux.just(event);
    }
}
