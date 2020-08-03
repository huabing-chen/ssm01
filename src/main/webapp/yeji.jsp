<%@ page language="java"  import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/业绩管理.css">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="js/M_select.css">
</head>

<body>
    <div id="allbox">
       
        <div id="box">
            <div id="search">
                <form action="" class="layui-form">
                    <span id="riqi">选择日期</span>
                    <input type="text" id="test1" placeholder="开始日期">
                    <em>-</em>
                    <input type="text" id="test2" placeholder="结束日期">

                    <input type="button" value="搜索" id="ss">
                </form>
            </div>
            <div id="yeji">
                 <span>服务人数：<em id="a1">100</em></span>
                <span>拉水车数：<em id="a2">10</em></span> 
                <span>营业额：<em id="a3">￥1,000</em></span>
            </div>
            <div id="main"></div>
           
        </div>
    </div>
</body>

</html>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/echarts.js"></script>
<script src="js/xlPaging.js"></script>
<script src="laydate/laydate.js"></script>
<script src="js/M_select.js"></script>
<script src="layui/layui.js"></script>
<script src="js/oApublic.js"></script>
<script>
	$(function(){
		$.ajax({
			url: '../../ssm01/tongji/xianshi',
	        type: 'get',
	        dataType: 'json',
	        data: {
	        	 start: $('#test1').val(),
                 end: $('#test2').val(),
	        },
	        success: function (data) {
		        
	            console.log(data);
	            $('#a1').html(data.fuwurenshu);
	            $('#a2').html(data.lashui);
	            $('#a3').html("￥" + data.yeji);

	            
	       		}
			
			});
		
		})

		
		
		
    // 创建变量zhi来作为全局变量保存部门名字
    var zhi;
    // 创建变量zhi2来作为全局变量保存员工名字
    var zhi2;
    // ajax请求、、三个按钮
   /*  $.ajax({
        url: '',
        type: 'post',
        dataType: 'json',
        data: {
            empId: '10001'
        },
        success: function (data) {
            console.log(data);
            $('#a1').html(data.fuwurenshu);
            $('#a2').html(data.lashui);
            $('#a3').html("￥" + data.yeji);
        },
        error: function (xhr, errorInfo) {
            console.log('ajax请求失败');
        }
    }); */
   

    // 点击搜索框后请求数据
     $('#ss').click(function () {
        // console.log(zhi);
        // console.log(zhi2);
       $.ajax({
			url: '../../ssm01/tongji/xianshi',
	        type: 'get',
	        dataType: 'json',
	        data: {
	        	 start: $('#test1').val(),
                 end: $('#test2').val(),
	        },
	        success: function (data) {
		        
	            console.log(data);
	            $('#a1').html(data.fuwurenshu);
	            $('#a2').html(data.lashui);
	            $('#a3').html("￥" + data.yeji);

	            
	       		}
			
			})
    }); 
   /* $(function(){
	   var yeji[];
	   var people[];
	   $.ajax({
			url: '../../ssm01/tongji/zhuzhuangtu',
	        type: 'get',
	        dataType: 'json',
	        data: {
	        	
	        },
	        success: function (data) {
		        
	           yeji=data.yye;
	           people=data.peoplenum;
	            
	       		}
			
			})
			
	   
	   }) */
    // 设置统计图
		    // 基于准备好的dom，初始化echarts实例
		    var myChart = echarts.init(document.getElementById('main'));
		    option = {
		        tooltip: {
		            trigger: 'axis',
		            axisPointer: {
		                type: 'cross',
		                crossStyle: {
		                    color: '#999'
		                }
		            }
		        },
		        legend: {
		            data: ['人数', '营业额', '折线']
		        },
		        xAxis: [
		            {
		                type: 'category',
		                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
		                axisPointer: {
		                    type: 'shadow'
		                }
		            }
		        ],
		        yAxis: [
		            {
		                type: 'value',
		                name: '人数（人）',
		                min: 0,
		                max: 100,
		                interval: 10,
		                axisLabel: {
		                    formatter: '{value}'
		                }
		            },
		            {
		                type: 'value',
		                name: '营业额',
		                min: 0,
		                max: 1000,
		                interval: 100,
		                axisLabel: {
		                    formatter: '{value} '
		                }
		            }
		        ],
		        series: [
		            {
		                name: '人数',
		                type: 'bar',
		                 data: [20, 49, 70, 23, 25, 76, 56, 22, 26, 80, 64, 33] 
		               /*  data:people */
		            },
		            {
		                name: '营业额',
		                type: 'bar',
		                 data: [26, 59, 90, 24, 37, 87, 66, 32, 47, 88, 68, 43] 
		                /* data:yeji */
		            },
		           /*  {
		                name: '人流量',
		                type: 'line',
		                yAxisIndex: 1,
		                data: [76.92, 83.05, 77.78, 95.83, 67.58, 87.36, 84.84, 68.75, 55.32, 90.9, 94.11, 76.74]
		            } */
		        ]
		    };
		    // 使用刚指定的配置项和数据显示图表。
		    myChart.setOption(option);

    // 设置日历插件
    //执行一个laydate实例
    laydate.render({
        elem: '#test1' //指定元素
    });
    laydate.render({
        elem: '#test2' //指定元素
    });


</script>