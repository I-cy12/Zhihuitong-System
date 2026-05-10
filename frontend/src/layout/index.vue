<template>
  <div :class="classObj" class="app-wrapper" :style="{ '--current-color': theme, '--current-color-light': theme + '1a', '--current-color-dark-bg': theme + '33' }">
    <div v-if="device === 'mobile' && sidebar.opened" class="drawer-bg" @click="handleClickOutside"/>
    <sidebar v-if="!sidebar.hide" class="sidebar-container" />
    <div :class="{ hasTagsView: needTagsView, sidebarHide: sidebar.hide }" class="main-container">
      <div :class="{ 'fixed-header': fixedHeader }">
        <navbar @setLayout="setLayout" />
        <tags-view v-if="needTagsView" />
      </div>
      <app-main />
      <settings ref="settingRef" />
    </div>

    <!-- 悬浮 AI 助手 -->
    <div class="floating-chat-btn" :class="{ open: chatVisible }" @click="chatVisible = !chatVisible">
      <transition name="icon-flip" mode="out-in">
        <el-icon v-if="!chatVisible" :size="26"><ChatDotRound /></el-icon>
        <el-icon v-else :size="26"><Close /></el-icon>
      </transition>
      <span v-if="!chatVisible" class="chat-pulse"></span>
    </div>
    <ChatDialog v-model="chatVisible" />
  </div>
</template>

<script setup lang="ts">
import { useWindowSize } from '@vueuse/core'
import { ChatDotRound, Close } from '@element-plus/icons-vue'
import Sidebar from './components/Sidebar/index.vue'
import ChatDialog from '@/components/ChatDialog/index.vue'
import { AppMain, Navbar, Settings, TagsView } from './components'
import useAppStore from '@/store/modules/app'
import useSettingsStore from '@/store/modules/settings'

const settingsStore = useSettingsStore()
const chatVisible = ref(false)
const theme = computed(() => settingsStore.theme)
const sidebar = computed(() => useAppStore().sidebar)
const device = computed(() => useAppStore().device)
const needTagsView = computed(() => settingsStore.tagsView)
const fixedHeader = computed(() => settingsStore.fixedHeader)

const classObj = computed(() => ({
  hideSidebar: !sidebar.value.opened,
  openSidebar: sidebar.value.opened,
  withoutAnimation: sidebar.value.withoutAnimation,
  mobile: device.value === 'mobile'
}))

const { width, height } = useWindowSize()
const WIDTH = 992 // refer to Bootstrap's responsive design

watch(() => device.value, () => {
  if (device.value === 'mobile' && sidebar.value.opened) {
    useAppStore().closeSideBar({ withoutAnimation: false })
  }
})

watchEffect(() => {
  if (width.value - 1 < WIDTH) {
    useAppStore().toggleDevice('mobile')
    useAppStore().closeSideBar({ withoutAnimation: true })
  } else {
    useAppStore().toggleDevice('desktop')
  }
})

function handleClickOutside(): void {
  useAppStore().closeSideBar({ withoutAnimation: false })
}

const settingRef = ref(null)
function setLayout() {
  settingRef.value.openSetting()
}
</script>

<style lang="scss" scoped>
@use "@/assets/styles/mixin.scss" as mix;
@use "@/assets/styles/variables.module.scss" as vars;

.app-wrapper {
  @include mix.clearfix;
  position: relative;
  height: 100%;
  width: 100%;

  &.mobile.openSidebar {
    position: fixed;
    top: 0;
  }
}

.main-container:has(.fixed-header) {
  height: 100vh;
  overflow: hidden;
}

.drawer-bg {
  background: #000;
  opacity: 0.3;
  width: 100%;
  top: 0;
  height: 100%;
  position: absolute;
  z-index: 999;
}

.fixed-header {
  position: fixed;
  top: 0;
  right: 0;
  z-index: 9;
  width: calc(100% - #{vars.$base-sidebar-width});
  transition: width 0.28s;
  background: var(--fixedHeaderBg, #ffffff);
}

.hideSidebar .fixed-header {
  width: calc(100% - 54px);
}

.sidebarHide .fixed-header {
  width: 100%;
}

.mobile .fixed-header {
  width: 100%;
}

// ── 悬浮 AI 按钮 ──
.floating-chat-btn {
  position: fixed;
  right: 28px;
  bottom: 32px;
  width: 56px;
  height: 56px;
  border-radius: 50%;
  background: linear-gradient(135deg, #6366f1, #8b5cf6);
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  z-index: 9999;
  box-shadow:
    0 4px 24px rgba(99, 102, 241, 0.4),
    0 1px 3px rgba(0, 0, 0, 0.1);
  transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);

  &:hover {
    transform: scale(1.1);
    box-shadow:
      0 6px 32px rgba(99, 102, 241, 0.5),
      0 2px 6px rgba(0, 0, 0, 0.12);
  }

  &.open {
    background: linear-gradient(135deg, #475569, #64748b);
    box-shadow:
      0 4px 20px rgba(71, 85, 105, 0.4),
      0 1px 3px rgba(0, 0, 0, 0.1);
    transform: rotate(0deg);

    &:hover {
      box-shadow:
        0 6px 28px rgba(71, 85, 105, 0.5),
        0 2px 6px rgba(0, 0, 0, 0.12);
    }
  }

  .chat-pulse {
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: rgba(99, 102, 241, 0.3);
    animation: chatPulse 2.5s ease-in-out infinite;
  }
}

@keyframes chatPulse {
  0%, 100% { transform: scale(1); opacity: 0.6; }
  50% { transform: scale(1.45); opacity: 0; }
}

.icon-flip-enter-active,
.icon-flip-leave-active {
  transition: all 0.2s ease;
}
.icon-flip-enter-from { opacity: 0; transform: scale(0.6) rotate(-90deg); }
.icon-flip-leave-to { opacity: 0; transform: scale(0.6) rotate(90deg); }
</style>