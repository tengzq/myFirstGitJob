<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>

<meta name="renderer" content="webkit">

<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>

<style type="text/css">
	.main .title{
		margin-top: 20px;
   		font-size: 20px;
   		font-weight:bold;
   		color:#666;
	}
	.rate-table{
		width: 100%;
		text-align: center;
		line-height: 35px;
		font-size: 14px;
		margin-top: 25px;
	}
	.rate-table thead th{
		font-size: 15px;
	}
	.rate-table th,td{
		border:1px solid #909090;
	}
</style>
</head>
<body>
<%@include file="../public/top.jsp" %>
<div class="maibody">
	<div class="main">
		<h2 class="title">利率表</h2>
		<hr style="color:#909090">
		<table class="rate-table">
			<thead>
				<tr>
					<th colspan="3">储蓄方式</th>
					<th>利率</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">活期</td>
					<td>0.35</td>
				</tr>
				<tr>
					<td rowspan="6">整存整取</td>
					<td colspan="2">3个月</td>
					<td>1.35</td>
				</tr>
				<tr>
					<td colspan="2">6个月</td>
					<td>1.55</td>
				</tr>
				<tr>
					<td colspan="2">一年</td>
					<td>1.75</td>
				</tr>
				<tr>
					<td colspan="2">二年</td>
					<td>2.35</td>
				</tr>
				<tr>
					<td colspan="2">三年</td>
					<td>3.00</td>
				</tr>
				<tr>
					<td colspan="2">五年</td>
					<td>--</td>
				</tr>
				<tr>
					<td rowspan="3">零存整取 整存零取 存本取息</td>
					<td colspan="2">一年</td>
					<td>1.35</td>
				</tr>
				<tr>
					<td colspan="2">三年</td>
					<td>1.35</td>
				</tr>
				<tr>
					<td colspan="2">五年</td>
					<td>--</td>
				</tr>
				<tr>
					<td colspan="3">协定存款</td>
					<td>1.15</td>
				</tr>
				<tr>
					<td colspan="3">一天通知存款</td>
					<td>0.80</td>
				</tr>
				<tr>
					<td colspan="3">七天通知存款</td>
					<td>1.35</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
<script type="text/javascript">
<%-- $(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=4");
	val_array.push("WEB_OR_MOBILE=1");
	val_array.push("RANDOM_CODE="+randomCode);
	$.ajax({
	   type: "post",
	   url: "<%=basePath%>register/viewlog",
	   data: val_array.join('&'),
	   success: function(data){}
	 });
}); --%>
	
	
</script>
</body>
</html>