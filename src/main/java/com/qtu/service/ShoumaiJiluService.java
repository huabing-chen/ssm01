package com.qtu.service;

import java.util.Map;

public interface ShoumaiJiluService {

	public Map insertJilu(String zongjine,String gouwuche);
	
	public Map insertJiluHuiyuan(String zongjine,String gouwuche,String huiyuanNo);
	
	//查询营业额
	Map selectYingYeE(String start,String end);
	
	//查询人数
	Map selectListRenShu(String start,String end);
	
	Map selectYearYingYeE();
	
	Map selectYearListRenShu();
}
