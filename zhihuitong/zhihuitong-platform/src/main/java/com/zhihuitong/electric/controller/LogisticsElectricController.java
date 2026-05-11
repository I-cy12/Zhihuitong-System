package com.zhihuitong.electric.controller;

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
import com.zhihuitong.electric.domain.LogisticsElectric;
import com.zhihuitong.electric.service.ILogisticsElectricService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 电控管理Controller
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
@RestController
@RequestMapping("/electric/electric")
public class LogisticsElectricController extends BaseController
{
    @Autowired
    private ILogisticsElectricService logisticsElectricService;

    /**
     * 查询电控管理列表
     */
    @PreAuthorize("@ss.hasPermi('electric:electric:list')")
    @GetMapping("/list")
    public TableDataInfo list(LogisticsElectric logisticsElectric)
    {
        startPage();
        List<LogisticsElectric> list = logisticsElectricService.selectLogisticsElectricList(logisticsElectric);
        return getDataTable(list);
    }

    /**
     * 导出电控管理列表
     */
    @PreAuthorize("@ss.hasPermi('electric:electric:export')")
    @Log(title = "电控管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LogisticsElectric logisticsElectric)
    {
        List<LogisticsElectric> list = logisticsElectricService.selectLogisticsElectricList(logisticsElectric);
        ExcelUtil<LogisticsElectric> util = new ExcelUtil<LogisticsElectric>(LogisticsElectric.class);
        util.exportExcel(response, list, "电控管理数据");
    }

    /**
     * 获取电控管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('electric:electric:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(logisticsElectricService.selectLogisticsElectricById(id));
    }

    /**
     * 新增电控管理
     */
    @PreAuthorize("@ss.hasPermi('electric:electric:add')")
    @Log(title = "电控管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LogisticsElectric logisticsElectric)
    {
        return toAjax(logisticsElectricService.insertLogisticsElectric(logisticsElectric));
    }

    /**
     * 修改电控管理
     */
    @PreAuthorize("@ss.hasPermi('electric:electric:edit')")
    @Log(title = "电控管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LogisticsElectric logisticsElectric)
    {
        return toAjax(logisticsElectricService.updateLogisticsElectric(logisticsElectric));
    }

    /**
     * 删除电控管理
     */
    @PreAuthorize("@ss.hasPermi('electric:electric:remove')")
    @Log(title = "电控管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(logisticsElectricService.deleteLogisticsElectricByIds(ids));
    }
}
