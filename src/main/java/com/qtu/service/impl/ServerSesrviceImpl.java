package com.qtu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtu.entity.Server;
import com.qtu.mapper.ServerMapper;
import com.qtu.service.ServerService;
@Service
@Transactional
public class ServerSesrviceImpl implements ServerService {

	@Resource
	private ServerMapper serverMapper;
	
	@Override
	public Map listAllServer() {
		List<Server> listAll = serverMapper.selectListAll();
		Map<String,Object> map = new HashMap<>();
		map.put("list", listAll);
		return map;
	}

	@Override
	public Map selectServerByName(String searchKey) {
		List<Server> list = serverMapper.selectServerBySerName(searchKey);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
		
	}

	@Override
	public Map deleteServerById(String id) {
		int row = serverMapper.deleteByPrimaryKey(Integer.valueOf(id));
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

	@Override
	public Server selectByPrimaryKey(String id) {
		Server server = serverMapper.selectByPrimaryKey(Integer.parseInt(id));
		return server;
	}

	@Override
	public Map updateByPrimaryKeySelective(String id,String serno,String sername,String serprice) {
		Server ser = new Server();
		ser.setId(Integer.parseInt(id));
		ser.setSerno(Integer.parseInt(serno));
		ser.setSername(sername);
		ser.setSerprice(Double.valueOf(serprice));
		int row = serverMapper.updateByPrimaryKeySelective(ser);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

	@Override
	public Map insertServer(String serno, String sername, String serprice) {
		Server ser = new Server();
		ser.setSername(sername);
		ser.setSerno(Integer.valueOf(serno));
		ser.setSerprice(Double.valueOf(serprice));
		ser.setSernum(0);
		int row = serverMapper.insertSelective(ser);
		Map<String,Object> map = new HashMap<>();
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}

}
