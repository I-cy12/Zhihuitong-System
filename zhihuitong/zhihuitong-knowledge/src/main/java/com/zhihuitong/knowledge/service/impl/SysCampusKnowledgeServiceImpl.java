package com.zhihuitong.knowledge.service.impl;

import java.util.List;
import com.zhihuitong.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zhihuitong.knowledge.mapper.SysCampusKnowledgeMapper;
import com.zhihuitong.knowledge.domain.SysCampusKnowledge;
import com.zhihuitong.knowledge.service.ISysCampusKnowledgeService;

/**
 * 校园知识内容Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-05-10
 */
@Service
public class SysCampusKnowledgeServiceImpl implements ISysCampusKnowledgeService 
{
    @Autowired
    private SysCampusKnowledgeMapper sysCampusKnowledgeMapper;

    /**
     * 查询校园知识内容
     * 
     * @param id 校园知识内容主键
     * @return 校园知识内容
     */
    @Override
    public SysCampusKnowledge selectSysCampusKnowledgeById(Long id)
    {
        return sysCampusKnowledgeMapper.selectSysCampusKnowledgeById(id);
    }

    /**
     * 查询校园知识内容列表
     * 
     * @param sysCampusKnowledge 校园知识内容
     * @return 校园知识内容
     */
    @Override
    public List<SysCampusKnowledge> selectSysCampusKnowledgeList(SysCampusKnowledge sysCampusKnowledge)
    {
        return sysCampusKnowledgeMapper.selectSysCampusKnowledgeList(sysCampusKnowledge);
    }

    /**
     * 新增校园知识内容
     * 
     * @param sysCampusKnowledge 校园知识内容
     * @return 结果
     */
    @Override
    public int insertSysCampusKnowledge(SysCampusKnowledge sysCampusKnowledge)
    {
        sysCampusKnowledge.setCreateTime(DateUtils.getNowDate());
        return sysCampusKnowledgeMapper.insertSysCampusKnowledge(sysCampusKnowledge);
    }

    /**
     * 修改校园知识内容
     * 
     * @param sysCampusKnowledge 校园知识内容
     * @return 结果
     */
    @Override
    public int updateSysCampusKnowledge(SysCampusKnowledge sysCampusKnowledge)
    {
        sysCampusKnowledge.setUpdateTime(DateUtils.getNowDate());
        return sysCampusKnowledgeMapper.updateSysCampusKnowledge(sysCampusKnowledge);
    }

    /**
     * 批量删除校园知识内容
     * 
     * @param ids 需要删除的校园知识内容主键
     * @return 结果
     */
    @Override
    public int deleteSysCampusKnowledgeByIds(Long[] ids)
    {
        return sysCampusKnowledgeMapper.deleteSysCampusKnowledgeByIds(ids);
    }

    /**
     * 删除校园知识内容信息
     *
     * @param id 校园知识内容主键
     * @return 结果
     */
    @Override
    public int deleteSysCampusKnowledgeById(Long id)
    {
        return sysCampusKnowledgeMapper.deleteSysCampusKnowledgeById(id);
    }

    /**
     * 查询所有已发布的校园知识内容（供RAG索引使用）
     *
     * @return 已发布的校园知识内容集合
     */
    @Override
    public List<SysCampusKnowledge> selectAllPublishedKnowledge()
    {
        return sysCampusKnowledgeMapper.selectAllPublishedKnowledge();
    }
}
