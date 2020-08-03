package com.qtu.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONArray;
import com.qtu.entity.ShoumaiJilu;
import com.qtu.mapper.MemberCordMapper;
import com.qtu.mapper.ShoumaiJiluMapper;
import com.qtu.service.MemberCordService;
import com.qtu.service.ShoumaiJiluService;
@Service
@Transactional
public class ShoumaiJiluServiceImpl implements ShoumaiJiluService {

	@Resource
	private ShoumaiJiluMapper shoumaiJiluMapper;
	
	@Resource 
	private MemberCordService memberCordService;

	@Override
	public Map insertJilu(String zongjine, String gouwuche) {
		String ss = gouwuche.substring(8, gouwuche.length()-11);
		System.out.println(ss);
		
		  List<ShoumaiJilu> t = JSONArray.parseArray(ss, ShoumaiJilu.class);
		  int row = 0,num=0;
		  for(ShoumaiJilu g:t) { 
			  g.setGoumaitime(new Date());
			   row = shoumaiJiluMapper.insertSelective(g);
			   num +=row;
			  }
		  Map<String,Object> map = new HashMap<>();
		  if(num==t.size() && num>0) {
			  map.put("status", 1);
		  }
		return map;
	}

	@Override
	public Map insertJiluHuiyuan(String zongjine, String gouwuche, String huiyuanNo) {
		String ss = gouwuche.substring(8, gouwuche.length()-11);
		System.out.println(ss);
		
		  List<ShoumaiJilu> t = JSONArray.parseArray(ss, ShoumaiJilu.class);
		  int row = 0,num=0;
		  for(ShoumaiJilu g:t) { 
			  g.setGoumaitime(new Date());
			  g.setMemid(Integer.valueOf(huiyuanNo));
			   row = shoumaiJiluMapper.insertSelective(g);
			   num +=row;
			  }
		  Map map = memberCordService.insertJilu(zongjine, gouwuche, huiyuanNo);
		return map;
	}

	@Override
	public Map selectYingYeE(String start, String end) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Map<String,Object> map = new HashMap<>();
		if(StringUtils.isEmpty(start) && StringUtils.isEmpty(end)) {
			Date todayStartTime = getTodayStartTime();
			Date todayEndTime = getTodayEndTime();
			String startTime = sdf.format(todayStartTime);
			String endTime = sdf.format(todayEndTime);
			List<ShoumaiJilu> list = shoumaiJiluMapper.selectListByTime(startTime, endTime);
			Double yingYeE=0.0;
			for(ShoumaiJilu sj:list) {
				String money = sj.getMoney();
				yingYeE+=Double.valueOf(money);
			}
			map.put("yeji", yingYeE);
		}else {
			String startTime =start;
			String endTime = end;
			if(start.length()<12) {
				startTime = start+" 00:00:00";
			}
			if(end.length()<12) {
				endTime = end+" 23:59:59";
			}
			List<ShoumaiJilu> list = shoumaiJiluMapper.selectListByTime(startTime, endTime);
			Double yingYeE=0.0;
			for(ShoumaiJilu sj:list) {
				String money = sj.getMoney();
				yingYeE+=Double.valueOf(money);
			}
			map.put("yeji", yingYeE);
		}
		return map;
	}

	@Override
	public Map selectListRenShu(String start, String end) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Map<String,Object> map = new HashMap<>();
		if(StringUtils.isEmpty(start) && StringUtils.isEmpty(end)) {
			Date todayStartTime = getTodayStartTime();
			Date todayEndTime = getTodayEndTime();
			String startTime = sdf.format(todayStartTime);
			String endTime = sdf.format(todayEndTime);
			List<ShoumaiJilu> list = shoumaiJiluMapper.selectListByTime(startTime, endTime);
			Integer renShu=0;
			for(ShoumaiJilu sj:list) {
				renShu+=sj.getQty();
			}
			map.put("fuwurenshu", renShu);
		}else {
			String startTime =start;
			String endTime = end;
			if(start.length()<12) {
				startTime = start+" 00:00:00";
			}
			if(end.length()<12) {
				endTime = end+" 23:59:59";
			}
			List<ShoumaiJilu> list = shoumaiJiluMapper.selectListByTime(startTime, endTime);
			Integer renShu=0;
			for(ShoumaiJilu sj:list) {
				renShu+=sj.getQty();
			}
			map.put("fuwurenshu", renShu);
		}
		return map;
	}
	
	@Override
	public Map selectYearYingYeE() {
		Double[] d = new Double[12];
		Map<String,Object> map = new HashMap<>();
		for(int i=1;i<=12;i++) {
			String startTime = getMonthStartTime(i);
			String endTime = getMonthEndTime(i);
			List<ShoumaiJilu> list = shoumaiJiluMapper.selectListByTime(startTime, endTime);
			Double yye=0.0;
			for(ShoumaiJilu sj:list) {
				yye+=Double.valueOf(sj.getMoney());
			}
			d[i-1]=yye;
		}
		map.put("yye", d);
		return map;
	}

	@Override
	public Map selectYearListRenShu() {
		Integer[] in = new Integer[12];
		Map<String,Object> map = new HashMap<>();
		for(int i=1;i<=12;i++) {
			String startTime = getMonthStartTime(i);
			String endTime = getMonthEndTime(i);
			List<ShoumaiJilu> list = shoumaiJiluMapper.selectListByTimeAndName(startTime, endTime);
			Integer num =0;
			for(ShoumaiJilu sj:list) {
				num+=sj.getQty();
			}
			in[i-1] = num;
		}
		map.put("peoplenum", in);
		return map;
	}
	
	public static Date getTodayStartTime() {
	       Calendar todayStart = Calendar.getInstance();
		/* todayStart.set(Calendar.MONTH, todayStart.get(Calendar.MONTH)+1); */
	       todayStart.set(Calendar.HOUR_OF_DAY, 0);
	       todayStart.set(Calendar.MINUTE, 0);
	       todayStart.set(Calendar.SECOND, 0);
	       return todayStart.getTime();
	   }
	
	public static Date getTodayEndTime() {
	     Calendar todayEnd = Calendar.getInstance();
		/* todayEnd.set(Calendar.MONTH, todayEnd.get(Calendar.MONTH)+1); */
	     todayEnd.set(Calendar.HOUR_OF_DAY, 23);
	     todayEnd.set(Calendar.MINUTE, 59);
	     todayEnd.set(Calendar.SECOND, 59);
	     return todayEnd.getTime();
	 }

	public static String getMonthStartTime(Integer month) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar monthStart = Calendar.getInstance();
		monthStart.set(Calendar.MONTH, month-1);
		monthStart.set(Calendar.DAY_OF_MONTH, 1);
		monthStart.set(Calendar.HOUR_OF_DAY, 0);
		monthStart.set(Calendar.MINUTE, 0);
		monthStart.set(Calendar.SECOND, 0);
		String ms = sdf.format(monthStart.getTime());
		return ms;
	}
	public static String getMonthEndTime(Integer month) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar monthEnd = Calendar.getInstance();
		monthEnd.set(Calendar.MONTH, month-1);
		
		//获取某月最大天数
        int lastDay = monthEnd.getActualMaximum(Calendar.DATE);
        //设置日历中月份的最大天数  
        monthEnd.set(Calendar.DAY_OF_MONTH, lastDay); 
		  
		  monthEnd.set(Calendar.HOUR_OF_DAY, 23);
		  monthEnd.set(Calendar.MINUTE, 59);
		  monthEnd.set(Calendar.SECOND, 59);
		 
		String me = sdf.format(monthEnd.getTime());
		return me;
	}

	
	
}
