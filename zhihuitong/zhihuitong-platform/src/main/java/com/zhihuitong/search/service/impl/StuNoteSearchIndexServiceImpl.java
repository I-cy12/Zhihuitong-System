package com.zhihuitong.search.service.impl;

import java.util.List;
import com.zhihuitong.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.search.mapper.StuNoteSearchIndexMapper;
import com.zhihuitong.search.domain.StuNoteSearchIndex;
import com.zhihuitong.search.service.IStuNoteSearchIndexService;

/**
 * 笔记搜索索引Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
@Service
public class StuNoteSearchIndexServiceImpl implements IStuNoteSearchIndexService 
{
    @Autowired
    private StuNoteSearchIndexMapper stuNoteSearchIndexMapper;

    /**
     * 查询笔记搜索索引
     * 
     * @param id 笔记搜索索引主键
     * @return 笔记搜索索引
     */
    @Override
    public StuNoteSearchIndex selectStuNoteSearchIndexById(Long id)
    {
        return stuNoteSearchIndexMapper.selectStuNoteSearchIndexById(id);
    }

    /**
     * 查询笔记搜索索引列表
     * 
     * @param stuNoteSearchIndex 笔记搜索索引
     * @return 笔记搜索索引
     */
    @Override
    public List<StuNoteSearchIndex> selectStuNoteSearchIndexList(StuNoteSearchIndex stuNoteSearchIndex)
    {
        return stuNoteSearchIndexMapper.selectStuNoteSearchIndexList(stuNoteSearchIndex);
    }

    /**
     * 新增笔记搜索索引
     * 
     * @param stuNoteSearchIndex 笔记搜索索引
     * @return 结果
     */
    @Override
    public int insertStuNoteSearchIndex(StuNoteSearchIndex stuNoteSearchIndex)
    {
        stuNoteSearchIndex.setCreateTime(DateUtils.getNowDate());
        return stuNoteSearchIndexMapper.insertStuNoteSearchIndex(stuNoteSearchIndex);
    }

    /**
     * 修改笔记搜索索引
     * 
     * @param stuNoteSearchIndex 笔记搜索索引
     * @return 结果
     */
    @Override
    public int updateStuNoteSearchIndex(StuNoteSearchIndex stuNoteSearchIndex)
    {
        stuNoteSearchIndex.setUpdateTime(DateUtils.getNowDate());
        return stuNoteSearchIndexMapper.updateStuNoteSearchIndex(stuNoteSearchIndex);
    }

    /**
     * 批量删除笔记搜索索引
     * 
     * @param ids 需要删除的笔记搜索索引主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteSearchIndexByIds(Long[] ids)
    {
        return stuNoteSearchIndexMapper.deleteStuNoteSearchIndexByIds(ids);
    }

    /**
     * 删除笔记搜索索引信息
     * 
     * @param id 笔记搜索索引主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteSearchIndexById(Long id)
    {
        return stuNoteSearchIndexMapper.deleteStuNoteSearchIndexById(id);
    }
}
