package com.qtu.service;

import java.text.ParseException;
import java.util.Date;
import java.util.Map;

public interface BuyWaterService {

	//所有拉水记录
	Map selectListAll();
	//添加拉水记录
	Map insertSelective(String watermg,String buytime,String waterprice) throws ParseException;
	//根据时间范围查询记录
	Map selectBuyWaterByTime(String startTiem,String endTiem)throws ParseException;
	
	Map selectBuyWaterTongji(String start,String end);
}
