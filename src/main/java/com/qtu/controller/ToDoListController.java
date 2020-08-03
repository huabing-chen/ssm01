package com.qtu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtu.entity.ToDoList;
import com.qtu.service.ToDoListService;

@Controller
@RequestMapping(value="/todolist")
public class ToDoListController {

	@Resource
	private ToDoListService toDoListService;
	
	@ResponseBody
	@RequestMapping(value="/selectAll")
	public Map selectAll() {
		Map map = toDoListService.selectAll();
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/todalistAdd")
	public Map todoListAdd(String subject, String time, String result, String faqipeople) throws ParseException {
		Map map = toDoListService.insertSelective(subject, time, result, faqipeople);
		return map;
	}
	
	@RequestMapping(value="/selectDaiBan")
	public void selectToDoListById(Integer id,HttpSession session) {
		ToDoList todo = toDoListService.selectByPrimaryKey(id);
		session.setAttribute("dothing", todo);
	}
	
	@ResponseBody
	@RequestMapping(value="/todolistupdate")
	public Map updateToDoList(Integer id, String subject, Date time, String result) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(time);
		Map map = toDoListService.updateByPrimaryKeySelective(id, subject, format, result);
		return map;
	}
}









