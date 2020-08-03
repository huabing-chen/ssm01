package com.qtu.mapper;

import java.util.List;

import com.qtu.entity.Shop;

public interface ShopMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shop record);

    int insertSelective(Shop record);

    Shop selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
    
    List<Shop> selectListAll();
    
    List<Shop> selectShopBySearchKey(String searchKey);
}