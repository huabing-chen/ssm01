package com.qtu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qtu.entity.Room;

public interface RoomMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
    //查询所有房间
    List<Room> selectAll();
    //按条件查询房间
    List<Room> selectRoomBy(@Param("roomnum") Integer roomnum,@Param("roomstyle")String roomstyle);
}