import request from '@/utils/request'

// AI 服务状态
export interface AiStatus {
  enabled: boolean
  maxConcurrency: number
  activeConnections: number
  totalRequests: number
  message: string
}

// AI 配置
export interface AiConfig {
  llm_api_key: string
  llm_base_url: string
  llm_model: string
  chunk_size: number
  chunk_overlap: number
  system_prompt: string
}

// 并发设置
export interface ConcurrencyDTO {
  maxConcurrency: number
}

// 活跃会话
export interface ActiveThread {
  thread_id: string
  username: string
  last_access: number
  expires_in: number
}

// 统计信息
export interface AiStats {
  enabled: boolean
  totalRequests: number
  activeConnections: number
  maxConcurrency: number
  activeThreads: ActiveThread[]
}

// RAG 索引结果
export interface RagIndexResult {
  total: number
  indexed: number
  skipped: number
  failed: number
}

/**
 * 获取 AI 服务状态
 */
export function getAiStatus() {
  return request<AiStatus>({
    url: '/agent/manage/status',
    method: 'get'
  })
}

/**
 * 切换 AI 服务状态
 */
export function toggleAiStatus(enabled?: boolean) {
  return request<string>({
    url: '/agent/manage/status',
    method: 'put',
    params: { enabled }
  })
}

/**
 * 获取并发设置
 */
export function getConcurrency() {
  return request<ConcurrencyDTO>({
    url: '/agent/manage/concurrency',
    method: 'get'
  })
}

/**
 * 设置最大并发数
 */
export function setConcurrency(data: ConcurrencyDTO) {
  return request<string>({
    url: '/agent/manage/concurrency',
    method: 'put',
    data
  })
}

/**
 * 获取 AI 配置
 */
export function getAiConfig() {
  return request<string>({
    url: '/agent/manage/config',
    method: 'get'
  })
}

/**
 * 更新 AI 配置
 */
export function updateAiConfig(data: AiConfig) {
  return request<string>({
    url: '/agent/manage/config',
    method: 'put',
    data
  })
}

/**
 * 获取综合统计信息
 */
export function getAiStats() {
  return request<AiStats>({
    url: '/agent/manage/stats',
    method: 'get'
  })
}

/**
 * 获取活跃会话列表
 */
export function getActiveThreads() {
  return request<string>({
    url: '/agent/manage/threads',
    method: 'get'
  })
}

/**
 * 清除所有会话记忆
 */
export function clearAllMemory() {
  return request<string>({
    url: '/agent/manage/memory',
    method: 'delete'
  })
}

/**
 * 删除单个会话
 */
export function deleteThread(threadId: string) {
  return request<string>({
    url: `/agent/manage/thread/${threadId}`,
    method: 'delete'
  })
}

/**
 * RAG 全量重建索引
 */
export function reindexAll() {
  return request<RagIndexResult>({
    url: '/agent/rag/index/all',
    method: 'post'
  })
}

/**
 * 从 Java 后端索引校园知识库
 */
export function indexKnowledge() {
  return request<RagIndexResult>({
    url: '/agent/rag/index/knowledge',
    method: 'post'
  })
}
