package com.qtu.mapper;

import java.util.List;

import com.qtu.entity.ToDoList;

public interface ToDoListMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ToDoList record);

    int insertSelective(ToDoList record);

    ToDoList selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ToDoList record);

    int updateByPrimaryKey(ToDoList record);
    
    //查询所有待办事宜
    List<ToDoList> selectAll();
}