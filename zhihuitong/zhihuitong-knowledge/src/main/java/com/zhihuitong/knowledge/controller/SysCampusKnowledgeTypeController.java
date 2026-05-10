package com.zhihuitong.knowledge.controller;

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
import com.zhihuitong.knowledge.domain.SysCampusKnowledgeType;
import com.zhihuitong.knowledge.service.ISysCampusKnowledgeTypeService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 校园知识分类Controller
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
@RestController
@RequestMapping("/knowledge/type")
public class SysCampusKnowledgeTypeController extends BaseController
{
    @Autowired
    private ISysCampusKnowledgeTypeService sysCampusKnowledgeTypeService;

    /**
     * 查询校园知识分类列表
     */
    @PreAuthorize("@ss.hasPermi('knowledge:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysCampusKnowledgeType sysCampusKnowledgeType)
    {
        startPage();
        List<SysCampusKnowledgeType> list = sysCampusKnowledgeTypeService.selectSysCampusKnowledgeTypeList(sysCampusKnowledgeType);
        return getDataTable(list);
    }

    /**
     * 导出校园知识分类列表
     */
    @PreAuthorize("@ss.hasPermi('knowledge:type:export')")
    @Log(title = "校园知识分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCampusKnowledgeType sysCampusKnowledgeType)
    {
        List<SysCampusKnowledgeType> list = sysCampusKnowledgeTypeService.selectSysCampusKnowledgeTypeList(sysCampusKnowledgeType);
        ExcelUtil<SysCampusKnowledgeType> util = new ExcelUtil<SysCampusKnowledgeType>(SysCampusKnowledgeType.class);
        util.exportExcel(response, list, "校园知识分类数据");
    }

    /**
     * 获取校园知识分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('knowledge:type:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysCampusKnowledgeTypeService.selectSysCampusKnowledgeTypeById(id));
    }

    /**
     * 新增校园知识分类
     */
    @PreAuthorize("@ss.hasPermi('knowledge:type:add')")
    @Log(title = "校园知识分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCampusKnowledgeType sysCampusKnowledgeType)
    {
        return toAjax(sysCampusKnowledgeTypeService.insertSysCampusKnowledgeType(sysCampusKnowledgeType));
    }

    /**
     * 修改校园知识分类
     */
    @PreAuthorize("@ss.hasPermi('knowledge:type:edit')")
    @Log(title = "校园知识分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCampusKnowledgeType sysCampusKnowledgeType)
    {
        return toAjax(sysCampusKnowledgeTypeService.updateSysCampusKnowledgeType(sysCampusKnowledgeType));
    }

    /**
     * 删除校园知识分类
     */
    @PreAuthorize("@ss.hasPermi('knowledge:type:remove')")
    @Log(title = "校园知识分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysCampusKnowledgeTypeService.deleteSysCampusKnowledgeTypeByIds(ids));
    }
}
