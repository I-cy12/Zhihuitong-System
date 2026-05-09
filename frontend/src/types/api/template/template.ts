import type { PageDomain, BaseEntity } from "../common";

/** 笔记模板配置分页查询参数 */
export interface TemplateQueryParams extends PageDomain {
  /** 模板名称 */
  name?: string;
}

/** 笔记模板配置信息 */
export interface StuNoteTemplate extends BaseEntity {
  /** 主键ID */
  id?: number;
  /** 学生ID（为空表示系统内置模板；不为空表示学生自定义模板） */
  studentId?: number;
  /** 模板名称 */
  name?: string;
  /** 模板类型（CLASS/EXPERIMENT/INTERVIEW/CUSTOM） */
  type?: string;
  /** 模板内容（纯文本/Markdown） */
  content?: string;
  /** 排序号（越小越靠前） */
  sortNo?: number;
  /** 状态（0启用 1停用） */
  status?: string;
  /** 创建时间 */
  createdAt?: string;
  /** 更新时间 */
  updatedAt?: string;
}
