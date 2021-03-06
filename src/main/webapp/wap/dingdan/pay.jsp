<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 强制  高速模式 渲染网页    -->
<meta name=”renderer” content=”webkit”>
<meta http-equiv=”X-UA-Compatible” content=”IE=Edge,chrome=1″ >

<!--添加  jq  支持加载-->
<script	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 加入移动布局 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<!-- 加入移动布局 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--添加  本地 mui  支持-->
<script src="${pageContext.request.contextPath}/static/mui/js/mui.min.js"></script>
<link href="${pageContext.request.contextPath}/static/mui/css/mui.css" rel="stylesheet"/>
<!--添加  本地  mui  支持-->

<!--添加layer移动  弹出窗口的 插件支持-->
<script src="${pageContext.request.contextPath}/static/layer_mobile/layer.js"></script>
<!--添加layer移动  弹出窗口的 插件支持-->

<!--mui head 变成绿色 -->
<link href="${pageContext.request.contextPath}/static/common/base/alert_mui_bar.css" rel="stylesheet"/>

<!--引入本页js  -->
<script src="${pageContext.request.contextPath}/static/common/dingdan/pay.js"></script>
<!--引入本页js  -->

<!-- 微信支付 js-->
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!-- 微信支付 js-->


<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->


<title>付款</title>
<style type="text/css">
.mui-input-row label {
	font-weight: bold;
}
.pay_btn{
	width:80%;
	font-family: Helvetica, sans-serif;
	font-size: 15px !important;
	border-radius: 5px!important;
	cursor: pointer;
	background: #22a736;
	font-weight: bold;
	color: white;
	padding: 10px 40px 10px 40px;
	display: inline-block;
	cursor: pointer;
}

.input_row{
	display: flex;
	display: -webkit-flex;
	position: relative;
	font-size: 13px;
}
.input_row:after {
    position: absolute;
    right: 0;
    bottom: 0;
    left: 0;
    height: 1px;
    content: '';
    -webkit-transform: scaleY(.5);
    transform: scaleY(.5);
    background-color: #c8c7cc;
}

.input_row div:nth-child(1){
    line-height: 30px;
    text-align: left;
	width: 60px;
}
.input_row div:nth-child(2){
	flex:1;
	line-height: 30px;
	-webkit-flex:1;
}
</style>

</head>
<script type="text/javascript" charset="utf-8">
	var dingdanId = "${dingdan.id}";
	
	mui.init();
	
	var share_url;//分享连接
	var share_img_url;//分享图标
	var share_title= "${config.title_}";//分享标题
	var share_desc = "${config.desc_}";//分享摘要
	
	
	$(function() {
		//$("#home").addClass("active");
			//分享连接
			var host = document.domain; 
			share_url = window.location.href;
			share_img_url = 'http://'+host+'${config.wx_share_img}';
			weixin_share();
			//分享连接
	});
	
	
</script>
<body>
<header id="header" class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">付款</h1>
</header>


<div class="mui-content">
	<p style="margin-bottom: 1px; padding-left: 10px; font-size: 12px; margin-top: 5px;">支付方式</p>
	<div style="padding: 10px; background-color: white; margin-bottom: 20px;">
		<img alt="" src="/static/images/wx_pay/wx_pay_icon.png" style="width: 30px; line-height:25px; vertical-align: middle; float:left; display: inline-block;">
		<span style="display: inline-block; line-height:25px; float:left; vertical-align: middle;">微信支付</span>
		<img alt="" src="/static/images/wx_pay/选中.png" style="width: 21px; line-height:25px; vertical-align: middle; float:right; display: inline-block;">
		<div style=" clear:both;"></div>
	</div>
	
	<div style="background-color: white; border-top: 1px solid #CACACA; padding: 0px 10px 0px 10px; margin-bottom: 20px; ">
		<div class="input_row">
			<div>订单号:</div>
			<div>${dingdan.out_trade_no} </div>
		</div>
		<div class="input_row">
			<div>订单金额:</div>
			<div>¥${dingdan.jine}元</div>
		</div>
	</div>
	
	<p style="margin-bottom: 1px; padding-left: 10px; font-size: 12px;">交易清单</p>
		<div style="background-color: white; border-top: 1px solid #CACACA; padding: 0px  0px 0px 0px; margin-bottom: 20px; ">
			<c:forEach var="goods" items="${dingdan.info}"  >
				<div class="goods_item" style="display: flex;display: -webkit-flex;position: relative; padding: 10px; border-bottom: 1px solid #CACACA; ">
					<div style="flex:1;	-webkit-flex:1; display: flex;display: -webkit-flex; " >
						<span style="vertical-align:top; width: 50px; height: 50px;  "><img style="width: 50px;" src="${goods.showImg }" /></span>
						<span style="vertical-align:top; padding-left: 3px; color: #333;font-size: 13px; flex:1;-webkit-flex:1;max-height: 50px; overflow:hidden; line-height: 16px;">${goods.title }</span>
					</div>
					
					
					<div style="width:73px;padding-left: 6px;" >
							<div style="color: #777;font-size: 13px;color: red; font-weight: bold;">¥ <span id="price">${goods.price}</span></div>
							<div style="color: #777;font-size: 13px;">x <span id="num">${goods.num }</span></div>
					</div>
				</div>
			</c:forEach>
		</div>
	
	<div style="text-align: center; margin-bottom: 90px;">
		<div class="pay_btn" onclick="pay()">立即支付¥<span id="pay_daifu">${dingdan.jine}</span>元</div>
	</div>
	
	
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/common/fixed_btm.jsp"/>


</body>
</html>