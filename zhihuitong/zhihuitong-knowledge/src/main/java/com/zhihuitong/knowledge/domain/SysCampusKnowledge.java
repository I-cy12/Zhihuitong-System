package com.zhihuitong.knowledge.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zhihuitong.common.annotation.Excel;
import com.zhihuitong.common.core.domain.BaseEntity;

/**
 * 校园知识内容对象 sys_campus_knowledge
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
public class SysCampusKnowledge extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 分类ID */
    @Excel(name = "分类ID")
    private Long typeId;

    /** 知识标题 */
    @Excel(name = "知识标题")
    private String title;

    /** 富文本正文内容 */
    @Excel(name = "富文本正文内容")
    private String content;

    /** 附件地址（PDF/Word） */
    @Excel(name = "附件地址", readConverterExp = "P=DF/Word")
    private String fileUrl;

    /** 状态 0草稿 1已发布 */
    @Excel(name = "状态 0草稿 1已发布")
    private String status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setTypeId(Long typeId) 
    {
        this.typeId = typeId;
    }

    public Long getTypeId() 
    {
        return typeId;
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

    public void setFileUrl(String fileUrl) 
    {
        this.fileUrl = fileUrl;
    }

    public String getFileUrl() 
    {
        return fileUrl;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("typeId", getTypeId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("fileUrl", getFileUrl())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
