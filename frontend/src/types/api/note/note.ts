import type { PageDomain, BaseEntity } from "../common";

/** 学习笔记配置分页查询参数 */
export interface NoteQueryParams extends PageDomain {
  /** 课程名称快照（可选；课程被改名/删除后仍可显示） */
  courseNameSnapshot?: string;
  /** 笔记标题 */
  title?: string;
  /** 笔记内容（纯文本/Markdown均可存） */
  content?: string;
  /** 标签（逗号分隔，如：需求,设计,复习） */
  tags?: string;
  /** 笔记封面 */
  image?: string;
}

/** 学习笔记配置信息 */
export interface StuNote extends BaseEntity {
  /** 主键ID */
  id?: number;
  /** 学生ID（对应学号/用户ID） */
  studentId?: number;
  /** 关联课程ID（可选，对应 stu_course.id） */
  courseId?: number;
  /** 课程名称快照（可选；课程被改名/删除后仍可显示） */
  courseNameSnapshot?: string;
  /** 笔记标题 */
  title?: string;
  /** 笔记内容（纯文本/Markdown均可存） */
  content?: string;
  /** 标签（逗号分隔，如：需求,设计,复习） */
  tags?: string;
  /** 创建时间 */
  createdAt?: string;
  /** 更新时间 */
  updatedAt?: string;
  /** 笔记封面 */
  image?: string;
}
