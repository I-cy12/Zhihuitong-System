package com.zhihuitong.template.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.template.mapper.StuNoteTemplateMapper;
import com.zhihuitong.template.domain.StuNoteTemplate;
import com.zhihuitong.template.service.IStuNoteTemplateService;

/**
 * 笔记模板Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
@Service
public class StuNoteTemplateServiceImpl implements IStuNoteTemplateService 
{
    @Autowired
    private StuNoteTemplateMapper stuNoteTemplateMapper;

    /**
     * 查询笔记模板
     * 
     * @param id 笔记模板主键
     * @return 笔记模板
     */
    @Override
    public StuNoteTemplate selectStuNoteTemplateById(Long id)
    {
        return stuNoteTemplateMapper.selectStuNoteTemplateById(id);
    }

    /**
     * 查询笔记模板列表
     * 
     * @param stuNoteTemplate 笔记模板
     * @return 笔记模板
     */
    @Override
    public List<StuNoteTemplate> selectStuNoteTemplateList(StuNoteTemplate stuNoteTemplate)
    {
        return stuNoteTemplateMapper.selectStuNoteTemplateList(stuNoteTemplate);
    }

    /**
     * 新增笔记模板
     * 
     * @param stuNoteTemplate 笔记模板
     * @return 结果
     */
    @Override
    public int insertStuNoteTemplate(StuNoteTemplate stuNoteTemplate)
    {
        return stuNoteTemplateMapper.insertStuNoteTemplate(stuNoteTemplate);
    }

    /**
     * 修改笔记模板
     * 
     * @param stuNoteTemplate 笔记模板
     * @return 结果
     */
    @Override
    public int updateStuNoteTemplate(StuNoteTemplate stuNoteTemplate)
    {
        return stuNoteTemplateMapper.updateStuNoteTemplate(stuNoteTemplate);
    }

    /**
     * 批量删除笔记模板
     * 
     * @param ids 需要删除的笔记模板主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteTemplateByIds(Long[] ids)
    {
        return stuNoteTemplateMapper.deleteStuNoteTemplateByIds(ids);
    }

    /**
     * 删除笔记模板信息
     * 
     * @param id 笔记模板主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteTemplateById(Long id)
    {
        return stuNoteTemplateMapper.deleteStuNoteTemplateById(id);
    }
}
