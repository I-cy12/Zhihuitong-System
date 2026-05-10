import type { PageDomain, BaseEntity } from "../common";

/** 校园知识分类配置分页查询参数 */
export interface TypeQueryParams extends PageDomain {
  /** 分类名称：规章制度/办事流程/校风校纪/通告批评 */
  typeName?: string;
  /** 状态 0正常 1停用 */
  status?: string;
}

/** 校园知识分类配置信息 */
export interface SysCampusKnowledgeType extends BaseEntity {
  /** 主键ID */
  id?: number;
  /** 分类名称：规章制度/办事流程/校风校纪/通告批评 */
  typeName?: string;
  /** 排序号 */
  sort?: number;
  /** 状态 0正常 1停用 */
  status?: string;
  /** ${column.columnComment} */
  createTime?: string;
}
