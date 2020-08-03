package com.qtu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.druid.util.StringUtils;
import com.qtu.entity.Room;
import com.qtu.mapper.RoomMapper;
import com.qtu.service.RoomService;
@Service
@Transactional
public class RoomServiceImpl implements RoomService {

	@Resource
	private RoomMapper roomMapper;
	@Override
	public Map selectAll() {
		List<Room> list = roomMapper.selectAll();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}
	@Override
	public Map insertSelective(String roomnum, String roomprice, String roomtype) {
		Room room = new Room();
		room.setRoomnum(Integer.parseInt(roomnum));
		room.setRoomprice(Double.valueOf(roomprice));
		room.setRoomtype(roomtype);
		room.setRoomstatus("空闲");
		room.setNumofuse(0);
		int row = roomMapper.insertSelective(room);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}
	@Override
	public Map roomSeach(String roomnum, String roomstyle) {
		boolean flag = StringUtils.isNumber(roomnum);
		List<Room> list;
		if(flag) {
			list = roomMapper.selectRoomBy(Integer.parseInt(roomnum), roomstyle);
		}else {
			list = roomMapper.selectRoomBy(null, roomstyle);
		}
		
		Map<String,Object> map = new HashMap<>();
		
			map.put("list", list);
		
		return map;
	}
	@Override
	public Map roomDelete(String roomId) {
		int row = roomMapper.deleteByPrimaryKey(Integer.valueOf(roomId));
		Map<String,Object> map = new HashMap<String,Object>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}
	@Override
	public Room selectByPrimaryKey(String roomId) {
		Room room = roomMapper.selectByPrimaryKey(Integer.parseInt(roomId));
		return room;
	}
	@Override
	public Map updateByPrimaryKeySelective(String id, String roomnum, String roomtype, String roomprice,
			String roomtime, String result) {
		Room room = new Room();
		room.setId(Integer.parseInt(id));
		room.setRoomnum(Integer.parseInt(roomnum));
		room.setRoomtype(roomtype);
		room.setRoomprice(Double.valueOf(roomprice));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		
		try {
			String format = sdf.format(now);
			now = sdf.parse(format);
		} catch (Exception e) {
			// TODO: handle exception
		}
		room.setRoomtime(now);
		room.setRoomstatus(result);
		if(result.equals("使用")) {
			
			Room rm = roomMapper.selectByPrimaryKey(Integer.parseInt(id));
			room.setNumofuse(rm.getNumofuse()+1);
		}
		int row = roomMapper.updateByPrimaryKeySelective(room);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

}
