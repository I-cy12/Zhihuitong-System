<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" label-width="68px">
      <el-form-item label="学期标识" prop="term">
        <el-input
          v-model="queryParams.term"
          placeholder="请输入学期标识"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">查询</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-card shadow="never" class="summary-card">
      <div class="summary">
        <div class="summary-title">课表周视图</div>
        <div class="summary-meta">
          <el-tag type="info" effect="plain">学期：{{ queryParams.term || "-" }}</el-tag>
          <el-tag type="success" effect="plain">课程数：{{ courseList.length }}</el-tag>
          <el-tag type="danger" effect="plain">周一至周五标红</el-tag>
        </div>
      </div>
    </el-card>

    <div v-loading="loading" class="week-grid">
      <div v-for="day in weekDays" :key="day.value" class="day-col">
        <div class="day-title" :class="{ weekday: day.isWeekday }">
          <span>{{ day.label }}</span>
          <span class="day-count">{{ (groupedCourses.get(day.value) || []).length }}</span>
        </div>
        <div class="day-body">
          <div
            v-for="c in groupedCourses.get(day.value) || []"
            :key="c.id"
            class="course-item"
            :class="{ weekday: day.isWeekday }"
          >
            <div class="course-name-row">
              <div class="course-name">{{ c.name }}</div>
              <el-tag v-if="c.startSection && c.endSection" size="small" :type="day.isWeekday ? 'danger' : 'info'" effect="light">
                第{{ c.startSection }}-{{ c.endSection }}节
              </el-tag>
            </div>
            <div class="course-meta">
              <el-tag v-if="c.teacher" size="small" effect="plain">{{ c.teacher }}</el-tag>
              <el-tag v-if="c.location" size="small" effect="plain" type="info">{{ c.location }}</el-tag>
            </div>
          </div>
          <el-empty v-if="(groupedCourses.get(day.value) || []).length === 0" :image-size="60" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts" name="CourseTimetable">
import { weekViewCourse } from "@/api/course/course"
import type { StuCourse } from "@/types/api/course/course"

const { proxy } = getCurrentInstance()

const loading = ref(false)
const courseList = ref<StuCourse[]>([])

const weekDays = [
  { value: 1, label: "周一", isWeekday: true },
  { value: 2, label: "周二", isWeekday: true },
  { value: 3, label: "周三", isWeekday: true },
  { value: 4, label: "周四", isWeekday: true },
  { value: 5, label: "周五", isWeekday: true },
  { value: 6, label: "周六", isWeekday: false },
  { value: 7, label: "周日", isWeekday: false },
]

const data = reactive({
  queryParams: {
    term: "2025-2026-1",
  } as { term?: string },
})

const { queryParams } = toRefs(data)

const groupedCourses = computed(() => {
  const map = new Map<number, StuCourse[]>()
  for (const d of weekDays) map.set(d.value, [])
  for (const c of courseList.value) {
    if (!c.dayOfWeek) continue
    if (!map.has(c.dayOfWeek)) map.set(c.dayOfWeek, [])
    map.get(c.dayOfWeek)!.push(c)
  }
  for (const [k, list] of map.entries()) {
    list.sort((a, b) => (a.startSection || 0) - (b.startSection || 0) || (a.endSection || 0) - (b.endSection || 0) || (a.id || 0) - (b.id || 0))
    map.set(k, list)
  }
  return map
})

function getWeekView() {
  loading.value = true
  weekViewCourse({ term: queryParams.value.term }).then((res) => {
    courseList.value = res.data || []
    loading.value = false
  }).catch(() => {
    loading.value = false
  })
}

function handleQuery() {
  getWeekView()
}

function resetQuery() {
  proxy?.resetForm("queryRef")
  getWeekView()
}

onMounted(() => {
  getWeekView()
})

onActivated(() => {
  getWeekView()
})
</script>

<style scoped>
.summary-card {
  margin-top: 12px;
  border-radius: 10px;
}

.summary {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  flex-wrap: wrap;
}

.summary-title {
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 0.2px;
}

.summary-meta {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
}

.week-grid {
  margin-top: 12px;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 12px;
}

.day-col {
  border: 1px solid var(--el-border-color);
  border-radius: 6px;
  overflow: hidden;
  background: var(--el-bg-color);
  min-height: 360px;
}

.day-title {
  padding: 10px 12px;
  font-weight: 600;
  background: var(--el-fill-color-lighter);
  border-bottom: 1px solid var(--el-border-color);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.day-title.weekday {
  color: var(--el-color-danger);
}

.day-count {
  min-width: 22px;
  height: 22px;
  border-radius: 999px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  background: var(--el-fill-color);
  color: var(--el-text-color-secondary);
  font-size: 12px;
  font-weight: 700;
}

.day-title.weekday .day-count {
  background: rgba(245, 108, 108, 0.12);
  color: var(--el-color-danger);
}

.day-body {
  padding: 10px 12px;
}

.course-item {
  padding: 10px 10px;
  border: 1px solid var(--el-border-color-lighter);
  border-radius: 6px;
  margin-bottom: 10px;
  background: var(--el-bg-color);
  transition: transform 0.08s ease, box-shadow 0.12s ease, border-color 0.12s ease;
}

.course-item.weekday {
  border-color: rgba(245, 108, 108, 0.45);
  box-shadow: 0 0 0 1px rgba(245, 108, 108, 0.12) inset;
}

.course-item:hover {
  transform: translateY(-1px);
  box-shadow: var(--el-box-shadow-lighter);
}

.course-name-row {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 10px;
}

.course-name {
  font-weight: 600;
  line-height: 20px;
}

.course-item.weekday .course-name {
  color: var(--el-color-danger);
}

.course-meta {
  margin-top: 6px;
  display: flex;
  gap: 8px;
  color: var(--el-text-color-secondary);
  font-size: 12px;
  line-height: 18px;
  flex-wrap: wrap;
}
</style>
