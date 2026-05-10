import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, KnowledgeQueryParams, SysCampusKnowledge } from '@/types'

// 查询校园知识内容列表
export function listKnowledge(query: KnowledgeQueryParams): Promise<TableDataInfo<SysCampusKnowledge[]>> {
  return request({
    url: '/knowledge/knowledge/list',
    method: 'get',
    params: query
  })
}

// 查询校园知识内容详细
export function getKnowledge(id: number): Promise<AjaxResult<SysCampusKnowledge>> {
  return request({
    url: '/knowledge/knowledge/' + id,
    method: 'get'
  })
}

// 新增校园知识内容
export function addKnowledge(data: SysCampusKnowledge): Promise<AjaxResult> {
  return request({
    url: '/knowledge/knowledge',
    method: 'post',
    data: data
  })
}

// 修改校园知识内容
export function updateKnowledge(data: SysCampusKnowledge): Promise<AjaxResult> {
  return request({
    url: '/knowledge/knowledge',
    method: 'put',
    data: data
  })
}

// 删除校园知识内容
export function delKnowledge(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/knowledge/knowledge/' + id,
    method: 'delete'
  })
}


