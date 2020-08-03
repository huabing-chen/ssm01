package com.qtu.service;

import java.util.Map;

import com.qtu.entity.Shop;

public interface ShopService {

	Map shopLisAll();
	
	Map shopBySearchKey(String searchKey);
	
	Map deleteByPrimaryKey(String shopId);
	
	Map insertSelective(String shopname,String shopprice,String shopsize,String shopnum);
	
	Shop selectByPrimaryKey(String shopId);
	
	Map updateByPrimaryKeySelective(Shop shop);
}
