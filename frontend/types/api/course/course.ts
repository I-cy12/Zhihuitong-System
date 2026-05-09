import type { PageDomain, BaseEntity } from "../common";

/** 课表管理配置分页查询参数 */
export interface CourseQueryParams extends PageDomain {
  /** 学生ID（对应学号/用户ID） */
  studentId?: number;
  /** 学期标识（示例：2025-2026-1） */
  term?: string;
  /** 课程名称 */
  name?: string;
  /** 任课教师 */
  teacher?: string;
  /** 星期几（1=周一…7=周日） */
  dayOfWeek?: number;
}

/** 课表管理配置信息 */
export interface StuCourse extends BaseEntity {
  /** 主键ID */
  id?: number;
  /** 学生ID（对应学号/用户ID） */
  studentId?: number;
  /** 学期标识（示例：2025-2026-1） */
  term?: string;
  /** 课程名称 */
  name?: string;
  /** 任课教师 */
  teacher?: string;
  /** 星期几（1=周一…7=周日） */
  dayOfWeek?: number;
  /** 开始节次（从1开始） */
  startSection?: number;
  /** 结束节次（&gt;=开始节次） */
  endSection?: number;
  /** 上课地点（教学楼/教室） */
  location?: string;
  /** 备注（如：专业核心/专业基础/方向课） */
  remark?: string;
  /** 创建时间 */
  createdAt?: string;
  /** 更新时间 */
  updatedAt?: string;
}
