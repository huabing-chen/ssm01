<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
		function del(id){
			var  r = confirm("请确定要删除学生："+id);
			if(r){
				$.ajax({
					url:"http://localhost:9999/ssm01/student/delete/"+id,
					type:"post",
					data:{"_method":"delete"},
					dataType:"json",
					success:function(data){
						if(data.result==200){
							location.href="http://localhost:9999/ssm01/student/list";
							}
						}
					});
				}
			}
		
		function update(id){
		
		 	/* var  r = confirm(id);  */
			
				$.ajax({
					url:"http://localhost:9999/ssm01/student/updateStudent/"+id,
					 type:"get",
					/* data:{"name":name,"teacherId":teacherId,"id":id}, */
					dataType:"json",
					 success:function(data){
						if(data.result==200){
							location.href="http://localhost:9999/ssm01/student/update";
						
							}
						} 
					});
				
			}
		
</script>
</head>
<body>
	<h1><a href="add">添加学生</a></h1>
	<table>
		<tr>
			<td>id</td>
			<td>teacherId</td>
			<td>name</td>
		</tr>
		<c:forEach items="${requestScope.list }" var="s">
		
		<tr>
			<td >${s.id }</td>
			<td >${s.teacherid }</td>
			<td >${s.name }</td>
			<td><a href="#" onclick="del(${s.id})">删除</a></td>
			<td><a href="#" onclick="update(${s.id})" >更新</a></td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>