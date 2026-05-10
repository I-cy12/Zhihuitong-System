import type { PageDomain, BaseEntity } from "../common";

/** 校园知识内容配置分页查询参数 */
export interface KnowledgeQueryParams extends PageDomain {
  /** 分类ID */
  typeId?: number;
  /** 知识标题 */
  title?: string;
  /** 状态 0草稿 1已发布 */
  status?: string;
}

/** 校园知识内容配置信息 */
export interface SysCampusKnowledge extends BaseEntity {
  /** 主键ID */
  id?: number;
  /** 分类ID */
  typeId?: number;
  /** 知识标题 */
  title?: string;
  /** 富文本正文内容 */
  content?: string;
  /** 附件地址（PDF/Word） */
  fileUrl?: string;
  /** 状态 0草稿 1已发布 */
  status?: string;
  /** 创建者 */
  createBy?: string;
  /** ${column.columnComment} */
  createTime?: string;
  /** ${column.columnComment} */
  updateTime?: string;
}
