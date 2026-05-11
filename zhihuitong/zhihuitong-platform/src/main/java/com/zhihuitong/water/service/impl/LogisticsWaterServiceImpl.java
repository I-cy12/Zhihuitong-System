package com.zhihuitong.water.service.impl;

import java.util.List;
import com.zhihuitong.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.water.mapper.LogisticsWaterMapper;
import com.zhihuitong.water.domain.LogisticsWater;
import com.zhihuitong.water.service.ILogisticsWaterService;

/**
 * 水控管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
@Service
public class LogisticsWaterServiceImpl implements ILogisticsWaterService 
{
    @Autowired
    private LogisticsWaterMapper logisticsWaterMapper;

    /**
     * 查询水控管理
     * 
     * @param id 水控管理主键
     * @return 水控管理
     */
    @Override
    public LogisticsWater selectLogisticsWaterById(Long id)
    {
        return logisticsWaterMapper.selectLogisticsWaterById(id);
    }

    /**
     * 查询水控管理列表
     * 
     * @param logisticsWater 水控管理
     * @return 水控管理
     */
    @Override
    public List<LogisticsWater> selectLogisticsWaterList(LogisticsWater logisticsWater)
    {
        return logisticsWaterMapper.selectLogisticsWaterList(logisticsWater);
    }

    /**
     * 新增水控管理
     * 
     * @param logisticsWater 水控管理
     * @return 结果
     */
    @Override
    public int insertLogisticsWater(LogisticsWater logisticsWater)
    {
        logisticsWater.setCreateTime(DateUtils.getNowDate());
        return logisticsWaterMapper.insertLogisticsWater(logisticsWater);
    }

    /**
     * 修改水控管理
     * 
     * @param logisticsWater 水控管理
     * @return 结果
     */
    @Override
    public int updateLogisticsWater(LogisticsWater logisticsWater)
    {
        logisticsWater.setUpdateTime(DateUtils.getNowDate());
        return logisticsWaterMapper.updateLogisticsWater(logisticsWater);
    }

    /**
     * 批量删除水控管理
     * 
     * @param ids 需要删除的水控管理主键
     * @return 结果
     */
    @Override
    public int deleteLogisticsWaterByIds(Long[] ids)
    {
        return logisticsWaterMapper.deleteLogisticsWaterByIds(ids);
    }

    /**
     * 删除水控管理信息
     * 
     * @param id 水控管理主键
     * @return 结果
     */
    @Override
    public int deleteLogisticsWaterById(Long id)
    {
        return logisticsWaterMapper.deleteLogisticsWaterById(id);
    }
}
