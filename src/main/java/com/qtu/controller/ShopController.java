package com.qtu.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtu.entity.Shop;
import com.qtu.service.ShopService;

@Controller
@RequestMapping(value="/shop")
public class ShopController {

	@Resource
	private ShopService shopService;
	
	@ResponseBody
	@RequestMapping(value="/listAll",method=RequestMethod.POST)
	public Map listAll() {
		Map map = shopService.shopLisAll();
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/searchKey",method=RequestMethod.POST)
	public Map selectListBySearcheKey(String searchKey) {
		Map map = shopService.shopBySearchKey(searchKey);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/deleteShop",method=RequestMethod.POST)
	public Map deleteShopById(String shopId) {
		Map map = shopService.deleteByPrimaryKey(shopId);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/addShop")
	public Map addShop(String shopname, String shopprice, String shopsize, String shopnum) {
		Map map = shopService.insertSelective(shopname, shopprice, shopsize, shopnum);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/updateshop")
	public void selectShopOne(String shopId,HttpSession session) {
		Shop shop = shopService.selectByPrimaryKey(shopId);
		session.setAttribute("shop", shop);
	}
	@ResponseBody
	@RequestMapping(value="/shopUpdateTiJiao")
	public Map updateShop(Shop shop) {
		System.out.println(shop.toString());
		Map map = shopService.updateByPrimaryKeySelective(shop);
		return map;
	}
}
