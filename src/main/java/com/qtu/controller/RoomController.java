package com.qtu.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.qtu.entity.Room;
import com.qtu.service.RoomService;

@Controller
@RequestMapping(value="/room")
public class RoomController {

	@Resource
	private RoomService roomService;
	
	@ResponseBody
	@RequestMapping(value="/roomAll")
	public Map sellectAll() {
		Map map = roomService.selectAll();
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/roomAdd")
	public Map roomAdd(String roomnum, String roomprice, String roomtype) {
		Map map = roomService.insertSelective(roomnum, roomprice, roomtype);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/roomSearch",method = RequestMethod.POST)
	public Map selectRoom(String searchKey) {
		Map map = roomService.roomSeach(searchKey, searchKey);
		
		
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/roomDelete")
	public Map deleteRoom(String roomId) {
		Map map = roomService.roomDelete(roomId);
		return map;
	}
	@RequestMapping(value="/selectRoom")
	public void selectRoomById(String id,HttpSession session) {
		Room room = roomService.selectByPrimaryKey(id);
		session.setAttribute("room", room);
	}
	
	@ResponseBody
	@RequestMapping(value="/roomupdate")
	public Map updateRoomByroom(String id, String roomnum, String roomtype, String roomprice,
			String roomtime, String result) {
		Map map = roomService.updateByPrimaryKeySelective(id, roomnum, roomtype, roomprice, roomtime, result);
		return map;
	}
}
