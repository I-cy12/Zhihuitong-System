package com.zhihuitong.template.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 笔记模板对象 stu_note_template
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
public class StuNoteTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 学生ID（为空表示系统内置模板；不为空表示学生自定义模板） */
    @Excel(name = "学生ID", readConverterExp = "为=空表示系统内置模板；不为空表示学生自定义模板")
    private Long studentId;

    /** 模板名称 */
    @Excel(name = "模板名称")
    private String name;

    /** 模板类型（CLASS/EXPERIMENT/INTERVIEW/CUSTOM） */
    @Excel(name = "模板类型", readConverterExp = "C=LASS/EXPERIMENT/INTERVIEW/CUSTOM")
    private String type;

    /** 模板内容（纯文本/Markdown） */
    @Excel(name = "模板内容", readConverterExp = "纯=文本/Markdown")
    private String content;

    /** 排序号（越小越靠前） */
    @Excel(name = "排序号", readConverterExp = "越=小越靠前")
    private Long sortNo;

    /** 状态（0启用 1停用） */
    @Excel(name = "状态", readConverterExp = "0=启用,1=停用")
    private String status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 更新时间 */
    private Date updatedAt;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setSortNo(Long sortNo) 
    {
        this.sortNo = sortNo;
    }

    public Long getSortNo() 
    {
        return sortNo;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }

    public void setUpdatedAt(Date updatedAt) 
    {
        this.updatedAt = updatedAt;
    }

    public Date getUpdatedAt() 
    {
        return updatedAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("studentId", getStudentId())
            .append("name", getName())
            .append("type", getType())
            .append("content", getContent())
            .append("sortNo", getSortNo())
            .append("status", getStatus())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .toString();
    }
}
