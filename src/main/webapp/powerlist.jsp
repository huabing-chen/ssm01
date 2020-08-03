<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户总数--小众洗浴管理系统</title>
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
<script type="text/javascript">
	       function changePower(){
	    	   //location.href='deptinsert.jsp';
				location.href="PowerServlet.do?oper=change"
	       }
	       
	       function updateUser(id){
	    	   //alert(id);
	    	   location.href='PowerServlet.do?oper=update1&id='+id;
	    	   //location.href='studentupdate.jsp';
	    	   
	       }
	       function searchAjax(){
	    	    //alert(123);
	    	    var searchKey=$("#searchKey").val();
	    	    //alert(searchKey);
				$.ajax({
					type:"post",
					data:{"searchKey":searchKey,"oper":"searchAjax"},
					url:"PowerServlet.do",
					dataType:"json",
					async:true,
					success:function(data){
						//列表展示
						var dlist=data;
						//拼接HTML
						var cont="";
						for(var i=0;i<dlist.length;i++){
							var s=dlist[i];
							
							cont+="<tr>";
							cont+="<td>";
							cont+=s.user_id ;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.user_realname;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.role_name;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.power_name;
							cont+="</td>";
							
														
							cont+="<td>";
							cont+="<button onclick=\"updateUser(${s.user_id })\"  class=\"layui-btn layui-btn-xs\">修改</button>";
							cont+="</td>";
							cont+="</tr>";
						}
						$("#dlist").html(cont);
						
					}
				});
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
			<a onclick="changePower()"
				class="layui-btn layui-btn-normal">权限修改</a>
		</div>
	</blockquote>
	<div class="layui-form news_list">
		<table class="layui-table">
		    <colgroup>
				<col width="5%">
				<col width="10%">
				<col width="10%">
				<col width="50%">
				<col width="18%">
		    </colgroup>
			<thead>
				<tr>
					<th>id</th>
					<th>名字</th>
					<th>职位 </th>
					<th>权限 </th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id=dlist class="users_content">
				<c:forEach items="${plist}" var="s">
					<tr>
						<td>${s.user_id} </td>
						<td>${s.user_realname }</td>
						<td>${s.role_name }</td>
						<td>${s.power_name }</td>
						<td>
							<button onclick="updateUser(${s.user_id })"
								class="layui-btn layui-btn-xs">修改职位</button>
                         </td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/allUsers.js"></script>
</body>
</html>