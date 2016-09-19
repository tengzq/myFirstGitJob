<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html class="no-js">

<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<title>万金先生 - 推荐有奖</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="wj-static/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="wj-static/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="wj-static/css/yaoqing.css" />
	<link rel="stylesheet" type="text/css" href="wj-static/css/layout.css" />
	<script src="//modernizr.com/downloads/modernizr-latest.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="wj-static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="wj-static/js/layout.js"></script>
</head>

<body>
	<!-- <header style="text-align: center;padding: 20px;">顶部通用，在此忽略</header> -->
	<%@include file="../public/top.jsp" %>

	<div id="body">

		<div class="banner">
			<a href="myAccount/userinvite?INVITE_ME=${pd.INVITE_ME }">开启万金生活</a>
		</div>

		<div class="r1">
			<div class="page">
				<div class="fl flow">
					
					<span>点击上方“申请参与”</span>
					<span>进入账户页生成推广链接</span>
					<span>坐等奖励发放</span>
					<span>成功邀请好友</span>
					<span>参与流程是什么样的？</span>
				</div>
				<div class="fr which">
					<h3>为什么放心推荐给好友？</h3>
					<p>来自500强企业的优质资产，银行千亿级授信企业</p>
					<p>期限灵活多样，安全稳定，最高收益20%</p>
					<p>逾期就赔，风险备用金账户随时待命</p>
				</div>
			</div>
		</div>
		
		<!-- <div style="background:url();"></div> -->
		<div class="r2">
			<div class="page">
				<div class="title" style="display:none">
					<h3>邀请好友注册首投，每邀请一位最高返<span style="color:#ffac00;">40元</span> </h3>
					<div class="sbicon">
						<span>40元</span>
					</div>
				</div>
				<div style="background:url('wj-static/images/publish_ticket.png');height:286px;margin-top:25px;display:none;"></div>
				<!-- <div class="jiangli">
					<h4><span>奖励一：</span>好友注册认证，你们都有奖！</h4>
					<div class="fl quan">
						<p><span class="orange-font">7</span>天内完成身份认证、手机绑定。您和好友各得</p>
						<p><sub>￥</sub>20</p>
						<p>投资优惠券</p>
					</div>
					<div class="fr quan">
						<p><span class="blue-font">8-30</span>天内完成身份认证、手机绑定。您和好友各得</p>
						<p><span>¥</span>10</p>
						<p>投资优惠券</p>
					</div>
				</div>
				<div class="jiangli">
					<h4><span>奖励二：</span>鼓励好友首次投资，再送您钱！</h4>
					<div class="fl quan quan2">
						<p>好友<span class="orange-font">7</span>天内首次投资，
							<br />奖励您</p>
						<p><sub>￥</sub>20</p>
						<p>投资优惠券</p>
					</div>
					<div class="fr quan quan2">
						<p>好友<span class="blue-font">8-30</span>天内首次投资，
							<br />奖励您</p>
						<p><span>¥</span>10</p>
						<p>投资优惠券</p>
					</div>
				</div>
			</div> -->
		</div>

		<div class="r3">
			<div class="page">
				<div class="title">
					<h3>好友投资，<span style="color:#FEB00F">提成您享 </span></h3>
					<div class="sbicon">
						<span>提成</span>
					</div>
				</div>
				<div class="r3-2">
					<!-- 您直接邀请的好友（一级）成功投资，您获得其投资金额的年化0.8.%的返现; 如该好友（一级）继续邀请好友（二级）加入，您可以获得对方投资金额的年化0.5%的返现;如该好友（二级）继续邀请好友（三级）加入，您可以获得对方投资金额的年化0.2%的返现; -->
					邀请码返现机制适用于纵向三级好友返现（最多年化1.5%现金返现），横向不限人数次数。（1.5% X N）
				</div>
				<div class="r3-3"></div>
			</div>
		</div>

		<div class="r4">
			<div class="page">
				<div class="title">
					<h3>呼朋唤壕友，<span style="color:#FEB00F">提成必须有 </span></h3>
					<div class="sbicon">
						<span>提成</span>
					</div>
				</div>
				<div class="r4-2">
					<p>
						您的累计投资
						<br>金额
					</p>
					<p>
						所有好友的累计
						<br>投资额
					</p>
					<div class="equal-1">超过<span>60w</span>，送两枚<span>1g金钞</span></div>
					<div class="equal-2">超过<span>80w</span>，送<span>5g金条</span></div>
					<div class="equal-3">超过<span>100w</span>，送<span>10g金条</span></div>
				</div>
			</div>
		</div>

	</div>

	<!-- <footer style="text-align: center;padding: 20px;">
	</footer> -->
	<%@include file="../public/foot.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			// 填充需要记录的数据
			var val_array = new Array();
			var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
			val_array.push("TYPE=1");
			val_array.push("VIEW_ID=3");
			val_array.push("WEB_OR_MOBILE=1");
			val_array.push("RANDOM_CODE="+randomCode);
			$.ajax({
			   type: "post",
			   url: "<%=basePath%>register/viewlog",
			   data: val_array.join('&'),
			   success: function(data){}
			 });
		});
	</script>
</body>

</html>