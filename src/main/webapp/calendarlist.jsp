<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.qtu.entity.BuyWater" %>
<%-- <%
	int user_id = (Integer) session.getAttribute("loginUser_id");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>拉水管理--小众洗浴管理系统</title>
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
<script src="layer/layer.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	        function addcalendar(){
	    	   location.href='calendarinsert.jsp';
	       }
		    $(function(){
			    
				$.ajax({
					type:"get",
					url:"../../ssm01/buywater/listAll",
					dataType:"json",
					async:true,
					success:function(data){
						//列表展示
						var ulist=data.list;
						var msg=data.msg;
						//拼接HTML
						var cont="";
						for(var i=0;i<ulist.length;i++){
							var s=ulist[i];
							
							cont+="<tr>";
							cont+="<td>";
							cont+=s.id ;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.watermg;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.waterprice;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.buytime;
							cont+="</td>";
							
							
							
							cont+="</tr>";
						}
						$("#ulist").html(cont);
						
					}
					
					})
			    })
	         
	        function searchAjax(){
	    	    var searchKeyStart=$("#searchKeyStart").val();
	    	    var searchKeyEnd=$("#searchKeyEnd").val();
	    	    alert(searchKeyEnd);
				$.ajax({
					type:"get",
					data:{"searchKeyStart":searchKeyStart,"searchKeyEnd":searchKeyEnd},
					url:"../../ssm01/buywater/selectList",
					dataType:"json",
					async:true,
					success:function(data){
						//列表展示
						var ulist=data.list;
						var msg=data.msg;
						//拼接HTML
						var cont="";
						for(var i=0;i<ulist.length;i++){
							var s=ulist[i];
							
							cont+="<tr>";
							cont+="<td>";
							cont+=s.id ;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.watermg;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.waterprice;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.buytime;
							cont+="</td>";
							
							
							
							cont+="</tr>";
						}
						$("#ulist").html(cont);
						
					}
				});
			}  
</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
			 <div class="layui-input-inline">
				<input id="searchKeyStart" name="searchKeyStart"
					placeholder="xxxx-xx-xx" class="layui-input search_input" type="text" />
				 
			</div>
			 <div class="layui-input-inline">
				<input id="searchKeyEnd" name="searchKeyEnd"
				placeholder="xxxx-xx-xx"	class="layui-input search_input" type="text" />
			</div>
			
			<a onclick="searchAjax()" class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a onclick="addcalendar()"
				class="layui-btn layui-btn-normal calendarsAdd_btn">添加</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
		<table class="layui-table">
		    <colgroup>
				<col width="5%">
				<col width="15%">
				<col width="10%">
				<col width="10%">
				
		    </colgroup>
			<thead>
				<tr>
					<th>id</th>
					<th>拉水重量</th>
					<th>价格</th>
					<th>拉水时间</th>
					
				</tr>
			</thead>
			<tbody id=ulist class="calendars_content">
				<c:forEach items="${ulist }" var="s">
				   <c:set var="User_id" scope="session" value="${loginUser_id }"/>
				   <c:if test="${s.user_id==User_id }">
					<tr>
						<td>${s.calendar_id }</td>
						<td>${s.calendar_title }</td>
						<td>${s.calendar_starttime }</td>
						<td>${s.calendar_endtime }</td>
						
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