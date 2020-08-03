package com.qtu.service;

import java.util.Map;

import com.qtu.entity.Member;

public interface MemberService {

	/**
	 * 	查询所有会员
	 * @return
	 */
	Map memberList();
	//根据会员号或者会员名查询
	Map selechMemberBy(String searchKey);
	//添加会员
	Map addMember(Member mem);
	//根据id查询要修改会员的信息
	Member selectById(Integer memberId);
	//更新会员信息
	Map updateByIdSelect(Member member);
	
	Map deleteMemberById(Integer memberId);
}
