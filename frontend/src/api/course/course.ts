import request from '@/utils/request'
import type { AjaxResult, TableDataInfo, CourseQueryParams, StuCourse } from '@/types'

// 查询学生课列表
export function listCourse(query: CourseQueryParams): Promise<TableDataInfo<StuCourse[]>> {
  return request({
    url: '/course/course/list',
    method: 'get',
    params: query
  })
}

// 查询学生课详细
export function getCourse(id: number): Promise<AjaxResult<StuCourse>> {
  return request({
    url: '/course/course/' + id,
    method: 'get'
  })
}

// 新增学生课
export function addCourse(data: StuCourse): Promise<AjaxResult> {
  return request({
    url: '/course/course',
    method: 'post',
    data: data
  })
}

// 修改学生课
export function updateCourse(data: StuCourse): Promise<AjaxResult> {
  return request({
    url: '/course/course',
    method: 'put',
    data: data
  })
}

// 删除学生课
export function delCourse(id: number | number[]): Promise<AjaxResult> {
  return request({
    url: '/course/course/' + id,
    method: 'delete'
  })
}

// 查询课表周视图（当前登录学生）
export function weekViewCourse(query?: { term?: string }): Promise<AjaxResult<StuCourse[]>> {
  return request({
    url: '/course/course/weekView',
    method: 'get',
    params: query
  })
}


