<template>
  <div class="chat-container">
    <!-- 头部 -->
    <div class="chat-header">
      <div class="header-left">
        <div class="ai-avatar">
          <el-icon><ChatDotRound /></el-icon>
        </div>
        <div class="header-info">
          <div class="title">AI 助手</div>
          <div class="status">在线</div>
        </div>
      </div>
      <el-button :icon="Refresh" circle size="small" @click="handleNewChat" title="新对话" />
    </div>

    <!-- 消息区域 -->
    <div class="chat-messages" ref="messagesRef">
      <!-- 欢迎屏幕 -->
      <div v-if="messages.length === 0" class="welcome-screen">
        <div class="welcome-avatar">
          <el-icon :size="32"><ChatDotRound /></el-icon>
        </div>
        <div class="welcome-title">你好，我是 AI 助手</div>
        <div class="welcome-subtitle">有什么我可以帮你的？</div>
        <div class="welcome-chips">
          <div
            v-for="chip in welcomeChips"
            :key="chip"
            class="chat-chip"
            @click="sendMessage(chip)"
          >
            {{ chip }}
          </div>
        </div>
      </div>

      <!-- 消息列表 -->
      <template v-for="msg in messages" :key="msg.id">
        <div class="message-row" :class="msg.role">
          <!-- AI 头像 -->
          <div v-if="msg.role === 'assistant'" class="message-avatar ai">
            <el-icon><ChatDotRound /></el-icon>
          </div>

          <!-- 消息气泡 -->
          <div class="message-bubble">
            <!-- 打字机效果：正在打字的消息 -->
            <div v-if="msg.id === typingMessageId" class="message-content">
              <span class="chat-markdown" v-html="renderMarkdown(displayedText)"></span>
              <span class="typing-cursor"></span>
            </div>
            <!-- 已完成的消息 -->
            <div v-else class="message-content">
              <span class="chat-markdown" v-html="renderMarkdown(msg.content)"></span>
            </div>

            <!-- 复制按钮（AI 消息） -->
            <span
              v-if="msg.role === 'assistant' && msg.id !== typingMessageId"
              class="copy-btn"
              @click="handleCopy(msg.content)"
              title="复制"
            >
              <el-icon><CopyDocument /></el-icon>
            </span>

            <!-- 建议标签 -->
            <div v-if="msg.suggestions?.length" class="suggestions">
              <el-tag
                v-for="s in msg.suggestions"
                :key="s"
                class="suggestion-tag"
                type="info"
                effect="plain"
                round
                @click="sendMessage(s)"
              >
                {{ s }}
              </el-tag>
            </div>
          </div>

          <!-- 用户头像 -->
          <div v-if="msg.role === 'user'" class="message-avatar user">
            <el-icon><User /></el-icon>
          </div>
        </div>
      </template>

      <!-- 打字指示器 -->
      <div v-if="waitingForReply" class="message-row assistant">
        <div class="message-avatar ai">
          <el-icon><ChatDotRound /></el-icon>
        </div>
        <div class="message-bubble">
          <div class="typing-indicator">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
          </div>
        </div>
      </div>
    </div>

    <!-- 输入区域 -->
    <div class="chat-input-area" @mousedown.capture="focusInput">
      <div class="input-wrapper">
        <el-input
          ref="inputRef"
          class="chat-textarea"
          v-model="inputText"
          type="textarea"
          rows="1"
          placeholder="输入消息..."
          @keydown.enter.exact.prevent="handleSend"
          :disabled="streaming"
        />
        <el-button
          class="send-btn"
          type="primary"
          :icon="Promotion"
          :disabled="!inputText.trim() || streaming"
          @click="handleSend"
        />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, nextTick, watch } from 'vue'
import { ChatDotRound, Refresh, Promotion, User, CopyDocument } from '@element-plus/icons-vue'
import { ElMessage, ElInput } from 'element-plus'
import { marked } from 'marked'
import hljs from 'highlight.js'
import 'highlight.js/styles/github-dark.css'
import { streamChat, deleteMemory, getHistory } from '@/api/agent/chat'
import useUserStore from '@/store/modules/user'
import type { ChatMessage, ChatResponse } from '@/types'
import './styles.scss'

// ── 配置 marked ──
marked.setOptions({
  breaks: true,
  gfm: true
})

const renderer = new marked.Renderer()
renderer.code = ({ text, lang }: { text: string; lang?: string }) => {
  const language = lang && hljs.getLanguage(lang) ? lang : 'plaintext'
  const highlighted = hljs.highlight(text, { language }).value
  return `<pre><code class="hljs language-${language}">${highlighted}</code></pre>`
}
marked.use({ renderer })

function renderMarkdown(text: string): string {
  const clean = text.replace(/\n+$/, '')
  return (marked.parse(clean) as string).trim()
}

// ── 状态 ──
const userStore = useUserStore()
const messagesRef = ref<HTMLElement>()
const inputRef = ref<InstanceType<typeof ElInput>>()
const inputText = ref('')
const streaming = ref(false)
const waitingForReply = ref(false)
const messages = ref<ChatMessage[]>([])
const threadId = ref('')
const typingMessageId = ref<string | null>(null)
const displayedText = ref('')
const abortController = ref<AbortController | null>(null)

const welcomeChips = ['你好，介绍一下自己', '帮我看看课程安排', '有什么学习建议？']

function focusInput() {
  setTimeout(() => {
    const textarea = inputRef.value?.$el?.querySelector('textarea')
    if (textarea) textarea.focus()
  }, 0)
}

// ── 会话管理 ──
function getSessionKey(): string {
  return `chat_session_user_${userStore.id || 'anonymous'}`
}

function loadSession() {
  const saved = localStorage.getItem(getSessionKey())
  if (saved) {
    try {
      const data = JSON.parse(saved)
      threadId.value = data.threadId || ''
      messages.value = data.messages || []
    } catch {
      initSession()
    }
  } else {
    initSession()
  }
}

function saveSession() {
  localStorage.setItem(getSessionKey(), JSON.stringify({
    threadId: threadId.value,
    messages: messages.value
  }))
}

function initSession() {
  threadId.value = crypto.randomUUID()
  messages.value = []
  saveSession()
}

// ── 打字机效果（支持从指定位置继续） ──
function typewriterEffect(text: string, startIndex: number, onComplete: () => void) {
  let index = startIndex
  const speed = 18
  const charsPerTick = 2

  const timer = setInterval(() => {
    if (index < text.length) {
      index = Math.min(index + charsPerTick, text.length)
      displayedText.value = text.substring(0, index)
      scrollToBottom()
    } else {
      clearInterval(timer)
      onComplete()
    }
  }, speed)

  return timer
}

// ── 发送消息 ──
function handleSend() {
  const text = inputText.value.trim()
  if (!text || streaming.value) return
  inputText.value = ''
  sendMessage(text)
}

async function sendMessage(text: string) {
  // 添加用户消息
  const userMsg: ChatMessage = {
    id: crypto.randomUUID(),
    role: 'user',
    content: text,
    timestamp: Date.now()
  }
  messages.value.push(userMsg)
  saveSession()
  scrollToBottom()

  // 开始流式请求
  streaming.value = true
  waitingForReply.value = true
  abortController.value = new AbortController()

  const assistantMsg: ChatMessage = {
    id: crypto.randomUUID(),
    role: 'assistant',
    content: '',
    timestamp: Date.now()
  }

  let fullText = ''
  let typewriterTimer: ReturnType<typeof setInterval> | null = null

  try {
    await streamChat(
      text,
      (resp: ChatResponse) => {
        if (resp.code === 200 && typeof resp.data === 'string') {
          // 文本块
          if (waitingForReply.value) {
            waitingForReply.value = false
            typingMessageId.value = assistantMsg.id
            displayedText.value = ''
            messages.value.push(assistantMsg)
          }

          // 记录当前已显示的字符数，用于打字机继续
          const currentLength = displayedText.value.length

          // 停止之前的打字机
          if (typewriterTimer) {
            clearInterval(typewriterTimer)
          }

          fullText += resp.data

          typewriterTimer = typewriterEffect(fullText, currentLength, () => {
            assistantMsg.content = fullText
            typewriterTimer = null
            saveSession()
          })
        } else if (resp.code === 201 && Array.isArray(resp.data)) {
          // 建议问题
          assistantMsg.suggestions = resp.data as string[]
          saveSession()
        } else if (resp.msg) {
          // 错误消息
          if (waitingForReply.value) {
            waitingForReply.value = false
          }
          assistantMsg.content += resp.msg
          messages.value.push(assistantMsg)
          saveSession()
        }
      },
      threadId.value,
      userStore.id,
      abortController.value.signal
    )
  } catch (e: any) {
    if (e.name !== 'AbortError') {
      console.error('聊天请求异常:', e)
      if (!assistantMsg.content) {
        assistantMsg.content = '请求失败，请稍后重试。'
        messages.value.push(assistantMsg)
      }
    }
  } finally {
    if (typewriterTimer) clearInterval(typewriterTimer)
    if (fullText) {
      assistantMsg.content = fullText
    }
    typingMessageId.value = null
    streaming.value = false
    waitingForReply.value = false
    abortController.value = null
    saveSession()
    scrollToBottom()
    // 延迟聚焦输入框，确保 DOM 更新完成后再聚焦
    setTimeout(() => {
      const textarea = inputRef.value?.$el?.querySelector('textarea')
      if (textarea) {
        textarea.focus()
      }
    }, 50)
  }
}

// ── 新对话 ──
async function handleNewChat() {
  if (streaming.value) {
    abortController.value?.abort()
  }
  if (threadId.value && messages.value.length > 0) {
    try {
      await deleteMemory(threadId.value)
    } catch { /* 忽略 */ }
  }
  initSession()
}

// ── 复制 ──
async function handleCopy(content: string) {
  try {
    await navigator.clipboard.writeText(content)
    ElMessage.success('已复制')
  } catch {
    ElMessage.warning('复制失败')
  }
}

// ── 滚动 ──
function scrollToBottom() {
  nextTick(() => {
    if (messagesRef.value) {
      messagesRef.value.scrollTop = messagesRef.value.scrollHeight
    }
  })
}

// ── 历史加载 ──
async function loadHistory() {
  if (!threadId.value || messages.value.length > 0) return
  try {
    const history = await getHistory(threadId.value)
    if (history.length > 0) {
      messages.value = history.map((h, i) => ({
        id: `history_${i}`,
        role: h.role as 'user' | 'assistant',
        content: h.content,
        timestamp: h.created_at ? new Date(h.created_at).getTime() : undefined
      }))
      saveSession()
      scrollToBottom()
    }
  } catch {
    /* 无历史 */
  }
}

// ── 生命周期 ──
onMounted(() => {
  loadSession()
  loadHistory()
})
</script>
