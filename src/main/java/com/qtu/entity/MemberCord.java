package com.qtu.entity;

import java.util.Date;

public class MemberCord {
    private Integer id;

    private String memno;

    private String memname;

    private Double recordprice;

    private Date recordtime;

    private String memshop;

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

    public Double getRecordprice() {
        return recordprice;
    }

    public void setRecordprice(Double recordprice) {
        this.recordprice = recordprice;
    }

    public Date getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(Date recordtime) {
        this.recordtime = recordtime;
    }

    public String getMemshop() {
        return memshop;
    }

    public void setMemshop(String memshop) {
        this.memshop = memshop;
    }
}