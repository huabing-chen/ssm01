<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>

<script type="text/javascript">
$(function(){
	alert("11111");
	var teaId = $("#teacherId").val();
	var stuName = $("#name").val();
	$.ajax({
		url:"http://localhost:9999/ssm01/student/teacherList",
		type:"get",
		dataType:"json",
		data:{"teacherid":teaId,"name":stuName},
		success:function(data){
			var option = "<option value='-1'>请选择老师</option>";
			for(var i=0;i<data.length;i++){
				var stu = data[i];
				option += "<option value="+stu.id+">"+stu.name+"</option>"
				}
			$("#teacherId").html($(option));
			}
		});
});
</script>
</head>
<body>

<form action="addStudent" method="post">
老师：<select name="teacherid" id="teacherId"></select>
学生姓名：<input type="text" name="name" id="name"/>
<input type="submit" value="添加"/>
</form>
</body>
</html>