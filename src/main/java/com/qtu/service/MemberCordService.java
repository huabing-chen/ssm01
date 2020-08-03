package com.qtu.service;

import java.util.Map;

public interface MemberCordService {

	//根据会员号查询所有消费记录
	Map selectListMemberCore(String memno);
	
	//添加消费记录
	Map insertJilu(String zongjine,String gouwuche,String huiyuanNo);
}
