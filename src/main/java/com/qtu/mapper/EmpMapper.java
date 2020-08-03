package com.qtu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qtu.entity.Emp;

public interface EmpMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);
    
    //登录，根据用户名和密码
    Emp selectByNameAndPwd(@Param("username")String username,@Param("password")String password);
    //修改密码
    int changePwdById(@Param("password")String password,@Param("id") Integer id);
    /**
     *        查询数据库中总共有多少条记录
     * @return
     */
    int selectCount();
    /**
     	* 查询一页的记录
     * @param startPage
     * @param endPage
     * @return
     */
    List<Emp> queryPage(@Param("startPage")Integer startPage,@Param("endPage")Integer endPage);
    //通过名字查询员工
    List<Emp> queryEmpByName(String name);
    
    int judetUnameIsHave(String uname);
}