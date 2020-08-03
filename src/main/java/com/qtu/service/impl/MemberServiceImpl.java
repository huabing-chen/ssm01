package com.qtu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtu.entity.Member;
import com.qtu.mapper.MemberMapper;
import com.qtu.service.MemberService;
@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberMapper memberMapper;
	
	@Override
	public Map memberList() {
		List<Member> memberListAll = memberMapper.memberListAll();
		Map<String,Object> map = new HashMap<>();
		map.put("list", memberListAll);
		
		return map;
	}

	@Override
	public Map selechMemberBy(String searchKey) {
		Member member = memberMapper.queryBymemNoOrName(searchKey);
		Map<String,Object> map = new HashMap<>();
		map.put("list", member);
		
		return map;
	}

	@Override
	public Map addMember(Member mem) {
		String memtel = mem.getMemtel();
		mem.setMemno(memtel.substring(memtel.length()-5,memtel.length()));
		int row = memberMapper.insertSelective(mem);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

	@Override
	public Member selectById(Integer memberId) {
		Member member = memberMapper.selectByPrimaryKey(memberId);
		
		return member;
	}

	@Override
	public Map updateByIdSelect(Member member) {
		int row = memberMapper.updateByPrimaryKeySelective(member);
		Map<String,Object> map = new HashMap<String,Object>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

	@Override
	public Map deleteMemberById(Integer memberId) {
		int row = memberMapper.deleteByPrimaryKey(memberId);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

}
