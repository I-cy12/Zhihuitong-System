<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="课程名称" prop="courseNameSnapshot">
        <el-input
          v-model="queryParams.courseNameSnapshot"
          placeholder="请输入课程名称快照"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="笔记标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入笔记标题"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['note:note:add']"
        >新增</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="noteList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="学生ID" align="center" prop="studentId" />
      <el-table-column label="关联课程ID" align="center" prop="courseId" />
      <el-table-column label="课程名称快照" align="center" prop="courseNameSnapshot" />
      <el-table-column label="笔记标题" align="center" prop="title" :show-overflow-tooltip="true" />
      <el-table-column label="封面" align="center" prop="coverImage" width="90">
        <template #default="scope">
          <ImagePreview v-if="scope.row.coverImage" :src="scope.row.coverImage" :width="56" :height="56" />
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="笔记内容" align="center" prop="content" :show-overflow-tooltip="true" />
      <el-table-column label="标签" align="center" prop="tags" />
      <el-table-column label="创建时间" align="center" prop="createdAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right">
        <template #default="scope">
          <el-button link type="primary" icon="View" @click="handleView(scope.row)" v-hasPermi="['note:note:query']">查看</el-button>
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['note:note:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['note:note:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改学习笔记对话框 -->
    <el-dialog :title="title" v-model="open" width="80%" append-to-body>
      <el-form ref="noteRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="学生ID" prop="studentId">
              <el-input v-model="form.studentId" placeholder="请输入学生ID" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="关联课程ID" prop="courseId">
              <el-input v-model="form.courseId" placeholder="请输入关联课程ID" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="课程名称快照" prop="courseNameSnapshot">
              <el-input v-model="form.courseNameSnapshot" placeholder="请输入课程名称快照" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="笔记标题" prop="title">
              <el-input v-model="form.title" placeholder="请输入笔记标题" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="封面图片" prop="coverImage">
              <ImageUpload v-model="form.coverImage" :limit="1" />
            </el-form-item>
          </el-col>
          <el-col :span="24" v-if="form.id == null">
            <el-form-item label="笔记模板">
              <el-select v-model="templateId" placeholder="请选择模板" clearable filterable @change="handleTemplateChange">
                <el-option v-for="item in templateOptions" :key="item.id" :label="item.name" :value="item.id" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="笔记内容">
              <editor v-model="form.content" :min-height="192"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="标签" prop="tags">
              <el-input v-model="form.tags" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog title="查看笔记" v-model="viewOpen" width="80%" append-to-body>
      <el-row :gutter="12">
        <el-col :span="14">
          <el-card shadow="never">
            <template #header>
              <div class="view-header">
                <div class="view-title-wrap">
                  <ImagePreview v-if="viewData.coverImage" class="view-cover" :src="viewData.coverImage" :width="44" :height="44" />
                  <div class="view-title">{{ viewData.title }}</div>
                </div>
              </div>
            </template>
            <div class="view-meta">
              <span v-if="viewData.courseNameSnapshot">课程：{{ viewData.courseNameSnapshot }}</span>
              <span v-if="viewData.tags">标签：{{ viewData.tags }}</span>
              <span v-if="viewData.createdAt">创建：{{ parseTime(viewData.createdAt, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
            </div>
            <div class="view-content" v-html="viewData.content"></div>
          </el-card>
        </el-col>
        <el-col :span="10">
          <el-card shadow="never">
            <template #header>
              <div class="view-header">
                <div class="view-title">AI总结</div>
                <div class="view-actions">
                  <el-button type="primary" :loading="summarizing" @click="handleAiSummary">AI总结</el-button>
                  <el-button v-if="summarizing" @click="stopAiSummary">停止</el-button>
                </div>
              </div>
            </template>
            <div class="summary-box">{{ summaryText || "点击AI总结生成内容" }}</div>
          </el-card>
        </el-col>
      </el-row>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="viewOpen = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts" name="Note">
import type { StuNote, NoteQueryParams } from "@/types/api/note/note"
import { listNote, getNote, delNote, addNote, updateNote } from "@/api/note/note"
import type { StuNoteTemplate } from "@/types/api/template/template"
import { listTemplate } from "@/api/template/template"
import { getToken } from "@/utils/auth"

const { proxy } = getCurrentInstance()

const noteList = ref<StuNote[]>([])
const open = ref<boolean>(false)
const loading = ref<boolean>(true)
const showSearch = ref<boolean>(true)
const ids = ref<number[]>([])
const single = ref<boolean>(true)
const multiple = ref<boolean>(true)
const total = ref<number>(0)
const title = ref<string>("")

const viewOpen = ref(false)
const viewData = ref<StuNote>({} as StuNote)
const summaryText = ref("")
const summarizing = ref(false)
let summaryAbort: AbortController | null = null

const templateOptions = ref<StuNoteTemplate[]>([])
const templateId = ref<number | null>(null)

const data = reactive({
  form: {} as StuNote,
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    courseNameSnapshot: undefined,
    title: undefined,
    content: undefined,
    tags: undefined,
  } as NoteQueryParams,
  rules: {
    studentId: [
      { required: true, message: "学生ID不能为空", trigger: "blur" }
    ],
    courseId: [
      { required: true, message: "关联课程ID不能为空", trigger: "blur" }
    ],
    title: [
      { required: true, message: "笔记标题不能为空", trigger: "blur" }
    ],
    content: [
      { required: true, message: "笔记内容不能为空", trigger: "blur" }
    ],
    tags: [
      { required: true, message: "标签不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询学习笔记列表 */
function getList() {
  loading.value = true
  listNote(queryParams.value).then(response => {
    noteList.value = response.rows
    total.value = response.total
    loading.value = false
  })
}

/** 取消按钮 */
function cancel() {
  open.value = false
  reset()
}

/** 表单重置 */
function reset() {
  form.value = {
    id: null,
    studentId: null,
    courseId: null,
    courseNameSnapshot: null,
    title: null,
    coverImage: null,
    content: null,
    tags: null,
    createdAt: null,
    updatedAt: null
  }
  templateId.value = null
  proxy.resetForm("noteRef")
}

async function loadTemplateOptions() {
  const res = await listTemplate({ pageNum: 1, pageSize: 1000 })
  templateOptions.value = (res.rows || [])
    .filter(t => t.status === "0")
    .sort((a, b) => (a.sortNo ?? 0) - (b.sortNo ?? 0))
}

function normalizeTemplateContent(content?: string) {
  const c = content || ""
  return c.includes("<") ? c : c.replace(/\n/g, "<br/>")
}

function handleTemplateChange(id: number | null) {
  if (!id) return
  const tpl = templateOptions.value.find(t => t.id === id)
  if (!tpl) return
  const apply = () => {
    form.value.content = normalizeTemplateContent(tpl.content)
    if (!form.value.title) form.value.title = tpl.name
  }
  if (form.value.content) {
    proxy.$modal.confirm("应用模板会覆盖当前笔记内容，是否继续？").then(apply).catch(() => {})
    return
  }
  apply()
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef")
  handleQuery()
}

/** 多选框选中数据 */
function handleSelectionChange(selection: StuNote[]) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加学习笔记"
  loadTemplateOptions()
}

/** 修改按钮操作 */
function handleUpdate(row: StuNote) {
  reset()
  const _id = row.id || ids.value[0]
  getNote(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改学习笔记"
  })
}

function handleView(row: StuNote) {
  const _id = row.id || ids.value[0]
  getNote(_id).then(response => {
    viewData.value = response.data
    summaryText.value = ""
    viewOpen.value = true
  })
}

async function handleAiSummary() {
  if (!viewData.value?.id) return
  if (summarizing.value) return
  summaryText.value = ""
  summarizing.value = true
  summaryAbort = new AbortController()

  const token = getToken()
  const url = `${import.meta.env.VITE_APP_BASE_API}/note/note/summaryStream/${viewData.value.id}`

  try {
    const resp = await fetch(url, {
      method: "GET",
      headers: {
        Accept: "text/event-stream",
        Authorization: token ? `Bearer ${token}` : ""
      },
      signal: summaryAbort.signal
    })
    if (!resp.ok || !resp.body) {
      summaryText.value = "AI总结失败，请稍后重试。"
      return
    }
    const reader = resp.body.getReader()
    const decoder = new TextDecoder("utf-8")
    let buffer = ""
    while (true) {
      const { value, done } = await reader.read()
      if (done) break
      buffer += decoder.decode(value, { stream: true })
      const lines = buffer.split("\n")
      buffer = lines.pop() || ""
      for (const line of lines) {
        if (line.startsWith("data:")) {
          let data = line.substring(5)
          if (data.startsWith(" ")) data = data.substring(1)
          summaryText.value += data
        }
      }
    }
  } catch (e) {
    if (summaryText.value === "") summaryText.value = "AI总结已停止。"
  } finally {
    summarizing.value = false
    summaryAbort = null
  }
}

function stopAiSummary() {
  if (summaryAbort) summaryAbort.abort()
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["noteRef"].validate((valid: boolean) => {
    if (valid) {
      if (form.value.id != null) {
        updateNote(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addNote(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row: StuNote) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除学习笔记编号为"' + _ids + '"的数据项？').then(function() {
    return delNote(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('note/note/export', {
    ...queryParams.value
  }, `note_${new Date().getTime()}.xlsx`)
}

getList()
</script>

<style scoped>
.view-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 12px;
}

.view-title {
  font-size: 14px;
  font-weight: 600;
}

.view-title-wrap {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  min-width: 0;
}

.view-cover {
  flex: none;
}

.view-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-bottom: 12px;
  color: var(--el-text-color-secondary);
  font-size: 12px;
}

.view-content {
  min-height: 240px;
  padding: 12px;
  border: 1px solid var(--el-border-color-light);
  border-radius: 6px;
  background: var(--el-fill-color-blank);
  overflow: auto;
}

.summary-box {
  min-height: 240px;
  padding: 12px;
  border: 1px solid var(--el-border-color-light);
  border-radius: 6px;
  background: var(--el-fill-color-blank);
  white-space: pre-wrap;
  word-break: break-word;
}
</style>
