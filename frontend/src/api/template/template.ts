import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, TemplateQueryParams, StuNoteTemplate } from '@/types'

// 查询笔记模板列表
export function listTemplate(query: TemplateQueryParams): Promise<TableDataInfo<StuNoteTemplate[]>> {
  return request({
    url: '/template/template/list',
    method: 'get',
    params: query
  })
}

// 查询笔记模板详细
export function getTemplate(id: number): Promise<AjaxResult<StuNoteTemplate>> {
  return request({
    url: '/template/template/' + id,
    method: 'get'
  })
}

// 新增笔记模板
export function addTemplate(data: StuNoteTemplate): Promise<AjaxResult> {
  return request({
    url: '/template/template',
    method: 'post',
    data: data
  })
}

// 修改笔记模板
export function updateTemplate(data: StuNoteTemplate): Promise<AjaxResult> {
  return request({
    url: '/template/template',
    method: 'put',
    data: data
  })
}

// 删除笔记模板
export function delTemplate(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/template/template/' + id,
    method: 'delete'
  })
}


