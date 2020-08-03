<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.qtu.entity.Emp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人资料</title>
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
<script type="text/javascript">
	$(function(){
		var address = []
		<%if ((String[]) session.getAttribute("loginUser_address") != null) {
			String[] str = (String[]) session.getAttribute("loginUser_address");
		for(String key :str){
		%>
		address.push("<%=key%>");
		<%
		}}
	    %>
	    $("#province").append("<option value='"+address[0]+"'selected >"+address[0]+"</option>");
	    $("#city").append("<option value='"+address[1]+"'selected >"+address[1]+"</option>").removeAttr("disabled");
	    $("#area").append("<option value='"+address[2]+"'selected >"+address[2]+"</option>").removeAttr("disabled");
		
		var hobby2 = document.getElementsByName("like1");
		var hobby3 = [];	    
			<%if ((String[]) session.getAttribute("loginUser_hobby") != null) {
				String[] str = (String[]) session.getAttribute("loginUser_hobby");
				for (String key : str) {%>
			hobby3.push("<%=key%>");
<%}
			}%>
	for (var i = 0; i < hobby3.length; i++) {
			for (var j = 0; j < hobby2.length; j++) {
				if (hobby2[j].value == hobby3[i]) {
					hobby[j].checked = true;
				}
			}
		}

	});
	function userinfo() {
		var userId = $("#userId").val();
		var userName = $("#userName").val();
		var userRealname = $("#userRealname").val();
		var userSex = $('input[type=radio][id=userSex]:checked').val();
		var phonenumber = $("#phonenumber").val();
		var userBorn = $("#userBorn").val();
		var province=$('#province option:selected').text();
		var city=$('#city option:selected').text();
		var area=$('#area option:selected').text();
		var hobby2 = document.getElementsByName("like1");
		console.log(hobby2)
		var hobby3 = [];
		for (k in hobby2) {
			if (hobby2[k].checked) {
				hobby3.push(hobby2[k].value);
			}
		}
		var userEmail = $("#userEmail").val();
		var selfassessment = $("#selfassessment").val();
		var headpic = $("#headpic").val()
		
		//采用Ajax方式进行访问服务器
		$.ajax({
			type : "get",
			data : {
				 "userId" : userId,
				"userName" : userName,
				"userRealname" : userRealname,
				"userSex" : userSex,
				"phonenumber" : phonenumber,
				"userBorn2" : userBorn,  
				"province" : province,
				"city" : city,
				"area" : area,
				"hobby" : hobby3,
				 "userEmail" : userEmail,
				"selfassessment" : selfassessment,
				"headpic" : headpic,
				"oper" : "userinfo" 
			},
			url : "../../ssm01/emp/userinfo",
			dataType : "json",
			traditional : true,
			async : true,
			success : function(data) {
				if (data.status == "1") {
					layer.msg("修改成功");
 					alert("修改成功");
					/* location.href = "UserServlet.do?"; */
					/* location.href = "userInfo.jsp"; */
					location.href = "index.jsp";
				} else {
					layer.msg("修改失败");
				}
			}
		});
	}

	function uploadFunction() {
		var formData = new FormData();
		formData.append('file', $('#file')[0].files[0]);
		$.ajax({
			url : 'UploadServlet.do',
			type : 'POST',
			cache : false,
			data : formData,
			dataType : "json",
			processData : false,
			contentType : false
		}).done(function(res) {
			console.log(res);
			if (res.status == "1") {
				$("#headpic").attr("value", res.fpath);
				$("#pic").attr("src", "images/" + res.fpath);
			}
		});
	}
</script>
</head>
<body class="childrenBody">
	<form action="" role="form" method="post"
		class="layui-form">
		<input name="userId" id="userId" type=hidden value="${loginUser_id }">
		<div class="user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input name="userName" id="userName" type="text"
						value="${loginUser_name }" disabled
						class="layui-input layui-disabled">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-block">
					<input name="userRealname" id="userRealname" type="text"
						value="${loginUser }" placeholder="请输入真实姓名" lay-verify="required"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input name="userSex" id="userSex" type="radio" name="userSex" value="男"
						title="男" <c:if test="${loginUser_sex eq '男' }">checked</c:if>>
					<input name="userSex" id="userSex" type="radio" name="userSex" value="女"
						title="女" <c:if test="${loginUser_sex eq '女' }">checked</c:if>>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号码</label>
				<div class="layui-input-block">
					<input name="phonenumber" id="phonenumber" type="tel"
						value="${loginPhonenumber }" placeholder="请输入手机号码"
						lay-verify="required|phone" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">出生年月</label>
				<div class="layui-input-block">
					<input name="userBorn" id="userBorn" type="text" value="${loginUser_born }"
						placeholder="请输入出生年月" lay-verify="required|date"
						onclick="layui.laydate({elem: this,max: laydate.now()})"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">家庭住址</label>
				<div class="layui-input-inline">
					<select name="province" id="province" lay-filter="province">
						<option value="">请选择省</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="city" id="city" lay-filter="city" disabled>
						<option value="">请选择市</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select name="area" id="area" lay-filter="area" disabled>
						<option value="">请选择县/区</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">特长</label>
				<div class="layui-input-block">
					<input id="hobby" type="checkbox" name="like1" title="拔罐" value="拔罐"> 
					<input id="hobby" type="checkbox" name="like1" title="刮痧" value="刮痧">
					<input id="hobby" type="checkbox" name="like1" title="按摩" value="按摩">
					<input id="hobby" type="checkbox" name="like1" title="修脚" value="修脚">
					<input id="hobby" type="checkbox" name="like1" title="采耳" value="采耳">
					<input id="hobby" type="checkbox" name="like1" title="脚底按摩" value="脚底按摩">
					<input id="hobby" type="checkbox" name="like1" title="搓澡" value="搓澡">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input name="userEmail" id="userEmail" type="text"
						value="${loginUser_email }" placeholder="请输入邮箱"
						lay-verify="required|email" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">自我评价</label>
				<div class="layui-input-block">
					<textarea name="selfassessment" id="selfassessment"
						value="${loginSelfassessment }" placeholder="请输入内容"
						class="layui-textarea">${loginSelfassessment }</textarea>
				</div>
			</div>
		</div>

		<%-- <div class="user_right">
			<input type="file" id="file" name="file" title="选择头像">
			<button type="button" onclick="uploadFunction()">上传</button>
			<img id="pic" src="images/${loginHeadpic }" width="100" height="100">
			<input name="headpic" id="headpic" type=hidden
				value="${loginHeadpic }">
		</div> --%>

		<div class="layui-form-item" style="margin-left: 5%;">
			<div class="layui-input-block">
				<button onclick="userinfo()" type="button" class="layui-btn">提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
	<script type="text/javascript" src="js/user.js"></script>
	<script src="layer/layer.js"></script>
</body>
</html>