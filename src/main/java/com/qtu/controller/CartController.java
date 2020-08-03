package com.qtu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONArray;
import com.qtu.bean.GouWuChe;
import com.qtu.service.MemberCordService;
import com.qtu.service.ShoumaiJiluService;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@Resource
	private ShoumaiJiluService shoumaiJiluService;	
	
	
	@ResponseBody
	@RequestMapping(value="/jieshoushuju")
	public Map getShuju(String zongjine,String gouwuche) {
		/*
		 * System.out.println("zongjine+++++++++++++++++++++++++"+zongjine);
		 * System.out.println("gouwuche+++++++++++++++++++++++++"+gouwuche);
		 */
		Map map = shoumaiJiluService.insertJilu(zongjine, gouwuche);
		return map;
		 
	}
	@ResponseBody
	@RequestMapping(value="/huiyuanzhifu")
	public Map getHuiYuanZhiFu(String zongjine,String gouwuche,String huiyuanNo) {
		System.out.println("++++++++++++++++++++++++会员号："+huiyuanNo);
		Map map = shoumaiJiluService.insertJiluHuiyuan(zongjine, gouwuche, huiyuanNo);
		return map;
	}
}
