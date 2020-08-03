package com.qtu.entity;

import java.util.Date;

public class Room {
    private Integer id;

    private Integer roomnum;

    private String roomstatus;

    private Double roomprice;

    private String roomtype;

    private Date roomtime;

    private Double timelong;

    private Integer numofuse;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoomnum() {
        return roomnum;
    }

    public void setRoomnum(Integer roomnum) {
        this.roomnum = roomnum;
    }

    public String getRoomstatus() {
        return roomstatus;
    }

    public void setRoomstatus(String roomstatus) {
        this.roomstatus = roomstatus;
    }

    public Double getRoomprice() {
        return roomprice;
    }

    public void setRoomprice(Double roomprice) {
        this.roomprice = roomprice;
    }

    public String getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype;
    }

    public Date getRoomtime() {
        return roomtime;
    }

    public void setRoomtime(Date roomtime) {
        this.roomtime = roomtime;
    }

    public Double getTimelong() {
        return timelong;
    }

    public void setTimelong(Double timelong) {
        this.timelong = timelong;
    }

    public Integer getNumofuse() {
        return numofuse;
    }

    public void setNumofuse(Integer numofuse) {
        this.numofuse = numofuse;
    }
}