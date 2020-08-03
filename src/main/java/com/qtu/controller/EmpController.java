package com.qtu.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qtu.util.Datetransform;
import com.qtu.util.PagingVO;
import com.alibaba.druid.util.StringUtils;
import com.qtu.entity.Emp;
import com.qtu.service.EmpService;

@Controller
@RequestMapping(value = "/emp")
public class EmpController {

	@Resource
	private EmpService empService;

	@ResponseBody
	@RequestMapping(value = "/loginAjax", method = RequestMethod.GET)
	public Map toLogin(String logname, String logpass, HttpServletRequest request) {
		System.out.println("logname=" + logname + ",logpass=" + logpass);
		Emp bean = empService.SelectByNameAndPwd(logname, logpass);
		Map<String, Object> map = new HashMap<>();
		/*
		 * String userAddress = bean.getUserAddress(); String[] address =
		 * userAddress.split(" ");
		 */
		if (bean != null) {
			map.put("status", 1);
			map.put("emp", bean);
			/* session.setAttribute("user", user); */
			// 把请求域范围扩大到会话范围session
			// 获取session对象
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", bean.getUserRealname());
			session.setAttribute("loginUser_name", bean.getUserName());
			session.setAttribute("loginUser_id", bean.getUserId());
			session.setAttribute("loginUser_pwd", bean.getUserPwd());
			session.setAttribute("loginUser_sex", bean.getUserSex());
			session.setAttribute("loginPhonenumber", bean.getPhonenumber());
			session.setAttribute("loginUser_born", bean.getUserBorn());
			String[] address = null;
			if (bean.getUserAddress() != null) {
				address = bean.getUserAddress().split(" ");
				System.out.println("address===========" + Arrays.toString(address));
			}
			session.setAttribute("loginUser_address", address);
			String[] hobby = null;
			if (bean.getUserHobby() != null) {
				hobby = bean.getUserHobby().split(" ");
				System.out.println("hobby=============" + Arrays.toString(hobby));
			}
			session.setAttribute("loginUser_hobby", hobby);
			session.setAttribute("loginUser_email", bean.getUserEmail());
			session.setAttribute("loginSelfassessment", bean.getSelfassessment());
			session.setAttribute("loginHeadpic", bean.getHeadpic());

		}
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/changePwdAjax")
	public Map changPwd(String pwdagain, Integer id) {
		int row = empService.changePwd(pwdagain, id);
		Map<String, Object> map = new HashMap<>();
		if (row > 0) {

			map.put("status", 1);
		}
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/loginOut")
	public void loginOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser_name");
		session.removeAttribute("loginUser_pwd");
		session.invalidate();
		ModelAndView mode = new ModelAndView();
		/* mode.setViewName("login.jsp"); */
		response.sendRedirect("../../ssm01/login.jsp");
	}

	@ResponseBody
	@RequestMapping(value = "/userinfo")
	public Map updateUserinfo(Emp emp, String userBorn, String province, String city, String area, String hobby) throws ParseException {
		Map<String, Object> map = new HashMap<>();

//		Date born = Datetransform.parse(userBorn, "yyyy-MM-dd");
		System.out.println(userBorn);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(!StringUtils.isEmpty(userBorn) && (userBorn instanceof String)) {
			
			Date parse = sdf.parse(userBorn);
			emp.setUserBorn(parse);
		}
		StringBuffer address = new StringBuffer();
		address.append(province);
		address.append(" ");
		address.append(city);
		address.append(" ");
		address.append(area);

		String hobby2 = hobby.replace(",", " ");
		emp.setUserPwd(null);
		emp.setUserAddress(address.toString());
		
		emp.setUserHobby(hobby2);
		int row = empService.updateEmp(emp);
		if (row > 0) {
			map.put("status", 1);
		}

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/pageList")
	public Map selectPageList(HttpServletRequest request, HttpServletResponse response,
			String curentPageNo,String pageSize) throws ServletException, IOException{
				// 登录成功
				List<Emp> list = null;
				// 查询数据库总记录数
				int total = empService.selectCount();
				System.out.println("===============total="+total);
				// 实例化分页对象
				PagingVO page = new PagingVO();
				page.setPageSize(20);
				page.setTotalCount(total);
				System.out.println(curentPageNo + "444444444");
				if (curentPageNo != null && !curentPageNo.equals("")) {
					if (curentPageNo.equals("0")) {
						page.setCurentPageNo(1);
					} else if (curentPageNo.equals(String.valueOf(page.getTotalCount() + 1))) {
						page.setCurentPageNo(page.getTotalCount());
					} else {
						page.setCurentPageNo(Integer.parseInt(curentPageNo));
					}

				}

				// 查询列表
				list = empService.queryPage(page);
				Map<String,Object> map = new HashMap<>();
				map.put("list", list);
				map.put("msg", "success");
				request.setAttribute("page", page);

				/*
				 * HttpSession session = request.getSession(); List<Power> powerlist1
				 * =powerService.list(); session.setAttribute("powerlist1", powerlist1);
				 * System.out.println(powerlist1.size());
				 */

				request.setAttribute("ulist", list);
		/* request.getRequestDispatcher("userlist.jsp").forward(request, response); */
				return map;
	
	}

	@ResponseBody
	@RequestMapping(value="/searchKey",method = RequestMethod.POST)
	public Map queryEmpByName(String searchKey) {
		List<Emp> list = empService.queryEmpByName(searchKey);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("msg", "success");
		return map;
	}

	@ResponseBody
	@RequestMapping(value="/judgeName")
	public Map judgeNameIsHave(String uname) {
		Map<String,Object> map =new HashMap<>();
		int row = empService.judgeUnameIdHave(uname);
		if(row>0) {
			map.put("isCheck", 1);
		}
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/addEmp")
	public Map addEmp(Emp emp, String born, String province, String city, String area, String hobby) throws ParseException {
		Map<String,Object> map  = new HashMap<>();
		System.out.println(born);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date userBorn = sdf.parse(born);
		StringBuffer address = new StringBuffer();
		address.append(province);
		address.append(" ");
		address.append(city);
		address.append(" ");
		address.append(area);

		
		
		emp.setUserAddress(address.toString());
		emp.setUserBorn(userBorn);
		emp.setUserHobby(hobby);
		
		System.out.println(emp.toString());
		int row = empService.insertEmp(emp);
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/deleteEmp")
	public Map delectEmp(Integer userId) {
		Map<String,Object> map = new HashMap<>();
		int row = empService.deleteEmp(userId);
		if(row>0) {
			map.put("status", 1);
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateEmp")
	public ModelAndView updateEmp(Integer userId,HttpSession session,HttpServletResponse response,
			HttpServletRequest request) {
		
		Emp emp = empService.selectEmpById(userId);
		String userAddress = emp.getUserAddress();
		String[] address = userAddress.split(" ");
		session.setAttribute("address", address);
		session.setAttribute("province", address[0]);
		session.setAttribute("city", address[1]);
		session.setAttribute("area", address[2]);
		session.setAttribute("user", emp);
		System.out.println("addrress=================");
		System.out.println(address[0]);
		System.out.println(address[1]);
		System.out.println(address[2]);
		System.out.println("updateEmp======="+emp.toString());
		 ModelAndView mav = new ModelAndView(); 
		 Map<String,Object> map = new HashMap<>();
		 map.put("user", emp);
		 mav.setViewName("userupdate");
		  
		return mav;
	}
	
}
