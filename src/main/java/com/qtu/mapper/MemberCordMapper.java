package com.qtu.mapper;

import java.util.List;

import com.qtu.entity.MemberCord;

public interface MemberCordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberCord record);

    int insertSelective(MemberCord record);

    MemberCord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberCord record);

    int updateByPrimaryKey(MemberCord record);
    //根据会员号，查询会员消费记录
    List<MemberCord> slectList(String memno);
}