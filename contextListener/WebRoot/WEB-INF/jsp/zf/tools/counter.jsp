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
<script type="text/javascript" src="wj-static/js/react.min.js"></script>
<script type="text/javascript" src="wj-static/js/counter.js"></script>
<script src="wj-static/js/datepick/laydate.js"></script>
<style type="text/css">
	.main .title{
		margin-top: 20px;
   		font-size: 20px;
   		font-weight:bold;
   		color:#666;
	}
	.user-input ul li{
		margin-top: 10px;
	}
	.user-input label{
	    display: inline-block;
	    width: 85px;
	    height: 35px;
	    line-height: 35px;
	    font-size: 16px;
	    text-align: center;
	}
	.user-input input[type=text]{
		height: 35px;
	    width: 273px;
	    font-size: 16px;
	}
	.user-input ul li p {
		margin-left: 160px;
	}
	.user-input span{
		font-size: 16px;
	}
	.err-area{
		display: none;
		color:red;
		padding-left: 90px;
   		margin-top: 10px;	
	}
	.operate ul li{
		margin-top: 25px;
		padding-left: 50px;
	}
	.operate input[type=button]{
	    height: 45px;
	    width: 185px;
	    border: 0;
	    font-size: 20px;
        background-color: #fff;
	}
	.operate input[type=button].re{
	    border: 3px solid #909090;
	    font-weight: bold;
	}
	.operate input[type=button].re:hover{
	    background-color: #666;
	    color:#fff;
	}
	.operate input[type=button].counter{
	    border: 3px solid #EB9641;
	    background-color: #EB9641;
	    color:#fff;
	    font-weight: bold;
	}
	.operate input[type=button].counter:hover{
	    background-color: #D6841E;
	    color:#fff;
	}
	.result-table{
		width: 100%;
	}
	.result-table table{
		width: 100%;
		line-height: 50px;
		margin-top: 20px;
	}
	.result-table table tr{
		border-top: 1px solid #909090;
		border-bottom: 1px solid #909090;
	}
	.result-table table th{
		background: #fff;
		font-size: 16px;
		border-left: 1px solid #909090;
	}
	.result-table table td{
		background: #fff;
		font-size: 16px;
		text-align: center;
		border-left: 1px solid #909090;
	}
	.result-table table td:first-child{
		border-left: 0;
	}
	.result-table table th:first-child{
		border-left: 0;
	}
</style>
</head>
<body>
<%@include file="../public/top.jsp" %>
<div class="maibody">
	<div class="main">
		<h2 class="title">收益计算器</h2>
		<hr style="color:#909090;margin-bottom: 25px;">
		<div style="width:100%">
			<div style="width: 65%;float:left;" class="user-input">
				<ul>
					<li>
						<div style="display: block;">
							<p>
								<label>投资金额：</label>
								<input type="text" id="amount"/>
								<span>元</span>
							</p>
							<p class="err-area"></p>
						</div>
					</li>
					<li>
						<div style="display: block;">
							<p>
								<label>年化收益：</label>
								<input type="text" id="totalRate"/>
								<span>%</span>
							</p>
							<p class="err-area"></p>
						</div>
					</li>
					<li>
						<div style="display: block;">
							<p>
								<label>投资期限：</label>
								<input id="start" type="text" style="width: 101px;" class="laydate-icon"/>
								<span style="font-weight: bold;margin: 0 10px;">-</span>
								<input id="end" type="text" style="width:101px;" class="laydate-icon"/>
							</p>
							<p class="err-area"></p>
						</div>
					</li>
				</ul>
			</div>
			<div style="width: 35%;float:right;" class="operate">
				<ul>
					<li>
						<div style="display: block;">
							<input type="button" class="re" value="重置">
						</div>
					</li>
					<li>
						<div style="display: block;">
							<input type="button" class="counter" value="开始计算">
						</div>
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="result-table">
			<h2 class="title">收益</h2>
			<div id="tt" style="width: 100%;display: none;text-align: center;font-size: 15px;margin-top: 15px;">
				<div style="width:25%;float:right;" id="totalAccrual">预计收益：400</div>
				<div style="width:25%;float:right;" id="days">计息天数：99</div>
				<div style="width:25%;float:right;" id="bb">起息日起：2015-01-01</div>
				<div style="width:25%" id="aa">投资金额：1000</div>
				<div class="clear"></div>
			</div>
			<table>
				<thead>
					<tr>
						<th>还款日期</th>
						<th>应收本息(元)</th>
						<th>应收利息(元)</th>
						<th>应收本金(元)</th>
					</tr>
				</thead>
				<tbody id="result-body">
					
				</tbody>
			</table>
		</div>
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

	!function() {
		laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
		var start = {
		    elem: '#start',
		    format: 'YYYY-MM-DD',
		    min: laydate.now(), //设定最小日期为当前日期
		    max: '2099-06-16', //最大日期
		    istime: false,
		    istoday: false,
		    choose: function(datas){
		         end.min = datas; //开始日选好后，重置结束日的最小日期
		         end.start = datas //将结束日的初始值设定为开始日
		    }
		};
		
		var end = {
		    elem: '#end',
		    format: 'YYYY-MM-DD',
		    min: laydate.now(),
		    max: '2099-06-16',
		    istime: false,
		    istoday: false,
		    choose: function(datas){
		        start.max = datas; //结束日选好后，充值开始日的最大日期
		    }
		};
		laydate(start);
		laydate(end);
	
	}();
</script>
</body>
</html>