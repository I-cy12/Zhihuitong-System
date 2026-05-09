package com.zhihuitong.note.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 学习笔记对象 stu_note
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
public class StuNote extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 学生ID（对应学号/用户ID） */
    @Excel(name = "学生ID", readConverterExp = "对=应学号/用户ID")
    private Long studentId;

    /** 关联课程ID（可选，对应 stu_course.id） */
    @Excel(name = "关联课程ID", readConverterExp = "可=选，对应,s=tu_course.id")
    private Long courseId;

    /** 课程名称快照（可选；课程被改名/删除后仍可显示） */
    @Excel(name = "课程名称快照", readConverterExp = "可=选；课程被改名/删除后仍可显示")
    private String courseNameSnapshot;

    /** 笔记标题 */
    @Excel(name = "笔记标题")
    private String title;

    /** 笔记内容（纯文本/Markdown均可存） */
    @Excel(name = "笔记内容", readConverterExp = "纯=文本/Markdown均可存")
    private String content;

    /** 标签（逗号分隔，如：需求,设计,复习） */
    @Excel(name = "标签", readConverterExp = "逗=号分隔，如：需求,设计,复习")
    private String tags;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedAt;

    /** 笔记封面 */
    @Excel(name = "笔记封面")
    private String coverImage;

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

    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }

    public void setCourseNameSnapshot(String courseNameSnapshot) 
    {
        this.courseNameSnapshot = courseNameSnapshot;
    }

    public String getCourseNameSnapshot() 
    {
        return courseNameSnapshot;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setTags(String tags) 
    {
        this.tags = tags;
    }

    public String getTags() 
    {
        return tags;
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

    public void setCoverImage(String coverImage) 
    {
        this.coverImage = coverImage;
    }

    public String getCoverImage() 
    {
        return coverImage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("studentId", getStudentId())
            .append("courseId", getCourseId())
            .append("courseNameSnapshot", getCourseNameSnapshot())
            .append("title", getTitle())
            .append("content", getContent())
            .append("tags", getTags())
            .append("createdAt", getCreatedAt())
            .append("updatedAt", getUpdatedAt())
            .append("coverImage", getCoverImage())
            .toString();
    }
}
