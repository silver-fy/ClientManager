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

<!--添加index.css-->
<link href="${pageContext.request.contextPath}/static/common/base/index.css" rel="stylesheet"/>
<!--添加index.css-->

<!--添加  js api-->
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<!--添加  js api-->

<!--添加  微信分享js 自己扩展的  -->
<script src="${pageContext.request.contextPath}/static/weixin_js/weixin_share.js"></script>
<!--添加  微信分享js 自己扩展的  -->

<title>留言板 - ${config.domain_title}</title>
<style type="text/css">
.my_list{
	position: relative;
	margin-top: 0;
	margin-bottom: 0;
	padding-left: 0;
	list-style: none;
	background-color: #fff;
}
.my_list:before {
	position: absolute;
	right: 0;
	left: 0;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: #c8c7cc;
	top: -1px;
}
.my_list:after {
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
.my_list_item{
	position: relative;
	padding: 10px 10px 10px 10px;
}

.my_list_item:after {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 15px;
	height: 1px;
	content: '';
	-webkit-transform: scaleY(.5);
	transform: scaleY(.5);
	background-color: #c8c7cc;
}
</style>


</head>
<script type="text/javascript" charset="utf-8">

var share_url;//分享连接
var share_img_url;//分享图标
var share_title= "留言板 - ${config.domain_title}";//分享标题
var share_desc = "${config.desc_}";//分享摘要

mui.init();

//这里需要 添加输入 框的监听  如果有焦点了。把下面菜单 隐藏
$(function() {
	
	//分享连接
	var host = document.domain; 
	share_url = window.location.href;
	share_img_url = 'http://'+host+'${config.wx_share_img}';
	weixin_share();
	//分享连接
});

function sub(){
	var nickName = $("#nickName").val();
	var content = $("#content").val();
	
	if(nickName.length<1){layer.closeAll();
		layer.open({content: '请填写昵称',skin: 'msg',time: 2});
		return;
	}
	if(content.length<3){layer.closeAll();
		layer.open({content: '请填写留言内容',skin: 'msg',time: 2});
		return;
	}
	
	$.post("/admin/message/add",{nickName:nickName,content:content,openid:openid},function(result){
		if(result.success){
			layer.closeAll();
			  //询问框
			  layer.open({
			    content: '提交成功,管理员审核后,即可显示'
			    ,btn: ['好', '我知道了']
			    ,yes: function(index){
			    	location.replace(location.href);
			    }
			    ,no: function(index){
			    	location.replace(location.href);
			    }
			  });
		}else{
			layer.closeAll(); 
			layer.open({ content: '提交失败' ,skin: 'msg',time: 2   });
		}
	},'json');
}

</script>

<body>
<div class="mui-content">
		
		<div class="my_list" style="margin-top: 6px;">
			
			<div class="my_list_item">
				<div style=" display: flex;display: -webkit-flex;">
					<div style="width: 50px; line-height: 38px;">
						昵称
					</div>
					<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
						<input type="text" id="nickName"  class="mui-input-clear" style="margin-bottom: 0px"  placeholder="昵称【选填】">
					</div>
				</div>
			</div>
			
			<div class="my_list_item">
				<div style=" display: flex;display: -webkit-flex;">
					<div style="width: 75px; line-height: 113px;">
						留言内容
					</div>
					<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
						<textarea id="content" rows="5" placeholder="留言内容【必填】"></textarea>
					</div>
				</div>
			</div>
		</div>
		
		<div style=" margin-bottom: 30px;">
			<button type="button" onclick="sub()" style="margin-bottom: 0px; padding-bottom: 5px; padding-top: 5px;" class="mui-btn mui-btn-success mui-btn-block">提交</button>
		</div>
		
		<div style="text-align: center; color: #8f8f94; ">朋友留言</div>
		
		<div class="my_list" style="margin-top: 6px;  background-color:#EFEFF4; ">
			
			<c:forEach var="msg" items="${messageList}" >
				<div class="my_list_item">
					<div style=" display: flex;display: -webkit-flex;">
						<div style="width: 45px; ">
							<img alt="" width="100%" src="/static/images/base/default_head_img.jpg" />
						</div>
						
						<div style="flex:1;-webkit-flex:1; padding-left: 10px;">
							<div style="color: #666;">${msg.nickName }</div>
							<div>${msg.content }</div>
							<div style="font-size: 13px; color: #B1B1B1;margin-top: 10px;"><fmt:formatDate value="${msg.createDateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
		
		
		
		
</div>


<!-- 验证openid 插件 -->
<jsp:include page="/wap/common/check_openid.jsp"/>
<!-- 验证openid 插件  -->

</body>
</html>