package com.zhihuitong.repair.service;

import java.util.List;
import com.zhihuitong.repair.domain.LogisticsRepair;

/**
 * 报修管理Service接口
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
public interface ILogisticsRepairService 
{
    /**
     * 查询报修管理
     * 
     * @param id 报修管理主键
     * @return 报修管理
     */
    public LogisticsRepair selectLogisticsRepairById(Long id);

    /**
     * 查询报修管理列表
     * 
     * @param logisticsRepair 报修管理
     * @return 报修管理集合
     */
    public List<LogisticsRepair> selectLogisticsRepairList(LogisticsRepair logisticsRepair);

    /**
     * 新增报修管理
     * 
     * @param logisticsRepair 报修管理
     * @return 结果
     */
    public int insertLogisticsRepair(LogisticsRepair logisticsRepair);

    /**
     * 修改报修管理
     * 
     * @param logisticsRepair 报修管理
     * @return 结果
     */
    public int updateLogisticsRepair(LogisticsRepair logisticsRepair);

    /**
     * 批量删除报修管理
     * 
     * @param ids 需要删除的报修管理主键集合
     * @return 结果
     */
    public int deleteLogisticsRepairByIds(Long[] ids);

    /**
     * 删除报修管理信息
     * 
     * @param id 报修管理主键
     * @return 结果
     */
    public int deleteLogisticsRepairById(Long id);
}
