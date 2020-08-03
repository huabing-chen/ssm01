<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改待办事宜--小众洗浴管理系统</title>
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
		 var id = localStorage.getItem("todolistId");
		 
		 $.ajax({
			 type:"get",
			 data:{"id":id},
			 url:"../../ssm01/todolist/selectDaiBan",
			 dataType : "json",
				async : true,
				success : function(data) {

					}
				
			 })
		 
		})
	function updateAjax() {
		var id = $("#id").val();
		var subject = $("#subject").val();
		var time = $("#time").val();
		/* var priority = $('input[type=radio][id=priority]:checked').val(); */
		var result = $('input[type=radio][id=result]:checked').val();
		/* var user_id = $("#user_id").val(); */
		//采用Ajax方式进行访问服务器
		$.ajax({
			type : "get",
			data : {
				"id" : id,
				"subject" : subject,
				"time" : time,
				
				"result" : result
				
			},
			url : "../../ssm01/todolist/todolistupdate",
			dataType : "json",
			async : true,
			success : function(data) {
				if (data.status == "1") {
					layer.msg("修改成功");
					//进入首页
					location.href = "dothinglist.jsp";
				} else {
					layer.msg("修改失败");
				}
			}
		});
	}
</script>
</head>
<body class="childrenBody">
	<form action="" role="form" method=""
		class="layui-form">
		<input type=hidden name="oper" value="add" />
		 <input name="id" id="id" type=hidden value="${dothing.id }">
		<div class="user_left">
			<div class="layui-form-item">
				<label class="layui-form-label">事宜描述</label>
				<div class="layui-input-block">
					<input name="subject" id="subject" type="text" value="${dothing.subject }"
						placeholder="请输入代办事宜" lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">创建时间</label>
				<div class="layui-input-block">
					<input name="time" id="time" type="text" value="${dothing.time }"
						placeholder="请输入事件到期日" lay-verify="required|date"
						onclick="layui.laydate({elem: this,max: '2099-06-16 23:59:59'})" class="layui-input">
				</div>
			</div>
			<%-- <div class="layui-form-item">
				<label class="layui-form-label">优先级</label>
				<div class="layui-input-block">
					<input name="priority" id="priority" type="text" value="${dothing.dothing_priority }"
						placeholder="请输入事件优先级" lay-verify="required" class="layui-input">
						<input type="radio" name="priority" id="priority" value="低" title="低" <c:if test="${dothing.dothing_priority eq '低' }">checked</c:if>>
					<input type="radio" name="priority" id="priority" value="中" title="中" <c:if test="${dothing.dothing_priority eq '中' }">checked</c:if>>
					<input type="radio" name="priority" id="priority" value="高" title="高" <c:if test="${dothing.dothing_priority eq '高' }">checked</c:if>>	
				</div>
			</div> --%>
			<div class="layui-form-item">
				<label class="layui-form-label">是否完成</label>
				<div class="layui-input-block">
					<%-- <input name="result" id="result" type="tel" value="${dothing.dothing_result }" placeholder=""
						lay-verify="required|phone" class="layui-input"> --%>
					<input type="radio" name="result" id="result" value="未完成" title="未完成" <c:if test="${dothing.themestate eq '未完成' }">checked</c:if>>
					<input type="radio" name="result" id="result" value="完成" title="完成" <c:if test="${dothing.themestate eq '完成' }">checked</c:if>>
				</div>
			</div>
			<%-- <div class="layui-form-item">
				<label class="layui-form-label">分配对象id</label>
				<div class="layui-input-block">
					<input name="user_id" id="user_id" type="text" value="${dothing.user_id }" disabled
						placeholder="请输入用户id" lay-verify="required" class="layui-input">
				</div>
			</div> --%>
		</div>

		<div class="layui-form-item" style="margin-left: 5%;">
			<div class="layui-input-block">
				<button onclick="updateAjax()" type="button" class="layui-btn">提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
	<script type="text/javascript" src="js/user.js"></script>
</body>
</html>