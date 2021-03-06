<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 强制  高速模式 渲染网页    -->
<meta name=”renderer” content=”webkit”>
<meta http-equiv=”X-UA-Compatible” content=”IE=Edge,chrome=1″ >
<!-- 强制  高速模式 渲染网页    -->

<!--添加  jq  支持加载-->
<script	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!--添加  jq  支持加载-->

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->

<!--添加  本页的样式   -->
<link href="${pageContext.request.contextPath}/static/common/base/fenlei.css" rel="stylesheet"/>
<!--添加  本页的样式   -->

<!--添加  修改 顶部bar成为绿色的样式  -->
<link href="${pageContext.request.contextPath}/static/common/base/alert_mui_bar.css" rel="stylesheet"/>
<!--添加  修改 顶部bar成为绿色的样式  -->

<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->


<title>${fenlei.name}分类-${config.domain_title}</title>

<style type="text/css">
</style>

</head>
<script type="text/javascript" charset="utf-8">

mui.init();


var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "${fenlei.name}分类-${config.domain_title}";//分享标题
var share_desc = "${config.desc_}";//分享摘要


$(function(){
	var host = document.domain; 
	share_url = window.location.href;
	share_img_url = 'http://'+host+'${fenlei.imgUrl}';
	weixin_share();
});
	
	




</script>
<body>
<header id="header" class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left "><span style="font-size: 16px; line-height: 20px; height: 20px;">返回</span></a>
	<h1 class="mui-title">${fenlei.name}</h1>
</header>


<div class="mui-content">
	
	<div class="goods_list">
		
		<c:forEach var="goods" items="${goodsList}">
			<div class="goods_item"  onclick="window.location.href='/wap/goods/${goods.id}.html'">
				<div style="width: 150px;">
					<img class="goods_item_left_img" alt="" src="${goods.showImg }" />
				</div>
				
				<div class="goods_item_right" >
					<div class="goods_item_right_title">${goods.title }</div>
					<div class="goods_item_right_price">
						<span style="font-size: 13px; color: #ef4706;  font-weight: bold;">¥</span>
						<span style="letter-spacing: 1px; color: #ef4706;  font-weight: bold;">${goods.price }</span>
						<span style="font-size: 12px; color:#9E9E9E;">${goods.sales }人购买</span>
					</div>
					<div class="goods_item_right_address">地址：${ADDRESS}</div>
				</div>
			</div>
		</c:forEach>
		
		
		
	</div>
	
	
</div>


<!-- 底部菜单 -->
<jsp:include page="/wap/common/fixed_btm.jsp"/>

		

</body>
</html>