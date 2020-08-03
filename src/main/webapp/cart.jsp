<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>layui数据表格实现类购物车功能</title>
    <link rel="stylesheet" type="text/css" href="//layui.hcwl520.com.cn/layui/css/layui.css?v=201801090202" />
    <script src="//layui.hcwl520.com.cn/layui/layui.js?v=201801090202"></script>
    <link rel="stylesheet" href="css/index.css">
    <!--角标-->
    <link rel="shortcut icon" href="https://www.kaisir.cn/icon/favicon.ico">
    <script src="js/index2.js"></script>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function updateMember(id){
			var list = $("#List2").val(); 
			var totalMoney = $("#RechargeCount_TotalMoney").val(); 
			/* var array = layui.table.cache("#List2"); */
			/* alery(totalMoney); */
			layui.data('test');
			/* alert("list"); */
			
			console.log(totalMoney);
			/* window.location="cart.jsp"; */
			$.ajax({
				
				})
		}
	</script>
</head>
<body>
 
<div id="guide_panel">
    
  <!--   <ul class="layui-timeline">
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">使用方法</h3>
                <p>
                    <br>1：单击左边商品列表任一商品，右边购物车数据表格会渲染一条数据，同时计算总数，合计金额。
                    <br>2：购物车数据表格，数量/单价改变，金额改变，底部合计金额，数量，也会跟随改变
                    <br>3：购物车数据表格，‘删除’，删除当前所选商品
                </p>
            </div>
        </li>
    </ul> -->
</div>
    <div id="row_panel">
        <div class="table-panel">
            <table id="List1" lay-filter="List1"></table>
            <p>商品列表</p>
        </div>
        <div class="table-panel">
            <table id="List2" lay-filter="List2"></table>
            <p>购物车</p>
        </div>
       <div class="bottom-panel">
            <span>总数:</span><span style="color: red;margin-right: 15px" id="RechargeCount_TotalQty">---</span>
            <span>合计金额:</span><span style="color:red;margin-right: 20px" id="RechargeCount_TotalMoney">---</span>
            <button  id="xianjin" class="layui-btn layui-btn-xs">现金支付</button>
            <button  id="huiyuan" class="layui-btn layui-btn-xs">会员支付</button>
       </div>
    </div>
</body>
</html>
