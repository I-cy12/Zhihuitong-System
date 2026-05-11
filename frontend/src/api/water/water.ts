import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, WaterQueryParams, LogisticsWater } from '@/types'

// 查询水控管理列表
export function listWater(query: WaterQueryParams): Promise<TableDataInfo<LogisticsWater[]>> {
  return request({
    url: '/water/water/list',
    method: 'get',
    params: query
  })
}

// 查询水控管理详细
export function getWater(id: number): Promise<AjaxResult<LogisticsWater>> {
  return request({
    url: '/water/water/' + id,
    method: 'get'
  })
}

// 新增水控管理
export function addWater(data: LogisticsWater): Promise<AjaxResult> {
  return request({
    url: '/water/water',
    method: 'post',
    data: data
  })
}

// 修改水控管理
export function updateWater(data: LogisticsWater): Promise<AjaxResult> {
  return request({
    url: '/water/water',
    method: 'put',
    data: data
  })
}

// 删除水控管理
export function delWater(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/water/water/' + id,
    method: 'delete'
  })
}


