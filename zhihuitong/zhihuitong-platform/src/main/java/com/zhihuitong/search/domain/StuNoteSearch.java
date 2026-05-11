package com.zhihuitong.search.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 笔记搜索对象 stu_note_search
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
public class StuNoteSearch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 关联笔记ID */
    private Long noteId;

    /** 笔记标题 */
    @Excel(name = "笔记标题")
    private String title;

    /** 笔记标签 */
    @Excel(name = "笔记标签")
    private String tags;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
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

    public void setTags(String tags) 
    {
        this.tags = tags;
    }

    public String getTags() 
    {
        return tags;
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
            .append("tags", getTags())
            .append("studentName", getStudentName())
            .append("createTime", getCreateTime())
            .toString();
    }
}
