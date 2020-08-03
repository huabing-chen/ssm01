package com.qtu.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.qtu.entity.BuyWater;

public interface BuyWaterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BuyWater record);

    int insertSelective(BuyWater record);

    BuyWater selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BuyWater record);

    int updateByPrimaryKey(BuyWater record);
    //查询所有拉水记录
    List<BuyWater> selectListAll();
    //根据时间范围查询拉水记录
    List<BuyWater> selectBuyWaterByTime(@Param("startTime") Date startTime,@Param("endTime") Date endTime);
    List<BuyWater> selectBuyWaterByTime2(@Param("startTime") String startTime,@Param("endTime") String endTime);
}