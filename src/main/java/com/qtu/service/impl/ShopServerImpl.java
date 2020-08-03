package com.qtu.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtu.entity.Shop;
import com.qtu.mapper.ShopMapper;
import com.qtu.service.ShopService;
@Service
@Transactional
public class ShopServerImpl implements ShopService {
	
	@Resource
	private ShopMapper shopMapper;

	@Override
	public Map shopLisAll() {
		List<Shop> listAll = shopMapper.selectListAll();
		Map<String,Object> map = new HashMap<>();
		map.put("list", listAll);
		return map;
	}

	@Override
	public Map shopBySearchKey(String searchKey) {
		List<Shop> list = shopMapper.selectShopBySearchKey(searchKey);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

	@Override
	public Map deleteByPrimaryKey(String shopId) {
		int row = shopMapper.deleteByPrimaryKey(Integer.valueOf(shopId));
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

	@Override
	public Map insertSelective(String shopname, String shopprice, String shopsize, String shopnum) {
		Shop shop = new Shop();
		shop.setShopname(shopname);
		shop.setShopprice(Double.valueOf(shopprice));
		shop.setShopsize(shopsize);
		shop.setShopnum(Integer.valueOf(shopnum));
		shop.setSellnum(0);
		shop.setSelltime(new Date());
		int row = shopMapper.insertSelective(shop);
		Map<String,Object> map = new HashMap<>();

		if(row>0) {
			map.put("status", 1);
		}
		return map;
		
	}

	@Override
	public Shop selectByPrimaryKey(String shopId) {
		Shop shop = shopMapper.selectByPrimaryKey(Integer.valueOf(shopId));
		
		return shop;
	}

	@Override
	public Map updateByPrimaryKeySelective(Shop shop) {
		int row = shopMapper.updateByPrimaryKeySelective(shop);
		Map<String,Object> map = new HashMap<>();

		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

}
