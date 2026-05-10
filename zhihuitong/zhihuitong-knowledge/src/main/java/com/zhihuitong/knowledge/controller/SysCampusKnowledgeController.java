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
import com.zhihuitong.knowledge.domain.SysCampusKnowledge;
import com.zhihuitong.knowledge.service.ISysCampusKnowledgeService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 校园知识内容Controller
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
@RestController
@RequestMapping("/knowledge/knowledge")
public class SysCampusKnowledgeController extends BaseController
{
    @Autowired
    private ISysCampusKnowledgeService sysCampusKnowledgeService;

    /**
     * 查询校园知识内容列表
     */
    @PreAuthorize("@ss.hasPermi('knowledge:knowledge:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysCampusKnowledge sysCampusKnowledge)
    {
        startPage();
        List<SysCampusKnowledge> list = sysCampusKnowledgeService.selectSysCampusKnowledgeList(sysCampusKnowledge);
        return getDataTable(list);
    }

    /**
     * 导出校园知识内容列表
     */
    @PreAuthorize("@ss.hasPermi('knowledge:knowledge:export')")
    @Log(title = "校园知识内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCampusKnowledge sysCampusKnowledge)
    {
        List<SysCampusKnowledge> list = sysCampusKnowledgeService.selectSysCampusKnowledgeList(sysCampusKnowledge);
        ExcelUtil<SysCampusKnowledge> util = new ExcelUtil<SysCampusKnowledge>(SysCampusKnowledge.class);
        util.exportExcel(response, list, "校园知识内容数据");
    }

    /**
     * 获取校园知识内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('knowledge:knowledge:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysCampusKnowledgeService.selectSysCampusKnowledgeById(id));
    }

    /**
     * 新增校园知识内容
     */
    @PreAuthorize("@ss.hasPermi('knowledge:knowledge:add')")
    @Log(title = "校园知识内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCampusKnowledge sysCampusKnowledge)
    {
        return toAjax(sysCampusKnowledgeService.insertSysCampusKnowledge(sysCampusKnowledge));
    }

    /**
     * 修改校园知识内容
     */
    @PreAuthorize("@ss.hasPermi('knowledge:knowledge:edit')")
    @Log(title = "校园知识内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCampusKnowledge sysCampusKnowledge)
    {
        return toAjax(sysCampusKnowledgeService.updateSysCampusKnowledge(sysCampusKnowledge));
    }

    /**
     * 删除校园知识内容
     */
    @PreAuthorize("@ss.hasPermi('knowledge:knowledge:remove')")
    @Log(title = "校园知识内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysCampusKnowledgeService.deleteSysCampusKnowledgeByIds(ids));
    }

    /**
     * 获取所有已发布的校园知识内容（供RAG索引使用）
     * 此接口供内部Python agent调用，无需权限验证
     */
    @GetMapping("/published")
    public AjaxResult getPublishedKnowledge()
    {
        List<SysCampusKnowledge> list = sysCampusKnowledgeService.selectAllPublishedKnowledge();
        return success(list);
    }
}
