package com.zhihuitong.course.controller;

import java.util.List;

import com.zhihuitong.common.core.domain.R;
import com.zhihuitong.course.domain.Result;
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
import com.zhihuitong.course.domain.StuCourse;
import com.zhihuitong.course.service.IStuCourseService;
import com.zhihuitong.common.utils.poi.ExcelUtil;
import com.zhihuitong.common.core.page.TableDataInfo;

/**
 * 课表管理Controller
 * 
 * @author ruoyi
 * @date 2026-05-07
 */
@RestController
@RequestMapping("/course/course")
public class StuCourseController extends BaseController
{
    @Autowired
    private IStuCourseService stuCourseService;

    /**
     * 查询课表管理列表
     */

    /**
     * 查询课表管理列表

     */
    @PreAuthorize("@ss.hasPermi('course:course:list')")
    @GetMapping("/list")
    public TableDataInfo list(StuCourse stuCourse)
    {
        startPage();
        List<StuCourse> list = stuCourseService.selectStuCourseList(stuCourse);
        return getDataTable(list);
    }

    @PreAuthorize("@ss.hasPermi('course:course:list')")
    @GetMapping("/weekView")
    public Result<List<StuCourse>> list(String term, Integer studentId)
    {
//        startPage();
        StuCourse stuCourse=new StuCourse();
        stuCourse.setTerm(term);
        stuCourse.setStudentId(studentId);
        List<StuCourse> list = stuCourseService.selectStuCourseList(stuCourse);
        return Result.success(list);
    }

    /**
     * 导出课表管理列表
     */
    @PreAuthorize("@ss.hasPermi('course:course:export')")
    @Log(title = "课表管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StuCourse stuCourse)
    {
        List<StuCourse> list = stuCourseService.selectStuCourseList(stuCourse);
        ExcelUtil<StuCourse> util = new ExcelUtil<StuCourse>(StuCourse.class);
        util.exportExcel(response, list, "课表管理数据");
    }

    /**
     * 获取课表管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('course:course:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return success(stuCourseService.selectStuCourseById(id));
    }

    /**
     * 新增课表管理
     */
    @PreAuthorize("@ss.hasPermi('course:course:add')")
    @Log(title = "课表管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StuCourse stuCourse)
    {
        return toAjax(stuCourseService.insertStuCourse(stuCourse));
    }

    /**
     * 修改课表管理
     */
    @PreAuthorize("@ss.hasPermi('course:course:edit')")
    @Log(title = "课表管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StuCourse stuCourse)
    {
        return toAjax(stuCourseService.updateStuCourse(stuCourse));
    }

    /**
     * 删除课表管理
     */
    @PreAuthorize("@ss.hasPermi('course:course:remove')")
    @Log(title = "课表管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(stuCourseService.deleteStuCourseByIds(ids));
    }
}
