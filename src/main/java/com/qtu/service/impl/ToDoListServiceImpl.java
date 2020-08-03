package com.qtu.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtu.entity.ToDoList;
import com.qtu.mapper.ToDoListMapper;
import com.qtu.service.ToDoListService;
@Service
@Transactional
public class ToDoListServiceImpl implements ToDoListService {

	@Resource
	private ToDoListMapper toDoListMapper;
	
	@Override
	public Map selectAll() {
		List<ToDoList> list = toDoListMapper.selectAll();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

	@Override
	public Map insertSelective(String subject, String time, String result, String faqipeople) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(time);
		ToDoList tdl = new ToDoList();
		tdl.setFaqipeople(faqipeople);
		tdl.setSubject(subject);
		tdl.setTime(date);
		tdl.setThemestate(result);
		int row = toDoListMapper.insertSelective(tdl);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

	@Override
	public ToDoList selectByPrimaryKey(Integer id) {
		ToDoList todolist = toDoListMapper.selectByPrimaryKey(id);
		
		return todolist;
	}

	@Override
	public Map updateByPrimaryKeySelective(Integer id, String subject, String time, String result) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(time);
		ToDoList todolist = new ToDoList();
		todolist.setId(id);
		todolist.setSubject(subject);
		todolist.setThemestate(result);
		todolist.setTime(date);
		int row = toDoListMapper.updateByPrimaryKeySelective(todolist);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

}
