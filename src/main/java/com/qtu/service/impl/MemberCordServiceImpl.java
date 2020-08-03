package com.qtu.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONArray;
import com.qtu.entity.Member;
import com.qtu.entity.MemberCord;
import com.qtu.entity.ShoumaiJilu;
import com.qtu.mapper.MemberCordMapper;
import com.qtu.mapper.MemberMapper;
import com.qtu.service.MemberCordService;
@Service
@Transactional
public class MemberCordServiceImpl implements MemberCordService {

	@Resource
	private MemberCordMapper memberCordMapper;
	@Resource
	private MemberMapper memberMapper;
	
	@Override
	public Map selectListMemberCore(String memno) {
		List<MemberCord> list = memberCordMapper.slectList(memno);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

	@Override
	public Map insertJilu(String zongjine, String gouwuche, String huiyuanNo) {
		Map<String,Object> map = new HashMap<>();
		
		
		Member member = memberMapper.queryBymemNoOrName(huiyuanNo);
		String name = member.getMemname();
		Double money = member.getMemmoney();
		if(money==null || money.equals("")) {
			money = 0.0;
		}
		//余额不足够的情况
		if(money<Double.valueOf(zongjine)) {
			map.put("status", 2);
			map.put("yue", money);
			return map;
		}else {//余额足够的情况
			
			//会员金额减去消费数
			Double nowMoney = money-Double.valueOf(zongjine);
			member.setMemmoney(nowMoney);
			//更新会员余额
			memberMapper.updateByPrimaryKeySelective(member);
			
			String ss = gouwuche.substring(8, gouwuche.length()-11);
			System.out.println(ss);
			List<ShoumaiJilu> t = JSONArray.parseArray(ss, ShoumaiJilu.class);
			int row = 0,num=0;
			
			for(ShoumaiJilu s:t) {
				MemberCord mc = new MemberCord();
				mc.setMemname(name);
				mc.setMemno(huiyuanNo);
				mc.setMemshop(s.getGoodsid());
				mc.setRecordprice(Double.valueOf(s.getMoney()));
				mc.setRecordtime(new Date());
				row = memberCordMapper.insertSelective(mc);
				num+=row;
			}
			map.put("status", 1);
			map.put("yue", nowMoney);
			
		}
		return map;
	}

}
