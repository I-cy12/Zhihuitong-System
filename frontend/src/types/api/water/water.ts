import type { PageDomain, BaseEntity } from "../common";

/** 水控管理配置分页查询参数 */
export interface WaterQueryParams extends PageDomain {
  /** 区域名称 */
  areaName?: string;
  /** 设备名称 */
  deviceName?: string;
  /** 设备编号 */
  deviceCode?: string;
  /** 使用状态 0正常 1异常 2离线 */
  useStatus?: string;
}

/** 水控管理配置信息 */
export interface LogisticsWater extends BaseEntity {
  /** 主键ID */
  id?: number;
  /** 区域名称 */
  areaName?: string;
  /** 设备名称 */
  deviceName?: string;
  /** 设备编号 */
  deviceCode?: string;
  /** 用水量(吨) */
  waterConsumption?: string;
  /** 使用状态 0正常 1异常 2离线 */
  useStatus?: string;
  /** 使用日期 */
  useDate?: string;
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
