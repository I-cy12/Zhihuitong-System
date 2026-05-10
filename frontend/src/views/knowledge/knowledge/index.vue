<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="知识分类" prop="typeId">
        <el-select v-model="queryParams.typeId" placeholder="请选择分类" clearable>
          <el-option
            v-for="item in typeOptions"
            :key="item.id"
            :label="item.typeName"
            :value="item.id"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="知识标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入知识标题"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option
            v-for="dict in sys_campus_knowledge"
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
          v-hasPermi="['knowledge:knowledge:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['knowledge:knowledge:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['knowledge:knowledge:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['knowledge:knowledge:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="knowledgeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" width="80" />
      <el-table-column label="知识分类" align="center" prop="typeId" width="120">
        <template #default="scope">
          {{ getTypeName(scope.row.typeId) }}
        </template>
      </el-table-column>
      <el-table-column label="知识标题" align="center" prop="title" show-overflow-tooltip />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <dict-tag :options="sys_campus_knowledge" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['knowledge:knowledge:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['knowledge:knowledge:remove']">删除</el-button>
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

    <!-- 添加或修改校园知识内容对话框 -->
    <el-dialog :title="title" v-model="open" width="700px" append-to-body>
      <el-form ref="knowledgeRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="知识分类" prop="typeId">
              <el-select v-model="form.typeId" placeholder="请选择分类">
                <el-option
                  v-for="item in typeOptions"
                  :key="item.id"
                  :label="item.typeName"
                  :value="item.id"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="知识标题" prop="title">
              <el-input v-model="form.title" placeholder="请输入知识标题" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="正文内容">
              <editor v-model="form.content" :min-height="300"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="附件地址" prop="fileUrl">
              <el-input v-model="form.fileUrl" placeholder="请输入附件地址" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in sys_campus_knowledge"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
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

<script setup lang="ts" name="Knowledge">
import type { SysCampusKnowledge, KnowledgeQueryParams } from "@/types/api/knowledge/knowledge"
import type { SysCampusKnowledgeType } from "@/types/api/knowledge/type"
import { listKnowledge, getKnowledge, delKnowledge, addKnowledge, updateKnowledge } from "@/api/knowledge/knowledge"
import { listType } from "@/api/knowledge/type"

const { proxy } = getCurrentInstance()
const { sys_campus_knowledge } = useDict('sys_campus_knowledge')

const knowledgeList = ref<SysCampusKnowledge[]>([])
const typeOptions = ref<SysCampusKnowledgeType[]>([])
const open = ref<boolean>(false)
const loading = ref<boolean>(true)
const showSearch = ref<boolean>(true)
const ids = ref<number[]>([])
const single = ref<boolean>(true)
const multiple = ref<boolean>(true)
const total = ref<number>(0)
const title = ref<string>("")

const data = reactive({
  form: {} as SysCampusKnowledge,
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    typeId: undefined,
    title: undefined,
    status: undefined,
  } as KnowledgeQueryParams,
  rules: {
    typeId: [
      { required: true, message: "分类ID不能为空", trigger: "blur" }
    ],
    title: [
      { required: true, message: "知识标题不能为空", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询校园知识分类下拉列表 */
function getTypeOptions() {
  listType({ pageNum: 1, pageSize: 100 }).then(response => {
    typeOptions.value = response.rows
  })
}

/** 根据分类ID获取分类名称 */
function getTypeName(typeId: number): string {
  const type = typeOptions.value.find(item => item.id === typeId)
  return type ? type.typeName : ''
}

/** 查询校园知识内容列表 */
function getList() {
  loading.value = true
  listKnowledge(queryParams.value).then(response => {
    knowledgeList.value = response.rows
    total.value = response.total
  }).finally(() => {
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
    typeId: null,
    title: null,
    content: null,
    fileUrl: null,
    status: null,
    createBy: null,
    createTime: null,
    updateTime: null
  }
  proxy.resetForm("knowledgeRef")
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
function handleSelectionChange(selection: SysCampusKnowledge[]) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加校园知识内容"
}

/** 修改按钮操作 */
function handleUpdate(row: SysCampusKnowledge) {
  reset()
  const _id = row.id || ids.value[0]
  getKnowledge(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改校园知识内容"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["knowledgeRef"].validate((valid: boolean) => {
    if (valid) {
      if (form.value.id != null) {
        updateKnowledge(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addKnowledge(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row: SysCampusKnowledge) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除校园知识内容编号为"' + _ids + '"的数据项？').then(function() {
    return delKnowledge(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('knowledge/knowledge/export', {
    ...queryParams.value
  }, `knowledge_${new Date().getTime()}.xlsx`)
}

getTypeOptions()
getList()
</script>
