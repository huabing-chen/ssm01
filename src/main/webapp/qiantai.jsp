<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.qtu.util.PagingVO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>会员管理--小众洗浴管理系统</title>
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
			url:"../../ssm01/member/listAll",
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
					cont += s.memno;
					cont += "</td>";
					
					cont += "<td>";
					cont += s.memname;
					cont += "</td>";

					cont += "<td>";
					cont += s.memmoney;
					cont += "</td>";

					cont += "<td>";
					cont += s.memtel;
					cont += "</td>";

					cont+="<td>";
					cont+="<button onclick=\"updateMember(6)\"  class=\"layui-btn layui-btn-xs\">修改</button>";
					cont+="<button onclick=\"record(${s.id})\"  class=\"layui-btn layui-btn-xs\">查看记录</button>";
					cont+="<button onclick=\"deleteMember(7)\"  class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
					
					cont+="</td>";
					cont+="</tr>";

				}
				$("#ulist").html(cont);

			}
				
			});
		});
	function updateMember(id){
		 localStorage.setItem("memberId", 6);
		 
		 window.location="memberUpdate.jsp";
		}
	function record(memno){
		localStorage.setItem("memno",11111);
		window.location="membercord.jsp";
		}
	function deleteMember(id){
		$.ajax({
			type:"post",
			data:{"memberId":id},
			url:"../../ssm01/member/deleteMember",
			dataType:"json",
			async:true,
			success:function(data){
				if(data.status==1){
					alert("删除成功！");
					location.href ="addressbook.jsp";
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
			url : "../../ssm01/member/searchKey",
			dataType : "json",
			async : true,
			success : function(data) {
				//列表展示
				var ulist = data.list;
				var msg = data.msg;
				//拼接HTML
				var cont = "";
				/*  for (var i = 0; i < ulist.length; i++) {  */
					/* var s = ulist[i]; */
					var s = ulist;

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
					cont += s.memmoney;
					cont += "</td>";

					cont += "<td>";
					cont += s.memtel;
					cont += "</td>";

					cont+="<td>";
					cont+="<button onclick=\"updateMember(${s.id})\"  class=\"layui-btn layui-btn-xs\">修改</button>";
					cont+="<button onclick=\"record(${s.id})\"  class=\"layui-btn layui-btn-xs\">查看记录</button>";
					cont+="<button onclick=\"deleteMember(41 )\"  class=\"layui-btn layui-btn-danger layui-btn-xs\">删除</button>";
					
					cont+="</td>";
					cont+="</tr>";

				/* } */
				$("#ulist").html(cont);

			}
		});
	}
	function addMember(){
		 location.href="addMember.jsp";
		}
</script>
</head>
<body class="childrenBody">


<div style="width:49%; float:left">
	
  <table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="100">
		    <col width="100">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>商品</th>
		      <th>价格</th>
		      <th>规格</th>
		      <th>数量</th>
		    </tr> 
		  </thead>
		  <tbody>
		    <tr>
		      <td>贤心</td>
		      <td>11</td>
		      <td>50</td>
		      <td><input type="text" id="sp1" name="sp1" value="0"></td>
		    </tr>
		    <tr>
		      <td>贤心</td>
		      <td>11</td>
		      <td>50</td>
		      <td><input type="text" id="sp1" name="sp2" value="0"></td>
		    </tr>
		 </tbody>
	
</table>
</div>
<div style="width:49%; float:right">
	
  <table class="layui-table">
		  <colgroup>
		    <col width="150">
		    <col width="100">
		    <col width="100">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th>商品</th>
		      <th>价格</th>
		      <th>规格</th>
		      <th>数量</th>
		    </tr> 
		  </thead>
		  <tbody>
		    <tr>
		      <td>贤心</td>
		      <td>11</td>
		      <td>50</td>
		      <td><input type="text" id="sp2" name="sp2" value="0"></td>
		    </tr>
		    <tr>
		      <td>贤心</td>
		      <td>11</td>
		      <td>50</td>
		      <td><input type="text" id="sp2" name="sp2" value="0"></td>
		  </tr>
		 </tbody>
	
</table>
</div>

	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/allUsers.js"></script>
</body>
</html>