package com.qtu.bean;

public class GouWuChe {

	public String GoodsId;
	public String GoodsName;
	public String Price;
	public Integer Qty;
	public String Money;
	public String getGoodsId() {
		return GoodsId;
	}
	public void setGoodsId(String goodsId) {
		GoodsId = goodsId;
	}
	public String getGoodsName() {
		return GoodsName;
	}
	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public Integer getQty() {
		return Qty;
	}
	public void setQty(Integer qty) {
		Qty = qty;
	}
	public String getMoney() {
		return Money;
	}
	public void setMoney(String money) {
		Money = money;
	}
	@Override
	public String toString() {
		return "GouWuChe [GoodsId=" + GoodsId + ", GoodsName=" + GoodsName + ", Price=" + Price + ", Qty=" + Qty
				+ ", Money=" + Money + "]";
	}
	
}
