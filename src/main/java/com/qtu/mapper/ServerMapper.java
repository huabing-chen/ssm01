package com.qtu.mapper;

import java.util.List;

import com.qtu.entity.Server;

public interface ServerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Server record);

    int insertSelective(Server record);

    Server selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Server record);

    int updateByPrimaryKey(Server record);
    //所有服务
    List<Server> selectListAll();
    //按照服务名字查询
    List<Server> selectServerBySerName(String searchKey);
}