import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, TypeQueryParams, SysCampusKnowledgeType } from '@/types'

// 查询校园知识分类列表
export function listType(query: TypeQueryParams): Promise<TableDataInfo<SysCampusKnowledgeType[]>> {
  return request({
    url: '/knowledge/type/list',
    method: 'get',
    params: query
  })
}

// 查询校园知识分类详细
export function getType(id: number): Promise<AjaxResult<SysCampusKnowledgeType>> {
  return request({
    url: '/knowledge/type/' + id,
    method: 'get'
  })
}

// 新增校园知识分类
export function addType(data: SysCampusKnowledgeType): Promise<AjaxResult> {
  return request({
    url: '/knowledge/type',
    method: 'post',
    data: data
  })
}

// 修改校园知识分类
export function updateType(data: SysCampusKnowledgeType): Promise<AjaxResult> {
  return request({
    url: '/knowledge/type',
    method: 'put',
    data: data
  })
}

// 删除校园知识分类
export function delType(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/knowledge/type/' + id,
    method: 'delete'
  })
}


