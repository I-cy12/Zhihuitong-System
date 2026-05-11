import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, RepairQueryParams, LogisticsRepair } from '@/types'

// 查询报修管理列表
export function listRepair(query: RepairQueryParams): Promise<TableDataInfo<LogisticsRepair[]>> {
  return request({
    url: '/repair/repair/list',
    method: 'get',
    params: query
  })
}

// 查询报修管理详细
export function getRepair(id: number): Promise<AjaxResult<LogisticsRepair>> {
  return request({
    url: '/repair/repair/' + id,
    method: 'get'
  })
}

// 新增报修管理
export function addRepair(data: LogisticsRepair): Promise<AjaxResult> {
  return request({
    url: '/repair/repair',
    method: 'post',
    data: data
  })
}

// 修改报修管理
export function updateRepair(data: LogisticsRepair): Promise<AjaxResult> {
  return request({
    url: '/repair/repair',
    method: 'put',
    data: data
  })
}

// 删除报修管理
export function delRepair(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/repair/repair/' + id,
    method: 'delete'
  })
}


