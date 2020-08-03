package com.qtu.mapper;

import java.util.List;

import com.qtu.entity.Member;

public interface MemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Member record);

    /**
     * 	添加会员
     * @param record
     * @return
     */
    int insertSelective(Member record);

    Member selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
    
    /**
     * 查询所有会员
     * @return
     */
    List<Member> memberListAll();
    /**
     * 	根据会员号或者会员名查询
     * @param searchKey
     * @return
     */
    Member queryBymemNoOrName(String searchKey);
    
    
}