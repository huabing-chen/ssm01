package com.qtu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtu.entity.Member;
import com.qtu.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Resource
	private MemberService memberService;
	
	@ResponseBody
	@RequestMapping(value="/listAll",method=RequestMethod.POST)
	public Map memberListAll() {
		Map map = memberService.memberList();
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/searchKey",method=RequestMethod.POST)
	public Map searchKeyBy(String searchKey) {
		Map map = memberService.selechMemberBy(searchKey);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/addMember")
	public Map addMemeber(String memname,String memtel,String memtime,String memmoney) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Member member = new Member();
		 Date parse = sdf.parse(memtime); 
		member.setMemtime(parse);
		member.setMemname(memname);
		member.setMemtel(memtel);
		double d = Double.parseDouble(memmoney);
		member.setMemmoney(d);
		Map map = memberService.addMember(member);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateMember")
	public Map updateBefore(Integer memberId,HttpSession session) {
		Member member = memberService.selectById(memberId);
		session.setAttribute("member", member);
		Map<String,Object> map = new HashMap<>();
		map.put("list", member);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/memberUpdateTiJiao")
	public Map updateMember(Member member) {
		Map map = memberService.updateByIdSelect(member);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/deleteMember")
	public Map deleteMember(Integer memberId) {
		Map map = memberService.deleteMemberById(memberId);
		return map;
	}
}
