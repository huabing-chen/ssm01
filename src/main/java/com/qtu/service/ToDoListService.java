package com.qtu.service;

import java.text.ParseException;
import java.util.Map;

import com.qtu.entity.ToDoList;

public interface ToDoListService {

	//查询所有待办事宜
	Map selectAll();
	//添加待办事宜
	Map insertSelective(String subject,String time,String result,String faqipeople)throws ParseException ;

	//根据id查询对象
	ToDoList selectByPrimaryKey(Integer id);
	//
	Map updateByPrimaryKeySelective(Integer id,String subject,String time,String result)throws ParseException;
}
