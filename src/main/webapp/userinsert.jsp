<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人资料--小众洗浴管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/user.css" media="all" />
<script src="layer/layer.js"></script>
<script type="text/javascript">
	function checkUname() {

		
		var uname = $("#uname").val();
		//采用Ajax方式进行访问服务器
		$.ajax({
			type : "get",
			data : {
				"uname" : uname,
				"oper" : "checkAjax"
			},
			url : "../../ssm01/emp/judgeName",
			dataType:"json",
			dataType : "json",
			async : true,
			success : function(data) {
				var flag = data.isCheck;
				if (flag == "1") {
					$("#msg").html("用户已经存在,不能添加");
				} else {
					$("#msg").html("用户不存在,可以添加");
				}
			}
		});
	}

	function addAjax() {

		
		var userId = $("#userId").val();
		var userName = $("#userName").val();
		var userRealname = $("#userRealname").val();
		var userPwd = $("#userPwd").val();
		var userSex = $("#userSex").val();
		var phonenumber = $("#phonenumber").val();
		var born = $("#born").val();
		var userEmail = $("#userEmail").val();
		/* var dept_id = $("#dept_id").val(); */
		var hobby2 = document.getElementsByName("like1");
		var hobby3 = [];
		
		$('input[type=checkbox]:checked').each(function() {
		      hobby3.push($(this).val());
		    });
	    
			
	   hobby3 = hobby3.join(" ");
	   var hobby4 = hobby3.toString();
	    console.log(hobby3);
	   // var hobby = $("#hobby").val(hobby3);
	    //JSON.stringify(hobby3);
		/* for (k in hobby2) {
			if (hobby2[k].checked) {
				hobby3.push(hobby2[k].value);
			}
		} */
		var headpic = $("#headpic").val();

		var province = $('#province option:selected').text();
		var city = $('#city option:selected').text();
		var area = $('#area option:selected').text();
		
		$.ajax({
			type : "get",
			data : {
				"userId" : userId,
				"userName" : userName,
				"userRealname" : userRealname,
				"userPwd" : userPwd,
				"userSex" : userSex,
				"phonenumber" : phonenumber,
				"born" : born,
				"userEmail" : userEmail,
				/* "dept_id" : dept_id, */
				"hobby" : hobby4,
				"headpic" : headpic,

				"province" : province,
				"city" : city,
				"area" : area,
				"oper" : "add"
			},
			
			url : "../../ssm01/emp/addEmp",
			dataType : "json",
			async : true,
			
			success : function(data) {
				
				if (data.status == "1") {
					layer.msg("添加成功");
					//进入首页
					 /* window.location.reload(); */
					 location.href = "userlist.jsp"; 
				} else {
					layer.msg("添加失败");
				}
			}
		});
	}
</script>
</head>
<body class="childrenBody">
	<form action="EmpServlet.do" role="form" method="post"
		class="layui-form">
		<input type=hidden name="oper" value="add" />
		<div class="user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input onblur="checkUname()" name="userName" id="userName" type="text"
						value="" placeholder="请输入用户名" lay-verify="required"
						class="layui-input">
					<div id=msg></div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">真实姓名</label>
				<div class="layui-input-block">
					<input name="userRealname" id="userRealname" type="text" value=""
						placeholder="请输入真实姓名" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input name="userPwd" id="userPwd" type="text" value="" placeholder="请输入密码"
						lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" pane="">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input name="userSex" id="userSex" type="radio" name="sex" value="男"
						title="男" checked=""> <input name="userSex" id="userSex"
						type="radio" name="sex" value="女" title="女">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号码</label>
				<div class="layui-input-block">
					<input name="phonenumber" id="phonenumber" type="tel" value=""
						placeholder="请输入手机号码" lay-verify="required|phone"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">出生年月</label>
				<div class="layui-input-block">
					<input name="born" id="born" type="text" value=""
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
				<label class="layui-form-label">邮箱</label>
				<div class="layui-input-block">
					<input name="userEmail" id="userEmail" type="text" value=""
						placeholder="请输入邮箱" lay-verify="required|email"
						class="layui-input">
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
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">部门id</label>
				<div class="layui-input-block">
					<input name="dept_id" id="dept_id" type="text" value=""
						placeholder="请输入部门id" lay-verify="required" class="layui-input">
					<select name="dept_id" id="dept_id" lay-verify="required" >
						 <option value="1">1</option>
						 <option value="2">2</option>
						 <option value="3">3</option>
					</select>
				</div>
			</div> -->
		</div>
		<!-- <div class="user_right">
			<input name="headpic" id="headpic" type="file" name="dddd"
				class="layui-upload-file" lay-title="换个头像"> <img src=""
				class="layui-circle" id="userFace">
		</div> -->

		<div class="layui-form-item" style="margin-left: 5%;">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" onclick="addAjax();">提交</button>
				<!-- <button type="submit" class="layui-btn">提交</button> -->
				<!-- <button class="layui-btn" lay-submit="" lay-filter="changeUser">立即提交</button> -->
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
	<script type="text/javascript" src="js/user.js"></script>
</body>
</html>