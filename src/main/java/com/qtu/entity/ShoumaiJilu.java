package com.qtu.entity;

import java.util.Date;

public class ShoumaiJilu {
    private Integer id;

    private String goodsid;

    private String goodsname;

    private String price;

    private Integer qty;

    private String money;

    private Integer memid;

    private Date goumaitime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(String goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Integer getMemid() {
        return memid;
    }

    public void setMemid(Integer memid) {
        this.memid = memid;
    }

    public Date getGoumaitime() {
        return goumaitime;
    }

    public void setGoumaitime(Date goumaitime) {
        this.goumaitime = goumaitime;
    }
}