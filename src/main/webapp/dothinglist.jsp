<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.qtu.entity.ToDoList" %>
<%-- <%
	int user_id = (Integer) session.getAttribute("loginUser_id");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>待办事宜--小众洗浴管理系统</title>
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
<script src="layer/layer.js"></script>
<script type="text/javascript">
	       function addDothing(){
	    	   location.href='dothinginsert.jsp';
	       }

	       function arrangeDothing(){
		       
	    	   location.href='DothingServlet.do?powercode=user_arrangedothing&oper=arrange';
	       }
	       


	       function deleteDothing(id){
	    	   
	    	   if(confirm("确定要删除吗")){
	    		  /*  location.href='DothingServlet.do?oper=delete&id='+id;   */
	    	   }
	       }
	       
	       function updateDothing(id){
		      // alert("nihao1");
	    	   //console.log(id);
	    	   //alert(id);
	    	   localStorage.setItem("todolistId", id);
	    	   location.href='dothingupdate.jsp';
	    	   //location.href='studentupdate.jsp';
	    	   
	       }
	       $(function(){
		       $.ajax({
			       type:"get",
			       url:"../../ssm01/todolist/selectAll",
			       dataType:"json",
			       async:true,
			       success:function(data){
						//列表展示
						var ulist=data.list;
						var msg=data.msg;
						//拼接HTML
						var cont="";
						 var btn=document.getElementsByTagName('button'); 
						for(var i=0;i<ulist.length;i++){
							
								var s=ulist[i];
								
								var shu=s.id;
								 console.log(shu);
								 
								/* alert(shu); */
								cont+="<tr>";
								cont+="<td>";
								cont+=s.id ;
								
								cont+="</td>";
								
								cont+="<td>";
								cont+=s.subject;
								cont+="</td>";
								
								cont+="<td>";
								cont+=s.time;
								cont+="</td>";
								
								cont+="<td>";
								cont+=s.faqipeople;
								cont+="</td>";
								
								cont+="<td>";
								cont+=s.themestate;
								cont+="</td>";
					
								cont+="<td>";
	       						cont+="<button onclick=\"updateDothing("+shu+")\"   class=\"layui-btn layui-btn-xs\">修改</button>";
	       													

								cont+="<button onclick=\"deleteDothing("+shu+")\" class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
								cont+="</td>";
								cont+="</tr>"; 
								$("#ulist").html(cont);
								/* alert(s.id); */	
					
						}
						/* $("#ulist").html(cont); */
						
					}
			       })
		       })
	     
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
			<a onclick="addDothing()"
				class="layui-btn layui-btn-normal DothingsAdd_btn">添加事宜</a>
		</div>
		<!-- <div class="layui-inline">
			<a onclick="arrangeDothing()" class="layui-btn layui-btn-warm">安排事情</a>
		</div> -->
	</blockquote>
	<div class="layui-form news_list">
		<table class="layui-table">
			<thead>
				<tr>
					<th>id</th>
					<th>事宜描述</th>
					<th>创建日期</th>
					<th>创建人</th>
					<th>是否完成</th>
					<!-- <th>分配对象id</th> -->
					<th>操作</th>
				</tr>
			</thead>
			<tbody id=ulist class="Dothings_content">
				<c:forEach items="${ulist }" var="s">
					<c:set var="User_id" scope="session" value="${loginUser_id }" />
					<c:if test="${s.id }">
						<tr>
							<td>${s.id }</td>
							<td>${s.subject }</td>
							<td>${s.time }</td>
							<td>${s.faqipeople }</td>
							<td>${s.themestate }</td>
							<%-- <td>${s.user_id }</td> --%>
							 <td>
								<%-- <button onclick="updateDothing(${s.id})"
									class="layui-btn layui-btn-xs">修改</button></td> --%>
								<%--<button onclick="deleteDothing(${s.id })"
									class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
							</td> --%>
						</tr>
					</c:if>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/allUsers.js"></script>
</body>
</html>