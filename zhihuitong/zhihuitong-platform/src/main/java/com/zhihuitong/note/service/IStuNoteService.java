package com.zhihuitong.note.service;

import java.util.List;
import com.zhihuitong.note.domain.StuNote;

/**
 * 学习笔记Service接口
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
public interface IStuNoteService 
{
    /**
     * 查询学习笔记
     * 
     * @param id 学习笔记主键
     * @return 学习笔记
     */
    public StuNote selectStuNoteById(Long id);

    /**
     * 查询学习笔记列表
     * 
     * @param stuNote 学习笔记
     * @return 学习笔记集合
     */
    public List<StuNote> selectStuNoteList(StuNote stuNote);

    /**
     * 新增学习笔记
     * 
     * @param stuNote 学习笔记
     * @return 结果
     */
    public int insertStuNote(StuNote stuNote);

    /**
     * 修改学习笔记
     * 
     * @param stuNote 学习笔记
     * @return 结果
     */
    public int updateStuNote(StuNote stuNote);

    /**
     * 批量删除学习笔记
     * 
     * @param ids 需要删除的学习笔记主键集合
     * @return 结果
     */
    public int deleteStuNoteByIds(Long[] ids);

    /**
     * 删除学习笔记信息
     * 
     * @param id 学习笔记主键
     * @return 结果
     */
    public int deleteStuNoteById(Long id);
}
