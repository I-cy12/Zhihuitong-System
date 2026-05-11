package com.zhihuitong.water.controller;

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
import com.zhihuitong.water.domain.LogisticsWater;
import com.zhihuitong.water.service.ILogisticsWaterService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 水控管理Controller
 * 
 * @author ruoyi
 * @date 2026-05-11
 */
@RestController
@RequestMapping("/water/water")
public class LogisticsWaterController extends BaseController
{
    @Autowired
    private ILogisticsWaterService logisticsWaterService;

    /**
     * 查询水控管理列表
     */
    @PreAuthorize("@ss.hasPermi('water:water:list')")
    @GetMapping("/list")
    public TableDataInfo list(LogisticsWater logisticsWater)
    {
        startPage();
        List<LogisticsWater> list = logisticsWaterService.selectLogisticsWaterList(logisticsWater);
        return getDataTable(list);
    }

    /**
     * 导出水控管理列表
     */
    @PreAuthorize("@ss.hasPermi('water:water:export')")
    @Log(title = "水控管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LogisticsWater logisticsWater)
    {
        List<LogisticsWater> list = logisticsWaterService.selectLogisticsWaterList(logisticsWater);
        ExcelUtil<LogisticsWater> util = new ExcelUtil<LogisticsWater>(LogisticsWater.class);
        util.exportExcel(response, list, "水控管理数据");
    }

    /**
     * 获取水控管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('water:water:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(logisticsWaterService.selectLogisticsWaterById(id));
    }

    /**
     * 新增水控管理
     */
    @PreAuthorize("@ss.hasPermi('water:water:add')")
    @Log(title = "水控管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LogisticsWater logisticsWater)
    {
        return toAjax(logisticsWaterService.insertLogisticsWater(logisticsWater));
    }

    /**
     * 修改水控管理
     */
    @PreAuthorize("@ss.hasPermi('water:water:edit')")
    @Log(title = "水控管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LogisticsWater logisticsWater)
    {
        return toAjax(logisticsWaterService.updateLogisticsWater(logisticsWater));
    }

    /**
     * 删除水控管理
     */
    @PreAuthorize("@ss.hasPermi('water:water:remove')")
    @Log(title = "水控管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(logisticsWaterService.deleteLogisticsWaterByIds(ids));
    }
}
