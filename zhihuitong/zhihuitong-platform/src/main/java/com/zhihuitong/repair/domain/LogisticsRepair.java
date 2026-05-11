package com.zhihuitong.repair.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 报修管理对象 logistics_repair
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
public class LogisticsRepair extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 报修单号 */
    private String repairNo;

    /** 报修类型  */
    @Excel(name = "报修类型 ")
    private String repairType;

    /** 报修标题 */
    @Excel(name = "报修标题")
    private String repairTitle;

    /** 报修内容 */
    @Excel(name = "报修内容")
    private String repairContent;

    /** 报修人 */
    @Excel(name = "报修人")
    private String repairPerson;

    /** 报修电话 */
    @Excel(name = "报修电话")
    private String repairPhone;

    /** 报修地点 */
    @Excel(name = "报修地点")
    private String repairAddress;

    /** 报修状态  */
    @Excel(name = "报修状态 ")
    private String repairStatus;

    /** 处理人 */
    @Excel(name = "处理人")
    private String handlePerson;

    /** 处理结果 */
    @Excel(name = "处理结果")
    private String handleContent;

    /** 处理时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "处理时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date handleTime;

    /** 报修照片 */
    @Excel(name = "报修照片")
    private String repairImage;

    /** 处理照片 */
    @Excel(name = "处理照片")
    private String handleImage;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setRepairNo(String repairNo) 
    {
        this.repairNo = repairNo;
    }

    public String getRepairNo() 
    {
        return repairNo;
    }

    public void setRepairType(String repairType) 
    {
        this.repairType = repairType;
    }

    public String getRepairType() 
    {
        return repairType;
    }

    public void setRepairTitle(String repairTitle) 
    {
        this.repairTitle = repairTitle;
    }

    public String getRepairTitle() 
    {
        return repairTitle;
    }

    public void setRepairContent(String repairContent) 
    {
        this.repairContent = repairContent;
    }

    public String getRepairContent() 
    {
        return repairContent;
    }

    public void setRepairPerson(String repairPerson) 
    {
        this.repairPerson = repairPerson;
    }

    public String getRepairPerson() 
    {
        return repairPerson;
    }

    public void setRepairPhone(String repairPhone) 
    {
        this.repairPhone = repairPhone;
    }

    public String getRepairPhone() 
    {
        return repairPhone;
    }

    public void setRepairAddress(String repairAddress) 
    {
        this.repairAddress = repairAddress;
    }

    public String getRepairAddress() 
    {
        return repairAddress;
    }

    public void setRepairStatus(String repairStatus) 
    {
        this.repairStatus = repairStatus;
    }

    public String getRepairStatus() 
    {
        return repairStatus;
    }

    public void setHandlePerson(String handlePerson) 
    {
        this.handlePerson = handlePerson;
    }

    public String getHandlePerson() 
    {
        return handlePerson;
    }

    public void setHandleContent(String handleContent) 
    {
        this.handleContent = handleContent;
    }

    public String getHandleContent() 
    {
        return handleContent;
    }

    public void setHandleTime(Date handleTime) 
    {
        this.handleTime = handleTime;
    }

    public Date getHandleTime() 
    {
        return handleTime;
    }

    public void setRepairImage(String repairImage) 
    {
        this.repairImage = repairImage;
    }

    public String getRepairImage() 
    {
        return repairImage;
    }

    public void setHandleImage(String handleImage) 
    {
        this.handleImage = handleImage;
    }

    public String getHandleImage() 
    {
        return handleImage;
    }

    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("repairNo", getRepairNo())
            .append("repairType", getRepairType())
            .append("repairTitle", getRepairTitle())
            .append("repairContent", getRepairContent())
            .append("repairPerson", getRepairPerson())
            .append("repairPhone", getRepairPhone())
            .append("repairAddress", getRepairAddress())
            .append("repairStatus", getRepairStatus())
            .append("handlePerson", getHandlePerson())
            .append("handleContent", getHandleContent())
            .append("handleTime", getHandleTime())
            .append("repairImage", getRepairImage())
            .append("handleImage", getHandleImage())
            .append("sort", getSort())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
