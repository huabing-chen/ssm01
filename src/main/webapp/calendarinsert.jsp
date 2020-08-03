<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.qtu.entity.BuyWater" %>
<%-- <%
	int user_id = (Integer) session.getAttribute("loginUser_id");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加拉水--小众洗浴管理系统</title>
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
</head>
<script type="text/javascript">
	function provingId() {
		var watermg = $("#watermg").val();
		var buytime = $("#buytime").val();
		var waterprice = $("#waterprice").val();
	/* 	var remind = $("#remind").val();
		var content = $("#content").val();
		var user_id = $("#user_id").val(); */
		<%-- if(<%=user_id%>!=user_id){
			layer.msg("您的id不正确不可以添加事件");
		} else { --%>
			/* layer.msg("您的id正确可以添加事件"); */
			$.ajax({
				type : "get",
				data : {
					"watermg" : watermg,
					"buytime" : buytime,
					"waterprice" : waterprice
					
					
				},
				url : "../../ssm01/buywater/buywaterAdd",
				dataType : "json",
				async : true,
				success : function(data) {
					if (data.status == "1") {
						layer.msg("添加成功");
						//进入首页
						location.href = "calendarlist.jsp";
					} else {
						layer.msg("添加失败");
					}
				}
			});
		

	}
</script>
<body class="childrenBody">
	<form action="" role="form" method="post"
		class="layui-form">
		<input type=hidden name="oper" value="add" />
		<div class="user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">拉水重量</label>
				<div class="layui-input-block">
					<input name="watermg" id="watermg" type="text" value=""
						placeholder="请输入拉水重量" lay-verify="required" class="layui-input">
				</div>
			</div>
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">开始时间</label>
				<div class="layui-input-block">
					<input name="start" id="start" type="text" value=""
						placeholder="请输入日程开始时间" lay-verify="required|date"
						onclick="layui.laydate({elem: this})" class="layui-input">
				</div>
			</div> -->
			<div class="layui-form-item">
				<label class="layui-form-label">拉水时间</label>
				<div class="layui-input-block">
					<input name="buytime" id="buytime" type="text" value="" placeholder="请输入拉水时间"
						lay-verify="required|date"
						onclick="layui.laydate({elem: this})" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">拉水价格</label>
				<div class="layui-input-block">
					<input name="waterprice" id="waterprice" type="tel" value=""
						placeholder="请输入拉水价钱" lay-verify="required|phone"
						class="layui-input">
				</div>
			</div>
			<%-- <div class="layui-form-item">
				<label class="layui-form-label">内容</label>
				<div class="layui-input-block">
					<input name="content" id="content" type="tel"
						value="${calendar.calendar_content }" placeholder="请输入提醒内容"
						lay-verify="required|phone" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户id</label>
				<div class="layui-input-block">
					<input name="user_id" id="user_id" type="text" value="${loginUser_id }" disabled
						placeholder="请输入您的id" lay-verify="required" class="layui-input">
				</div>
			</div> --%>
		</div>

		<div class="layui-form-item" style="margin-left: 5%;">
			<div class="layui-input-block">
			    <button onclick="provingId()" type="button" class="layui-btn">提交</button>
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