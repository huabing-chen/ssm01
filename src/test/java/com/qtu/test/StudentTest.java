package com.qtu.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qtu.entity.Emp;
import com.qtu.mapper.EmpMapper;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class StudentTest {

	/*
	 * @Resource private StudentService studentService;
	 * 
	 * @Resource private TeacherService teacherService;
	 * 
	 * @Test public void test1() { Student ss =
	 * studentService.selectByPrimaryKey(1); System.out.println(ss); }
	 * 
	 * @Test public void test2() { List<Teacher> list = teacherService.list();
	 * for(Teacher t:list) { System.out.println(t.getName()); } }
	 */
	
	@Resource
	private EmpMapper empMapper;
	
	@Test
	public void test1() {
		Emp emp = empMapper.selectByNameAndPwd("admin", "123456");
		System.out.println(emp.getPhonenumber());
	}
	
	@Test
	public void test2() {
	
	}
}








