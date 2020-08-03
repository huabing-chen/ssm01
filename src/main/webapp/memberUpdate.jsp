<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.qtu.entity.Member"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>会员资料--小众洗浴管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/user.css" media="all" />
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">


	$(function(){
		
		
		var userIdEidt = localStorage.getItem("memberId");
		/* alert(userIdEidt); */
		localStorage.setItem("memberId","0");
		$.ajax({
			type:"GET",
	    	   url:"../../ssm01/member/updateMember",
	    	   dataType:"json",
				async:true,
				data : {"memberId":userIdEidt},
				success:function(data){
					var member = data.list;
				     
				}
			});
		
	})
	
	function updateAjax() {
		var id = $("#id").val();
		var memno = $("#memno").val();
		var memname = $("#memname").val();
		var memmoney = $("#memmoney").val();
		var memtel = $("#memtel").val();
		
		//采用Ajax方式进行访问服务器
		$.ajax({
			type : "get",
			data : {
				"id":id,
				"memno" : memno,
				"memname" : memname,
				"memmoney" : memmoney,
				"memtel" : memtel,
				
			},
			url : "../../ssm01/member/memberUpdateTiJiao",
			dataType : "json",
			async : true,
			success : function(data) {
				if (data.status == "1") {
					layer.msg("修改成功");
					alert("修改成功")
					//进入首页
					location.href = "addressbook.jsp";
				} else {
					layer.msg("修改失败");
				}
			}
		});
	}
</script>
</head>
<body class="childrenBody">
	<form action="" role="form" method="post"
		class="layui-form">
		<input type=hidden name="oper" value="add" />
		<input name="id" id="id" type=hidden value="${member.id }">
		<div class="user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">会员号</label>
				<div class="layui-input-block">
					<input name="memno" id="memno" type="text" value="${member.memno }"
					disabled	placeholder="请输入用户名" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">会员姓名</label>
				<div class="layui-input-block">
					<input name="memname" id="memname" type="text" value="${member.memname }"
						placeholder="请输入真实姓名" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">会员余额</label>
				<div class="layui-input-block">
					<input name="memmoney" id="memmoney" type="text" value="${member.memmoney }" placeholder="请输入密码"
						lay-verify="required" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">手机号码</label>
				<div class="layui-input-block">
					<input name="memtel" id="memtel" type="tel" value="${member.memtel }"
						placeholder="" lay-verify="required|phone"
						class="layui-input">
				</div>
			</div>
			
			<%-- <div class="layui-form-item">
				<label class="layui-form-label">部门id</label>
				<div class="layui-input-block">
					<input name="dept_id" id="dept_id" type="text" value="${user.dept_id }"
						placeholder="请输入部门id" lay-verify="required" class="layui-input">
					<select name="dept_id" id="dept_id" lay-verify="required" >
						 <option value="1" <c:if test="${user.dept_id eq '1' }">selected</c:if>>1</option>
						 <option value="2" <c:if test="${user.dept_id eq '2' }">selected</c:if>>2</option>
						 <option value="3" <c:if test="${user.dept_id eq '3' }">selected</c:if>>3</option>
					</select>
				</div>
			</div> --%>
		</div>
		
		<%-- <div class="user_right">
			<input name="selfassessment" id="selfassessment" type=hidden
				value="${user.selfassessment }" class="" lay-title=""> 
		</div>
		<div class="user_right">
			<input name="headpic" id="headpic" type=hidden
				value="${user.headpic }" class="" lay-title=""> 
		</div>
 --%>
		<div class="layui-form-item" style="margin-left: 5%;">
			<div class="layui-input-block">
				<button onclick="updateAjax()" type="button"
								class="layui-btn">提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
	<script type="text/javascript" src="js/user.js"></script>
</body>
</html>