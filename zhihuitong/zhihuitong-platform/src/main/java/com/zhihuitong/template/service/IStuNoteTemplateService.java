package com.zhihuitong.template.service;

import java.util.List;
import com.zhihuitong.template.domain.StuNoteTemplate;

/**
 * 笔记模板Service接口
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
public interface IStuNoteTemplateService 
{
    /**
     * 查询笔记模板
     * 
     * @param id 笔记模板主键
     * @return 笔记模板
     */
    public StuNoteTemplate selectStuNoteTemplateById(Long id);

    /**
     * 查询笔记模板列表
     * 
     * @param stuNoteTemplate 笔记模板
     * @return 笔记模板集合
     */
    public List<StuNoteTemplate> selectStuNoteTemplateList(StuNoteTemplate stuNoteTemplate);

    /**
     * 新增笔记模板
     * 
     * @param stuNoteTemplate 笔记模板
     * @return 结果
     */
    public int insertStuNoteTemplate(StuNoteTemplate stuNoteTemplate);

    /**
     * 修改笔记模板
     * 
     * @param stuNoteTemplate 笔记模板
     * @return 结果
     */
    public int updateStuNoteTemplate(StuNoteTemplate stuNoteTemplate);

    /**
     * 批量删除笔记模板
     * 
     * @param ids 需要删除的笔记模板主键集合
     * @return 结果
     */
    public int deleteStuNoteTemplateByIds(Long[] ids);

    /**
     * 删除笔记模板信息
     * 
     * @param id 笔记模板主键
     * @return 结果
     */
    public int deleteStuNoteTemplateById(Long id);
}
