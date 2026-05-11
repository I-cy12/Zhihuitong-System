package com.zhihuitong.water.mapper;

import java.util.List;
import com.zhihuitong.water.domain.LogisticsWater;

/**
 * 水控管理Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
public interface LogisticsWaterMapper 
{
    /**
     * 查询水控管理
     * 
     * @param id 水控管理主键
     * @return 水控管理
     */
    public LogisticsWater selectLogisticsWaterById(Long id);

    /**
     * 查询水控管理列表
     * 
     * @param logisticsWater 水控管理
     * @return 水控管理集合
     */
    public List<LogisticsWater> selectLogisticsWaterList(LogisticsWater logisticsWater);

    /**
     * 新增水控管理
     * 
     * @param logisticsWater 水控管理
     * @return 结果
     */
    public int insertLogisticsWater(LogisticsWater logisticsWater);

    /**
     * 修改水控管理
     * 
     * @param logisticsWater 水控管理
     * @return 结果
     */
    public int updateLogisticsWater(LogisticsWater logisticsWater);

    /**
     * 删除水控管理
     * 
     * @param id 水控管理主键
     * @return 结果
     */
    public int deleteLogisticsWaterById(Long id);

    /**
     * 批量删除水控管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLogisticsWaterByIds(Long[] ids);
}
