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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- JSTL -->


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

<!--添加  vue.js 支持加载-->
<script src="${pageContext.request.contextPath}/static/vue/vue.min.js"></script>
<!--添加  vue.js 支持加载-->

<!--mui head 变成绿色 -->
<link href="${pageContext.request.contextPath}/static/common/base/alert_mui_bar.css" rel="stylesheet"/>

<!--添加  本页 js css  -->
<%-- <script src="${pageContext.request.contextPath}/static/common/dingdan/create.js"></script>
<link href="${pageContext.request.contextPath}/static/common/dingdan/create.css" rel="stylesheet"/> --%>
<!--添加  本页 js css  -->

<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->

<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->

<title>订单详情</title>
</head>

<style type="text/css">

.title{
	padding: 10px 10px 10px 10px; 
	text-align: center; 
	color: white;
    background: -webkit-gradient(linear, 0% 77%, 411 82%, color-stop(19%,#EA743C), color-stop(138%,#D63700));
    margin-top: 10px;
    font-size: 14px;
    margin-bottom: 10px;
}

.base_info{
	background-color: white;
	padding: 10px 10px 10px 10px; 
	border-bottom: 2px solid red;
}

.base_info .name_phone{
	padding-left: 10px;
	font-size: 14px;
}

.base_info .address{
	padding-left: 10px;
	margin-top:6px;
	font-size: 13px;
	color: #777;
}

.dingdan_list{
	background-color: white;
	margin-bottom: 10px;
}

.dingdan_list .dingdan_item{
	position: relative;
	padding: 10px 10px 0px 10px;
}

.liuyan{
	background-color:white;
	padding: 10px;
	margin-bottom: 10px;
}

.pay_type{
	padding: 10px;
	background-color:white;
	margin-bottom: 10px;
}


.dingdan_item_cancel{    
    font-size: 13px;
    display: inline-block;
    padding: 3px 13px 3px 14px;
    border: 1px solid #ccc;
    border-radius: 15px;
    color: #222;
    background-color: #FFFFFF;
    margin-right: 16px;
}
.dingdan_item_pay{
	font-size: 13px;
	display: inline-block; 
	padding: 3px 13px 3px 14px;
	border: 1px solid #ccc; 
	border-radius:15px; 
	color: white; 
	background-color:#E03C36;
}


</style>
<script type="text/javascript" charset="utf-8">

var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "${config.title_}";//分享标题
var share_desc = "${config.desc_}";//分享摘要


mui.init();
$(function() {
	//$("#home").addClass("active");
	
	//分享连接
	var host = document.domain; 
	share_url = '${config.web_site}';
	share_img_url = 'http://'+host+'${config.wx_share_img}';
	weixin_share();
	//分享连接
	
	
});

//取消订单
function dingdan_cancel_dlg(dingdanId){
	//弹出确定 对话框
	  //询问框
	  layer.open({
	    content: '您确定要取消订单吗？'
	    ,btn: ['是', '不是']
	    ,yes: function(index){
	    	dingdan_cancel(dingdanId)
	    }
	  });
}

//取消订单
function dingdan_cancel(dingdanId){
	
	layer.open({
	    type: 2
	    ,content: '取消中'
	    ,shadeClose:false
  });
	
	$.post("/dingdan/update", {id:dingdanId,state:3}, function(result) {
		if(result.success){
			location.replace(location.href);
		}
	}, 'json');
}



</script>

<body id="app">
<header id="header" class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">订单详情</h1>
</header>


<div class="mui-content">
	
	<div style="margin-bottom: 100px;">
	
		<div class="title">
			<c:choose>
				<c:when test="${dingdan.state==0}">
					待付款
				</c:when>
				<c:when test="${dingdan.state==1}">
					已付款
				</c:when>
				<c:when test="${dingdan.state==3}">
					已取消
				</c:when>
			</c:choose>
		</div>
		
		
		<div class="base_info">
			<div class="name_phone">
				<span>${dingdan.name}</span>  
				<span>${dingdan.phone}</span>
			</div>
			<div class="address">
				${dingdan.address}
			</div>
		</div>
		
		
		<div class="dingdan_list">
				<c:forEach var="goods" items="${dingdan.info}"  >
					<div class="dingdan_item">
						<div style="display: flex;display: -webkit-flex;position: relative; border-bottom: 1px solid rgba(0, 0, 0, .3); padding-bottom: 10px;">
							<div style="flex:1;	-webkit-flex:1; display: flex;display: -webkit-flex; " >
								<span style="vertical-align:top; width: 50px; height: 50px; "><img style="width: 50px;" src="${goods.showImg }" /></span>
								<span style="vertical-align:top;padding-left: 3px;color: #333;font-size: 13px; flex:1;-webkit-flex:1;max-height: 50px; overflow:hidden; line-height: 16px;">${goods.title }</span>
							</div>
							<div style="width:73px;padding-left: 6px;" >
								<div style="color: #777;font-size: 13px; color: red; font-weight: bold;">¥ <span id="price">${goods.price}</span></div>
								<div style="color: #777;font-size: 13px;">x <span id="num">${goods.num }</span></div>
							</div>
						</div>
					</div>
				</c:forEach>
		</div>
		
		<div class="liuyan">
			<div style="font-size: 14px;">留言</div>
			<div style="font-size: 13px; color: #777">${dingdan.remark}</div>
		</div>
		
		<div class="pay_type">
			<div style="background-color: white;">
				<img alt="" src="/static/images/wx_pay/wx_pay_icon.png" style="width: 30px; line-height:25px; vertical-align: middle; float:left; display: inline-block;">
				<span style="display: inline-block; line-height:25px; float:left; font-size: 14px; vertical-align: middle;">微信支付</span>
				<img alt="" src="/static/images/wx_pay/选中.png" style="width: 21px; line-height:25px; vertical-align: middle; float:right; display: inline-block;">
				<div style=" clear:both;"></div>
			</div>
		</div>
		
		<div style="padding: 10px; background-color: white; margin-bottom: 10px;">
			<div style=" display: flex;display: -webkit-flex; margin-bottom: 10px;">
				<div style="width: 100px; text-align: left; font-size:14px;color:#777;">商品数量</div>
				<div style="flex:1;-webkit-flex:1; text-align: right;  font-size: 14px;  color: #777;">${goodsNum}</div>
			</div>
			
			<div style=" display: flex;display: -webkit-flex;">
				<div style="width: 100px; text-align: left;font-size:14px;color:#000;font-weight: bold">订单总价</div>
				<div style="flex:1;-webkit-flex:1; text-align: right;font-size:14px;color:#000; font-weight: bold;">${dingdan.jine }</div>
			</div>
		</div>
		
		<div style="padding: 10px; background-color: white; margin-bottom: 10px;">
			<div style=" display: flex;display: -webkit-flex; margin-bottom: 10px;">
				<div style="text-align: left; font-size:14px;color:#777;">订单编号：${dingdan.out_trade_no }</div>
			</div>
			<div style=" display: flex;display: -webkit-flex; ">
				<div style="text-align: left; font-size:14px;color:#777;">创建时间：<fmt:formatDate value="${dingdan.createDateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
			</div>
		</div>
		
		<div style="padding: 10px; background-color: white; margin-bottom: 10px;">
			<div style=" display: flex;display: -webkit-flex; ">
				<div style="text-align: left; font-size:14px;color:#777;">付款时间：<fmt:formatDate value="${dingdan.payDateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
			</div>
		</div>
		
		
		
		<c:if test="${dingdan.state==0 }">
			<div style="padding: 10px; background-color:white; display: block; text-align: right;">
					<span onclick="dingdan_cancel_dlg(${dingdan.id})" class="dingdan_item_cancel">取消订单</span>
					<span onclick="window.location.href='/wap/dingdan/pay/${dingdan.id}'"  class="dingdan_item_pay">支付订单</span>
			</div>
		</c:if>
		
	</div>
	
	
	
	
</div>

<!-- 底部菜单 -->
<jsp:include page="/wap/common/fixed_btm.jsp"/>

<script>
var app = new Vue({
	el : '#app',
	data : {
		name : '',
		phone:'',
		address : '',
		remark:""
	}
});
</script>

</body>
</html>