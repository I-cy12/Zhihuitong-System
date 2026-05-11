package com.zhihuitong.search.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.zhihuitong.common.annotation.Log;
import com.zhihuitong.common.core.controller.BaseController;
import com.zhihuitong.common.core.domain.AjaxResult;
import com.zhihuitong.common.enums.BusinessType;
import com.zhihuitong.search.domain.StuNoteSearch;
import com.zhihuitong.search.service.IStuNoteSearchService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 笔记搜索Controller
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
@RestController
@RequestMapping("/search/search")
public class StuNoteSearchController extends BaseController
{
    @Autowired
    private IStuNoteSearchService stuNoteSearchService;

    /**
     * 查询笔记搜索列表
     */
    @PreAuthorize("@ss.hasPermi('search:search:list')")
    @GetMapping("/list")
    public TableDataInfo list(StuNoteSearch stuNoteSearch)
    {
        startPage();
        List<StuNoteSearch> list = stuNoteSearchService.selectStuNoteSearchList(stuNoteSearch);
        return getDataTable(list);
    }

    /**
     * 导出笔记搜索列表
     */
    @PreAuthorize("@ss.hasPermi('search:search:export')")
    @Log(title = "笔记搜索", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StuNoteSearch stuNoteSearch)
    {
        List<StuNoteSearch> list = stuNoteSearchService.selectStuNoteSearchList(stuNoteSearch);
        ExcelUtil<StuNoteSearch> util = new ExcelUtil<StuNoteSearch>(StuNoteSearch.class);
        util.exportExcel(response, list, "笔记搜索数据");
    }

    /**
     * 获取笔记搜索详细信息
     */
    @PreAuthorize("@ss.hasPermi('search:search:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(stuNoteSearchService.selectStuNoteSearchById(id));
    }

    /**
     * 新增笔记搜索
     */
    @PreAuthorize("@ss.hasPermi('search:search:add')")
    @Log(title = "笔记搜索", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StuNoteSearch stuNoteSearch)
    {
        return toAjax(stuNoteSearchService.insertStuNoteSearch(stuNoteSearch));
    }

    /**
     * 修改笔记搜索
     */
    @PreAuthorize("@ss.hasPermi('search:search:edit')")
    @Log(title = "笔记搜索", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StuNoteSearch stuNoteSearch)
    {
        return toAjax(stuNoteSearchService.updateStuNoteSearch(stuNoteSearch));
    }

    /**
     * 删除笔记搜索
     */
    @PreAuthorize("@ss.hasPermi('search:search:remove')")
    @Log(title = "笔记搜索", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(stuNoteSearchService.deleteStuNoteSearchByIds(ids));
    }
}
