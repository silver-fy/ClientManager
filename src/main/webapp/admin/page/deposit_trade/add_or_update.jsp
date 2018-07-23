<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL -->

${config.headStr}

${config.layuiStr}

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no" />

<!--添加  vue.js 支持加载-->
<script src="${pageContext.request.contextPath}/static/vue/vue.min.js"></script>
<!--添加  vue.js 支持加载-->

<style>
html, body {
}
.layui-form-item {
	margin-bottom: 3px;
}
</style>

<script>
var save_url = '${save_url}';


function save() {
	var index = layer.load(1, {
		shade : [ 0.1, '#fff' ]
	});
	
	$.post(save_url, {
		clientId : '${clientId}',type : '${type}',
		actual:app.actual,money:app.money,remark:app.remark,discounts:app.discounts,
	}, function(result) {
		if (result.success) {
			window.parent.closeDlg(result.msg);
		} else {
			layer.msg(result.msg);
		}
	}, 'json');
}

</script>

</head>
<body id="app">
	<div style="padding: 10px; overflow: hidden;">
		<div class="layui-form layui-form-pane">
			
			<div class="layui-form-item">
				<label class="layui-form-label">客户姓名</label>
				<div class="layui-input-block">
					<input type="text" autocomplete="off"  disabled="disabled"value="${client.name }"   class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">客户手机</label>
				<div class="layui-input-block">
					<input type="text" autocomplete="off"  disabled="disabled" value="${client.phone }"   class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">卡余额</label>
				<div class="layui-input-block">
					<input type="text" autocomplete="off"  disabled="disabled"value="${client.balance }"   class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">实收金额</label>
				<div class="layui-input-block">
					<input type="text"   autocomplete="off"  v-model="actual"
						value=""  class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">优惠金额</label>
				<div class="layui-input-block">
					<input type="text"   autocomplete="off"  v-model="discounts" value=""  class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">储值金额</label>
				<div class="layui-input-block">
					<input type="text"   autocomplete="off"  v-model="money"	value=""   class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-block">
					<input type="text"   autocomplete="off"  v-model="remark"	value=""   class="layui-input">
				</div>
			</div>
		</div>

		
		<div class="site-demo-button" style="margin-top: 20px;">
			<button id="save" onclick="save()"
				class="layui-btn site-demo-layedit" data-type="content">${btn_text }</button>
		</div>
	</div>

<script>
	layui.use([ 'laydate', 'laypage', 'layer', 'table', 'carousel',
			'upload', 'element' ], function() {
		var laydate = layui.laydate //日期
		, laypage = layui.laypage //分页
		layer = layui.layer //弹层
		, table = layui.table //表格
		, carousel = layui.carousel //轮播
		, upload = layui.upload //上传
		, element = layui.element; //元素操作
	});
</script>

<script>
var app = new Vue({
	el : '#app',
	data : {
	}
});
</script>

</body>
</html>