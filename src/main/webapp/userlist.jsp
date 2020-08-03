<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ page import="com.qtu.util.*" %>
<%-- <%@ page isELIgnored="false" %> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户总数--小众洗浴管理模板</title>
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

function addUser(){
	   /* location.href='userinsert.jsp'; */
	   window.location="userinsert.jsp";
}
function deleteUser(userId){
	  console.log(userId);
	   if(confirm("确定要删除吗")){
		   $.ajax({
	    	   type:"GET",
	    	   data:{"userId":userId},
	    	   url:"../../ssm01/emp/deleteEmp",
	    	   dataType:"json",
				async:true,
				success:function(data){
					if(data.status==1){
						alert("删除成功")
						layer.msg("删除成功");
						location.href = "userlist.jsp"; 
						}
				}
	    	   })
		   /* location.href='EmpServlet.do?oper=delete&id='+id;  */ 
	   }
}
function updateUser(id){
	   /* console.log(id);
	   $.ajax({
    	   type:"GET",
    	   data:{"userId":id},
    	   url:"../../ssm01/emp/updateEmp",
    	   dataType:"json",
			async:true,
			success:function(data){
				
			}
    	   }) */
	   localStorage.setItem("userId", id);
	    location.href="userupdate.jsp";
	   //location.href='studentupdate.jsp';
	   
}

$(function(){
	$.ajax({
		type:"get",
		data:{"curentPageNo":1,"oper":"searchAjax"},
		url:"../../ssm01/emp/pageList",
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
				cont+=s.userId ;
				cont+="</td>";
				
				cont+="<td>";
				cont+=s.userName;
				cont+="</td>";
				
				cont+="<td>";
				cont+=s.userRealname;
				cont+="</td>";
				
				cont+="<td>";
				cont+=s.userSex;
				cont+="</td>";
				
				cont+="<td>";
				cont+=s.phonenumber;
				cont+="</td>";
				
				cont+="<td>";
				cont+=s.userBorn;
				cont+="</td>";
				
				cont+="<td>";
				cont+=s.userAddress;
				cont+="</td>";

				cont+="<td>";
				cont+=s.userHobby;
				cont+="</td>";
				
				cont+="<td>";
				cont+=s.userEmail;
				cont+="</td>";
				
				/* cont+="<td>";
				cont+=s.dept_name;
				cont+="</td>"; */
				
				cont+="<td>";
				cont+="<button onclick=\"updateUser("+s.userId+")\"  class=\"layui-btn layui-btn-xs\">修改</button>";
				cont+="<button onclick=\"deleteUser("+s.userId+" )\"  class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
				cont+="</td>";
				cont+="</tr>";
				
			}
			$("#ulist").html(cont);
			
		}
		});
})
 

			
	      
	       function searchAjax(){
	    	  
	    	    var searchKey=$("#searchKey").val();
	    		
				$.ajax({
					type:"post",
					data:{"searchKey":searchKey,"curentPageNo":1,"oper":"searchAjax"},
					url:"../../ssm01/emp/searchKey",
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
							cont+=s.userId ;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.userName;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.userRealname;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.userSex;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.phonenumber;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.userBorn;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.userAddress;
							cont+="</td>";

							cont+="<td>";
							cont+=s.userHobby;
							cont+="</td>";
							
							cont+="<td>";
							cont+=s.userEmail;
							cont+="</td>";
							
							/* cont+="<td>";
							cont+=s.dept_name;
							cont+="</td>"; */
							
							cont+="<td>";
							cont+="<button onclick=\"updateUser("+s.userId+")\"  class=\"layui-btn layui-btn-xs\">修改</button>";
							cont+="<button onclick=\"deleteUser("+s.userId+" )\" class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
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
				<input id="searchKey" name="searchKey"
					class="layui-input search_input" type="text" />
				<!--  <input type="text" id="searchKey" name="searchKey" value=""
					placeholder="请输入关键字" class="layui-input search_input"> -->
			</div>
			<a onclick="searchAjax()" class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a onclick="addUser()"
				class="layui-btn layui-btn-normal usersAdd_btn">添加员工</a>
		</div>
		
	</blockquote>
	<div class="layui-form news_list">
		<table class="layui-table">
			<colgroup>
				<col width="5%">
				<col width="9%">
				<col width="9%">
				<col width="6%">
				<col width="12%">
				<col width="12%">
				<col width="18%">
				<col width="15%">
				<%-- <col width="18%"> --%>
				<col width="10%">
				<col width="8%">
				<col width="18%">
			</colgroup>
			<thead>
				<tr>
					<th>id</th>
					<th>用户名</th>
					<th>真实姓名</th>		
					<th>性别</th>
					<th>电话号码</th>
					<th>出生日期</th>
					<th>地址</th>
					<th>特长</th>
					<th>邮箱</th>
					<!-- <th>头像</th> -->
					<!-- <th>部门</th> -->
					<th>操作</th>
				</tr>
			</thead>
			<tbody id=ulist class="users_content">
				<c:forEach items="${ulist }" var="s">
					 <tr>
						<td>${s.userId }</td>
						<td>${s.userName }</td>
						<td>${s.userRealname }</td>
						<td>${s.userPwd }</td>
						<td>${s.userSex }</td>
						<td>${s.phonenumber }</td>
						<td>${s.userBorn }</td>
						<td>${s.userAddress }</td>
						<td>${s.userEmail }</td>
						<%-- <td><img src="images/${s.headpic }" width="30" height="30" /></td>
						<td>${s.dept_name }</td> --%>
						<td>
							<button onclick="updateUser(${s.userId })"
								class="layui-btn layui-btn-xs">修改</button>
							<button onclick="deleteUser(${s.userId })"
								class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
						</td>
					</tr> 
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="page" style="text-align:center;">
		<ul class="pagination">
			<%-- <li><a href="../../ssm01/emp/pageList?curentPageNo=${page.upPageNo }&pageSize=${page.pageSize }">上一页</a></li> --%>
            <%
				PagingVO pagevo =(PagingVO)request.getAttribute("page");
				for (int i = 0; pagevo != null && i < pagevo.getTotalCount(); i++) {
			%>
			<li><a href="../../ssm01/emp/pageList?curentPageNo=<%=i + 1%>&pageSize=5"><%=i + 1%></a>
		
			</li>
			<%
				}
			%>
			<%-- <li><a href="../../ssm01/emp/pageList?curentPageNo=${page.nextPageNo }&pageSize=${page.pageSize }">下一页</a>
			</li> --%>
		</ul>

	</div> 

	<%-- <div id="demo0">
		<div class="layui-box layui-laypage layui-laypage-default"
			id="layui-laypage-1">
			<a href="UserServlet.do?curentPageNo=${page.upPageNo }&pageSize=${page.pageSize }" class="layui-laypage-prev " >上一页</a> 
			<!--  <span class="layui-laypage-curr"><em class="layui-laypage-em"></em><em>1</em> </span> -->
			<%
				PagingVO pagevo = (PagingVO) request.getAttribute("page");
				for (int i = 0; pagevo != null && i < pagevo.getTotalCount(); i++) {
			%>
			<a href="UserServlet.do?curentPageNo=<%=i + 1%>&pageSize=5" data-page="<%=i + 1%>"><em class="layui-laypage-em"></em><em><%=i + 1%></em></a>
			<%
				}
			%>
			<a href="UserServlet.do?curentPageNo=${page.nextPageNo }&pageSize=${page.pageSize }" class="layui-laypage-next" >下一页</a>
		</div>
		总页数${page.totalCount }
	</div> --%>

	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/allUsers.js"></script>
</body>
</html>