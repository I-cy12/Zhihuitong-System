package com.zhihuitong.course.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 课表管理对象 stu_course
 * 
 * @author ruoyi
 * @date 2026-05-07
 */
public class StuCourse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Integer id;

    /** 学生ID（对应学号/用户ID） */
    @Excel(name = "学生ID", readConverterExp = "对=应学号/用户ID")
    private Integer studentId;

    /** 学期标识（示例：2025-2026-1） */
    @Excel(name = "学期标识", readConverterExp = "示=例：2025-2026-1")
    private String term;

    /** 课程名称 */
    @Excel(name = "课程名称")
    private String name;

    /** 任课教师 */
    @Excel(name = "任课教师")
    private String teacher;

    /** 星期几（1=周一…7=周日） */
    @Excel(name = "星期几", readConverterExp = "1==周一…7=周日")
    private Integer dayOfWeek;

    /** 开始节次（从1开始） */
    @Excel(name = "开始节次", readConverterExp = "从=1开始")
    private Integer startSection;

    /** 结束节次（&gt;=开始节次） */
    @Excel(name = "结束节次", readConverterExp = "&=gt;=开始节次")
    private Integer endSection;

    /** 上课地点（教学楼/教室） */
    @Excel(name = "上课地点", readConverterExp = "教=学楼/教室")
    private String location;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 更新时间 */
    private Date updatedAt;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }

    public void setStudentId(Integer studentId) 
    {
        this.studentId = studentId;
    }

    public Integer getStudentId() 
    {
        return studentId;
    }

    public void setTerm(String term) 
    {
        this.term = term;
    }

    public String getTerm() 
    {
        return term;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setTeacher(String teacher) 
    {
        this.teacher = teacher;
    }

    public String getTeacher() 
    {
        return teacher;
    }

    public void setDayOfWeek(Integer dayOfWeek) 
    {
        this.dayOfWeek = dayOfWeek;
    }

    public Integer getDayOfWeek() 
    {
        return dayOfWeek;
    }

    public void setStartSection(Integer startSection) 
    {
        this.startSection = startSection;
    }

    public Integer getStartSection() 
    {
        return startSection;
    }

    public void setEndSection(Integer endSection) 
    {
        this.endSection = endSection;
    }

    public Integer getEndSection() 
    {
        return endSection;
    }

    public void setLocation(String location) 
    {
        this.location = location;
    }

    public String getLocation() 
    {
        return location;
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
            .append("term", getTerm())
            .append("name", getName())
            .append("teacher", getTeacher())
            .append("dayOfWeek", getDayOfWeek())
            .append("startSection", getStartSection())
            .append("endSection", getEndSection())
            .append("location", getLocation())
            .append("remark", getRemark())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .toString();
    }
}
