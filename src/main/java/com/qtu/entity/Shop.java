package com.qtu.entity;

import java.util.Date;

public class Shop {
    private Integer id;

    private String shopname;

    private Double shopprice;

    private String shopsize;

    private Integer shopnum;

    private Integer sellnum;

    private Date selltime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public Double getShopprice() {
        return shopprice;
    }

    public void setShopprice(Double shopprice) {
        this.shopprice = shopprice;
    }

    public String getShopsize() {
        return shopsize;
    }

    public void setShopsize(String shopsize) {
        this.shopsize = shopsize;
    }

    public Integer getShopnum() {
        return shopnum;
    }

    public void setShopnum(Integer shopnum) {
        this.shopnum = shopnum;
    }

    public Integer getSellnum() {
        return sellnum;
    }

    public void setSellnum(Integer sellnum) {
        this.sellnum = sellnum;
    }

    public Date getSelltime() {
        return selltime;
    }

    public void setSelltime(Date selltime) {
        this.selltime = selltime;
    }

	@Override
	public String toString() {
		return "Shop [id=" + id + ", shopname=" + shopname + ", shopprice=" + shopprice + ", shopsize=" + shopsize
				+ ", shopnum=" + shopnum + ", sellnum=" + sellnum + ", selltime=" + selltime + "]";
	}
    
}