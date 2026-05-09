import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, NoteQueryParams, StuNote } from '@/types'

// 查询学习笔记列表
export function listNote(query: NoteQueryParams): Promise<TableDataInfo<StuNote[]>> {
  return request({
    url: '/note/note/list',
    method: 'get',
    params: query
  })
}

// 查询学习笔记详细
export function getNote(id: number): Promise<AjaxResult<StuNote>> {
  return request({
    url: '/note/note/' + id,
    method: 'get'
  })
}

// 新增学习笔记
export function addNote(data: StuNote): Promise<AjaxResult> {
  return request({
    url: '/note/note',
    method: 'post',
    data: data
  })
}

// 修改学习笔记
export function updateNote(data: StuNote): Promise<AjaxResult> {
  return request({
    url: '/note/note',
    method: 'put',
    data: data
  })
}

// 删除学习笔记
export function delNote(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/note/note/' + id,
    method: 'delete'
  })
}


