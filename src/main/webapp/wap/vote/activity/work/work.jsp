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

<link href="${pageContext.request.contextPath}/static/css/vote/base.css" rel="stylesheet"/>

<!-- 微信支付 js-->
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!-- 微信支付 js-->

<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->

<!--添加  本页 css js -->
<link href="${pageContext.request.contextPath}/static/css/vote/work.css" rel="stylesheet"/>
<script src="${pageContext.request.contextPath}/static/js/vote/work.js"></script>
<!--添加  本页 css js -->

<title>${activityWork.name } - ${activity.name}</title>

<style type="text/css">

/* 作品页面  投票按钮 */
.toupiao_btn{
	background-color: ${activity.color_};
	color: white;
	height: 40px;
	line-height: 40px;
	text-align: center;
	border-radius: 10px;
}
.toupiao_btn:HOVER{
	background-color:  ${activity.click_color};
}
/* 作品页面  投票按钮 */
</style>

</head>
<script type="text/javascript" charset="utf-8">
	mui.init();
	
	var share_url;//分享连接
	var share_img_url;//分享图标
	var share_title= "我是【${activityWork.name}】正在参加,${activity.name}";//分享标题
	var share_desc = "${activityWork.desc_}【快来为我投票吧】";//分享摘要
	
	var activityId = '${activityId}';  //活动id
	var activityWorkId = '${activityWork.id}';//作品id
	
	
	$(function() {
		var host = document.domain; 
		share_url = window.location.href;
		share_img_url = 'http://'+host+'${activityWork.imgUrl}';
		weixin_share();
		
		
		$("#ewm").on('touchstart', function(evt) {
		    var e = event || evt;
		    //可以设置为关注 
		    window.localStorage.setItem("guanzhu", "1");
		    window.localStorage.setItem("activityId", activityId);
		}).on('touchmove', function(evt) {
		    var e = event || evt;
		}).on('touchend', function(evt) {
		    var e = event || evt;
		    window.localStorage.setItem("guanzhu", "0");
		});
	});
	
</script>

<body>
<div class="mui-content">
	
	<div style="padding: 10px 10px 10px 10px;">
		<p style=" color: #2b425b; margin-bottom:0px; font-size: 15px;">${activity.name}</p>
	</div>
	
	<div style="padding: 10px 10px 10px 10px;">
		<div class="top">
			<p style="color: #2b425b; font-size: 15px; font-weight: bold; margin-bottom: 5px;">${activityWork.name }</p>
			<img style="width: 100%;" src="${activityWork.imgUrl }" />
		</div>
	</div>
	
	<div style="padding: 10px 10px 10px 10px;">
		<div class="top3">
			<div class="top3_item">
				<div class="top3_item_top">${activityWork.num }</div>
				<div class="top3_item_bottom">票数</div>
			</div>
			<div class="top3_item">
				<div class="top3_item_top">${activityWork.rowNum }</div>
				<div class="top3_item_bottom">排名</div>
			</div>
			<div class="top3_item">
				<div class="top3_item_top">${activityWork.numGap }<span style="font-size: 13px; color: #989898;">票</span></div>
				<div class="top3_item_bottom">距上一名</div>
			</div>
		</div>
	</div>
	
	<c:if test="${activity.disableGift==0}">
		<div style="padding: 10px 10px 10px 10px;">
			<div class="toupiao_btn" onclick="toupiao()">
				<img style="display: inline-block; width: 15px;" src="/static/images/vote/hand.png"/>
				<span style="display: inline-block;">投票</span>
			</div>
		</div>
	</c:if>
	
	<c:if test="${activity.disableGift==1}">
		<div style="padding: 10px 10px 10px 10px;">
			<div style="display: flex;display: -webkit-flex; ">
				<div style="overflow: hidden; flex:1;-webkit-flex:1; padding: 0px 10px 0px 10px; ">
					<div class="toupiao_btn" onclick="toupiao()">
						<img style="display: inline-block; width: 15px;  " src="/static/images/vote/hand.png"/>
						<span style="display: inline-block;  ">投票</span>
					</div>
				</div>
				
				<div style="overflow: hidden; flex:1;-webkit-flex:1; padding: 0px 10px 0px 10px;">
					<div onclick="open_gift_window()" class="btn_gift">
						<img style="display: inline-block; vertical-align:bottom; width: 25px;" src="/static/images/vote/activity/gift/gift.png"/>
						<span style="display: inline-block; vertical-align:bottom;text-shadow: 2px 3px 5px #5d5d5d;">送礼物</span>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	
	<c:if test="${activity.guanzhu==0}">
		<div style="padding: 10px 10px 10px 10px; ">
			<div style="background-color:white; text-align: center;">
				<p style=" text-align:center; margin-bottom:0px;">长按二维码:请关注公众号后,投票</p>
				<img style="width: 50%;" src="${activity.erweima}" />
			</div>
		</div>
	</c:if>
	
	<div id="activity_content" class="activity_content" style="padding: 10px 10px 10px 10px;">
		<div style="border-left: 5px solid ${activity.color_}; border-radius: 0 2px 2px 0;background-color: #f2f2f2; padding: 10px 0px 10px 0px;">详情</div>
		${activityWork.content }
	</div>
	
	<div style="height: 100px;"></div>


<!-- 底部菜单 -->
<jsp:include page="/wap/vote/common/fixed_btm.jsp"/>
<jsp:include page="/wap/vote/common/check_openid.jsp"/>


<!-- 窗口组件 -->
<jsp:include page="/wap/vote/activity/work/work_window.jsp"/>
<!-- 窗口组件 -->


</div>
</body>
</html>