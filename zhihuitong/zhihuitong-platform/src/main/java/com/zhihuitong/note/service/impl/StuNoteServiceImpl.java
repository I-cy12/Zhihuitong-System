package com.zhihuitong.note.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.note.mapper.StuNoteMapper;
import com.zhihuitong.note.domain.StuNote;
import com.zhihuitong.note.service.IStuNoteService;

/**
 * 学习笔记Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
@Service
public class StuNoteServiceImpl implements IStuNoteService 
{
    @Autowired
    private StuNoteMapper stuNoteMapper;

    /**
     * 查询学习笔记
     * 
     * @param id 学习笔记主键
     * @return 学习笔记
     */
    @Override
    public StuNote selectStuNoteById(Long id)
    {
        return stuNoteMapper.selectStuNoteById(id);
    }

    /**
     * 查询学习笔记列表
     * 
     * @param stuNote 学习笔记
     * @return 学习笔记
     */
    @Override
    public List<StuNote> selectStuNoteList(StuNote stuNote)
    {
        return stuNoteMapper.selectStuNoteList(stuNote);
    }

    /**
     * 新增学习笔记
     * 
     * @param stuNote 学习笔记
     * @return 结果
     */
    @Override
    public int insertStuNote(StuNote stuNote)
    {
        return stuNoteMapper.insertStuNote(stuNote);
    }

    /**
     * 修改学习笔记
     * 
     * @param stuNote 学习笔记
     * @return 结果
     */
    @Override
    public int updateStuNote(StuNote stuNote)
    {
        return stuNoteMapper.updateStuNote(stuNote);
    }

    /**
     * 批量删除学习笔记
     * 
     * @param ids 需要删除的学习笔记主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteByIds(Long[] ids)
    {
        return stuNoteMapper.deleteStuNoteByIds(ids);
    }

    /**
     * 删除学习笔记信息
     * 
     * @param id 学习笔记主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteById(Long id)
    {
        return stuNoteMapper.deleteStuNoteById(id);
    }
}
