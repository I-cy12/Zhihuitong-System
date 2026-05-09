import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, CourseQueryParams, StuCourse } from '@/types'

// 查询课表管理列表
export function listCourse(query: CourseQueryParams): Promise<TableDataInfo<StuCourse[]>> {
  return request({
    url: '/course/course/list',
    method: 'get',
    params: query
  })
}

// 查询课表管理详细
export function getCourse(id: number): Promise<AjaxResult<StuCourse>> {
  return request({
    url: '/course/course/' + id,
    method: 'get'
  })
}

// 新增课表管理
export function addCourse(data: StuCourse): Promise<AjaxResult> {
  return request({
    url: '/course/course',
    method: 'post',
    data: data
  })
}

// 修改课表管理
export function updateCourse(data: StuCourse): Promise<AjaxResult> {
  return request({
    url: '/course/course',
    method: 'put',
    data: data
  })
}

// 删除课表管理
export function delCourse(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/course/course/' + id,
    method: 'delete'
  })
}


