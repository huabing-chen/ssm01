<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.qtu.util.PagingVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>会员消费记录--小众洗浴管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/font_eolqem241z66flxr.css" media="all" />
<link rel="stylesheet" href="css/user.css" media="all" />
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var memno = localStorage.getItem("memno");
		/* alert(memno); */
		localStorage.setItem("memno","0");
		$.ajax({
			type:"get",
			url:"../../ssm01/membercord/listAll",
			dataType:"json",
			async:true,
			data:{
				"memno":memno
				},
			success : function(data){
			
				
				//列表展示
				var ulist = data.list;
				var msg = data.msg;
				//拼接HTML
				var cont = "";
				for (var i = 0; i < ulist.length; i++) {
					var s = ulist[i];

					cont += "<tr>";
					cont += "<td>";
					cont += s.id;
					cont += "</td>";

					
					cont += "<td>";
					cont += s.memno;
					cont += "</td>";
					
					cont += "<td>";
					cont += s.memname;
					cont += "</td>";

					cont += "<td>";
					cont += s.memshop;
					cont += "</td>";

					cont += "<td>";
					cont += s.recordprice;
					cont += "</td>";

					cont += "<td>";
					cont += s.recordtime;
					cont += "</td>";
					
					/* cont+="<td>";
					cont+="<button onclick=\"updateMember(6)\"  class=\"layui-btn layui-btn-xs\">修改</button>";
					cont+="<button onclick=\"record(${s.id})\"  class=\"layui-btn layui-btn-xs\">查看记录</button>";
					cont+="<button onclick=\"deleteMember(7)\"  class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
					
					cont+="</td>"; */
					cont+="</tr>";

				}
				$("#ulist").html(cont);

			}
				
			});
		});
	
	
	
</script>
</head>
<body class="childrenBody">
	
	<div class="layui-form news_list">
		<table class="layui-table">
			<colgroup>
				<col width="10%">
				<col width="17%">
				<col width="17%">
				<col width="17%">
				<col width="17%">
				<col width="28%">
			</colgroup>
			<thead>
				<tr>
					<th>id</th>
					<th>会员号</th>
					<th>姓名</th>
					<th>购买商品</th>
					<th>金额</th>
					<th>时间</th>
				</tr>
			</thead>
			<tbody id=ulist class="users_content">
				<c:forEach items="${ulist }" var="s">
					<tr>
						<td>${s.id }</td>
						<td>${s.memno }</td>
						<td>${s.memname }</td>
						<td>${s.memshop }</td>
						<td>${s.recordprice }</td>
						<td>${s.recordtime }</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="page" style="text-align: center;">
		<ul class="pagination">
			<%-- <li><a
				href="UserServlet.do?curentPageNo=${page.upPageNo }&pageSize=${page.pageSize }">上一页</a></li> --%>
			<%
				PagingVO pagevo = (PagingVO) request.getAttribute("page");
				for (int i = 0; pagevo != null && i < pagevo.getTotalCount(); i++) {
			%>
			<li><a href="UserServlet.do?curentPageNo=<%=i + 1%>&pageSize=5"><%=i + 1%></a>
			</li>
			<%
				}
			%>
			<%-- <li><a
				href="UserServlet.do?curentPageNo=${page.nextPageNo }&pageSize=${page.pageSize }">下一页</a>
			</li> --%>
		</ul>

	</div>

	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/allUsers.js"></script>
</body>
</html>