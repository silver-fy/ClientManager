<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 开启高速模式    -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<!-- 开启高速模式 -->

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL -->

<!-- 加入移动布局 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
<!-- 加入移动布局 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--添加layer移动  弹出窗口的 插件支持-->
<script src="${pageContext.request.contextPath}/static/layer_mobile/layer.js"></script>
<!--添加layer移动  弹出窗口的 插件支持-->

<!--添加  jq  支持加载-->
<script	src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!--添加 jq 支持加载-->
<title></title>
</head>

<script type="text/javascript" charset="utf-8">
$(function(){
	layer.open({
	    type: 2
	    ,content: ' '
	    ,shadeClose:false
	});
	
	var guanzhu = window.localStorage.getItem("guanzhu");
	var activityId = window.localStorage.getItem("activityId");
	
	if(guanzhu==1){
		//设置此openid 为关注 用户
		$.post('/admin/activity/user/guanzhu', {activityId:activityId}, function(result) {
			if(result.success){
				 //提示
				  layer.open({
				    content: '感谢关注我们!'
				    ,skin: 'msg'
				    ,time: 2 //2秒后自动关闭
				  });
				window.localStorage.setItem("guanzhu", 0);
			}
		}, 'json');
	}
	
	//从缓存中取出跳转url
	var jumpURL =  window.sessionStorage.getItem("jumpURL");
	if(jumpURL){
		window.sessionStorage.setItem("jumpURL",null);
		window.location.href= jumpURL ;
	}else{
		window.location.href= "/wap/activity/${activityId}" ;
	}
	
});

</script>

<body>

</body>
</html>