<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<!--<![endif]-->
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>万金先生 - 提现</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>

<link rel="stylesheet" type="text/css" href="wj-static/css/reset.css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="wj-static/css/layout.css">
<link rel="stylesheet" type="text/css" href="wj-static/css/recharge.css">
<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<style type="text/css">
.drawcash ul li:first-child {
	margin: 25px 0 15px 0;
}

.drawcash ul li:first-child input {
	height: 25px;
	margin-right: 10px;
}

.drawcash ul li .btn.btn-1 {
	margin-left: 15%;
	background-color: #2e9dd0;
	border: 0;
	color: #fff;
	font-family: "微软雅黑", "Microsoft YaHei";
	height: 40px;
	font-size: 16px;
	width: 170px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<%@ include file="../public/top.jsp"%>
	<div id="main">
		<div class="mainbody main">
			<%@include file="../public/acc_left.jsp"%>
			<div class="content">
				<div class="gerenxinxi woyaochongzhi">
					<h3>
						<span>我要提现</span>
					</h3>
					<div class="con">
						<div class="drawrecord_nav" style="margin-top: 0;">
							<div class="my-ac-tx-balance mt0 clearfix">
								可用余额：<span class="my-ac-balanceNum">${sessionScope.sessionZfUser.BALANCE}</span>元
							</div>
							<p class="c39a1ea my-ac-txs-gx">恭喜您，已成功提交提现申请！</p>
							<div style="margin: 0 9px 0 9px;">
								<table ellpadding="0" cellspacing="0" namee="drawrecord_table" id="drawrecord_table">
									<tbody>
										<tr>
											<th>提现金额</th>
											<th>到账金额</th>
											<th>提交时间</th>
											<th>预计到账时间</th>
											<th>状态</th>
										</tr>
										<c:forEach items="${drawcashList}" var="dc">
											<tr>
												<td>¥${dc.amount}</td>
												<td>¥${dc.amount-2}</td>
												<td>${dc.create_date}</td>
												<td>${dc.pre_date} 24点之前</td>
												<td>
													<c:if test="${dc.status==1}">
														待处理
													</c:if>
													<c:if test="${dc.status==2}">
														处理中
													</c:if>
													<c:if test="${dc.status==3}">
														已完成
													</c:if>
													<c:if test="${dc.status==4}">
														失败
													</c:if>
												</td>
											</tr>
										</c:forEach>
										<c:if test="${empty drawcashList}">
											<tr>
												<td colspan="10">尚无提现申请</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<p class="txc mt15" style="font-size:13px;">
									<!-- <a href="##" class="c39a1ea my-ac-txs-op">查看提现记录</a> --><a href="myAccount/list" class="c39a1ea my-ac-txs-op my-ac-txs-opz" style="border-left: 0">返回我的账户</a><a class="c39a1ea my-ac-txs-op" href="myAccount/draw_cash">继续提现</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript">
	/* $(function(){
		//replace手机号
		console.log('replace mobile');
		var mobile = '${sessionScope.sessionZfUser.TEL}';
		mobile = mobile.replace(/(\d{3})\d{4}(\d{4})/,'$1****$2');
		console.log(mobile);
	}) */


	$(function() {
		$('.bind').on("click",function(){
		$.ajax({
			type:'post',
			url:'myAccount/addBindAjax',
			data : {},
			async : false,
			dataType : 'json',
			success : function(data) {
				if (data.msg == "nobind") {
					swal("已申请", "申请已提交请耐心等待", "error");
				}
				if (data.msg == "success") {
					window.location.href = getRootPath()+"/myAccount/addBind";
					return;
				}
				if(data.msg=='nologin'){
					window.location.href = getRootPath()+"/login_toZfLogin";
					return;
				}
			}
		});
	});

	<%--
		var nowAmount = parseInt($('#now-amount').val()), 
			$amount = $('#amount'), 
			$amountValidEm = $('.valid-amount-em>em')
		/*下面两个值单位元*/
		var WITHDRAW_MIN = 50, WITHDRAW_MAX = $("#now-amount").val();
		/* WITHDRAW_MAX = Math.min(nowAmount, 1000000000) / 100; */
		function ckAmount() {
			var amountVal = $amount.val();
			if (!$.trim(amountVal)) {
				return true;
			}
			if (!/^\d+(\.\d{1,2})?$/.test(amountVal)) {
				$amountValidEm.text('金额格式错误！');
				return false;
			}
			var amount = parseFloat(amountVal) * 100;
			if (amount < WITHDRAW_MIN * 100) {
				$amountValidEm.text('最小提现金额为'+ WITHDRAW_MIN+ '元');
				return false;
			} else if (amount > WITHDRAW_MAX * 100) {
				$amountValidEm.text('您最大可提现金额为'+ WITHDRAW_MAX+ '元');
				return false;
			} else {
				$amountValidEm.text('');
				return true;
			}
		}
		$amount.on('keyup', function() {
			ckAmount();
		});

		$('.btn-1').on('click',function(e) {
				if (!$amount.val()) {
					$amountValidEm.text('请输入提现金额');
					e.preventDefault();
					return;
				}
				if (!ckAmount()) {
					e.preventDefault();
					return;
				}
				if (ckAmount()) {
					$.ajax({
						url : 'drawcash/submitDrawCash',
						type : 'post',
						data : {amount : $("#amount").val()},
						async : false,
						dataType : 'json',
						success : function(data) {
							if (data.msg == "tologin") {
								window.location.href = getRootPath()+"/login_toZfLogin";
							}
							if (data.msg == "faild") {
								swal({
									title : "提现失败",
									text : "是否继续提现？",
									type : "error",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "是,继续提现",
									cancelButtonText : "不,返回账户",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(isConfirm) {
									if (isConfirm) {
										window.location.href = getRootPath()+"/myAccount/draw_cash";
									} else {
										window.location.href = getRootPath()+"/myAccount/list";
									}
								});
							}
							if (data.msg == "success") {
								swal({
									title : "申请成功，请等待审核",
									text : "是否继续提现？",
									type : "success",
									showCancelButton : true,
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "是,继续提现",
									cancelButtonText : "不,返回账户",
									closeOnConfirm : false,
									closeOnCancel : false
								},
								function(
										isConfirm) {
									if (isConfirm) {
										window.location.href = getRootPath()+"/myAccount/draw_cash";
									} else {
										window.location.href = getRootPath()+"/myAccount/list";
									}
								});
							}
					}
				});
			}
		});
});
--%>
</script>

	<%@ include file="../public/foot.jsp"%>
	<script type="text/javascript" src="wj-static/js/drawcash.js"></script>
</body>
</html>