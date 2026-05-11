import type { PageDomain, BaseEntity } from "../common";

/** 报修管理配置分页查询参数 */
export interface RepairQueryParams extends PageDomain {
  /** 报修类型  */
  repairType?: string;
  /** 报修人 */
  repairPerson?: string;
  /** 报修状态  */
  repairStatus?: string;
  /** 处理人 */
  handlePerson?: string;
}

/** 报修管理配置信息 */
export interface LogisticsRepair extends BaseEntity {
  /** 主键ID */
  id?: number;
  /** 报修单号 */
  repairNo?: string;
  /** 报修类型  */
  repairType?: string;
  /** 报修标题 */
  repairTitle?: string;
  /** 报修内容 */
  repairContent?: string;
  /** 报修人 */
  repairPerson?: string;
  /** 报修电话 */
  repairPhone?: string;
  /** 报修地点 */
  repairAddress?: string;
  /** 报修状态  */
  repairStatus?: string;
  /** 处理人 */
  handlePerson?: string;
  /** 处理结果 */
  handleContent?: string;
  /** 处理时间 */
  handleTime?: string;
  /** 报修照片 */
  repairImage?: string;
  /** 处理照片 */
  handleImage?: string;
  /** 排序 */
  sort?: number;
  /** 备注 */
  remark?: string;
  /** 创建者 */
  createBy?: string;
  /** 创建时间 */
  createTime?: string;
  /** 更新者 */
  updateBy?: string;
  /** 更新时间 */
  updateTime?: string;
}
