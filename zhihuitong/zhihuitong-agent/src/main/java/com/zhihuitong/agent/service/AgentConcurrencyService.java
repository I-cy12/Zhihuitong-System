package com.zhihuitong.agent.service;

import org.springframework.stereotype.Service;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * AI 并发控制服务
 */
@Service
public class AgentConcurrencyService {

    private final AtomicInteger maxConcurrency = new AtomicInteger(5);
    private final AtomicInteger activeCount = new AtomicInteger(0);

    /**
     * 尝试获取并发许可（非阻塞）
     *
     * @return true 获取成功，false 已达上限
     */
    public boolean tryAcquire() {
        int current = activeCount.get();
        int max = maxConcurrency.get();
        while (current < max) {
            if (activeCount.compareAndSet(current, current + 1)) {
                return true;
            }
            current = activeCount.get();
        }
        return false;
    }

    /**
     * 释放并发许可
     */
    public void release() {
        activeCount.decrementAndGet();
    }

    /**
     * 获取当前活跃连接数
     */
    public int getActiveCount() {
        return activeCount.get();
    }

    /**
     * 获取最大并发数
     */
    public int getMaxConcurrency() {
        return maxConcurrency.get();
    }

    /**
     * 设置最大并发数
     */
    public void setMaxConcurrency(int max) {
        if (max < 1) {
            throw new IllegalArgumentException("最大并发数必须 >= 1");
        }
        this.maxConcurrency.set(max);
    }
}
