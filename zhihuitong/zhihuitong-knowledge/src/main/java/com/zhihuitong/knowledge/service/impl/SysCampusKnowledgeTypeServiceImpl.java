package com.zhihuitong.knowledge.service.impl;

import java.util.List;
import com.zhihuitong.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.knowledge.mapper.SysCampusKnowledgeTypeMapper;
import com.zhihuitong.knowledge.domain.SysCampusKnowledgeType;
import com.zhihuitong.knowledge.service.ISysCampusKnowledgeTypeService;

/**
 * 校园知识分类Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
@Service
public class SysCampusKnowledgeTypeServiceImpl implements ISysCampusKnowledgeTypeService 
{
    @Autowired
    private SysCampusKnowledgeTypeMapper sysCampusKnowledgeTypeMapper;

    /**
     * 查询校园知识分类
     * 
     * @param id 校园知识分类主键
     * @return 校园知识分类
     */
    @Override
    public SysCampusKnowledgeType selectSysCampusKnowledgeTypeById(Long id)
    {
        return sysCampusKnowledgeTypeMapper.selectSysCampusKnowledgeTypeById(id);
    }

    /**
     * 查询校园知识分类列表
     * 
     * @param sysCampusKnowledgeType 校园知识分类
     * @return 校园知识分类
     */
    @Override
    public List<SysCampusKnowledgeType> selectSysCampusKnowledgeTypeList(SysCampusKnowledgeType sysCampusKnowledgeType)
    {
        return sysCampusKnowledgeTypeMapper.selectSysCampusKnowledgeTypeList(sysCampusKnowledgeType);
    }

    /**
     * 新增校园知识分类
     * 
     * @param sysCampusKnowledgeType 校园知识分类
     * @return 结果
     */
    @Override
    public int insertSysCampusKnowledgeType(SysCampusKnowledgeType sysCampusKnowledgeType)
    {
        sysCampusKnowledgeType.setCreateTime(DateUtils.getNowDate());
        return sysCampusKnowledgeTypeMapper.insertSysCampusKnowledgeType(sysCampusKnowledgeType);
    }

    /**
     * 修改校园知识分类
     * 
     * @param sysCampusKnowledgeType 校园知识分类
     * @return 结果
     */
    @Override
    public int updateSysCampusKnowledgeType(SysCampusKnowledgeType sysCampusKnowledgeType)
    {
        return sysCampusKnowledgeTypeMapper.updateSysCampusKnowledgeType(sysCampusKnowledgeType);
    }

    /**
     * 批量删除校园知识分类
     * 
     * @param ids 需要删除的校园知识分类主键
     * @return 结果
     */
    @Override
    public int deleteSysCampusKnowledgeTypeByIds(Long[] ids)
    {
        return sysCampusKnowledgeTypeMapper.deleteSysCampusKnowledgeTypeByIds(ids);
    }

    /**
     * 删除校园知识分类信息
     * 
     * @param id 校园知识分类主键
     * @return 结果
     */
    @Override
    public int deleteSysCampusKnowledgeTypeById(Long id)
    {
        return sysCampusKnowledgeTypeMapper.deleteSysCampusKnowledgeTypeById(id);
    }
}
