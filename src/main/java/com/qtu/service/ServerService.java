package com.qtu.service;

import java.util.Map;

import com.qtu.entity.Server;

public interface ServerService {

	//所有服务
	Map listAllServer();
	
	Map selectServerByName(String searchKey);
	
	Map deleteServerById(String id);
	
	Server selectByPrimaryKey(String id);
	
	
	Map updateByPrimaryKeySelective(String id,String serno,String sername,String serprice);
	
	Map insertServer(String serno,String sername,String serprice);
}
