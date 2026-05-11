import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, SearchQueryParams, StuNoteSearch } from '@/types'

// 查询笔记搜索列表
export function listSearch(query: SearchQueryParams): Promise<TableDataInfo<StuNoteSearch[]>> {
  return request({
    url: '/search/search/list',
    method: 'get',
    params: query
  })
}

// 查询笔记搜索详细
export function getSearch(id: number): Promise<AjaxResult<StuNoteSearch>> {
  return request({
    url: '/search/search/' + id,
    method: 'get'
  })
}

// 新增笔记搜索
export function addSearch(data: StuNoteSearch): Promise<AjaxResult> {
  return request({
    url: '/search/search',
    method: 'post',
    data: data
  })
}

// 修改笔记搜索
export function updateSearch(data: StuNoteSearch): Promise<AjaxResult> {
  return request({
    url: '/search/search',
    method: 'put',
    data: data
  })
}

// 删除笔记搜索
export function delSearch(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/search/search/' + id,
    method: 'delete'
  })
}


