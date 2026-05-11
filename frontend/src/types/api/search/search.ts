import type { PageDomain, BaseEntity } from "../common";

/** 笔记搜索配置分页查询参数 */
export interface SearchQueryParams extends PageDomain {
  /** 笔记标题 */
  title?: string;
  /** 笔记标签 */
  tags?: string;
  /** 学生姓名 */
  studentName?: string;
  /** 创建时间 */
  createTime?: string;
}

/** 笔记搜索配置信息 */
export interface StuNoteSearch extends BaseEntity {
  /** 主键 */
  id?: number;
  /** 关联笔记ID */
  noteId?: number;
  /** 笔记标题 */
  title?: string;
  /** 笔记标签 */
  tags?: string;
  /** 学生姓名 */
  studentName?: string;
  /** 创建时间 */
  createTime?: string;
}
