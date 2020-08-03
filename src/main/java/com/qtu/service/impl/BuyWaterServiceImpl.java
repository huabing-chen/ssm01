package com.qtu.service.impl;

import java.text.ParseException;
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
import com.qtu.entity.BuyWater;
import com.qtu.entity.ShoumaiJilu;
import com.qtu.mapper.BuyWaterMapper;
import com.qtu.service.BuyWaterService;

@Service
@Transactional
public class BuyWaterServiceImpl implements BuyWaterService {
	
	@Resource
	private BuyWaterMapper buyWaterMapper;

	@Override
	public Map selectListAll() {
		List<BuyWater> list = buyWaterMapper.selectListAll();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		
		return map;
	}

	@Override
	public Map insertSelective(String watermg, String buytime, String waterprice) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(buytime);
		BuyWater bw = new BuyWater();
		bw.setBuytime(date);
		bw.setWatermg(watermg);
		bw.setWaterprice(Integer.parseInt(waterprice));
		int row = buyWaterMapper.insertSelective(bw);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

	@Override
	public Map selectBuyWaterByTime(String startTiem, String endTiem) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start =null;
		Date end =null;
		/* System.out.println("end========="+end); */
		
			start = sdf.parse(startTiem);
			end = sdf.parse(endTiem);
			
		
		List<BuyWater> list = buyWaterMapper.selectBuyWaterByTime(start, end);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}

	@Override
	public Map selectBuyWaterTongji(String start, String end) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Map<String,Object> map = new HashMap<>();
		if(StringUtils.isEmpty(start) && StringUtils.isEmpty(end)) {
			Date todayStartTime = getTodayStartTime();
			Date todayEndTime = getTodayEndTime();
			String startTime = sdf.format(todayStartTime);
			String endTime = sdf.format(todayEndTime);
			List<BuyWater> list = buyWaterMapper.selectBuyWaterByTime2(startTime, endTime);
			
			Integer renShu=list.size();
			
			map.put("lashui", renShu);
		}else {
			String startTime =start;
			String endTime = end;
			if(start.length()<12) {
				startTime = start+" 00:00:00";
			}
			if(end.length()<12) {
				endTime = end+" 23:59:59";
			}
			
			List<BuyWater> list = buyWaterMapper.selectBuyWaterByTime2(startTime, endTime);
			Integer renShu=list.size();
			map.put("lashui", renShu);
		}
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

}
