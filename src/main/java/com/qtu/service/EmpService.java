package com.qtu.service;

import java.util.List;

import com.qtu.entity.Emp;
import com.qtu.util.PagingVO;

public interface EmpService {

    /**
     *         根据用户名和密码登录
     * @param userName
     * @param pwd
     * @return
     */
	public Emp SelectByNameAndPwd(String userName,String pwd);
	
	/**
	 * 根据id修改密码
	 * @param pwd
	 * @param id
	 * @return
	 */
	public int changePwd(String pwd,Integer id);
	
	/**
	 * 根据id修改员工信息
	 * @param emp
	 * @return
	 */
	public int updateEmp(Emp emp);
	
	/**
	 * 查询有多少条记录
	 * @return
	 */
	public int selectCount();
	
	/**
	 * fen ye查询
	 * @param startSize
	 * @param endSize
	 * @return
	 */
	public List<Emp> queryPage(PagingVO page);
	/**
	 * 	根据名字查询员工
	 * @param name
	 * @return
	 */
	public List<Emp> queryEmpByName(String name);
	
	/**
	 * 	判断用户昵称是否存在
	 * @param uname
	 * @return
	 */
	public int judgeUnameIdHave(String uname);
	
	/**
	 * 	新增员工
	 * @param emp
	 * @return
	 */
	public int insertEmp(Emp emp);
	/**
	 * 	根据id删除员工
	 * @param id
	 * @return
	 */
	public int deleteEmp(Integer id);
	/**
	 * 	根据id查找员工
	 * @param id
	 * @return
	 */
	public Emp selectEmpById(Integer id);
}
