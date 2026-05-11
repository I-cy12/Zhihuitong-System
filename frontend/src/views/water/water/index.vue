<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="区域名称" prop="areaName">
        <el-input
          v-model="queryParams.areaName"
          placeholder="请输入区域名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备名称" prop="deviceName">
        <el-input
          v-model="queryParams.deviceName"
          placeholder="请输入设备名称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="设备编号" prop="deviceCode">
        <el-input
          v-model="queryParams.deviceCode"
          placeholder="请输入设备编号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="使用状态" prop="useStatus">
        <el-select v-model="queryParams.useStatus" placeholder="请选择使用状态" clearable>
          <el-option
            v-for="dict in logistics_use_status"
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
          v-hasPermi="['water:water:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['water:water:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['water:water:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['water:water:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="waterList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="区域名称" align="center" prop="areaName" />
      <el-table-column label="设备名称" align="center" prop="deviceName" />
      <el-table-column label="设备编号" align="center" prop="deviceCode" />
      <el-table-column label="用水量(吨)" align="center" prop="waterConsumption" />
      <el-table-column label="使用状态" align="center" prop="useStatus">
        <template #default="scope">
          <dict-tag :options="logistics_use_status" :value="scope.row.useStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="使用日期" align="center" prop="useDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.useDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['water:water:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['water:water:remove']">删除</el-button>
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

    <!-- 添加或修改水控管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="waterRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="区域名称" prop="areaName">
              <el-input v-model="form.areaName" placeholder="请输入区域名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="设备名称" prop="deviceName">
              <el-input v-model="form.deviceName" placeholder="请输入设备名称" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="设备编号" prop="deviceCode">
              <el-input v-model="form.deviceCode" placeholder="请输入设备编号" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="用水量(吨)" prop="waterConsumption">
              <el-input v-model="form.waterConsumption" placeholder="请输入用水量(吨)" />
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="使用状态" prop="useStatus">
              <el-select v-model="form.useStatus" placeholder="请选择使用状态">
                <el-option
                  v-for="dict in logistics_use_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="使用日期" prop="useDate">
              <el-date-picker clearable
                v-model="form.useDate"
                type="date"
                value-format="YYYY-MM-DD"
                placeholder="请选择使用日期">
              </el-date-picker>
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

<script setup lang="ts" name="Water">
import type { LogisticsWater, WaterQueryParams } from "@/types/api/water/water"
import { listWater, getWater, delWater, addWater, updateWater } from "@/api/water/water"

const { proxy } = getCurrentInstance()
const { logistics_use_status } = useDict('logistics_use_status')

const waterList = ref<LogisticsWater[]>([])
const open = ref<boolean>(false)
const loading = ref<boolean>(true)
const showSearch = ref<boolean>(true)
const ids = ref<number[]>([])
const single = ref<boolean>(true)
const multiple = ref<boolean>(true)
const total = ref<number>(0)
const title = ref<string>("")

const data = reactive({
  form: {} as LogisticsWater,
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    areaName: undefined,
    deviceName: undefined,
    deviceCode: undefined,
    useStatus: undefined,
  } as WaterQueryParams,
  rules: {
    areaName: [
      { required: true, message: "区域名称不能为空", trigger: "blur" }
    ],
    deviceName: [
      { required: true, message: "设备名称不能为空", trigger: "blur" }
    ],
    deviceCode: [
      { required: true, message: "设备编号不能为空", trigger: "blur" }
    ],
    waterConsumption: [
      { required: true, message: "用水量不能为空", trigger: "blur" }
    ],
    useStatus: [
      { required: true, message: "使用状态不能为空", trigger: "change" }
    ],
    useDate: [
      { required: true, message: "使用日期不能为空", trigger: "change" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** 查询水控管理列表 */
function getList() {
  loading.value = true
  listWater(queryParams.value).then(response => {
    waterList.value = response.rows
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
    areaName: null,
    deviceName: null,
    deviceCode: null,
    waterConsumption: null,
    useStatus: null,
    useDate: null,
    remark: null,
    createBy: null,
    createTime: null,
    updateBy: null,
    updateTime: null
  }
  proxy.resetForm("waterRef")
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
function handleSelectionChange(selection: LogisticsWater[]) {
  ids.value = selection.map(item => item.id)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** 新增按钮操作 */
function handleAdd() {
  reset()
  open.value = true
  title.value = "添加水控管理"
}

/** 修改按钮操作 */
function handleUpdate(row: LogisticsWater) {
  reset()
  const _id = row.id || ids.value[0]
  getWater(_id).then(response => {
    form.value = response.data
    open.value = true
    title.value = "修改水控管理"
  })
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["waterRef"].validate((valid: boolean) => {
    if (valid) {
      if (form.value.id != null) {
        updateWater(form.value).then(() => {
          proxy.$modal.msgSuccess("修改成功")
          open.value = false
          getList()
        })
      } else {
        addWater(form.value).then(() => {
          proxy.$modal.msgSuccess("新增成功")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** 删除按钮操作 */
function handleDelete(row: LogisticsWater) {
  const _ids = row.id || ids.value
  proxy.$modal.confirm('是否确认删除水控管理编号为"' + _ids + '"的数据项？').then(function() {
    return delWater(_ids)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("删除成功")
  }).catch(() => {})
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('water/water/export', {
    ...queryParams.value
  }, `water_${new Date().getTime()}.xlsx`)
}

getList()
</script>
