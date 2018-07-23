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

<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->

<!--修改mui head-bar 变成绿色   -->
<link href="${pageContext.request.contextPath}/static/common/base/alert_mui_bar.css" rel="stylesheet"/>
<!--修改mui head-bar 变成绿色   -->

<!--引入本页css  js-->
<link href="${pageContext.request.contextPath}/static/common/goods/view.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/static/common/goods/view.js"></script>
<!--引入本页css  js-->


<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->

<title>${goods.title}</title>

<style type="text/css">
</style>

</head>
<script type="text/javascript" charset="utf-8">
mui.init();

var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "${goods.title}";//分享标题
var share_desc = "${goods.contentNoTag}";//分享摘要

$(function() {
	//$("#home").addClass("active");
	var host = document.domain; 
	share_url = window.location.href;
	share_img_url = 'http://'+host+'${goods.showImg}';
	weixin_share();
});



</script>
<body>
<header id="header" class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">${goods.title}</h1>
</header>



<div class="mui-content">
		<div id="slider" class="mui-slider">
			<div class="mui-slider-group mui-slider-loop">
				<!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="${goods.showImg}">
					</a>
				</div>
				 
				<!-- 第一张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="${goods.showImg}">
					</a>
				</div>
				
				<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="${goods.showImg}">
					</a>
				</div>
				
			</div>
			
			<div class="mui-slider-indicator">
				<div class="mui-indicator mui-active"></div>
			</div>
			
		</div>
		<!-- 轮播结束 -->
		
		<!-- 商品头信息开始 -->
		<div style="background-color: #f8f8f8; margin-bottom: 15px;">
			<h3 style="display: block; margin:0px; font-size: 20px; height: 35px; line-height: 35px;  overflow: hidden;">${goods.title}</h3>
			<div style="color: #ef4706; font-size: 14px; ">
				商品价格：<span style="font-weight:  bold;">${goods.price}元</span>
			</div>
			
			<div style="font-size: 13px; ">
				商品规格：<span style="font-weight:  bold;">${goods.spec}</span>
			</div>
			<div style="font-size: 13px; margin-bottom: 5px;">
				商品库存：<span style="font-weight:bold;">${goods.kucun}</span> 　
				商品销量：<span style="font-weight:bold;">${goods.sales}</span>
			</div>
			
			<!--加入购物车     立即购买    -->
			<div class="buy_add_shop">
				<div onclick="add_shop_cart(${goods.id})">加入购物车</div>
				<div onclick="window.location.href='/wap/dingdan/create?ids=${goods.id}&source=shop' ">立即购买</div>
			</div>
			
			
		</div>
		<!-- 商品头信息结束 -->
		
		
		<!-- 购买 详情 开始 -->
		<div class="show_view_detail" >
			
			<div style="color: #50b350; text-align: center; line-height: 30px; border-bottom: 1px solid #EEF2F2; ">
				商品详情
			</div>
			
			<!-- <div style="font-size: 13px; text-align: center;">
				温馨提示：购买商品前，请您注意商品的详情
			</div> -->
			
			
			<div style="padding: 10px;">
				${goods.content}
			</div>
			
		</div>
		<!-- 购买 详情 结束 -->
	 	
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/common/fixed_btm.jsp"/>
		

</body>
</html>