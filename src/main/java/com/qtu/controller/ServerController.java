package com.qtu.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qtu.entity.Server;
import com.qtu.service.ServerService;

@Controller
@RequestMapping(value="/server")
public class ServerController {

	@Resource
	private ServerService serverService;
	
	@ResponseBody
	@RequestMapping(value="/listAll")
	public Map selectAllServer() {
		Map map = serverService.listAllServer();
		return map;
	}
	@ResponseBody
	@RequestMapping(value="searchKey",method=RequestMethod.POST)
	public Map selectServiceByName(String searchKey) {
		Map map = serverService.selectServerByName(searchKey);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/serverMember",method=RequestMethod.POST)
	public Map deleteServiceById(String serverId) {
		Map map = serverService.deleteServerById(serverId);
		return map;
	}
	@RequestMapping(value="/updateServer",method=RequestMethod.POST)
	public void updateBefore(String serverId,HttpSession session) {
		Server ss = serverService.selectByPrimaryKey(serverId);
		session.setAttribute("server", ss);
	}
	@ResponseBody
	@RequestMapping(value="/updateServerTiJiao")
	public Map updateServeice(String id,String serno,String sername,String serprice) {
		Map map = serverService.updateByPrimaryKeySelective(id, serno, sername, serprice);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/addServer")
	public Map insertServer(String serno,String sername,String serprice) {
		Map map = serverService.insertServer(serno, sername, serprice);
		return map;
	}
}
