package com.zhihuitong.search.mapper;

import java.util.List;
import com.zhihuitong.search.domain.StuNoteSearch;

/**
 * 笔记搜索Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
public interface StuNoteSearchMapper 
{
    /**
     * 查询笔记搜索
     * 
     * @param id 笔记搜索主键
     * @return 笔记搜索
     */
    public StuNoteSearch selectStuNoteSearchById(Long id);

    /**
     * 查询笔记搜索列表
     * 
     * @param stuNoteSearch 笔记搜索
     * @return 笔记搜索集合
     */
    public List<StuNoteSearch> selectStuNoteSearchList(StuNoteSearch stuNoteSearch);

    /**
     * 新增笔记搜索
     * 
     * @param stuNoteSearch 笔记搜索
     * @return 结果
     */
    public int insertStuNoteSearch(StuNoteSearch stuNoteSearch);

    /**
     * 修改笔记搜索
     * 
     * @param stuNoteSearch 笔记搜索
     * @return 结果
     */
    public int updateStuNoteSearch(StuNoteSearch stuNoteSearch);

    /**
     * 删除笔记搜索
     * 
     * @param id 笔记搜索主键
     * @return 结果
     */
    public int deleteStuNoteSearchById(Long id);

    /**
     * 批量删除笔记搜索
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStuNoteSearchByIds(Long[] ids);
}
