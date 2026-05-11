package com.zhihuitong.repair.service.impl;

import java.util.List;
import com.zhihuitong.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.repair.mapper.LogisticsRepairMapper;
import com.zhihuitong.repair.domain.LogisticsRepair;
import com.zhihuitong.repair.service.ILogisticsRepairService;

/**
 * 报修管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
@Service
public class LogisticsRepairServiceImpl implements ILogisticsRepairService 
{
    @Autowired
    private LogisticsRepairMapper logisticsRepairMapper;

    /**
     * 查询报修管理
     * 
     * @param id 报修管理主键
     * @return 报修管理
     */
    @Override
    public LogisticsRepair selectLogisticsRepairById(Long id)
    {
        return logisticsRepairMapper.selectLogisticsRepairById(id);
    }

    /**
     * 查询报修管理列表
     * 
     * @param logisticsRepair 报修管理
     * @return 报修管理
     */
    @Override
    public List<LogisticsRepair> selectLogisticsRepairList(LogisticsRepair logisticsRepair)
    {
        return logisticsRepairMapper.selectLogisticsRepairList(logisticsRepair);
    }

    /**
     * 新增报修管理
     * 
     * @param logisticsRepair 报修管理
     * @return 结果
     */
    @Override
    public int insertLogisticsRepair(LogisticsRepair logisticsRepair)
    {
        logisticsRepair.setCreateTime(DateUtils.getNowDate());
        return logisticsRepairMapper.insertLogisticsRepair(logisticsRepair);
    }

    /**
     * 修改报修管理
     * 
     * @param logisticsRepair 报修管理
     * @return 结果
     */
    @Override
    public int updateLogisticsRepair(LogisticsRepair logisticsRepair)
    {
        logisticsRepair.setUpdateTime(DateUtils.getNowDate());
        return logisticsRepairMapper.updateLogisticsRepair(logisticsRepair);
    }

    /**
     * 批量删除报修管理
     * 
     * @param ids 需要删除的报修管理主键
     * @return 结果
     */
    @Override
    public int deleteLogisticsRepairByIds(Long[] ids)
    {
        return logisticsRepairMapper.deleteLogisticsRepairByIds(ids);
    }

    /**
     * 删除报修管理信息
     * 
     * @param id 报修管理主键
     * @return 结果
     */
    @Override
    public int deleteLogisticsRepairById(Long id)
    {
        return logisticsRepairMapper.deleteLogisticsRepairById(id);
    }
}
