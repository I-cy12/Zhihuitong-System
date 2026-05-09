package com.zhihuitong.course.mapper;

import java.util.List;
import com.zhihuitong.course.domain.StuCourse;

/**
 * 课表管理Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-07
 */
public interface StuCourseMapper 
{
    /**
     * 查询课表管理
     * 
     * @param id 课表管理主键
     * @return 课表管理
     */
    public StuCourse selectStuCourseById(Integer id);

    /**
     * 查询课表管理列表
     * 
     * @param stuCourse 课表管理
     * @return 课表管理集合
     */
    public List<StuCourse> selectStuCourseList(StuCourse stuCourse);

    /**
     * 新增课表管理
     * 
     * @param stuCourse 课表管理
     * @return 结果
     */
    public int insertStuCourse(StuCourse stuCourse);

    /**
     * 修改课表管理
     * 
     * @param stuCourse 课表管理
     * @return 结果
     */
    public int updateStuCourse(StuCourse stuCourse);

    /**
     * 删除课表管理
     * 
     * @param id 课表管理主键
     * @return 结果
     */
    public int deleteStuCourseById(Integer id);

    /**
     * 批量删除课表管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStuCourseByIds(Integer[] ids);
}
