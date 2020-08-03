package com.qtu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qtu.entity.ShoumaiJilu;

public interface ShoumaiJiluMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ShoumaiJilu record);

    int insertSelective(ShoumaiJilu record);

    ShoumaiJilu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShoumaiJilu record);

    int updateByPrimaryKey(ShoumaiJilu record);
    //查询营业额
    List<ShoumaiJilu> selectListByTime(@Param("start")String start,@Param("end")String end);
    //查询人数
    List<ShoumaiJilu> selectListByTimeAndName(@Param("start")String start,@Param("end")String end);
}