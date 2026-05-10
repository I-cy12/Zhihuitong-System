/**
 * AI 聊天相关类型
 */

export interface ChatMessage {
  id: string
  role: 'user' | 'assistant'
  content: string
  timestamp?: number
  suggestions?: string[]
}

export interface ChatResponse {
  code: number
  msg: string
  data?: string | string[]
}
