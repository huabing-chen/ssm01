<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.qtu.entity.Room" %>
<%-- <%
	int user_id = (Integer) session.getAttribute("loginUser_id");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加单间--小众洗浴管理系统</title>
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
	function provingId() {
		var roomnum = $("#roomnum").val();
		var roomprice = $("#roomprice").val();
		/* var priority = $('input[type=radio][id=priority]:checked').val(); */
		var result = $('input[type=radio][id=result]:checked').val();
		var roomtype = $("#roomtype").val();
		/* var user_id = $("#user_id").val(); */
		<%-- if(<%=user_id%>!=user_id){
			layer.msg("您的id不正确不可以添加日程");
		} else {
			layer.msg("您的id正确可以添加日程"); --%>
			$.ajax({
				type : "get",
				data : {
					"roomnum" : roomnum,
					"roomprice" : roomprice,
					
					"roomtype" : roomtype
					
					
				},
				url : "../../ssm01/room/roomAdd",
				dataType : "json",
				async : true,
				success : function(data) {
					if (data.status == "1") {
						layer.msg("添加成功");
						//进入首页
						location.href = "roomlist.jsp";
					} else {
						layer.msg("添加失败");
					}
				}
			});
		

	}
</script>
</head>
<body class="childrenBody">
	<form action=" " role="form" method=""
		class="layui-form">
		<input type=hidden name="oper" value="add" />
		<div class="user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">房间号</label>
				<div class="layui-input-block">
					<input name="roomnum" id="roomnum" type="text" value=""
						placeholder="请输入房间号" lay-verify="required" class="layui-input">
				</div>
			</div>
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">创建日期</label>
				<div class="layui-input-block">
					<input name="time" id="time" type="text" value=""
						placeholder="请输入事件到期日" lay-verify="required|date"
						onclick="layui.laydate({elem: this,max: '2099-06-16 23:59:59'})" class="layui-input">
				</div>
			</div> -->
			<div class="layui-form-item">
				<label class="layui-form-label">单间价格</label>
				<div class="layui-input-block">
					<input name="roomprice" id="roomprice" type="text" value=""
						placeholder="请输入价格" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">单间类型</label>
				<div class="layui-input-block">
					<input name="roomtype" id="roomtype" type="text" value=""
						placeholder="请输入房间类型" lay-verify="required" class="layui-input">
				</div>
			</div>
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">优先级</label>
				<div class="layui-input-block">
					<input name="priority" id="priority" type="text" value="" placeholder="请输入事件优先级"
						lay-verify="required" class="layui-input">
					<input type="radio" name="priority" id="priority" value="低" title="低" checked>
					<input type="radio" name="priority" id="priority" value="中" title="中">
					<input type="radio" name="priority" id="priority" value="高" title="高">	
				</div>
			</div> -->
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">是否完成</label>
				<div class="layui-input-block">
					<input name="result" id="result" type="tel" value=""
						placeholder="事情是否完成" lay-verify="required|phone"
						class="layui-input">
					<input type="radio" name="result" id="result" value="未使用" title="未使用" checked>
					<input type="radio" name="result" id="result" value="使用" title="使用">
				</div>
			</div> -->
			<%-- <div class="layui-form-item">
				<label class="layui-form-label">对象id</label>
				<div class="layui-input-block">
					<input name="user_id" id="user_id" type="text" value="${loginUser_id }" disabled
						placeholder="请输入用户id" lay-verify="required" class="layui-input">
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