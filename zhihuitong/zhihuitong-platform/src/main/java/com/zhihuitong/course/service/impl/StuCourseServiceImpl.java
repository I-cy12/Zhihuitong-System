package com.zhihuitong.course.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.course.mapper.StuCourseMapper;
import com.zhihuitong.course.domain.StuCourse;
import com.zhihuitong.course.service.IStuCourseService;

/**
 * 课表管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-07
 */
@Service
public class StuCourseServiceImpl implements IStuCourseService 
{
    @Autowired
    private StuCourseMapper stuCourseMapper;

    /**
     * 查询课表管理
     * 
     * @param id 课表管理主键
     * @return 课表管理
     */
    @Override
    public StuCourse selectStuCourseById(Integer id)
    {
        return stuCourseMapper.selectStuCourseById(id);
    }

    /**
     * 查询课表管理列表
     * 
     * @param stuCourse 课表管理
     * @return 课表管理
     */
    @Override
    public List<StuCourse> selectStuCourseList(StuCourse stuCourse)
    {
        return stuCourseMapper.selectStuCourseList(stuCourse);
    }

    /**
     * 新增课表管理
     * 
     * @param stuCourse 课表管理
     * @return 结果
     */
    @Override
    public int insertStuCourse(StuCourse stuCourse)
    {
        return stuCourseMapper.insertStuCourse(stuCourse);
    }

    /**
     * 修改课表管理
     * 
     * @param stuCourse 课表管理
     * @return 结果
     */
    @Override
    public int updateStuCourse(StuCourse stuCourse)
    {
        return stuCourseMapper.updateStuCourse(stuCourse);
    }

    /**
     * 批量删除课表管理
     * 
     * @param ids 需要删除的课表管理主键
     * @return 结果
     */
    @Override
    public int deleteStuCourseByIds(Integer[] ids)
    {
        return stuCourseMapper.deleteStuCourseByIds(ids);
    }

    /**
     * 删除课表管理信息
     * 
     * @param id 课表管理主键
     * @return 结果
     */
    @Override
    public int deleteStuCourseById(Integer id)
    {
        return stuCourseMapper.deleteStuCourseById(id);
    }
}
