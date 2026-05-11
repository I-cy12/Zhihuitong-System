import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, ElectricQueryParams, LogisticsElectric } from '@/types'

// 查询电控管理列表
export function listElectric(query: ElectricQueryParams): Promise<TableDataInfo<LogisticsElectric[]>> {
  return request({
    url: '/electric/electric/list',
    method: 'get',
    params: query
  })
}

// 查询电控管理详细
export function getElectric(id: number): Promise<AjaxResult<LogisticsElectric>> {
  return request({
    url: '/electric/electric/' + id,
    method: 'get'
  })
}

// 新增电控管理
export function addElectric(data: LogisticsElectric): Promise<AjaxResult> {
  return request({
    url: '/electric/electric',
    method: 'post',
    data: data
  })
}

// 修改电控管理
export function updateElectric(data: LogisticsElectric): Promise<AjaxResult> {
  return request({
    url: '/electric/electric',
    method: 'put',
    data: data
  })
}

// 删除电控管理
export function delElectric(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/electric/electric/' + id,
    method: 'delete'
  })
}


