package com.qtu.controller;

import java.text.ParseException;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtu.service.BuyWaterService;

@Controller
@RequestMapping(value="/buywater")
public class BuyWaterController {

	@Resource
	private BuyWaterService buyWaterService;
	
	@ResponseBody
	@RequestMapping(value="/listAll")
	public Map selectListAll() {
		Map map = buyWaterService.selectListAll();
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/buywaterAdd")
	public Map addBuyWater(String watermg, String buytime, String waterprice) throws ParseException {
		Map map = buyWaterService.insertSelective(watermg, buytime, waterprice);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/selectList")
	public Map selectByTime(String searchKeyStart,String searchKeyEnd) throws ParseException {
		System.out.println(searchKeyEnd+" =="+searchKeyStart);
		Map map = buyWaterService.selectBuyWaterByTime(searchKeyStart, searchKeyEnd);
		return map;
	}
}
