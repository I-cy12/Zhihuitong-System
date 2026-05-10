import { getToken } from '@/utils/auth'
import type { ChatResponse } from '@/types'

const baseUrl = import.meta.env.VITE_APP_BASE_API

/**
 * SSE 流式聊天
 */
export function streamChat(
  message: string,
  onChunk: (resp: ChatResponse) => void,
  threadId?: string,
  userId?: string | number,
  signal?: AbortSignal
): Promise<void> {
  return new Promise(async (resolve, reject) => {
    try {
      const token = getToken()
      const resp = await fetch(`${baseUrl}/agent/chat/stream`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token ? `Bearer ${token}` : ''
        },
        body: JSON.stringify({ message, threadId, userId }),
        signal
      })

      if (!resp.ok) {
        reject(new Error(`HTTP ${resp.status}`))
        return
      }

      const reader = resp.body!.getReader()
      const decoder = new TextDecoder('utf-8')
      let buffer = ''

      while (true) {
        const { value, done } = await reader.read()
        if (done) break

        buffer += decoder.decode(value, { stream: true })
        const lines = buffer.split('\n')
        buffer = lines.pop() || ''

        for (const line of lines) {
          // 跳过空行和 SSE 事件名行
          if (!line || line.startsWith('event:') || line.startsWith('id:') || line.startsWith('retry:')) continue
          if (!line.startsWith('data:')) continue

          let data = line.substring(5)
          if (data.startsWith(' ')) data = data.substring(1)
          if (!data || data === '[DONE]') continue

          try {
            const parsed = JSON.parse(data) as ChatResponse
            onChunk(parsed)
          } catch {
            // 非 JSON 数据，忽略
          }
        }
      }
      resolve()
    } catch (e) {
      reject(e)
    }
  })
}

/**
 * 删除会话记忆
 */
export function deleteMemory(threadId: string) {
  return fetch(`${baseUrl}/agent/chat/memory/${threadId}`, {
    method: 'DELETE',
    headers: { 'Authorization': `Bearer ${getToken()}` }
  })
}

/**
 * 获取会话历史
 */
export async function getHistory(threadId: string): Promise<{ role: string; content: string; created_at?: string }[]> {
  const resp = await fetch(`${baseUrl}/agent/chat/history/${threadId}`, {
    headers: { 'Authorization': `Bearer ${getToken()}` }
  })
  const json = await resp.json()
  if (json.code === 200 && json.data) {
    return typeof json.data === 'string' ? JSON.parse(json.data) : json.data
  }
  return []
}
