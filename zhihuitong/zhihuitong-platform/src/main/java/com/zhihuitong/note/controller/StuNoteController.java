package com.zhihuitong.note.controller;

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
import com.zhihuitong.note.domain.StuNote;
import com.zhihuitong.note.service.IStuNoteService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 学习笔记Controller
 * 
 * @author ruoyi
 * @date 2026-05-09
 */
@RestController
@RequestMapping("/note/note")
public class StuNoteController extends BaseController
{
    @Autowired
    private IStuNoteService stuNoteService;

    /**
     * 查询学习笔记列表
     */
    @PreAuthorize("@ss.hasPermi('note:note:list')")
    @GetMapping("/list")
    public TableDataInfo list(StuNote stuNote)
    {
        startPage();
        List<StuNote> list = stuNoteService.selectStuNoteList(stuNote);
        return getDataTable(list);
    }

    /**
     * 导出学习笔记列表
     */
    @PreAuthorize("@ss.hasPermi('note:note:export')")
    @Log(title = "学习笔记", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StuNote stuNote)
    {
        List<StuNote> list = stuNoteService.selectStuNoteList(stuNote);
        ExcelUtil<StuNote> util = new ExcelUtil<StuNote>(StuNote.class);
        util.exportExcel(response, list, "学习笔记数据");
    }

    /**
     * 获取学习笔记详细信息
     */
    @PreAuthorize("@ss.hasPermi('note:note:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(stuNoteService.selectStuNoteById(id));
    }

    /**
     * 新增学习笔记
     */
    @PreAuthorize("@ss.hasPermi('note:note:add')")
    @Log(title = "学习笔记", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StuNote stuNote)
    {
        return toAjax(stuNoteService.insertStuNote(stuNote));
    }

    /**
     * 修改学习笔记
     */
    @PreAuthorize("@ss.hasPermi('note:note:edit')")
    @Log(title = "学习笔记", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StuNote stuNote)
    {
        return toAjax(stuNoteService.updateStuNote(stuNote));
    }

    /**
     * 删除学习笔记
     */
    @PreAuthorize("@ss.hasPermi('note:note:remove')")
    @Log(title = "学习笔记", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(stuNoteService.deleteStuNoteByIds(ids));
    }
}
