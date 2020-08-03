package com.qtu.entity;

import java.util.Date;

public class Member {
    private Integer id;

    private String memno;

    private String memname;

    private Double memmoney;

    private Date memtime;

    private String memtel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMemno() {
        return memno;
    }

    public void setMemno(String memno) {
        this.memno = memno;
    }

    public String getMemname() {
        return memname;
    }

    public void setMemname(String memname) {
        this.memname = memname;
    }

    public Double getMemmoney() {
        return memmoney;
    }

    public void setMemmoney(Double memmoney) {
        this.memmoney = memmoney;
    }

    public Date getMemtime() {
        return memtime;
    }

    public void setMemtime(Date memtime) {
        this.memtime = memtime;
    }

    public String getMemtel() {
        return memtel;
    }

    public void setMemtel(String memtel) {
        this.memtel = memtel;
    }
}