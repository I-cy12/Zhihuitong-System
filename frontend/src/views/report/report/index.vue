<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      
      <el-form-item label="报修类型 " prop="repairType">
        <el-select v-model="queryParams.repairType" placeholder="请选择报修类型 " clearable>
          <el-option
            v-for="dict in repair_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="报修人" prop="repairPerson">
        <el-input
          v-model="queryParams.repairPerson"
          placeholder="请输入报修人"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="报修地点" prop="repairAddress">
        <el-input
          v-model="queryParams.repairAddress"
          placeholder="请输入报修地点"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="报修状态 " prop="repairStatus">
        <el-select v-model="queryParams.repairStatus" placeholder="请选择报修状态 " clearable>
          <el-option
            v-for="dict in repair_status"
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
          v-hasPermi="['repair:repair:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['repair:repair:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['repair:repair:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['repair:repair:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="repairList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="报修类型 " align="center" prop="repairType">
        <template #default="scope">
          <dict-tag :options="repair_type" :value="scope.row.repairType"/>
        </template>
      </el-table-column>
      <el-table-column label="报修标题" align="center" prop="repairTitle" />
      <el-table-column label="报修人" align="center" prop="repairPerson" />
      <el-table-column label="报修电话" align="center" prop="repairPhone" />
      <el-table-column label="报修地点" align="center" prop="repairAddress" />
      <el-table-column label="报修状态 " align="center" prop="repairStatus">
        <template #default="scope">
          <dict-tag :options="repair_status" :value="scope.row.repairStatus"/>
        </template>
      </el-table-column>

      <el-table-column label="处理时间" align="center" prop="handleTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.handleTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['repair:repair:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['repair:repair:remove']">删除</el-button>
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

    <!-- 添加或修改报修管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="repairRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="报修类型 " prop="repairType">
              <el-select v-model="form.repairType" placeholder="请选择报修类型 ">
                <el-option
                  v-for="dict in repair_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="报修标题" prop="repairTitle">
              <el-input v-model="form.repairTitle" placeholder="请输入报修标题" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="报修内容">
              <editor v-model="form.repairContent" :min-height="192"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="报修人" prop="repairPerson">
              <el-input v-model="form.repairPerson" placeholder="请输入报修人" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="报修电话" prop="repairPhone">
              <el-input v-model="form.repairPhone" placeholder="请输入报修电话" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="报修地点" prop="repairAddress">
              <el-input v-model="form.repairAddress" placeholder="请输入报修地点" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="报修状态 " prop="repairStatus">
              <el-select v-model="form.repairStatus" placeholder="请选择报修状态 ">
                <el-option
                  v-for="dict in repair_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <!-- <el-col :span="24">
            <el-form-item label="报修照片" prop="repairImage">
              <el-upload action="/repair/repair/uploadImage" v-model:file-list="form.repairImage"></el-upload>
            </el-form-item>
          </el-col>

          <el-col :span="24">
            <el-form-item label="处理照片" prop="handleImage">
              <el-upload action="/repair/repair/uploadImage" v-model:file-list="form.handleImage"></el-upload>
            </el-form-item>
          </el-col> -->
        

          
          <el-col :span="24">
            <el-form-item label="报修照片" prop="repairImage">
              <image-upload v-model="form.repairImage"/>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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

<script setup lang="ts" name="Repair">
import type { LogisticsRepair, RepairQueryParams } from "@/types/api/repair/repair"
import { listRepair, getRepair, delRepair, addRepair, updateRepair } from "@/api/repair/repair"

const { proxy } = getCurrentInstance()
const { repair_type, repair_status } = useDict('repair_type', 'repair_status')


const repairList = ref<LogisticsRepair[]>([])
const open = ref<boolean>(false)
const loading = ref<boolean>(true)
const showSearch = ref<boolean>(true)
const ids = ref<number[]>([])
const single = ref<boolean>(true)
const multiple = ref<boolean>(true)
const total = ref<number>(0)
const title = ref<string>("")

const data = reactive({
  form: {} as LogisticsRepair,
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    repairNo: undefined,
    repairType: undefined,
    repairPerson: undefined,
    repairAddress: undefined,
    repairStatus: undefined,
  } as RepairQueryParams,
  rules: {
    repairType: [
      { required: true, message: "报修类型不能为空", trigger: "change" }
    ],
    repairTitle: [
      { required: true, message: "报修标题不能为空", trigger: "blur" }
    ],
    repairPerson: [
      { required: true, message: "报修人不能为空", trigger: "blur" }
    ],
    repairPhone: [
      { required: true, message: "报修电话不能为空", trigger: "blur" }
    ],
    repairAddress: [
      { required: true, message: "报修地点不能为空", trigger: "blur" }
    ],
    repairStatus: [
      { required: true, message: "报修状态不能为空", trigger: "change" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询报修管理列表 */
function getList() {
  loading.value = true
  listRepair(queryParams.value).then(response => {
    repairList.value = response.rows
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
    repairNo: null,
    repairType: null,
    repairTitle: null,
    repairContent: null,
    repairPerson: null,
    repairPhone: null,
    repairAddress: null,
    repairStatus: null,
    handlePerson: null,
    handleContent: null,
    handleTime: null,
    repairImage: null,
    handleImage: null,
    sort: null,
    remark: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  }
  proxy.resetForm("repairRef")
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
function handleSelectionChange(selection: LogisticsRepair[]) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加报修管理"
}

/** 修改按钮操作 */
function handleUpdate(row: LogisticsRepair) {
  reset()
  const _id = row.id || ids.value[0]
  getRepair(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改报修管理"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["repairRef"].validate((valid: boolean) => {
    if (valid) {
      if (form.value.id != null) {
        updateRepair(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addRepair(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row: LogisticsRepair) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除报修管理编号为"' + _ids + '"的数据项？').then(function() {
    return delRepair(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('repair/repair/export', {
    ...queryParams.value
  }, `repair_${new Date().getTime()}.xlsx`)
}

getList()
</script>
