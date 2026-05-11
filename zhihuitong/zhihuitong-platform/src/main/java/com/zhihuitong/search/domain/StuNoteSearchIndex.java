package com.zhihuitong.search.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 笔记搜索索引对象 stu_note_search_index
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
public class StuNoteSearchIndex extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 关联笔记ID */
    @Excel(name = "关联笔记ID")
    private Long noteId;

    /** 笔记标题（冗余用于搜索） */
    @Excel(name = "笔记标题", readConverterExp = "冗=余用于搜索")
    private String title;

    /** 笔记内容（冗余用于搜索） */
    @Excel(name = "笔记内容", readConverterExp = "冗=余用于搜索")
    private String content;

    /** 标签（冗余用于搜索） */
    @Excel(name = "标签", readConverterExp = "冗=余用于搜索")
    private String tags;

    /** 学生ID */
    @Excel(name = "学生ID")
    private Long studentId;

    /** 学生名称 */
    @Excel(name = "学生名称")
    private String studentName;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setNoteId(Long noteId) 
    {
        this.noteId = noteId;
    }

    public Long getNoteId() 
    {
        return noteId;
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

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }

    public void setStudentName(String studentName) 
    {
        this.studentName = studentName;
    }

    public String getStudentName() 
    {
        return studentName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("noteId", getNoteId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("tags", getTags())
            .append("studentId", getStudentId())
            .append("studentName", getStudentName())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
