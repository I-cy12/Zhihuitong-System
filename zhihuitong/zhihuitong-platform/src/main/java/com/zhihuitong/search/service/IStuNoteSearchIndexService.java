package com.zhihuitong.search.service;

import java.util.List;
import com.zhihuitong.search.domain.StuNoteSearchIndex;

/**
 * 笔记搜索索引Service接口
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
public interface IStuNoteSearchIndexService 
{
    /**
     * 查询笔记搜索索引
     * 
     * @param id 笔记搜索索引主键
     * @return 笔记搜索索引
     */
    public StuNoteSearchIndex selectStuNoteSearchIndexById(Long id);

    /**
     * 查询笔记搜索索引列表
     * 
     * @param stuNoteSearchIndex 笔记搜索索引
     * @return 笔记搜索索引集合
     */
    public List<StuNoteSearchIndex> selectStuNoteSearchIndexList(StuNoteSearchIndex stuNoteSearchIndex);

    /**
     * 新增笔记搜索索引
     * 
     * @param stuNoteSearchIndex 笔记搜索索引
     * @return 结果
     */
    public int insertStuNoteSearchIndex(StuNoteSearchIndex stuNoteSearchIndex);

    /**
     * 修改笔记搜索索引
     * 
     * @param stuNoteSearchIndex 笔记搜索索引
     * @return 结果
     */
    public int updateStuNoteSearchIndex(StuNoteSearchIndex stuNoteSearchIndex);

    /**
     * 批量删除笔记搜索索引
     * 
     * @param ids 需要删除的笔记搜索索引主键集合
     * @return 结果
     */
    public int deleteStuNoteSearchIndexByIds(Long[] ids);

    /**
     * 删除笔记搜索索引信息
     * 
     * @param id 笔记搜索索引主键
     * @return 结果
     */
    public int deleteStuNoteSearchIndexById(Long id);
}
