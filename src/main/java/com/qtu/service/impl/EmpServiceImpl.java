package com.qtu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qtu.entity.Emp;
import com.qtu.mapper.EmpMapper;
import com.qtu.service.EmpService;
import com.qtu.util.PagingVO;

@Service
@Transactional
public class EmpServiceImpl implements EmpService {
	@Resource
	private EmpMapper empMapper;

	@Override
	public Emp SelectByNameAndPwd(String userName, String pwd) {
		
		return empMapper.selectByNameAndPwd(userName, pwd);
	}

	@Override
	public int changePwd(String pwd, Integer id) {
		
		return empMapper.changePwdById(pwd, id);
	}

	@Override
	public int updateEmp(Emp emp) {
		
		return empMapper.updateByPrimaryKeySelective(emp);
	}

	@Override
	public int selectCount() {
		
		return empMapper.selectCount();
	}

	@Override
	public List<Emp> queryPage(PagingVO page) {
		int begin=(page.getCurentPageNo()-1)*page.getPageSize();
		int end=page.getPageSize();
		System.out.println("================begin="+begin);
		System.out.println("================end="+end);
		return empMapper.queryPage(begin, end);
	}

	@Override
	public List<Emp> queryEmpByName(String name) {
		
		return empMapper.queryEmpByName(name);
	}

	@Override
	public int judgeUnameIdHave(String uname) {
		int row;
		try {
			row = empMapper.judetUnameIsHave(uname);
			if(row>0) {
				return row;
			}
		}catch(Exception e){
			row =0;
		}
		
		
		return 0;
	}

	@Override
	public int insertEmp(Emp emp) {
		
		return empMapper.insert(emp);
	}

	@Override
	public int deleteEmp(Integer id) {
		int row;
		try {
			row = empMapper.deleteByPrimaryKey(id);
		} catch (Exception e) {
			row = 0;
		}
		
		return row;
	}

	@Override
	public Emp selectEmpById(Integer id) {
		Emp emp = empMapper.selectByPrimaryKey(id);
		return emp;
	}

}
