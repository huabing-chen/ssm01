package com.qtu.service;

import java.util.Map;

import com.qtu.entity.Room;

public interface RoomService {

	Map selectAll();
	//添加房间
	Map insertSelective(String roomnum,String roomprice,String roomtype);
	//根据条件查询房间
	Map roomSeach(String roomnum,String roomstyle);
	//根据id删除房间
	Map roomDelete(String roomId);

	//根据查询对象
	Room selectByPrimaryKey(String roomId);
	
	Map updateByPrimaryKeySelective(String id,String roomnum,String roomtype,String roomprice,String roomtime,String result);
}
