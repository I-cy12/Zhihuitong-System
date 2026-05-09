<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="课程名称快照" prop="courseNameSnapshot">
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
          v-hasPermi="['system:note:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:note:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:note:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['system:note:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="noteList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="学生ID" align="center" prop="studentId" />
      <el-table-column label="关联课程ID" align="center" prop="courseId" />
      <el-table-column label="课程名称快照" align="center" prop="courseNameSnapshot" />
      <el-table-column label="笔记标题" align="center" prop="title" />
      <el-table-column label="笔记内容" align="center" prop="content" />
      <el-table-column label="标签" align="center" prop="tags" />
      <el-table-column label="更新时间" align="center" prop="updatedAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="笔记封面" align="center" prop="image" width="100">
        <template #default="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['system:note:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['system:note:remove']">删除</el-button>
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
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="noteRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="学生ID" prop="studentId">
              <el-input v-model="form.studentId" placeholder="请输入学生ID" />
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
            <el-form-item label="笔记内容">
              <editor v-model="form.content" :min-height="192"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="标签" prop="tags">
              <el-input v-model="form.tags" type="textarea" placeholder="请输入内容" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="笔记封面" prop="image">
              <image-upload v-model="form.image"/>
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
  </div>
</template>

<script setup lang="ts" name="Note">
import type { StuNote, NoteQueryParams } from "@/types/api/system/note"
import { listNote, getNote, delNote, addNote, updateNote } from "@/api/system/note"

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

const data = reactive({
  form: {} as StuNote,
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    courseNameSnapshot: undefined,
    title: undefined,
    content: undefined,
    tags: undefined,
    image: undefined
  } as NoteQueryParams,
  rules: {
    studentId: [
      { required: true, message: "学生ID不能为空", trigger: "blur" }
    ],
    courseNameSnapshot: [
      { required: true, message: "课程名称快照不能为空", trigger: "blur" }
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
    content: null,
    tags: null,
    createdAt: null,
    updatedAt: null,
    image: null
  }
  proxy.resetForm("noteRef")
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
  proxy.download('system/note/export', {
    ...queryParams.value
  }, `note_${new Date().getTime()}.xlsx`)
}

getList()
</script>
