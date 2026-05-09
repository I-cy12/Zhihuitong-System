package com.zhihuitong.template.controller;

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
import com.zhihuitong.template.domain.StuNoteTemplate;
import com.zhihuitong.template.service.IStuNoteTemplateService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 笔记模板Controller
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
@RestController
@RequestMapping("/template/template")
public class StuNoteTemplateController extends BaseController
{
    @Autowired
    private IStuNoteTemplateService stuNoteTemplateService;

    /**
     * 查询笔记模板列表
     */
    @PreAuthorize("@ss.hasPermi('template:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(StuNoteTemplate stuNoteTemplate)
    {
        startPage();
        List<StuNoteTemplate> list = stuNoteTemplateService.selectStuNoteTemplateList(stuNoteTemplate);
        return getDataTable(list);
    }

    /**
     * 导出笔记模板列表
     */
    @PreAuthorize("@ss.hasPermi('template:template:export')")
    @Log(title = "笔记模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StuNoteTemplate stuNoteTemplate)
    {
        List<StuNoteTemplate> list = stuNoteTemplateService.selectStuNoteTemplateList(stuNoteTemplate);
        ExcelUtil<StuNoteTemplate> util = new ExcelUtil<StuNoteTemplate>(StuNoteTemplate.class);
        util.exportExcel(response, list, "笔记模板数据");
    }

    /**
     * 获取笔记模板详细信息
     */
    @PreAuthorize("@ss.hasPermi('template:template:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(stuNoteTemplateService.selectStuNoteTemplateById(id));
    }

    /**
     * 新增笔记模板
     */
    @PreAuthorize("@ss.hasPermi('template:template:add')")
    @Log(title = "笔记模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StuNoteTemplate stuNoteTemplate)
    {
        return toAjax(stuNoteTemplateService.insertStuNoteTemplate(stuNoteTemplate));
    }

    /**
     * 修改笔记模板
     */
    @PreAuthorize("@ss.hasPermi('template:template:edit')")
    @Log(title = "笔记模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StuNoteTemplate stuNoteTemplate)
    {
        return toAjax(stuNoteTemplateService.updateStuNoteTemplate(stuNoteTemplate));
    }

    /**
     * 删除笔记模板
     */
    @PreAuthorize("@ss.hasPermi('template:template:remove')")
    @Log(title = "笔记模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(stuNoteTemplateService.deleteStuNoteTemplateByIds(ids));
    }
}
