package com.zhihuitong.repair.controller;

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
import com.zhihuitong.repair.domain.LogisticsRepair;
import com.zhihuitong.repair.service.ILogisticsRepairService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 报修管理Controller
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
@RestController
@RequestMapping("/repair/repair")
public class LogisticsRepairController extends BaseController
{
    @Autowired
    private ILogisticsRepairService logisticsRepairService;

    /**
     * 查询报修管理列表
     */
    @PreAuthorize("@ss.hasPermi('repair:repair:list')")
    @GetMapping("/list")
    public TableDataInfo list(LogisticsRepair logisticsRepair)
    {
        startPage();
        List<LogisticsRepair> list = logisticsRepairService.selectLogisticsRepairList(logisticsRepair);
        return getDataTable(list);
    }

    /**
     * 导出报修管理列表
     */
    @PreAuthorize("@ss.hasPermi('repair:repair:export')")
    @Log(title = "报修管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LogisticsRepair logisticsRepair)
    {
        List<LogisticsRepair> list = logisticsRepairService.selectLogisticsRepairList(logisticsRepair);
        ExcelUtil<LogisticsRepair> util = new ExcelUtil<LogisticsRepair>(LogisticsRepair.class);
        util.exportExcel(response, list, "报修管理数据");
    }

    /**
     * 获取报修管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('repair:repair:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(logisticsRepairService.selectLogisticsRepairById(id));
    }

    /**
     * 新增报修管理
     */
    @PreAuthorize("@ss.hasPermi('repair:repair:add')")
    @Log(title = "报修管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LogisticsRepair logisticsRepair)
    {
        return toAjax(logisticsRepairService.insertLogisticsRepair(logisticsRepair));
    }

    /**
     * 修改报修管理
     */
    @PreAuthorize("@ss.hasPermi('repair:repair:edit')")
    @Log(title = "报修管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LogisticsRepair logisticsRepair)
    {
        return toAjax(logisticsRepairService.updateLogisticsRepair(logisticsRepair));
    }

    /**
     * 删除报修管理
     */
    @PreAuthorize("@ss.hasPermi('repair:repair:remove')")
    @Log(title = "报修管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(logisticsRepairService.deleteLogisticsRepairByIds(ids));
    }
}
