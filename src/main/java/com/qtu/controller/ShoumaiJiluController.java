package com.qtu.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtu.service.BuyWaterService;
import com.qtu.service.ShoumaiJiluService;

@Controller
@RequestMapping(value="/tongji")
public class ShoumaiJiluController {

	@Resource
	private ShoumaiJiluService shoumaiJiluService;
	
	@Resource
	private BuyWaterService buyWaterService;
	
	@ResponseBody
	@RequestMapping(value="/xianshi")
	public Map tongjixianshi(String start,String end) throws ParseException {
		Map map1 = shoumaiJiluService.selectListRenShu(start, end);
		Map map2 = shoumaiJiluService.selectYingYeE(start, end);
		Map map3 = buyWaterService.selectBuyWaterTongji(start, end);
	
		Map<String,Object> map = new HashMap<>();
		map.put("yeji", map2.get("yeji"));
		map.put("fuwurenshu", map1.get("fuwurenshu"));
		map.put("lashui", map3.get("lashui"));
		
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/zhuzhuangtu")
	public Map tongjiZhuZhuangTu() {
		Map<String,Object> map = new HashMap<>();
		Map map1 = shoumaiJiluService.selectYearListRenShu();
		Map map2 = shoumaiJiluService.selectYearYingYeE();
		map.put("peoplenum", map1.get("peoplenum"));
		map.put("yye", map2.get("yye"));
		return map;
	}
}
