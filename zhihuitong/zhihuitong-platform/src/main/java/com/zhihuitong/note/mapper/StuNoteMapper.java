package com.zhihuitong.note.mapper;

import java.util.List;
import com.zhihuitong.note.domain.StuNote;

/**
 * 学习笔记Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
public interface StuNoteMapper 
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
     * 删除学习笔记
     * 
     * @param id 学习笔记主键
     * @return 结果
     */
    public int deleteStuNoteById(Long id);

    /**
     * 批量删除学习笔记
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStuNoteByIds(Long[] ids);
}
