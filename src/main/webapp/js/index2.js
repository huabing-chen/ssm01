layui.use(['layer', 'form', 'element', 'jquery', 'table', 'laydate'], function () {
    var form = layui.form, element = layui.element, $ = layui.$, layer = layui.layer,
        table = layui.table, laydate = layui.laydate;
    /**
     * 数据表格:定义表头数据
     * @type {{}}
     */
    var lan = {};
    lan.cpbm = "商品";//产品编码
    lan.cpjm = "规格";//产品简码
    /*lan.cpmc = "产品名称";*/
    lan.ckjj = "价格";//参考进价
   /* lan.lpbz = "礼品标志";*/
    lan.spbh = "商品名称";
    lan.spmc = "商品规格";
    lan.sl = "数量";
    lan.dj = "单价";
    lan.je = "金额";
    lan.cz = "操作";
    /**
     * 购物车数据
     * @type {Array}
     */
    var goodsData = [];
    //会员编号
    var huiyuanNo;
    /**
     * 商品数据
     * @type {string}
     */
    var GoodsDataStr = "[" +
	"{\"GoodsID\":\"澡票1\",\"NameCode\":\"成人\",\"GoodsName\":\"成人\",\"Price\":10,\"XPrice\":10,\"LAY_TABLE_INDEX\":0},"+
	
	"{\"GoodsID\":\"澡票2\",\"NameCode\":\"儿童\",\"GoodsName\":\"儿童\",\"Price\":20,\"XPrice\":8,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"澡巾1\",\"NameCode\":\"好\",\"GoodsName\":\"优\",\"Price\":20,\"XPrice\":10,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"毛巾\",\"NameCode\":\"大\",\"GoodsName\":\"优\",\"Price\":20,\"XPrice\":15,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"绿茶\",\"NameCode\":\"500ml\",\"GoodsName\":\"500ml\",\"Price\":20,\"XPrice\":3,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"矿泉水\",\"NameCode\":\"500ml\",\"GoodsName\":\"500ml\",\"Price\":20,\"XPrice\":1,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"洗头膏\",\"NameCode\":\"50ml\",\"GoodsName\":\"50ml\",\"Price\":20,\"XPrice\":1,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"矿泉水\",\"NameCode\":\"500ml\",\"GoodsName\":\"500ml\",\"Price\":20,\"XPrice\":1,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"按摩\",\"NameCode\":\"30分钟\",\"GoodsName\":\"30分钟\",\"Price\":20,\"XPrice\":35,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"搓澡\",\"NameCode\":\"优\",\"GoodsName\":\"优\",\"Price\":20,\"XPrice\":10,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"打盐\",\"NameCode\":\"优\",\"GoodsName\":\"优\",\"Price\":20,\"XPrice\":10,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"单间1\",\"NameCode\":\"淋浴2人\",\"GoodsName\":\"淋浴2人\",\"Price\":20,\"XPrice\":25,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"单间2\",\"NameCode\":\"盆浴2人\",\"GoodsName\":\"盆浴2人\",\"Price\":20,\"XPrice\":35,\"LAY_TABLE_INDEX\":0},"+
	"{\"GoodsID\":\"修脚\",\"GoodsName\":\"优\",\"NameCode\":\"优\",\"GoodsClass\":\"13819785158099968\",\"GoodsType\":1,\"Price\":0,\"PriceUnit\":0,\"PriceNum\":0,\"XPrice\":20,\"Images\":null,\"IsPoint\":0,\"PointType\":0,\"MinDiscount\":0,\"IsDiscount\":0,\"Remark\":null,\"IsDelete\":0,\"IsGift\":1,\"ExchangePoint\":500,\"CreateTime\":20190114151658,\"CompID\":198,\"ShopID\":\"237\",\"MasterID\":\"237\",\"MeasureUnit\":\"1\",\"Specials\":0,\"IsShelf\":0,\"FreightTemplateID\":null,\"Id\":\"14083067377571840\",\"LAY_TABLE_INDEX\":9}" +
	"]";

    var GoodsData = JSON.parse(GoodsDataStr);
    //保存购物车里的信息
    var gouwuche = [];
    //保存总金额
    var zongjine;
    /**
     * 页面加载时执行
     */
    $(function () {
       /* console.table(GoodsData);*/  //这个是表格中的所有东西
 
        /**
         * List1数据表格渲染(商品列表)
         */
       var ListTable1 = table.render({
            data:GoodsData,
            elem: '#List1',
            cellMinWidth: 95,
            //height: 'full-190',
            height: '460',
           /* url:'/cart/shop',*/
            minheight:430,
            page: true,
            limit: 30,
            limits: [10, 20, 30, 40],
            done: function (res) {
                if (res.rows && res.rows.length == 1) {
                    var data = res.rows[0];
 
                    GoodsList_onDblClickRow(data);
                }
            },
            cols: [
                [
                    { field: 'GoodsID', title: lan.cpbm, align: 'left' },
                    { field: 'NameCode', title: lan.cpjm, align: 'left' },
                   /* { field: 'GoodsName', title: lan.cpmc, align: 'left' },*/
                    {
                        field: 'XPrice', title: lan.ckjj, align: 'right', templet: function (d) {
                            return "<span style='color:red'>￥" + d.XPrice + "</span>";
                        }
                    },
                   /* {
                        field: 'IsGift', title: lan.lpbz, align: 'center', templet: function (d) {
                            var _fm = '<div class="padding_top4 padding_left5">';
                            _fm += d.IsGift == 1 ? '<i class="layui-icon layui-icon-ok" title=' + lan.lp + '></i>' : '<i class="layui-icon layui-icon-close" title=' + lan.flp + '></i>';
                            _fm += "</div>";
                            return _fm;
                        }
                    }*/
                ]
            ]
        });
 
        /**
         * List2数据表格渲染(购物车)
         */
        var ListTable2 = table.render({
            data:goodsData,
            elem: '#List2',
            cellMinWidth: 95,
            //height: 'full-190',
            height: '460',
            minheight:430,
            page: true,
            limit: 20,
            limits: [10, 20, 30, 40],
            cols: [
                [
                    { field: 'GoodsID', title: lan.spbh },
                    { field: 'GoodsName', title: lan.spmc },
                    { field: 'Qty', title: lan.sl, edit: 'text' },
                    { field: 'Price', title: lan.dj, edit: 'text' },
                    { field: 'Money', title: lan.je },
                    {
                        title: lan.cz, align: "center", fixed: 'right', templet: function (d) {
                            var html = '<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delet">删除</a> ';
                            return html;
                        }
                    }
                ]
            ],
            done: function (res) {
                $("#List2").siblings().find("td").each(function () {
                    if ($(this).attr("data-edit") == 'text') {
                        var num = $(this).find("div").text();
                        $(this).append('<input class="layui-input layui-table-edit" value="' + num + '">')
                    }
                })
                gouwuche = res;
                /*console.log(res);*/
            }
 
        });
 
        /**
         * 监听商品列表'行'单击事件
         */
        table.on('row(List1)', function (obj) {
            var data = obj.data;
            var isNew = true;
            var vKey = data.GoodsID; //产品编码
            //遍历购物车，是否存在产品；存在，数量+1 计算金额
            for (var i = 0; i < goodsData.length; i++) {
                var tRow = goodsData[i];
                if (vKey == tRow.GoodsID) {
                    tRow.Qty = parseInt(tRow.Qty) + 1;
                    tRow.Money = accMul(tRow.Qty, tRow.Price,2);
                    isNew = false;
                    break;
                }
            }
            //判断当前数据是否为新增数据
            if (isNew) {
                var tmpRow = {};
                tmpRow.Id = data.Id;
                tmpRow.GoodsID = data.GoodsID;
                tmpRow.GoodsName = data.GoodsName;
                tmpRow.Price = data.XPrice;
                tmpRow.Qty = 1;
                tmpRow.Money =(data.XPrice).toFixed(2);
                tmpRow.SalesCode = "";
                goodsData.push(tmpRow);
            }
            //console.log(goodsData);
 
            /**
             * 开始刷新购物车
             */
            shoppingCartRefresh();
        });
 
 
        /**
         * 监听购物车行删除事件
         */
        table.on('tool(List2)', function (obj, index) {
            var data = obj.data;
            if (obj.event === 'delet') {
                for (var i = 0; i < goodsData.length; i++) {
                    var gd = goodsData[i];
                    if (data.GoodsID == gd.GoodsID) {
                        goodsData.splice(i, 1);
                    }
                }
                /**
                 * 开始刷新购物车
                 */
                shoppingCartRefresh();
            }
        });
 
        /**
         * 购物车行编辑事件
         */
        table.on('edit(List2)', function (obj) {
            var data = goodsData;
            for (var i = 0; i < data.length; i++) {
                if (obj.data.Id == data[i].Id) {
                    if (isNaN(data[i].Qty) || data[i].Qty < 0) {
                        data[i].Qty = 0;
                    }
                    if (isNaN(data[i].Price) || data[i].Price < 0) {
                        data[i].Price = 0;
                    }
                    data[i].Qty = Number(data[i].Qty); //数量:声明数字类型
                    data[i].Price = parseFloat(data[i].Price).toFixed(2); //金额:声明小数类型
                    data[i].Money = accMul(data[i].Qty, data[i].Price,2); //计算总金额:保留2位小数
                }
            }
            /**
             * 开始刷新购物车
             */
            shoppingCartRefresh();
        });
 
 
        /**
         * 购物车刷新函数
         */
        function shoppingCartRefresh(){
            var TotalQty = 0;
            var TotalMoney = 0;
            //数据表格重载
            ListTable2.reload({ data: goodsData });
            //计算总数 合计金额
            for (var i = 0; i < goodsData.length; i++) {
                TotalQty = accAdd(TotalQty, goodsData[i].Qty);
                TotalMoney = (accAdd(TotalMoney, parseFloat(goodsData[i].Money))).toFixed(2);
            }
            // console.log("总数量:"+TotalQty);
            // console.log("总金额:"+TotalMoney);
            $("#RechargeCount_TotalQty").html(TotalQty);
            $("#RechargeCount_TotalMoney").html(TotalMoney);
            zongjine = TotalMoney;
            /*console.log(zongjine);*/ //总金额已经获取到了
        }
        
        //现金支付方法
        $(document).on('click',"#xianjin",function(){
           xianJinZhiFu();
          /* var goods= JSON.parse(gouwuche);*/
           
           var goods = JSON.stringify( gouwuche );
           
           $.ajax({
        	type:"get",
   			url:"../../ssm01/cart/jieshoushuju",
   			dataType:"json",
   			async:true,
   			data:{"zongjine":zongjine,"gouwuche":goods},
        	 success : function(data){
        		   if(data.status==1){
        			   alert("ok");
        			   /*layer.msg('ok');*/
        			   window.location="cart.jsp";
        		   }
        	   }
           })
        });
        
        //会员支付，最好是弄成弹框的形式
        $(document).on('click',"#huiyuan",function(){
            xianJinZhiFu();
           /* var goods= JSON.parse(gouwuche);*/
            var goods = JSON.stringify( gouwuche );
            
            
            layer.open({
                type: 1
                ,title: "请输入会员号",
                closeBtn: 1,
                shadeClose:true,
                isOutAnim:true,
                area: '400px',
                shade: 0.7
                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                ,resize: false,
                btnAlign: 'c'
                ,moveType: 1,//拖拽模式，0或者1

                content: '<div style="padding:50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><div class="layui-form"><div class="layui-form-item"><div class="layui-input-inline"><input id="old-pass" style="color: #0C0C0C" class="layui-input" type="password" placeholder="会员号"></div></div></div><div class="btn-cont"><button class="pass cancel-btn">取消</button><button class="pass ok-btn">确认</button></div></div>',

                success: function(layero,index){
                    var btn = layero.find('.btn-cont');
                    var oldPass=layero.find('#old-pass');
                    var id ;

                    //取消按钮事件
                    btn.find('.cancel-btn').click(function () {
                        layer.close(index);
                    });

                    //确认按钮点击事件
                    btn.find('.ok-btn').click(function () {
                    	/* id = $(oldPass).val();*/
                        //获取输入框内容方式一
                        console.log("oldPass="+$(oldPass).val());
                        
                    	 $.ajax({
                          	type:"get",
                     			url:"../../ssm01/cart/huiyuanzhifu",
                     			dataType:"json",
                     			async:true,
                     			data:{"zongjine":zongjine,"gouwuche":goods,"huiyuanNo":$(oldPass).val()},
                     			
                     			success : function(data){
                     				var ye = data.yue;
                     				if(data.status==2){
                     					
                     					 alert("余额不足;余额为："+ye);
                     				}else{
            
                     					alert("支付成功！余额为："+ye)
                     				}
                          		  
                          	   }
                             })
                    	
                        layer.close(index);
                    })
                }
            });
       

       
            
            
            
            
            
            
        /*   */
         });
        
        //现金支付按钮
        function xianJinZhiFu(){
        	shoppingCartRefresh();
        	console.log(zongjine);
        	console.log(gouwuche);
        	/*var GoodsData = JSON.parse(gouwuche);*/
        	
        }
        /**
         * 小数加法
         * @param arg1
         * @param arg2
         * @returns {number}
         */
        function accAdd(arg1,arg2){
            var r1,r2,m;
            try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
            try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
            m=Math.pow(10,Math.max(r1,r2));
            return (arg1*m+arg2*m)/m;
        }
        /**
         * 小数乘法
         * @param arg1
         * @param arg2
         * @param fix
         * @returns {*}
         */
        function accMul(arg1,arg2,fix) {
            if(!parseInt(fix)==fix)
            {
                return;
            }
            var m=0,s1=arg1.toString(),s2=arg2.toString();
            try{m+=s1.split(".")[1].length}catch(e){}
            try{m+=s2.split(".")[1].length}catch(e){}
            if(m>fix){
                return (Math.round(Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m-fix))/Math.pow(10,fix));
            }else if(m<=fix){
                return (Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)).toFixed(fix);
            }else{
                return (arg1*arg2).toFixed(fix);
            }
        }
 
    });
 
});