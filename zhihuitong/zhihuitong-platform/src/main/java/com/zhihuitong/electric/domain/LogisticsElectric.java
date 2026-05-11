package com.zhihuitong.electric.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 电控管理对象 logistics_electric
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
public class LogisticsElectric extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String areaName;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 设备编号 */
    @Excel(name = "设备编号")
    private String deviceCode;

    /** 用电量(度) */
    @Excel(name = "用电量(度)")
    private BigDecimal electricConsumption;

    /** 使用状态 0正常 1异常 2离线 */
    @Excel(name = "使用状态 0正常 1异常 2离线")
    private String useStatus;

    /** 使用日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "使用日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date useDate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }

    public void setDeviceName(String deviceName) 
    {
        this.deviceName = deviceName;
    }

    public String getDeviceName() 
    {
        return deviceName;
    }

    public void setDeviceCode(String deviceCode) 
    {
        this.deviceCode = deviceCode;
    }

    public String getDeviceCode() 
    {
        return deviceCode;
    }

    public void setElectricConsumption(BigDecimal electricConsumption) 
    {
        this.electricConsumption = electricConsumption;
    }

    public BigDecimal getElectricConsumption() 
    {
        return electricConsumption;
    }

    public void setUseStatus(String useStatus) 
    {
        this.useStatus = useStatus;
    }

    public String getUseStatus() 
    {
        return useStatus;
    }

    public void setUseDate(Date useDate) 
    {
        this.useDate = useDate;
    }

    public Date getUseDate() 
    {
        return useDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("areaName", getAreaName())
            .append("deviceName", getDeviceName())
            .append("deviceCode", getDeviceCode())
            .append("electricConsumption", getElectricConsumption())
            .append("useStatus", getUseStatus())
            .append("useDate", getUseDate())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
