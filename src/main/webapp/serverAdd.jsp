<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加技师服务--小众洗浴管理系统</title>
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
	
	function addAjax() {

		
		
		var serno= $("#serno").val();
		
		var sername = $("#sername").val();
		var serprice = $("#serprice").val();
		
		
		
		$.ajax({
			type : "get",
			data : {
				
				"serno" : serno,
				
				"sername" : sername,
				"serprice" : serprice,
				/* "memmoney" : userEmail,
				 "dept_id" : dept_id, 
				
				"headpic" : headpic, */

				
			},
			
			url : "../../ssm01/server/addServer",
			dataType : "json",
			async : true,
			
			success : function(data) {
				
				if (data.status == "1") {
					layer.msg("添加成功");
					//进入首页
					 /* window.location.reload(); */
					 location.href = "serverlist.jsp"; 
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
				<label class="layui-form-label">服务编号</label>
				<div class="layui-input-block">
					<input onblur="checkUname()" name="serno" id="serno" type="text"
						value="" placeholder="请输入服务编号" lay-verify="required"
						class="layui-input">
					<div id=msg></div>
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">服务名</label>
				<div class="layui-input-block">
					<input name="sername" id="sername" type="text" value=""
						placeholder="请输入服务名" lay-verify="required"
						class="layui-input">
				</div>
			</div>
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">创建时间</label>
				<div class="layui-input-block">
					<input name="memtime" id="memtime" type="text" value=""
						placeholder="请输入创办时间" lay-verify="required|date"
						onclick="layui.laydate({elem: this,max: laydate.now()})"
						class="layui-input">
				</div>
			</div> -->
			
			<div class="layui-form-item">
				<label class="layui-form-label">价格</label>
				<div class="layui-input-block">
					<input name="serprice" id="serprice" type="text" value=""
						placeholder="请输入价格" lay-verify="required"
						class="layui-input">
				</div>
			</div>
			
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