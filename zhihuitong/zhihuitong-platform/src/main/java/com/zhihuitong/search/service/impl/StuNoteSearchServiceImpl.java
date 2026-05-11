package com.zhihuitong.search.service.impl;

import java.util.List;
import com.zhihuitong.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.search.mapper.StuNoteSearchMapper;
import com.zhihuitong.search.domain.StuNoteSearch;
import com.zhihuitong.search.service.IStuNoteSearchService;

/**
 * 笔记搜索Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
@Service
public class StuNoteSearchServiceImpl implements IStuNoteSearchService 
{
    @Autowired
    private StuNoteSearchMapper stuNoteSearchMapper;

    /**
     * 查询笔记搜索
     * 
     * @param id 笔记搜索主键
     * @return 笔记搜索
     */
    @Override
    public StuNoteSearch selectStuNoteSearchById(Long id)
    {
        return stuNoteSearchMapper.selectStuNoteSearchById(id);
    }

    /**
     * 查询笔记搜索列表
     * 
     * @param stuNoteSearch 笔记搜索
     * @return 笔记搜索
     */
    @Override
    public List<StuNoteSearch> selectStuNoteSearchList(StuNoteSearch stuNoteSearch)
    {
        return stuNoteSearchMapper.selectStuNoteSearchList(stuNoteSearch);
    }

    /**
     * 新增笔记搜索
     * 
     * @param stuNoteSearch 笔记搜索
     * @return 结果
     */
    @Override
    public int insertStuNoteSearch(StuNoteSearch stuNoteSearch)
    {
        stuNoteSearch.setCreateTime(DateUtils.getNowDate());
        return stuNoteSearchMapper.insertStuNoteSearch(stuNoteSearch);
    }

    /**
     * 修改笔记搜索
     * 
     * @param stuNoteSearch 笔记搜索
     * @return 结果
     */
    @Override
    public int updateStuNoteSearch(StuNoteSearch stuNoteSearch)
    {
        return stuNoteSearchMapper.updateStuNoteSearch(stuNoteSearch);
    }

    /**
     * 批量删除笔记搜索
     * 
     * @param ids 需要删除的笔记搜索主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteSearchByIds(Long[] ids)
    {
        return stuNoteSearchMapper.deleteStuNoteSearchByIds(ids);
    }

    /**
     * 删除笔记搜索信息
     * 
     * @param id 笔记搜索主键
     * @return 结果
     */
    @Override
    public int deleteStuNoteSearchById(Long id)
    {
        return stuNoteSearchMapper.deleteStuNoteSearchById(id);
    }
}
