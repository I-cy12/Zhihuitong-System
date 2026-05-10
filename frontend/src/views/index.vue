<template>
  <div class="dashboard-container">
    <div class="dashboard-layout">
      <!-- 左侧：轮播图 + 老师寄语 -->
      <div class="left-section">
        <!-- 轮播图 -->
        <div class="carousel-wrapper">
          <el-carousel
            ref="carouselRef"
            :interval="3000"
            :height="carouselHeight"
            indicator-position="none"
            @mouseenter="pauseCarousel"
            @mouseleave="resumeCarousel"
          >
            <el-carousel-item v-for="(slide, index) in carouselSlides" :key="index">
              <div class="carousel-slide" :style="{ background: slide.bg }">
                <div class="carousel-content">
                  <div class="carousel-badge">{{ slide.badge }}</div>
                  <h2 class="carousel-title">{{ slide.title }}</h2>
                  <p class="carousel-desc">{{ slide.description }}</p>
                </div>
                <div class="carousel-icon">
                  <svg-icon :icon-class="slide.icon" class="carousel-svg-icon" />
                </div>
              </div>
            </el-carousel-item>
          </el-carousel>
          <!-- 轮播指示器 -->
          <div class="carousel-indicators">
            <div
              v-for="(slide, index) in carouselSlides"
              :key="'indicator-' + index"
              class="indicator-dot"
              :class="{ active: currentSlideIndex === index }"
              @click="goToSlide(index)"
            >
              <div
                v-if="currentSlideIndex === index"
                class="indicator-progress"
                :class="{ paused: isCarouselPaused }"
              />
            </div>
          </div>
        </div>

        <!-- 老师寄语 -->
        <div class="teacher-messages-card" @mouseenter="pauseMessage" @mouseleave="resumeMessage">
          <div class="card-header">
            <div class="card-header-left">
              <svg-icon icon-class="education" class="header-icon" />
              <span class="card-header-title">老师寄语</span>
            </div>
            <div class="card-header-right">
              <el-button text size="small" @click="prevMessage" :disabled="teacherMessages.length <= 1">
                <el-icon><ArrowLeft /></el-icon>
              </el-button>
              <span class="message-counter">{{ currentMessageIndex + 1 }} / {{ teacherMessages.length }}</span>
              <el-button text size="small" @click="nextMessage" :disabled="teacherMessages.length <= 1">
                <el-icon><ArrowRight /></el-icon>
              </el-button>
            </div>
          </div>
          <div class="teacher-message-content">
            <transition name="message-fade" mode="out-in">
              <div :key="currentMessageIndex" class="message-item">
                <div class="message-quote">
                  <span class="quote-mark">"</span>
                  {{ currentMessage.content }}
                  <span class="quote-mark">"</span>
                </div>
                <div class="message-meta">
                  <span class="message-date">{{ currentMessage.date }}</span>
                </div>
              </div>
            </transition>
          </div>
        </div>
      </div>

      <!-- 右侧：项目介绍 + 音乐播放器 -->
      <div class="right-section">
        <!-- 项目介绍卡片（点击任意位置翻转） -->
        <div class="profile-card" @click="isCardFlipped = !isCardFlipped">
          <div class="profile-card-inner" :class="{ flipped: isCardFlipped }">
            <!-- 正面：项目介绍 -->
            <div class="profile-front">
              <div class="profile-avatar-wrapper">
                <div class="profile-avatar-ring">
                  <img :src="logoImage" alt="校园智慧通" class="profile-avatar" />
                </div>
              </div>
              <h3 class="profile-name">校园智慧通</h3>
              <p class="profile-subtitle">智能校园管理平台</p>
              <p class="profile-desc">
                集成课程管理、AI 智能助手、知识库检索、学习笔记等功能，致力于打造高效、智能的校园数字化服务生态。
              </p>
              <div class="profile-stats">
                <div class="stat-item">
                  <span class="stat-value">{{ systemStats.courses }}</span>
                  <span class="stat-label">课程</span>
                </div>
                <div class="stat-item">
                  <span class="stat-value">{{ systemStats.notes }}</span>
                  <span class="stat-label">笔记</span>
                </div>
                <div class="stat-item">
                  <span class="stat-value">{{ systemStats.knowledge }}</span>
                  <span class="stat-label">知识库</span>
                </div>
              </div>
              <div class="flip-hint">
                <el-icon class="flip-icon"><Refresh /></el-icon>
                <span>点击翻转 · 音乐空间</span>
              </div>
            </div>

            <!-- 背面：音乐播放器 -->
            <div class="profile-back">
              <div class="music-header">
                <span class="music-label">NOW PLAYING</span>
                <svg-icon icon-class="music" class="music-header-icon" />
              </div>

              <div class="vinyl-record" :class="{ spinning: isPlaying }">
                <div class="vinyl-ring vinyl-ring-1"></div>
                <div class="vinyl-ring vinyl-ring-2"></div>
                <div class="vinyl-ring vinyl-ring-3"></div>
                <div class="vinyl-center">
                  <div class="vinyl-dot"></div>
                </div>
              </div>

              <h4 class="music-title">{{ currentTrack.name }}</h4>
              <p class="music-artist">{{ currentTrack.artist }}</p>

              <div class="music-progress">
                <div class="progress-bar">
                  <div class="progress-fill" :style="{ width: progressPercent + '%' }"></div>
                </div>
                <div class="progress-time">
                  <span>{{ formatTime(currentTime) }}</span>
                  <span>{{ formatTime(trackDuration) }}</span>
                </div>
              </div>

              <div class="music-controls">
                <button class="control-btn" @click.stop="prevTrack">
                  <svg viewBox="0 0 24 24" fill="currentColor"><path d="M6 6h2v12H6zm3.5 6l8.5 6V6z"/></svg>
                </button>
                <button class="play-btn" @click.stop="togglePlay">
                  <svg v-if="isPlaying" viewBox="0 0 24 24" fill="currentColor"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>
                  <svg v-else viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>
                </button>
                <button class="control-btn" @click.stop="nextTrack">
                  <svg viewBox="0 0 24 24" fill="currentColor"><path d="M6 18V6l8.5 6zm7-12v12h2V6z"/></svg>
                </button>
              </div>

              <div class="flip-hint flip-hint-back">
                <el-icon class="flip-icon"><Refresh /></el-icon>
                <span>点击翻转 · 项目介绍</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onBeforeUnmount } from 'vue'
import { ArrowLeft, ArrowRight, Refresh } from '@element-plus/icons-vue'
import SvgIcon from '@/components/SvgIcon/index.vue'
import logoImage from '@/assets/logo/logo.png'

// ==================== 轮播图 ====================
const carouselSlides = ref([
  {
    bg: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
    badge: '智慧校园',
    title: 'AI 驱动的智能学习助手',
    description: '基于大语言模型的智能对话系统，支持知识检索、联网搜索，让学习更高效',
    icon: 'dashboard'
  },
  {
    bg: 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)',
    badge: '课程管理',
    title: '一站式课程服务体系',
    description: '可视化课表管理、智能排课提醒，让每堂课都井然有序',
    icon: 'education'
  },
  {
    bg: 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)',
    badge: '知识库',
    title: '构建你的专属知识图谱',
    description: '校园知识智能分类与检索，RAG 技术赋能精准问答',
    icon: 'documentation'
  },
  {
    bg: 'linear-gradient(135deg, #43e97b 0%, #38f9d7 100%)',
    badge: '学习笔记',
    title: '高效记录，深度思考',
    description: '富文本编辑、Markdown 支持、笔记模板，让知识沉淀更轻松',
    icon: 'edit'
  }
])

const currentSlideIndex = ref(0)
const isCarouselPaused = ref(false)
const carouselRef = ref()
const carouselHeight = ref('320px')

const pauseCarousel = () => {
  isCarouselPaused.value = true
  carouselRef.value?.pause()
}

const resumeCarousel = () => {
  isCarouselPaused.value = false
  carouselRef.value?.resume()
}

const goToSlide = (index: number) => {
  currentSlideIndex.value = index
  carouselRef.value?.setActiveItem(index)
}

// 监听轮播切换
let carouselTimer: ReturnType<typeof setInterval> | null = null

onMounted(() => {
  carouselTimer = setInterval(() => {
    if (!isCarouselPaused.value) {
      currentSlideIndex.value = (currentSlideIndex.value + 1) % carouselSlides.value.length
    }
  }, 3000)

  // 响应式轮播高度
  updateCarouselHeight()
  window.addEventListener('resize', updateCarouselHeight)
})

onBeforeUnmount(() => {
  if (carouselTimer) clearInterval(carouselTimer)
  window.removeEventListener('resize', updateCarouselHeight)
})

const updateCarouselHeight = () => {
  carouselHeight.value = window.innerWidth < 768 ? '200px' : '320px'
}

// ==================== 项目介绍 / 卡片翻转 ====================
const isCardFlipped = ref(false)

const systemStats = ref({
  courses: 12,
  notes: 128,
  knowledge: 56
})

// ==================== 音乐播放器 ====================
const musicList = [
  { name: '小酌', artist: '轻音乐合集', src: '' },
  { name: '屋檐下面', artist: '轻音乐合集', src: '' },
  { name: '远方的鲸', artist: '轻音乐合集', src: '' },
  { name: '不如遗忘', artist: '轻音乐合集', src: '' }
]

const currentTrackIndex = ref(0)
const isPlaying = ref(false)
const currentTime = ref(0)
const trackDuration = ref(0)
let audioElement: HTMLAudioElement | null = null

const currentTrack = computed(() => musicList[currentTrackIndex.value])
const progressPercent = computed(() =>
  trackDuration.value > 0 ? (currentTime.value / trackDuration.value) * 100 : 0
)

const formatTime = (seconds: number) => {
  const m = Math.floor(seconds / 60)
  const s = Math.floor(seconds % 60)
  return `${m}:${s.toString().padStart(2, '0')}`
}

const togglePlay = () => {
  if (!audioElement) return
  if (isPlaying.value) {
    audioElement.pause()
  } else {
    audioElement.play().catch(() => {})
  }
  isPlaying.value = !isPlaying.value
}

const nextTrack = () => {
  currentTrackIndex.value = (currentTrackIndex.value + 1) % musicList.length
  resetAudio()
}

const prevTrack = () => {
  currentTrackIndex.value = (currentTrackIndex.value - 1 + musicList.length) % musicList.length
  resetAudio()
}

const resetAudio = () => {
  if (audioElement) {
    audioElement.pause()
    audioElement.src = musicList[currentTrackIndex.value].src
    audioElement.load()
    currentTime.value = 0
    if (isPlaying.value) {
      audioElement.play().catch(() => {})
    }
  }
}

// ==================== 老师寄语 ====================
const teacherMessages = ref([
  {
    content: '学习不是一蹴而就的事情，它需要持之以恒的努力和不断的积累。希望你们能够珍惜在校的每一天，用心去感受知识的力量。',
    author: '王明远',
    title: '计算机学院 教授',
    date: '2026-03-15',
    avatarBg: 'linear-gradient(135deg, #667eea, #764ba2)'
  },
  {
    content: '技术在不断更新迭代，但基础知识永远不会过时。打好基础，才能在未来的职业道路上走得更远。加油！',
    author: '李晓华',
    title: '软件工程系 副教授',
    date: '2026-03-10',
    avatarBg: 'linear-gradient(135deg, #f093fb, #f5576c)'
  },
  {
    content: '实践是检验真理的唯一标准。多动手写代码，多参与项目实战，理论结合实践才能真正掌握技能。',
    author: '张文博',
    title: '数据科学系 讲师',
    date: '2026-02-28',
    avatarBg: 'linear-gradient(135deg, #4facfe, #00f2fe)'
  },
  {
    content: '团队合作是现代软件开发的核心能力。学会与人沟通、协作，这将是你受益终身的财富。',
    author: '陈思琪',
    title: '人工智能学院 教授',
    date: '2026-02-20',
    avatarBg: 'linear-gradient(135deg, #43e97b, #38f9d7)'
  },
  {
    content: '不要害怕犯错，每一次错误都是成长的契机。保持好奇心，勇于探索未知领域，你们的未来充满无限可能。',
    author: '刘建国',
    title: '信息工程系 教授',
    date: '2026-02-15',
    avatarBg: 'linear-gradient(135deg, #fa709a, #fee140)'
  }
])

const currentMessageIndex = ref(0)
const isMessagePaused = ref(false)
let messageTimer: ReturnType<typeof setInterval> | null = null

const currentMessage = computed(() => teacherMessages.value[currentMessageIndex.value])

const nextMessage = () => {
  currentMessageIndex.value = (currentMessageIndex.value + 1) % teacherMessages.value.length
}

const prevMessage = () => {
  currentMessageIndex.value = (currentMessageIndex.value - 1 + teacherMessages.value.length) % teacherMessages.value.length
}

const pauseMessage = () => {
  isMessagePaused.value = true
}

const resumeMessage = () => {
  isMessagePaused.value = false
}

onMounted(() => {
  messageTimer = setInterval(() => {
    if (!isMessagePaused.value) {
      nextMessage()
    }
  }, 4000)
})

onBeforeUnmount(() => {
  if (messageTimer) clearInterval(messageTimer)
})
</script>

<style scoped>
/* ==================== 容器布局 ==================== */
.dashboard-container {
  padding: 20px;
  background: #f0f2f5;
  min-height: calc(100vh - 84px);
}

.dashboard-layout {
  display: flex;
  gap: 20px;
  max-width: 1400px;
  margin: 0 auto;
}

.left-section {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 20px;
  min-width: 0;
  height: 520px;
}

.right-section {
  width: 300px;
  flex-shrink: 0;
}

/* ==================== 轮播图 ==================== */
.carousel-wrapper {
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.carousel-wrapper :deep(.el-carousel__container) {
  border-radius: 12px;
}

.carousel-slide {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 40px 50px;
  position: relative;
  overflow: hidden;
}

.carousel-content {
  position: relative;
  z-index: 2;
  max-width: 60%;
}

.carousel-badge {
  display: inline-block;
  background: rgba(255, 255, 255, 0.2);
  backdrop-filter: blur(10px);
  color: #fff;
  padding: 4px 16px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 1px;
  margin-bottom: 16px;
  border: 1px solid rgba(255, 255, 255, 0.3);
}

.carousel-title {
  color: #fff;
  font-size: 28px;
  font-weight: 700;
  margin: 0 0 12px 0;
  line-height: 1.3;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
}

.carousel-desc {
  color: rgba(255, 255, 255, 0.9);
  font-size: 15px;
  line-height: 1.6;
  margin: 0;
  text-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
}

.carousel-icon {
  position: relative;
  z-index: 2;
  opacity: 0.15;
}

.carousel-svg-icon {
  font-size: 180px;
  color: #fff;
}

/* 轮播指示器 */
.carousel-indicators {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 8px;
  z-index: 10;
}

.indicator-dot {
  width: 8px;
  height: 8px;
  border-radius: 2px;
  background: rgba(255, 255, 255, 0.4);
  cursor: pointer;
  overflow: hidden;
  transition: all 0.3s ease;
  position: relative;
}

.indicator-dot.active {
  width: 32px;
  opacity: 1;
}

.indicator-progress {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background: #fff;
  border-radius: 2px;
  animation: progressFill 3s linear forwards;
}

.indicator-progress.paused {
  animation-play-state: paused;
}

@keyframes progressFill {
  from { transform: translateX(-100%); }
  to { transform: translateX(0); }
}

/* ==================== 右侧卡片（翻转） ==================== */
.profile-card {
  perspective: 1000px;
  height: 520px;
  cursor: pointer;
}

.profile-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  transition: transform 0.7s cubic-bezier(0.4, 0, 0.2, 1);
  transform-style: preserve-3d;
}

.profile-card-inner.flipped {
  transform: rotateY(180deg);
}

.profile-front,
.profile-back {
  position: absolute;
  inset: 0;
  backface-visibility: hidden;
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

/* 正面：项目介绍 */
.profile-front {
  background: #fff;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  padding: 30px 24px;
  align-items: center;
  text-align: center;
}

.profile-avatar-wrapper {
  margin-bottom: 16px;
}

.profile-avatar-ring {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  padding: 3px;
  background: linear-gradient(135deg, #667eea, #764ba2);
  animation: ringRotate 10s linear infinite;
}

@keyframes ringRotate {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

.profile-avatar {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #fff;
}

.profile-name {
  font-size: 20px;
  font-weight: 700;
  color: #1a1a2e;
  margin: 0 0 4px 0;
}

.profile-subtitle {
  font-size: 13px;
  color: #667eea;
  font-weight: 500;
  margin: 0 0 16px 0;
}

.profile-desc {
  font-size: 13px;
  color: #666;
  line-height: 1.7;
  margin: 0 0 20px 0;
  padding: 0 4px;
}

.profile-stats {
  display: flex;
  gap: 0;
  width: 100%;
  padding: 16px 0;
  border-top: 1px solid #f0f0f0;
  border-bottom: 1px solid #f0f0f0;
  margin-bottom: 16px;
}

.stat-item {
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 4px;
}

.stat-item + .stat-item {
  border-left: 1px solid #f0f0f0;
}

.stat-value {
  font-size: 22px;
  font-weight: 700;
  color: #1a1a2e;
}

.stat-label {
  font-size: 12px;
  color: #999;
}

.flip-hint {
  margin-top: auto;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  font-size: 12px;
  color: #bbb;
  padding-top: 12px;
  border-top: 1px solid #f0f0f0;
  transition: color 0.2s;
}

.profile-card:hover .flip-hint {
  color: #667eea;
}

.flip-hint .flip-icon {
  transition: transform 0.3s;
}

.profile-card:hover .flip-hint .flip-icon {
  transform: rotate(180deg);
}

/* 背面：音乐播放器 */
.profile-back {
  background: linear-gradient(160deg, #1a1c2e 0%, #2a2d3e 100%);
  padding: 24px;
  align-items: center;
  text-align: center;
  transform: rotateY(180deg);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
}

.music-header {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.music-label {
  font-size: 10px;
  color: rgba(255, 255, 255, 0.4);
  letter-spacing: 2px;
  font-weight: 700;
}

.music-header-icon {
  font-size: 16px;
  color: #667eea;
}

/* 黑胶唱片 */
.vinyl-record {
  width: 140px;
  height: 140px;
  border-radius: 50%;
  background: #111;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
  margin-bottom: 20px;
  border: 2px solid rgba(255, 255, 255, 0.05);
}

.vinyl-record.spinning {
  animation: spin 4s linear infinite;
}

@keyframes spin {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

.vinyl-ring {
  position: absolute;
  border-radius: 50%;
  border: 1px solid rgba(255, 255, 255, 0.03);
}

.vinyl-ring-1 {
  inset: 10px;
  border-color: rgba(255, 255, 255, 0.06);
}

.vinyl-ring-2 {
  inset: 20px;
  border-color: rgba(255, 255, 255, 0.04);
}

.vinyl-ring-3 {
  inset: 35px;
  border-color: rgba(255, 255, 255, 0.03);
}

.vinyl-center {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #667eea;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.4);
  z-index: 1;
}

.vinyl-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #e0e0e0;
}

.music-title {
  color: #fff;
  font-size: 16px;
  font-weight: 700;
  margin: 0 0 2px 0;
}

.music-artist {
  color: #667eea;
  font-size: 12px;
  margin: 0 0 16px 0;
}

/* 进度条 */
.music-progress {
  width: 100%;
  margin-bottom: 16px;
}

.progress-bar {
  width: 100%;
  height: 3px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 2px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #667eea, #764ba2);
  border-radius: 2px;
  transition: width 0.3s;
  box-shadow: 0 0 8px rgba(102, 126, 234, 0.5);
}

.progress-time {
  display: flex;
  justify-content: space-between;
  margin-top: 6px;
  font-size: 10px;
  color: rgba(255, 255, 255, 0.4);
  font-variant-numeric: tabular-nums;
}

/* 控制按钮 */
.music-controls {
  display: flex;
  align-items: center;
  gap: 20px;
  margin-bottom: 16px;
}

.control-btn {
  background: none;
  border: none;
  color: rgba(255, 255, 255, 0.5);
  cursor: pointer;
  padding: 4px;
  transition: color 0.2s;
}

.control-btn:hover {
  color: #fff;
}

.control-btn svg {
  width: 20px;
  height: 20px;
}

.play-btn {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: linear-gradient(135deg, #667eea, #764ba2);
  border: none;
  color: #fff;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.2s, box-shadow 0.2s;
  box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
}

.play-btn:hover {
  transform: scale(1.05);
  box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
}

.play-btn svg {
  width: 22px;
  height: 22px;
}

.flip-hint-back {
  color: rgba(255, 255, 255, 0.3);
  border-top-color: rgba(255, 255, 255, 0.08);
}

.profile-card:hover .flip-hint-back {
  color: rgba(255, 255, 255, 0.7);
}

/* ==================== 老师寄语 ==================== */
.teacher-messages-card {
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  padding: 20px 24px;
  flex: 1;
  display: flex;
  flex-direction: column;
}

.card-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
}

.card-header-left {
  display: flex;
  align-items: center;
  gap: 8px;
}

.header-icon {
  font-size: 18px;
  color: #667eea;
}

.card-header-title {
  font-size: 16px;
  font-weight: 700;
  color: #1a1a2e;
}

.card-header-right {
  display: flex;
  align-items: center;
  gap: 8px;
}

.message-counter {
  font-size: 12px;
  color: #999;
  font-variant-numeric: tabular-nums;
  min-width: 36px;
  text-align: center;
}

.teacher-message-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.message-item {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.message-quote {
  font-size: 14px;
  color: #555;
  line-height: 1.8;
  font-style: italic;
  padding: 16px 20px;
  background: linear-gradient(135deg, #f8f9ff 0%, #f0f4ff 100%);
  border-radius: 8px;
  border-left: 3px solid #667eea;
}

.quote-mark {
  color: #667eea;
  font-size: 20px;
  font-weight: 700;
  opacity: 0.6;
  font-style: normal;
}

.message-meta {
  display: flex;
  justify-content: flex-end;
}

.message-date {
  font-size: 12px;
  color: #bbb;
}

/* 消息切换动画 */
.message-fade-enter-active,
.message-fade-leave-active {
  transition: all 0.4s ease;
}

.message-fade-enter-from {
  opacity: 0;
  transform: translateX(20px);
}

.message-fade-leave-to {
  opacity: 0;
  transform: translateX(-20px);
}

/* ==================== 响应式 ==================== */
@media (max-width: 900px) {
  .dashboard-layout {
    flex-direction: column;
  }

  .left-section {
    height: auto;
  }

  .right-section {
    width: 100%;
  }

  .profile-card {
    height: 480px;
  }

  .carousel-slide {
    padding: 24px 30px;
  }

  .carousel-title {
    font-size: 22px;
  }

  .carousel-desc {
    font-size: 13px;
  }

  .carousel-svg-icon {
    font-size: 120px;
  }
}

@media (max-width: 480px) {
  .dashboard-container {
    padding: 12px;
  }

  .carousel-slide {
    padding: 20px;
  }

  .carousel-content {
    max-width: 100%;
  }

  .carousel-icon {
    display: none;
  }

  .carousel-title {
    font-size: 18px;
  }
}
</style>
