package com.zhihuitong.knowledge.mapper;

import java.util.List;
import com.zhihuitong.knowledge.domain.SysCampusKnowledgeType;

/**
 * 校园知识分类Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
public interface SysCampusKnowledgeTypeMapper 
{
    /**
     * 查询校园知识分类
     * 
     * @param id 校园知识分类主键
     * @return 校园知识分类
     */
    public SysCampusKnowledgeType selectSysCampusKnowledgeTypeById(Long id);

    /**
     * 查询校园知识分类列表
     * 
     * @param sysCampusKnowledgeType 校园知识分类
     * @return 校园知识分类集合
     */
    public List<SysCampusKnowledgeType> selectSysCampusKnowledgeTypeList(SysCampusKnowledgeType sysCampusKnowledgeType);

    /**
     * 新增校园知识分类
     * 
     * @param sysCampusKnowledgeType 校园知识分类
     * @return 结果
     */
    public int insertSysCampusKnowledgeType(SysCampusKnowledgeType sysCampusKnowledgeType);

    /**
     * 修改校园知识分类
     * 
     * @param sysCampusKnowledgeType 校园知识分类
     * @return 结果
     */
    public int updateSysCampusKnowledgeType(SysCampusKnowledgeType sysCampusKnowledgeType);

    /**
     * 删除校园知识分类
     * 
     * @param id 校园知识分类主键
     * @return 结果
     */
    public int deleteSysCampusKnowledgeTypeById(Long id);

    /**
     * 批量删除校园知识分类
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCampusKnowledgeTypeByIds(Long[] ids);
}
