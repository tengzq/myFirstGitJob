<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://lantouzi.com/css/dialog_style.css?v2">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>账房先生 - 专为账房打造的优质理财平台</title>
<meta name="keywords" content="账房先生,账房投资,懒理财,理财">
<meta name="description"
	content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、贝塔斯曼、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。">
<!-- 
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
 -->
<link rel="stylesheet" type="text/css" href="wj-static/css/reset.css">
<link rel="stylesheet" type="text/css" href="wj-static/css/layout.css">

<link rel="stylesheet" type="text/css" href="wj-static/css/record-common.css">
<link rel="stylesheet" type="text/css" href="wj-static/css/record.css">


<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<style>
.ll-notice {
	width: 600px;
	margin-top: 50px;
}

.ll-notice p {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="../public/top.jsp"%>
	<div id="main">
		<div id="bd" class="clearfix">
		        <%@ include file="../public/acc_left.jsp"%>
				<div class="maininfo alignright">
					<div class="my-page my-page-withdraw">
						<div class="my-mod my-withdraw">
							<div class="hd">
								<h2>我要提现</h2>
							</div>
							<c:choose>
								<c:when test="${pd.BANK_CARD==''||pd.BANK_CARD==null}">
									<div class="bd">
										<div class="unbindcard-tips">
											${pd.BANK_CARD}！还未绑定提现银行卡，<a href="myAccount/bindcard">立即绑定</a>才能提现
										</div>
										<div class="ll-notice">
											<p>推荐绑定以下14家银行的银行卡，到账更快捷。同时，在移动端可享受大额充值通道。</p>
											<p>分别为：中国银行，农业银行，中国工商银行，建设银行，招商银行，光大银行，华夏银行，平安银行，浦发银行，中信银行，兴业银行，中国邮政储蓄银行，广发银行，民生银行。</p>
										</div>

										<div class="withdraw-rules">
											<h4>提现说明：</h4>
											<p>1.每日仅限提现一笔，该笔提现操作免除手续费。</p>
											<p>2.如当日有过充值行为，则当日不可进行提现。</p>
											<p>3.充值未投资的金额，每日最多提现（提现上限）10000元；投资回本金额的提现不受影响。</p>
											<p>4.提现操作，大行T+1日完成，小行大于T+1日完成，均受节假日影响。</p>
											<p>5.最小提现金额为50元。</p>
											<p>6.提现银行卡姓名应与实名认证身份一致，才可提现。</p>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="bd">
										<div class="withdraw-tips" style="display:none"></div>
										<p class="available-balance-tips">
											可提额度： <em class="highlight"><span>${pd.BALANCE }</span></em>元
										</p>
										<p style="color:#666">（注：当日充值金额不可提现，充值未投资金额每日仅可提现10000元 ）
										</p>
										<form id="withdraw-form" class="form my-form">
											<input type="hidden" id="now-amount" value="${pd.BALANCE }">
											<ul>
												<li class="form-field"><span class="f-k">输入提现金额：</span>
													<span class="f-v"> <input type="text" name="amount"
														id="amount" autocomplete="off" style="width:203px;">元
												</span> <span class="f-e valid-amount-em"> <em></em>
												</span></li>
											</ul>
											<button type="button" class="btn btn-1 tongji"
												style="margin:20px 98px" data-category="立即提现"
												data-label="withdraw">立即提现</button>
										</form>
										<div class="ll-notice">
											<p>如您的银行卡，已在账房先生的移动端使用过连连支付进行充值，更换或解绑请联系客服。</p>
										</div>

										<div class="withdraw-rules">
											<h4>提现说明：</h4>
											<p>1.每日仅限提现一笔，该笔提现操作免除手续费。</p>
											<p>2.如当日有过充值行为，则当日不可进行提现。</p>
											<p>3.充值未投资的金额，每日最多提现（提现上限）10000元；投资回本金额的提现不受影响。</p>
											<p>4.提现操作，大行T+1日完成，小行大于T+1日完成，均受节假日影响。</p>
											<p>5.最小提现金额为50元。</p>
											<p>6.提现银行卡姓名应与实名认证身份一致，才可提现。</p>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<script type="text/javascript">
						$(document)
								.ready(
										function() {
											var nowAmount = parseInt($(
													'#now-amount').val()), $amount = $('#amount'), $amountValidEm = $('.valid-amount-em>em'), numberFormat = $.Utils.numberFormat;
											/*下面两个值单位元*/
											var WITHDRAW_MIN = 50, WITHDRAW_MAX = $(
													"#now-amount").val();
											/* WITHDRAW_MAX = Math.min(nowAmount, 1000000000) / 100; */
											function ckAmount() {
												var amountVal = $amount.val();
												if (!$.trim(amountVal)) {
													return true;
												}
												if (!/^\d+(\.\d{1,2})?$/
														.test(amountVal)) {
													$amountValidEm
															.text('金额格式错误！');
													return false;
												}
												var amount = parseFloat(amountVal) * 100;
												if (amount < WITHDRAW_MIN * 100) {
													$amountValidEm
															.text('最小提现金额为'
																	+ WITHDRAW_MIN
																	+ '元');
													return false;
												} else if (amount > WITHDRAW_MAX * 100) {
													$amountValidEm
															.text('您最大可提现金额为'
																	+ WITHDRAW_MAX
																	+ '元');
													return false;
												} else {
													$amountValidEm.text('');
													return true;
												}
											}
											$amount.on('keyup', function() {
												ckAmount();
											});

											$('.btn-1')
													.on(
															'click',
															function(e) {
																if (!$amount
																		.val()) {
																	$amountValidEm
																			.text('请输入提现金额');
																	e
																			.preventDefault();
																	return;
																}
																if (!ckAmount()) {
																	e
																			.preventDefault();
																	return;
																}
																if (ckAmount()) {
																	$
																			.ajax({
																				url : 'drawcash/submitDrawCash',
																				type : 'post',
																				data : {
																					amount : $(
																							"#amount")
																							.val()
																				},
																				async : false,
																				dataType : 'json',
																				success : function(
																						data) {
																					if (data.msg == "tologin") {
																						window.location.href = "login_toZfLogin";
																					}
																					if (data.msg == "faild") {
																						swal(
																								{
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
																								function(
																										isConfirm) {
																									if (isConfirm) {
																										window.location.href = "myAccount/draw_cash";
																									} else {
																										window.location.href = "myAccount/list";
																									}
																								});
																					}
																					if (data.msg == "success") {
																						swal(
																								{
																									title : "提现成功",
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
																										window.location.href = "myAccount/draw_cash";
																									} else {
																										window.location.href = "myAccount/list";
																									}
																								});
																					}
																				}
																			});
																}
															});

										});
					</script>
				</div>
				
			</div>
		</div>
		<%@ include file="../public/foot.jsp"%>

</body>
</html>