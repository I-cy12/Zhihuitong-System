<template>
  <div class="agent-manage">
    <!-- 页面标题 -->
    <div class="page-header" :class="{ 'is-visible': headerVisible }">
      <div class="header-content">
        <div class="header-icon">
          <el-icon :size="28"><Cpu /></el-icon>
        </div>
        <div class="header-text">
          <h1>Agent 管理中心</h1>
          <p>监控和管理 AI 服务状态、配置与会话</p>
        </div>
      </div>
      <div class="header-actions">
        <el-button :icon="Refresh" circle @click="refreshAll" :loading="refreshing" />
      </div>
    </div>

    <!-- 主要内容区 -->
    <div class="content-grid">
      <!-- 第一行：服务状态 & 并发控制 & RAG 知识库 -->
      <div class="row triple-row">
        <transition name="card-slide" appear>
          <div v-if="cardsVisible[0]" class="card status-card" :style="{ '--delay': '0.1s' }">
            <div class="card-header">
              <div class="card-title">
                <el-icon class="title-icon"><Monitor /></el-icon>
                <span>服务状态</span>
              </div>
              <div class="status-indicator" :class="{ 'is-active': statusData.enabled }">
                <span class="status-dot"></span>
                <span class="status-text">{{ statusData.enabled ? '运行中' : '已停止' }}</span>
              </div>
            </div>
            <div class="card-body">
              <div class="status-visual">
                <div class="status-circle" :class="{ 'is-active': statusData.enabled }">
                  <el-icon :size="48"><Cpu /></el-icon>
                </div>
                <div class="status-message">{{ statusData.message }}</div>
              </div>
              <div class="status-switch">
                <span class="switch-label">{{ statusData.enabled ? '关闭服务' : '开启服务' }}</span>
                <el-switch
                  v-model="statusData.enabled"
                  :loading="statusLoading"
                  @change="handleStatusChange"
                />
              </div>
            </div>
          </div>
        </transition>

        <transition name="card-slide" appear>
          <div v-if="cardsVisible[1]" class="card concurrency-card" :style="{ '--delay': '0.2s' }">
            <div class="card-header">
              <div class="card-title">
                <el-icon class="title-icon"><Connection /></el-icon>
                <span>并发控制</span>
              </div>
            </div>
            <div class="card-body">
              <div class="concurrency-visual">
                <div class="concurrency-display">
                  <div class="concurrency-number">
                    <animated-number :value="concurrencyData.maxConcurrency" />
                  </div>
                  <div class="concurrency-label">最大并发数</div>
                </div>
              </div>
              <div class="concurrency-control">
                <el-input-number
                  v-model="concurrencyData.maxConcurrency"
                  :min="1"
                  :max="100"
                  size="large"
                  @change="handleConcurrencyChange"
                />
                <el-button
                  type="primary"
                  :loading="concurrencyLoading"
                  @click="saveConcurrency"
                  class="save-btn"
                >
                  保存设置
                </el-button>
              </div>
            </div>
          </div>
        </transition>

        <transition name="card-slide" appear>
          <div v-if="cardsVisible[2]" class="card rag-card" :style="{ '--delay': '0.3s' }">
            <div class="card-header">
              <div class="card-title">
                <el-icon class="title-icon"><Files /></el-icon>
                <span>RAG 知识库</span>
              </div>
            </div>
            <div class="card-body">
              <div class="rag-content">
                <div class="rag-action">
                  <el-button
                    type="primary"
                    size="large"
                    :loading="ragLoading"
                    @click="handleReindex"
                    class="reindex-btn"
                  >
                    <el-icon class="btn-icon"><Refresh /></el-icon>
                    全量重建索引
                  </el-button>
                  <el-button
                    type="success"
                    size="large"
                    :loading="knowledgeLoading"
                    @click="handleIndexKnowledge"
                    class="knowledge-btn"
                  >
                    <el-icon class="btn-icon"><Files /></el-icon>
                    索引校园知识库
                  </el-button>
                  <p class="rag-hint">重建索引将重新处理所有知识库文章</p>
                </div>
                <div v-if="ragResult" class="rag-stats">
                  <div class="rag-stat-item total">
                    <div class="rag-stat-number">{{ ragResult.total }}</div>
                    <div class="rag-stat-label">文章总数</div>
                  </div>
                  <div class="rag-stat-item indexed">
                    <div class="rag-stat-number">{{ ragResult.indexed }}</div>
                    <div class="rag-stat-label">已索引</div>
                  </div>
                  <div class="rag-stat-item skipped">
                    <div class="rag-stat-number">{{ ragResult.skipped }}</div>
                    <div class="rag-stat-label">跳过</div>
                  </div>
                  <div class="rag-stat-item failed">
                    <div class="rag-stat-number">{{ ragResult.failed }}</div>
                    <div class="rag-stat-label">失败</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </transition>
      </div>

      <!-- 第二行：运行统计 -->
      <transition name="card-slide" appear>
        <div v-if="cardsVisible[3]" class="card stats-card" :style="{ '--delay': '0.4s' }">
          <div class="card-header">
            <div class="card-title">
              <el-icon class="title-icon"><DataAnalysis /></el-icon>
              <span>运行统计</span>
            </div>
            <el-button text :icon="Refresh" @click="fetchStats" :loading="statsLoading">
              刷新数据
            </el-button>
          </div>
          <div class="card-body">
            <div class="stats-grid">
              <div class="stat-item requests">
                <div class="stat-icon">
                  <el-icon :size="28"><Lightning /></el-icon>
                </div>
                <div class="stat-content">
                  <div class="stat-value">
                    <animated-number :value="statsData.totalRequests" />
                  </div>
                  <div class="stat-label">累计请求</div>
                </div>
              </div>
              <div class="stat-item connections">
                <div class="stat-icon">
                  <el-icon :size="28"><Connection /></el-icon>
                </div>
                <div class="stat-content">
                  <div class="stat-value">
                    <animated-number :value="statsData.activeConnections" />
                  </div>
                  <div class="stat-label">活跃连接</div>
                </div>
              </div>
              <div class="stat-item sessions">
                <div class="stat-icon">
                  <el-icon :size="28"><ChatDotRound /></el-icon>
                </div>
                <div class="stat-content">
                  <div class="stat-value">
                    <animated-number :value="activeThreads.length" />
                  </div>
                  <div class="stat-label">活跃会话</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </transition>

      <!-- 第三行：模型配置 -->
      <transition name="card-slide" appear>
        <div v-if="cardsVisible[4]" class="card config-card" :style="{ '--delay': '0.5s' }">
          <div class="card-header">
            <div class="card-title">
              <el-icon class="title-icon"><Setting /></el-icon>
              <span>模型配置</span>
            </div>
            <el-tag type="success" size="small" effect="plain">热更新</el-tag>
          </div>
          <div class="card-body">
            <el-form :model="configData" label-position="top" class="config-form">
              <div class="form-row">
                <el-form-item label="模型名称" class="form-item">
                  <el-input v-model="configData.llm_model" placeholder="例如: gpt-4" />
                </el-form-item>
                <el-form-item label="API 地址" class="form-item">
                  <el-input v-model="configData.llm_base_url" placeholder="https://api.openai.com/v1" />
                </el-form-item>
              </div>
              <el-form-item label="API 密钥">
                <el-input
                  v-model="configData.llm_api_key"
                  type="password"
                  show-password
                  placeholder="留空则不更新"
                />
              </el-form-item>
              <el-form-item label="系统提示词">
                <el-input
                  v-model="configData.system_prompt"
                  type="textarea"
                  :rows="4"
                  placeholder="设置 AI 的行为和角色..."
                />
              </el-form-item>
              <el-form-item>
                <el-button
                  type="primary"
                  :loading="configLoading"
                  @click="saveConfig"
                  class="save-config-btn"
                >
                  保存配置
                </el-button>
              </el-form-item>
            </el-form>
          </div>
        </div>
      </transition>

      <!-- 第五行：会话记忆管理 -->
      <transition name="card-slide" appear>
        <div v-if="cardsVisible[5]" class="card sessions-card" :style="{ '--delay': '0.6s' }">
          <div class="card-header">
            <div class="card-title">
              <el-icon class="title-icon"><User /></el-icon>
              <span>会话记忆管理</span>
              <el-badge :value="activeThreads.length" class="thread-badge" />
            </div>
            <el-button
              type="danger"
              text
              :loading="clearLoading"
              @click="handleClearAll"
              :disabled="activeThreads.length === 0"
            >
              清除全部
            </el-button>
          </div>
          <div class="card-body">
            <div v-if="activeThreads.length === 0" class="empty-sessions">
              <el-icon :size="48"><ChatDotRound /></el-icon>
              <p>暂无活跃会话</p>
            </div>
            <div v-else class="sessions-list">
              <transition-group name="session-item">
                <div
                  v-for="thread in activeThreads"
                  :key="thread.thread_id"
                  class="session-item"
                >
                  <div class="session-info">
                    <div class="session-avatar">
                      <el-icon><User /></el-icon>
                    </div>
                    <div class="session-details">
                      <div class="session-user">{{ thread.username }}</div>
                      <div class="session-id">{{ thread.thread_id }}</div>
                    </div>
                  </div>
                  <div class="session-meta">
                    <el-tag type="success" size="small" effect="plain">活跃</el-tag>
                    <span class="session-expires">剩余 {{ formatExpires(thread.expires_in) }}</span>
                  </div>
                  <el-button
                    type="danger"
                    text
                    size="small"
                    :loading="deletingThread === thread.thread_id"
                    @click="handleDeleteThread(thread.thread_id)"
                  >
                    删除
                  </el-button>
                </div>
              </transition-group>
            </div>
          </div>
        </div>
      </transition>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, onUnmounted, watch, h } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import {
  Cpu,
  Monitor,
  Connection,
  DataAnalysis,
  Lightning,
  ChatDotRound,
  Files,
  Refresh,
  Setting,
  User
} from '@element-plus/icons-vue'
import {
  getAiStatus,
  toggleAiStatus,
  getConcurrency,
  setConcurrency,
  getAiConfig,
  updateAiConfig,
  getAiStats,
  getActiveThreads,
  clearAllMemory,
  deleteThread,
  reindexAll,
  indexKnowledge
} from '@/api/agent/manage'
import type { AiStatus, AiConfig, AiStats, ActiveThread, RagIndexResult } from '@/api/agent/manage'

// 动画数字组件
const AnimatedNumber = {
  props: {
    value: { type: Number, default: 0 }
  },
  setup(props: { value: number }) {
    const displayValue = ref(0)
    const animationFrame = ref<number>()

    const animate = (start: number, end: number) => {
      const duration = 800
      const startTime = performance.now()

      const update = (currentTime: number) => {
        const elapsed = currentTime - startTime
        const progress = Math.min(elapsed / duration, 1)
        const eased = 1 - Math.pow(1 - progress, 3) // easeOutCubic
        displayValue.value = Math.round(start + (end - start) * eased)

        if (progress < 1) {
          animationFrame.value = requestAnimationFrame(update)
        }
      }

      if (animationFrame.value) {
        cancelAnimationFrame(animationFrame.value)
      }
      animationFrame.value = requestAnimationFrame(update)
    }

    watch(() => props.value, (newVal, oldVal) => {
      animate(oldVal || 0, newVal)
    }, { immediate: true })

    onUnmounted(() => {
      if (animationFrame.value) {
        cancelAnimationFrame(animationFrame.value)
      }
    })

    return () => h('span', { class: 'animated-number' }, displayValue.value)
  }
}

// 卡片可见性控制
const headerVisible = ref(false)
const cardsVisible = ref([false, false, false, false, false, false])

// 加载状态
const refreshing = ref(false)
const statusLoading = ref(false)
const concurrencyLoading = ref(false)
const statsLoading = ref(false)
const ragLoading = ref(false)
const knowledgeLoading = ref(false)
const configLoading = ref(false)
const clearLoading = ref(false)
const deletingThread = ref<string | null>(null)

// 数据
const statusData = reactive<AiStatus>({
  enabled: false,
  maxConcurrency: 10,
  activeConnections: 0,
  totalRequests: 0,
  message: '加载中...'
})

const concurrencyData = reactive({
  maxConcurrency: 10
})

const statsData = reactive<AiStats>({
  enabled: false,
  totalRequests: 0,
  activeConnections: 0,
  maxConcurrency: 10,
  activeThreads: []
})

const configData = reactive<AiConfig>({
  llm_api_key: '',
  llm_base_url: '',
  llm_model: '',
  chunk_size: 500,
  chunk_overlap: 50,
  system_prompt: ''
})

const activeThreads = ref<ActiveThread[]>([])
const ragResult = ref<RagIndexResult | null>(null)

// 定时器
let refreshTimer: ReturnType<typeof setInterval> | null = null

// 方法
const fetchStatus = async () => {
  try {
    const res = await getAiStatus()
    Object.assign(statusData, res.data)
  } catch (error) {
    console.error('获取状态失败:', error)
  }
}

const fetchConcurrency = async () => {
  try {
    const res = await getConcurrency()
    concurrencyData.maxConcurrency = res.data?.maxConcurrency || 10
  } catch (error) {
    console.error('获取并发设置失败:', error)
  }
}

const fetchStats = async () => {
  statsLoading.value = true
  try {
    const res = await getAiStats()
    Object.assign(statsData, res.data)
  } catch (error) {
    console.error('获取统计失败:', error)
  } finally {
    statsLoading.value = false
  }
}

const fetchConfig = async () => {
  try {
    const res = await getAiConfig()
    // Java 后端返回的字符串在 msg 字段中
    const jsonStr = res.msg || res.data
    if (jsonStr) {
      try {
        const config = JSON.parse(jsonStr as string)
        Object.assign(configData, config)
      } catch {
        console.warn('配置解析失败')
      }
    }
  } catch (error) {
    console.error('获取配置失败:', error)
  }
}

const fetchThreads = async () => {
  try {
    const res = await getActiveThreads()
    // Java 后端返回的字符串在 msg 字段中
    const jsonStr = res.msg || res.data
    if (jsonStr) {
      try {
        const data = JSON.parse(jsonStr as string)
        activeThreads.value = data.data || []
      } catch {
        activeThreads.value = []
      }
    }
  } catch (error) {
    console.error('获取会话列表失败:', error)
  }
}

const refreshAll = async () => {
  refreshing.value = true
  await Promise.all([
    fetchStatus(),
    fetchConcurrency(),
    fetchStats(),
    fetchConfig(),
    fetchThreads()
  ])
  refreshing.value = false
}

const handleStatusChange = async (val: boolean) => {
  statusLoading.value = true
  try {
    await toggleAiStatus(val)
    ElMessage.success(val ? 'AI 服务已开启' : 'AI 服务已关闭')
    await fetchStatus()
  } catch (error) {
    statusData.enabled = !val
    ElMessage.error('操作失败')
  } finally {
    statusLoading.value = false
  }
}

const handleConcurrencyChange = (val: number | undefined) => {
  if (val) {
    concurrencyData.maxConcurrency = val
  }
}

const saveConcurrency = async () => {
  concurrencyLoading.value = true
  try {
    await setConcurrency({ maxConcurrency: concurrencyData.maxConcurrency })
    ElMessage.success('并发设置已保存')
  } catch (error) {
    ElMessage.error('保存失败')
  } finally {
    concurrencyLoading.value = false
  }
}

const saveConfig = async () => {
  configLoading.value = true
  try {
    await updateAiConfig(configData)
    ElMessage.success('配置已更新')
  } catch (error) {
    ElMessage.error('更新失败')
  } finally {
    configLoading.value = false
  }
}

const handleReindex = async () => {
  await ElMessageBox.confirm(
    '确定要全量重建索引吗？这可能需要一些时间。',
    '确认操作',
    { type: 'warning' }
  )

  ragLoading.value = true
  try {
    const res = await reindexAll()
    ragResult.value = res.data
    ElMessage.success('索引重建完成')
  } catch (error) {
    ElMessage.error('索引重建失败')
  } finally {
    ragLoading.value = false
  }
}

const handleIndexKnowledge = async () => {
  await ElMessageBox.confirm(
    '确定要索引校园知识库吗？这将从Java后端获取所有已发布的知识内容并建立向量索引。',
    '确认操作',
    { type: 'warning' }
  )

  knowledgeLoading.value = true
  try {
    const res = await indexKnowledge()
    ragResult.value = res.data
    ElMessage.success('校园知识库索引完成')
  } catch (error) {
    ElMessage.error('校园知识库索引失败')
  } finally {
    knowledgeLoading.value = false
  }
}

const handleDeleteThread = async (threadId: string) => {
  await ElMessageBox.confirm('确定删除此会话？', '确认', { type: 'warning' })

  deletingThread.value = threadId
  try {
    await deleteThread(threadId)
    ElMessage.success('会话已删除')
    await fetchThreads()
  } catch (error) {
    ElMessage.error('删除失败')
  } finally {
    deletingThread.value = null
  }
}

const handleClearAll = async () => {
  await ElMessageBox.confirm(
    '确定清除所有会话记忆？此操作不可恢复。',
    '确认清除',
    { type: 'error', confirmButtonText: '清除全部' }
  )

  clearLoading.value = true
  try {
    await clearAllMemory()
    ElMessage.success('所有会话记忆已清除')
    await fetchThreads()
  } catch (error) {
    ElMessage.error('清除失败')
  } finally {
    clearLoading.value = false
  }
}

const formatExpires = (seconds: number) => {
  if (seconds < 60) return `${seconds}秒`
  if (seconds < 3600) return `${Math.floor(seconds / 60)}分钟`
  return `${Math.floor(seconds / 3600)}小时`
}

// 入场动画
const startEntryAnimation = () => {
  headerVisible.value = true
  cardsVisible.value.forEach((_, index) => {
    setTimeout(() => {
      cardsVisible.value[index] = true
    }, 100 + index * 100)
  })
}

// 生命周期
onMounted(async () => {
  startEntryAnimation()
  await refreshAll()

  // 30秒自动刷新
  refreshTimer = setInterval(() => {
    fetchStatus()
    fetchStats()
    fetchThreads()
  }, 30000)
})

onUnmounted(() => {
  if (refreshTimer) {
    clearInterval(refreshTimer)
  }
})
</script>

<style scoped lang="scss">
.agent-manage {
  min-height: 100vh;
  padding: 24px;
  background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ec 100%);
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
}

// 页面标题
.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 28px;
  padding: 24px 32px;
  background: #ffffff;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
  transform: translateY(-20px);
  opacity: 0;
  transition: all 0.6s cubic-bezier(0.16, 1, 0.3, 1);

  &.is-visible {
    transform: translateY(0);
    opacity: 1;
  }

  .header-content {
    display: flex;
    align-items: center;
    gap: 16px;
  }

  .header-icon {
    width: 56px;
    height: 56px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 16px;
    color: #ffffff;
    box-shadow: 0 8px 24px rgba(102, 126, 234, 0.3);
  }

  .header-text {
    h1 {
      margin: 0;
      font-size: 24px;
      font-weight: 700;
      color: #1a1a2e;
      letter-spacing: -0.5px;
    }

    p {
      margin: 4px 0 0;
      font-size: 14px;
      color: #6b7280;
    }
  }
}

// 内容网格
.content-grid {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.row {
  display: grid;
  gap: 24px;

  &.triple-row {
    grid-template-columns: repeat(3, 1fr);

    @media (max-width: 1200px) {
      grid-template-columns: repeat(2, 1fr);
    }

    @media (max-width: 768px) {
      grid-template-columns: 1fr;
    }
  }
}

// 卡片通用样式
.card {
  background: #ffffff;
  border-radius: 16px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
  overflow: hidden;
  transition: all 0.3s ease;

  &:hover {
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
    transform: translateY(-4px);
  }

  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 24px;
    border-bottom: 1px solid #f0f0f0;
  }

  .card-title {
    display: flex;
    align-items: center;
    gap: 12px;
    font-size: 16px;
    font-weight: 600;
    color: #1a1a2e;

    .title-icon {
      font-size: 20px;
    }
  }

  .card-body {
    padding: 24px;
  }
}

// 服务状态卡片 - 蓝色主题
.status-card {
  .card-title .title-icon {
    color: #3b82f6;
  }

  .status-indicator {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 6px 16px;
    border-radius: 20px;
    background: #f3f4f6;
    font-size: 13px;
    color: #6b7280;
    transition: all 0.3s ease;

    &.is-active {
      background: #dbeafe;
      color: #3b82f6;

      .status-dot {
        background: #3b82f6;
        box-shadow: 0 0 12px rgba(59, 130, 246, 0.5);
      }
    }

    .status-dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #ef4444;
      transition: all 0.3s ease;
    }
  }

  .status-visual {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 24px 0;
  }

  .status-circle {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f3f4f6;
    border: 3px solid #e5e7eb;
    color: #9ca3af;
    transition: all 0.5s ease;

    &.is-active {
      background: #dbeafe;
      border-color: #3b82f6;
      color: #3b82f6;
      box-shadow: 0 0 40px rgba(59, 130, 246, 0.2);
      animation: pulse-blue 2s infinite;
    }
  }

  .status-message {
    margin-top: 16px;
    font-size: 14px;
    color: #6b7280;
  }

  .status-switch {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px;
    background: #f9fafb;
    border-radius: 12px;
  }

  .switch-label {
    font-size: 14px;
    color: #4b5563;
  }
}

// 并发控制卡片 - 紫色主题
.concurrency-card {
  .card-title .title-icon {
    color: #8b5cf6;
  }

  .concurrency-visual {
    display: flex;
    justify-content: center;
    padding: 24px 0;
  }

  .concurrency-display {
    text-align: center;
  }

  .concurrency-number {
    font-size: 56px;
    font-weight: 700;
    background: linear-gradient(135deg, #8b5cf6 0%, #a78bfa 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    line-height: 1;
  }

  .concurrency-label {
    margin-top: 8px;
    font-size: 14px;
    color: #6b7280;
  }

  .concurrency-control {
    display: flex;
    gap: 12px;

    :deep(.el-input-number) {
      flex: 1;
    }

    .save-btn {
      background: linear-gradient(135deg, #8b5cf6 0%, #a78bfa 100%);
      border: none;
      font-weight: 600;

      &:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 24px rgba(139, 92, 246, 0.3);
      }
    }
  }
}

// 统计卡片 - 多彩主题
.stats-card {
  .card-title .title-icon {
    color: #f59e0b;
  }

  .stats-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;

    @media (max-width: 768px) {
      grid-template-columns: 1fr;
    }
  }

  .stat-item {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 24px;
    border-radius: 16px;
    transition: all 0.3s ease;

    &:hover {
      transform: translateY(-4px);
    }

    &.requests {
      background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);

      .stat-icon {
        background: #f59e0b;
        color: #ffffff;
      }
    }

    &.connections {
      background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);

      .stat-icon {
        background: #3b82f6;
        color: #ffffff;
      }
    }

    &.sessions {
      background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);

      .stat-icon {
        background: #10b981;
        color: #ffffff;
      }
    }
  }

  .stat-icon {
    width: 56px;
    height: 56px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 14px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }

  .stat-value {
    font-size: 32px;
    font-weight: 700;
    color: #1a1a2e;
    line-height: 1;
  }

  .stat-label {
    margin-top: 4px;
    font-size: 13px;
    color: #6b7280;
  }
}

// RAG 卡片 - 绿色主题
.rag-card {
  .card-title .title-icon {
    color: #10b981;
  }

  .rag-content {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .rag-action {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
  }

  .reindex-btn {
    padding: 12px 32px;
    font-size: 14px;
    font-weight: 600;
    background: linear-gradient(135deg, #10b981 0%, #34d399 100%);
    border: none;
    border-radius: 10px;
    transition: all 0.3s ease;

    .btn-icon {
      margin-right: 6px;
    }

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 24px rgba(16, 185, 129, 0.4);
    }
  }

  .knowledge-btn {
    padding: 12px 32px;
    font-size: 14px;
    font-weight: 600;
    background: linear-gradient(135deg, #3b82f6 0%, #60a5fa 100%);
    border: none;
    border-radius: 10px;
    transition: all 0.3s ease;

    .btn-icon {
      margin-right: 6px;
    }

    &:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 24px rgba(59, 130, 246, 0.4);
    }
  }

  .rag-hint {
    font-size: 12px;
    color: #9ca3af;
  }

  .rag-stats {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
    padding: 14px;
    background: #f9fafb;
    border-radius: 10px;
  }

  .rag-stat-item {
    text-align: center;
    padding: 10px;
    border-radius: 8px;
    transition: all 0.3s ease;

    &:hover {
      transform: scale(1.05);
    }

    &.total {
      background: #ffffff;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.06);
    }

    &.indexed {
      background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
    }

    &.skipped {
      background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
    }

    &.failed {
      background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
    }
  }

  .rag-stat-number {
    font-size: 20px;
    font-weight: 700;
    color: #1a1a2e;
  }

  .rag-stat-label {
    margin-top: 2px;
    font-size: 11px;
    color: #6b7280;
  }
}

// 配置卡片 - 橙色主题
.config-card {
  .card-title .title-icon {
    color: #f97316;
  }

  .config-form {
    :deep(.el-form-item__label) {
      color: #4b5563;
      font-weight: 500;
    }

    .form-row {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 24px;

      @media (max-width: 768px) {
        grid-template-columns: 1fr;
      }
    }

    .save-config-btn {
      padding: 12px 48px;
      background: linear-gradient(135deg, #f97316 0%, #fb923c 100%);
      border: none;
      font-weight: 600;

      &:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 24px rgba(249, 115, 22, 0.3);
      }
    }
  }
}

// 会话管理卡片 - 青色主题
.sessions-card {
  .card-title .title-icon {
    color: #06b6d4;
  }

  .thread-badge {
    margin-left: 8px;

    :deep(.el-badge__content) {
      background: #06b6d4;
    }
  }

  .empty-sessions {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 48px;
    color: #d1d5db;

    p {
      margin-top: 16px;
      font-size: 14px;
      color: #9ca3af;
    }
  }

  .sessions-list {
    display: flex;
    flex-direction: column;
    gap: 12px;
    max-height: 400px;
    overflow-y: auto;

    &::-webkit-scrollbar {
      width: 6px;
    }

    &::-webkit-scrollbar-track {
      background: #f3f4f6;
      border-radius: 3px;
    }

    &::-webkit-scrollbar-thumb {
      background: #d1d5db;
      border-radius: 3px;

      &:hover {
        background: #9ca3af;
      }
    }
  }

  .session-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px;
    background: #f9fafb;
    border-radius: 12px;
    transition: all 0.3s ease;

    &:hover {
      background: #f0f9ff;
      transform: translateX(4px);
    }
  }

  .session-info {
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .session-avatar {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #06b6d4 0%, #22d3ee 100%);
    border-radius: 10px;
    color: #ffffff;
    font-size: 18px;
  }

  .session-details {
    display: flex;
    flex-direction: column;
    gap: 2px;
  }

  .session-user {
    font-weight: 600;
    color: #1a1a2e;
    font-size: 14px;
  }

  .session-id {
    font-family: 'SF Mono', Monaco, 'Cascadia Code', monospace;
    font-size: 11px;
    color: #9ca3af;
    max-width: 200px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .session-meta {
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .session-expires {
    font-size: 12px;
    color: #6b7280;
  }
}

// 动画
.animated-number {
  display: inline-block;
  font-variant-numeric: tabular-nums;
}

@keyframes pulse-blue {
  0%,
  100% {
    box-shadow: 0 0 40px rgba(59, 130, 246, 0.2);
  }

  50% {
    box-shadow: 0 0 60px rgba(59, 130, 246, 0.4);
  }
}

// 卡片入场动画
.card-slide-enter-active {
  transition: all 0.6s cubic-bezier(0.16, 1, 0.3, 1);
  transition-delay: var(--delay, 0s);
}

.card-slide-enter-from {
  opacity: 0;
  transform: translateY(30px) scale(0.95);
}

// 会话列表动画
.session-item-enter-active,
.session-item-leave-active {
  transition: all 0.4s ease;
}

.session-item-enter-from {
  opacity: 0;
  transform: translateX(-30px);
}

.session-item-leave-to {
  opacity: 0;
  transform: translateX(30px);
}

// 响应式调整
@media (max-width: 768px) {
  .agent-manage {
    padding: 16px;
  }

  .page-header {
    flex-direction: column;
    gap: 16px;
    text-align: center;

    .header-content {
      flex-direction: column;
    }
  }

  .stat-value {
    font-size: 24px !important;
  }

  .concurrency-number {
    font-size: 40px !important;
  }
}
</style>
