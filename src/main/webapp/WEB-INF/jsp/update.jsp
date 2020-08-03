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
$(function(){

	$.ajax({
		url:"http://localhost:9999/ssm01/student/teacherList/",
		type:"get",
		dataType:"json",
		success:function(data){
			var option = "";
			for(var i=0;i<data.length;i++){
				var ss = data[i];
					if(${sessionScope.stu.teacherid }==ss.id){
						option = "<option value="+ss.id+">"+ss.name+"</option>";
						}
				}
			for(var i=0;i<data.length;i++){
				var stu = data[i];
				option += "<option value="+stu.id+">"+stu.name+"</option>"
				}
			$("#teacherId").html($(option));
			}
		});
});


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
/* function update(id){
	var  r = confirm("请确定要更改学生信息：");
	
	var form = $("#form").serializeArray();
	alert(form);
	var obj={};
	for(var i=0;i<form.length();i++){
			obj[form[i].name] = form[i].value;
		}
	if(r){
		$.ajax({
			
			url:"http://localhost:9999/ssm01/student/updateStu/"+id,
			type:"post",
			data:JSON.stringify(obj),
			  /* data:{"_method":"PUT"},  */ //,"teacherid":tId,"name":sname,"id":id
			dataType:"json",
			headers:{
				Accept:"application/json",
				"Content-Type":"application/json"
			},
			success:function(data){
				if(data.result==200){
					location.href="http://localhost:9999/ssm01/student/list";
					}
				}
			});
		}
}
 */

</script>
</head>
<body>
<form action="updateStu"   method="post" id="form">
    <input type="hidden" name="id" value="${sessionScope.stu.id }" _method="put">
	老师：<select name="teacherid" id="teacherId" value="${sessionScope.stu.teacherid }"></select>
	姓名：<input type="text" name="name" value="${sessionScope.stu.name }"/>
	<input type="submit" value="更新"  />
	<%-- --%>
</form>

</body>
</html>