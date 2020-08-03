package com.qtu.entity;

import java.util.Date;

public class BuyWater {
    private Integer id;

    private String watermg;

    private Integer waterprice;

    private Date buytime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWatermg() {
        return watermg;
    }

    public void setWatermg(String watermg) {
        this.watermg = watermg;
    }

    public Integer getWaterprice() {
        return waterprice;
    }

    public void setWaterprice(Integer waterprice) {
        this.waterprice = waterprice;
    }

    public Date getBuytime() {
        return buytime;
    }

    public void setBuytime(Date buytime) {
        this.buytime = buytime;
    }
}