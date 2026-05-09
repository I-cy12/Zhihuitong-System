<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="学生ID" prop="studentId">
        <el-input
          v-model="queryParams.studentId"
          placeholder="请输入学生ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="学期标识" prop="term">
        <el-input
          v-model="queryParams.term"
          placeholder="请输入学期标识"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="课程名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入课程名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任课教师" prop="teacher">
        <el-input
          v-model="queryParams.teacher"
          placeholder="请输入任课教师"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="星期几" prop="dayOfWeek">
        <el-select v-model="queryParams.dayOfWeek" placeholder="请选择星期几" clearable>
          <el-option
            v-for="dict in course_week"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['course:course:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['course:course:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['course:course:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['course:course:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="courseList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="学生ID" align="center" prop="studentId" />
      <el-table-column label="学期标识" align="center" prop="term" />
      <el-table-column label="课程名称" align="center" prop="name" />
      <el-table-column label="任课教师" align="center" prop="teacher" />
      <el-table-column label="星期几" align="center" prop="dayOfWeek">
        <template #default="scope">
          <dict-tag :options="course_week" :value="scope.row.dayOfWeek"/>
        </template>
      </el-table-column>
      <el-table-column label="开始节次" align="center" prop="startSection" />
      <el-table-column label="结束节次" align="center" prop="endSection" />
      <el-table-column label="上课地点" align="center" prop="location" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="创建时间" align="center" prop="createdAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['course:course:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['course:course:remove']">删除</el-button>
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

    <!-- 添加或修改课表管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="courseRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="学生ID" prop="studentId">
              <el-input v-model="form.studentId" placeholder="请输入学生ID" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="学期标识" prop="term">
              <el-input v-model="form.term" placeholder="请输入学期标识" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="课程名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入课程名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="任课教师" prop="teacher">
              <el-input v-model="form.teacher" placeholder="请输入任课教师" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="星期几" prop="dayOfWeek">
              <el-select v-model="form.dayOfWeek" placeholder="请选择星期几">
                <el-option
                  v-for="dict in course_week"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="开始节次" prop="startSection">
              <el-input v-model="form.startSection" placeholder="请输入开始节次" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="结束节次" prop="endSection">
              <el-input v-model="form.endSection" placeholder="请输入结束节次" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="上课地点" prop="location">
              <el-input v-model="form.location" placeholder="请输入上课地点" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" placeholder="请输入备注" />
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

<script setup lang="ts" name="Course">
import type { StuCourse, CourseQueryParams } from "@/types/api/course/course"
import { listCourse, getCourse, delCourse, addCourse, updateCourse } from "@/api/course/course"

const { proxy } = getCurrentInstance()
const { course_week } = useDict('course_week')

const courseList = ref<StuCourse[]>([])
const open = ref<boolean>(false)
const loading = ref<boolean>(true)
const showSearch = ref<boolean>(true)
const ids = ref<number[]>([])
const single = ref<boolean>(true)
const multiple = ref<boolean>(true)
const total = ref<number>(0)
const title = ref<string>("")

const data = reactive({
  form: {} as StuCourse,
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    studentId: undefined,
    term: undefined,
    name: undefined,
    teacher: undefined,
    dayOfWeek: undefined,
  } as CourseQueryParams,
  rules: {
    studentId: [
      { required: true, message: "学生ID不能为空", trigger: "blur" }
    ],
    term: [
      { required: true, message: "学期标识不能为空", trigger: "blur" }
    ],
    name: [
      { required: true, message: "课程名称不能为空", trigger: "blur" }
    ],
    teacher: [
      { required: true, message: "任课教师不能为空", trigger: "blur" }
    ],
    dayOfWeek: [
      { required: true, message: "星期几不能为空", trigger: "change" }
    ],
    startSection: [
      { required: true, message: "开始节次不能为空", trigger: "blur" }
    ],
    endSection: [
      { required: true, message: "结束节次不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询课表管理列表 */
function getList() {
  loading.value = true
  listCourse(queryParams.value).then(response => {
    courseList.value = response.rows
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
    term: null,
    name: null,
    teacher: null,
    dayOfWeek: null,
    startSection: null,
    endSection: null,
    location: null,
    remark: null,
    createdAt: null,
    updatedAt: null
  }
  proxy.resetForm("courseRef")
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
function handleSelectionChange(selection: StuCourse[]) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加课表管理"
}

/** 修改按钮操作 */
function handleUpdate(row: StuCourse) {
  reset()
  const _id = row.id || ids.value[0]
  getCourse(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改课表管理"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["courseRef"].validate((valid: boolean) => {
    if (valid) {
      if (form.value.id != null) {
        updateCourse(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addCourse(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row: StuCourse) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除课表管理编号为"' + _ids + '"的数据项？').then(function() {
    return delCourse(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('course/course/export', {
    ...queryParams.value
  }, `course_${new Date().getTime()}.xlsx`)
}

getList()
</script>
