package com.qtu.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtu.service.MemberCordService;

@Controller
@RequestMapping(value="/membercord")
public class MemberCordController {

	@Resource
	private MemberCordService memberCordService;
	
	@ResponseBody
	@RequestMapping(value="/listAll")
	public Map selectListMemCore(String memno) {
		Map map = memberCordService.selectListMemberCore(memno);
		return map;
	}
}
