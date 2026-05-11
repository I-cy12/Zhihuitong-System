package com.zhihuitong.electric.service.impl;

import java.util.List;
import com.zhihuitong.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.electric.mapper.LogisticsElectricMapper;
import com.zhihuitong.electric.domain.LogisticsElectric;
import com.zhihuitong.electric.service.ILogisticsElectricService;

/**
 * 电控管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
@Service
public class LogisticsElectricServiceImpl implements ILogisticsElectricService 
{
    @Autowired
    private LogisticsElectricMapper logisticsElectricMapper;

    /**
     * 查询电控管理
     * 
     * @param id 电控管理主键
     * @return 电控管理
     */
    @Override
    public LogisticsElectric selectLogisticsElectricById(Long id)
    {
        return logisticsElectricMapper.selectLogisticsElectricById(id);
    }

    /**
     * 查询电控管理列表
     * 
     * @param logisticsElectric 电控管理
     * @return 电控管理
     */
    @Override
    public List<LogisticsElectric> selectLogisticsElectricList(LogisticsElectric logisticsElectric)
    {
        return logisticsElectricMapper.selectLogisticsElectricList(logisticsElectric);
    }

    /**
     * 新增电控管理
     * 
     * @param logisticsElectric 电控管理
     * @return 结果
     */
    @Override
    public int insertLogisticsElectric(LogisticsElectric logisticsElectric)
    {
        logisticsElectric.setCreateTime(DateUtils.getNowDate());
        return logisticsElectricMapper.insertLogisticsElectric(logisticsElectric);
    }

    /**
     * 修改电控管理
     * 
     * @param logisticsElectric 电控管理
     * @return 结果
     */
    @Override
    public int updateLogisticsElectric(LogisticsElectric logisticsElectric)
    {
        logisticsElectric.setUpdateTime(DateUtils.getNowDate());
        return logisticsElectricMapper.updateLogisticsElectric(logisticsElectric);
    }

    /**
     * 批量删除电控管理
     * 
     * @param ids 需要删除的电控管理主键
     * @return 结果
     */
    @Override
    public int deleteLogisticsElectricByIds(Long[] ids)
    {
        return logisticsElectricMapper.deleteLogisticsElectricByIds(ids);
    }

    /**
     * 删除电控管理信息
     * 
     * @param id 电控管理主键
     * @return 结果
     */
    @Override
    public int deleteLogisticsElectricById(Long id)
    {
        return logisticsElectricMapper.deleteLogisticsElectricById(id);
    }
}
