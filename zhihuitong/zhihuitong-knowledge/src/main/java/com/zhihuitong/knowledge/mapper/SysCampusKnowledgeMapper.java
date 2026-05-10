package com.zhihuitong.knowledge.mapper;

import java.util.List;
import com.zhihuitong.knowledge.domain.SysCampusKnowledge;

/**
 * 校园知识内容Mapper接口
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
public interface SysCampusKnowledgeMapper 
{
    /**
     * 查询校园知识内容
     * 
     * @param id 校园知识内容主键
     * @return 校园知识内容
     */
    public SysCampusKnowledge selectSysCampusKnowledgeById(Long id);

    /**
     * 查询校园知识内容列表
     * 
     * @param sysCampusKnowledge 校园知识内容
     * @return 校园知识内容集合
     */
    public List<SysCampusKnowledge> selectSysCampusKnowledgeList(SysCampusKnowledge sysCampusKnowledge);

    /**
     * 新增校园知识内容
     * 
     * @param sysCampusKnowledge 校园知识内容
     * @return 结果
     */
    public int insertSysCampusKnowledge(SysCampusKnowledge sysCampusKnowledge);

    /**
     * 修改校园知识内容
     * 
     * @param sysCampusKnowledge 校园知识内容
     * @return 结果
     */
    public int updateSysCampusKnowledge(SysCampusKnowledge sysCampusKnowledge);

    /**
     * 删除校园知识内容
     * 
     * @param id 校园知识内容主键
     * @return 结果
     */
    public int deleteSysCampusKnowledgeById(Long id);

    /**
     * 批量删除校园知识内容
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCampusKnowledgeByIds(Long[] ids);

    /**
     * 查询所有已发布的校园知识内容（供RAG索引使用）
     *
     * @return 已发布的校园知识内容集合
     */
    public List<SysCampusKnowledge> selectAllPublishedKnowledge();
}
