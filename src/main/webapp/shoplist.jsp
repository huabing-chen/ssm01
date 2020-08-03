<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.qtu.util.PagingVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>商品管理--小众洗浴管理系统</title>
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
		
		$.ajax({
			type:"post",
			url:"../../ssm01/shop/listAll",
			dataType:"json",
			async:true,
			data:{
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
					cont += s.shopname;
					cont += "</td>";
					
					cont += "<td>";
					cont += s.shopprice;
					cont += "</td>";

					cont += "<td>";
					cont += s.shopsize;
					cont += "</td>";

					cont += "<td>";
					cont += s.shopnum;
					cont += "</td>";

					cont+="<td>";
					cont+="<button onclick=\"updateMember("+s.id+")\"  class=\"layui-btn layui-btn-xs\">修改</button>";
					cont+="<button onclick=\"deleteMember("+s.id+")\"  class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
					
					cont+="</td>";
					cont+="</tr>";

				}
				$("#ulist").html(cont);

			}
				
			});
		});
	function updateMember(id){
		 localStorage.setItem("shopId", id);
		 
		 window.location="shopUpdate.jsp";
		}
	function record(memno){
		localStorage.setItem("memno",memno);
		window.location="membercord.jsp";
		}
	function deleteMember(id){
		$.ajax({
			type:"post",
			data:{"shopId":id},
			url:"../../ssm01/shop/deleteShop",
			dataType:"json",
			async:true,
			success:function(data){
				if(data.status==1){
					alert("删除成功！");
					location.href ="shoplist.jsp";
					/* window.locaton="addressbook.jsp"; */
					}
				}
			})
		}
	function searchAjax() {
		var searchKey = $("#searchKey").val();
		$.ajax({
			type : "post",
			data : {
				"searchKey" : searchKey,
				"oper" : "searchAjax"
			},
			url : "../../ssm01/shop/searchKey",
			dataType : "json",
			async : true,
			success : function(data) {
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
					cont += s.shopname;
					cont += "</td>";
					
					cont += "<td>";
					cont += s.shopprice;
					cont += "</td>";

					cont += "<td>";
					cont += s.shopsize;
					cont += "</td>";

					cont += "<td>";
					cont += s.shopnum;
					cont += "</td>";

					cont+="<td>";
					cont+="<button onclick=\"updateMember("+s.id+")\"  class=\"layui-btn layui-btn-xs\">修改</button>";
					cont+="<button onclick=\"deleteMember("+s.id+" )\"  class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
					
					cont+="</td>";
					cont+="</tr>";

				 } 
				$("#ulist").html(cont);

			}
		});
	}
	function addMember(){
		 location.href="shopAdd.jsp";
		}
</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
			<div class="layui-input-inline">
				<input id="searchKey" name="searchKey"
					class="layui-input search_input" type="text" />
				<!--  <input type="text" id="searchKey" name="searchKey" value=""
					placeholder="请输入关键字" class="layui-input search_input"> -->
			</div>
			<a onclick="searchAjax()" class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a onclick="addMember()"
				class="layui-btn layui-btn-normal usersAdd_btn">添加商品</a>
		</div>
	</blockquote>
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
					<th>商品名字</th>
					<th>商品价格</th>
					<th>规格</th>
					<th>数量</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id=ulist class="users_content">
				<c:forEach items="${ulist }" var="s">
					<tr>
						<td>${s.id }</td>
						<td>${s.shopname }</td>
						<td>${s.shopprice }</td>
						<td>${s.shopsize }</td>
						<td>${s.shopnum }</td>
						<td>
							<button onclick="updateMember(${s.id })"
								class="layui-btn layui-btn-xs">修改</button>
							
							<button onclick="deleteMember(${s.id })"
								class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
						</td>
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