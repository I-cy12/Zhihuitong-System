package com.zhihuitong.electric.mapper;

import java.util.List;
import com.zhihuitong.electric.domain.LogisticsElectric;

/**
 * 电控管理Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
public interface LogisticsElectricMapper 
{
    /**
     * 查询电控管理
     * 
     * @param id 电控管理主键
     * @return 电控管理
     */
    public LogisticsElectric selectLogisticsElectricById(Long id);

    /**
     * 查询电控管理列表
     * 
     * @param logisticsElectric 电控管理
     * @return 电控管理集合
     */
    public List<LogisticsElectric> selectLogisticsElectricList(LogisticsElectric logisticsElectric);

    /**
     * 新增电控管理
     * 
     * @param logisticsElectric 电控管理
     * @return 结果
     */
    public int insertLogisticsElectric(LogisticsElectric logisticsElectric);

    /**
     * 修改电控管理
     * 
     * @param logisticsElectric 电控管理
     * @return 结果
     */
    public int updateLogisticsElectric(LogisticsElectric logisticsElectric);

    /**
     * 删除电控管理
     * 
     * @param id 电控管理主键
     * @return 结果
     */
    public int deleteLogisticsElectricById(Long id);

    /**
     * 批量删除电控管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLogisticsElectricByIds(Long[] ids);
}
