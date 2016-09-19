<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>账房先生 - 专为账房打造的优质理财平台</title>
<meta name="keywords" content="账房先生,账房投资,懒理财,理财">
<meta name="description"
	content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、贝塔斯曼、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。">
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<meta name="renderer" content="webkit">
<script src="jingtai/js/hm.js"></script>
<script type="text/javascript" src="jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="jingtai/js/seed.min.js"></script>
<link rel="stylesheet" type="text/css" href="jingtai/css/my.css">

<script src="jingtai/js/PagerView.js"></script>
<link rel="stylesheet" type="text/css" href="jingtai/css/sweetalert.css">
<script src="jingtai/js/sweetalert.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="doc">
		<style>
.nav a i {
	display: block;
	position: absolute;
	width: 36px;
	height: 16px;
	line-height: 16px;
	color: #fff;
	background: #ff7744;
	border-radius: 5px;
	top: 50%;
	margin-top: -20px;
	left: 50%;
	margin-left: 38px;
	text-align: center;
	font-style: normal;
	font-size: 12px;
}
</style>
		<%@ include file="../public/top.jsp"%>
		<div id="bd">
			<div class="content clearfix">
				<div class="main alignright">
					<div class="my-page my-page-recharge">
						<div class="my-mod my-recharge">
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active"><a data-toggle="tab" href="#home">网银充值
									</a></li>

									<li><a data-toggle="tab" href="#profile">银行转账</a></li>
								</ul>

								<div class="tab-content">
									<div class="bd tab-pane in active" id="home">
										<p class="available-balance-tips">
											账户可用余额：<em class="highlight"><span>${pd.BALANCE }</span></em>元
										</p>
										<p style="color:#666">（注：项目起投金额为100的整数倍）</p>
										<form id="rechrage-form" class="form my-form">
											<input type="hidden" id="now-amount" value="0"> 	
											<ul>
												<li class="form-field"><span class="f-k">输入充值金额：</span>
													<span class="f-v"> <input type="text" name="amount"
														id="amount" autocomplete="off" style="width:203px;" value="">元
												</span> <span class="f-e valid-amount-em"
													style="clear:left;margin-left:100px;height:42px;"> <em
														style="background-position:-380px -298px;"></em>
												</span> <span class="f-t" style="margin-left:98px;">充值金额：<em
														id="ret-amount"><span>0.00</span></em>元
												</span></li>
											</ul>
											<button type="button" class="btn tongji"
												style="margin:20px 100px" data-category="立即充值"
												data-label="recharge">立即充值</button>
										</form>
										<div>${msg }</div>
										<div class="withdraw-rules">
											<h4>充值说明：</h4>
											<p>1.当日充值金额不可提现，充值未投资金额每日仅可提现10000元。</p>
											<p>2.账房先生严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、
												冻结账户、永久停止服务，并会影响银行征信记录。</p>
											<p>3.开启自动投标后，充值金额会在次日零点加入自动投标。</p>
										</div>
									</div>

									<div id="profile" class="tab-pane">
										<div class="withdraw-rules" style="margin-top:20px;">
											<h4 style="color: red;">直接转账汇款说明：</h4>
											<p>1.您在银行转账成功后，在下方填写提交充值申请，受理后到账。</p>
											<p>
												2.如果您是"<label style="color: red;">现金充值</label>"，需凭银行交易流水号来此提交申请，请保留银行回单。
											</p>
											<p>3.充值受理时间，每天9:00-22:00，建议您再次时间段内提交充值申请，否则其他时间段内提交充值申请会延后受理，如有其它问题请联系我们：XXXXXX。</p>
										</div>
										<form class="form my-form" method="post" id="shenqingfrom"
											action="myAccount/moneyOrderReques" target="_blank"
											style="margin-top:20px;">
											<input type="hidden" name="MONEY_ORDER_METHOD"
												id="MONEY_ORDER_METHOD">
											<ul>
												<li class="form-field"><span class="f-k">贷账号：<input
														name="MONEY_ORDER_TO" readonly="readonly" value="1223456"
														style="border: none;"></span></li>
												<li class="form-field"><span class="f-k">账户名：XXX公司</span>
												</li>
												<li class="form-field"><span class="f-k">开户行：XXX</span>
												</li>
												<li class="form-field"><span class="f-v"> 汇款日期：<input
														type="text" id="MONEY_ORDER_DATE" name="MONEY_ORDER_DATE"
														autocomplete="off" style="width:203px;">银行汇款时间
												</span></li>
												<li class="form-field"><span class="f-v"> 汇款金额：<input
														type="text" id="MONEY_ORDER_NUM" name="MONEY_ORDER_NUM"
														autocomplete="off" style="width:203px;"
														onkeyup="dokeyup();">货币为人民币，格式如100.00
												</span> <span id="moneyNum" style="display: none"></span></li>
												<li class="form-field"><span class="f-v"> 汇出行：<input
														type="text" id="MONEY_ORDER_BANK" name="MONEY_ORDER_BANK"
														autocomplete="off" style="width:203px;">
												</span></li>
												<li class="form-field"><span class="f-k"> 汇款方式：<input
														type="radio" name="huikuan" value="1" checked="checked">银行卡转账
														<input type="radio" name="huikuan" value="2">现金汇款
												</span></li>
												<div id="bankCard">
													<ul>
														<li class="form-field"><span class="f-v">
																汇款账户：<input type="text" id="MONEY_ORDER_FROM"
																name="MONEY_ORDER_FROM" autocomplete="off"
																style="width:203px;">
														</span></li>
													</ul>
												</div>
												<div id="xianjin" style="display: none">
													<ul>
														<li><span class="f-v"> 交易流水号：<input
																type="text" id="MONEY_ORDER_BATCH"
																name="MONEY_ORDER_BATCH" autocomplete="off"
																style="width:203px;">
														</span></li>
													</ul>
												</div>
												<li class="form-field"><span class="f-v"> 说明：<input
														type="text" id="MARK" name="MARK" style="width:203px;"
														placeholder="您的姓名">
												</span></li>
												<li><span class="spanmsg"
													style="color: red; display: none"> </span></li>
											</ul>
											<button type="button" id="apply"
												style="width: 100px;height: 30px; background-color:red; margin-top: 50px;border: none;color: white;"
												data-category="提交申请">提交</button>
											<button type="reset"
												style="width: 100px;height: 30px;margin-top: 50px">重置</button>
										</form>
										<div
											style="height: 40px;width: 100%; background-color:fuchsia;  padding-top: 15px;font-size: 18px; margin-top: 30px;">
											信用卡充值套现客户一律按原路返回处理，产生手续费、提现费一切有客户承担</div>
										<div class="withdraw-rules">
											<h4>温馨提示：</h4>
											<p>问：充值到账是什么时候？</p>
											<p>答：在线充值和礼品卡充值即时到账，线下充值以银行到账时间为准，每天9:00-22:00受理。</p>
											<p>问：充值的手续费如何收取？</p>
											<p>
												答：线上充值：充值金额*0.3%,投资用户充值免手续费；</br>线下转账汇款：具体费用以银行实际扣费为准。
											</p>
											<p>充值过程中出现什么问题，请到帮助中心查看，或拨打XXX热线。</p>
										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
					<script type="text/javascript">
						//是否为企业用户
						var IS_TYPE_CORP = Boolean(0);

						$(document).ready(function() {
							var nowAmount = parseInt($('#now-amount').val()), 
							$amount = $('#amount'), 
							$retMount = $('#ret-amount'), 
							$amountValidEm = $('.valid-amount-em>em');
							$amount.on('keyup',function() {
								if(ckAmount()){
									$retMount.find("span").text($amount.val());
								}
								
							}).on('blur',ckAmount).focus();
							function ckAmount() {
								var amountVal = $amount.val();
								if (!$.trim(amountVal)) {
									return true;
								}
								if (!/^\d+(\.\d{1,2})?$/.test(amountVal)) {
									$amountValidEm.text( '金额格式输入错误');
									return false;
								}
								var amount = parseFloat(amountVal) * 100;
								if (amount < 0|| (!IS_TYPE_CORP && amount > 100000000)) {
									$amountValidEm.text('金额输入错误');
									return false;
								}
								return true;
							}
							seed.use('dialog',function() {
								var dialogPay = new $.ui.Dialog(document,{
									elem : $('#dialog-tmpl').html(),
									height : '300px',
									drag : false,
									fixed : true,
									overlay : true,
									lock : true,
									trigger : 'submit2yeepay'
								});
								$(document).on('click','.ecope_dialog .close-btn,.ecope_dialog .close',function(e) {
									e.preventDefault();
									dialogPay.close();
								});
							});

							$('.tongji').on('click',function(e) {
								if ($amount.val() == "") {
									$amountValidEm.text('请输入金额');
									return;
								}
								
								if (!ckAmount()) {
									e.preventDefault();
									return;
								}
								$.ajax({
									url : 'recharge/submitRecharge',
									type : 'post',
									data : {amount : $amount.val()},
									async : false,
									dataType : 'json',
									success : function(data) {
										if (data.msg == 'tologin') {
											window.location.href = "login_toZfLogin";
										}
										if (data.msg == "faild") {
											swal({   
												title: "充值失败",   
												text: "是否继续充值？",  
												type: "error",   
												showCancelButton: true,   
												confirmButtonColor: "#DD6B55",   
												confirmButtonText: "是,继续充值",  
												cancelButtonText: "不,返回账户",   
												closeOnConfirm: false,   
												closeOnCancel: false 
												}, 
											function(isConfirm){   
												if (isConfirm) {     
													window.location.href = "myAccount/recharge";   
												} else {     
													window.location.href="myAccount/list";   
												}
											});
										}
										if(data.msg=="bindcard"){
											window.location.href = "myAccount/bindcard";
										}
										window.location.href = data.msg;
									}
								});

							});
						});

						(function() {
							$("input[name=huikuan]").click(function() {
								showCont();
							});

							$("#apply").on("click",function() {
								$("#MONEY_ORDER_METHOD").val($("input[name=huikuan]:checked").val());
								if ($("#MONEY_ORDER_DATE").val() == ""|| $("#MONEY_ORDER_NUM").val() == ""|| $("#MONEY_ORDER_METHOD").val() == ""|| $("#MARK").val() == ""|| $("#MONEY_ORDER_BANK").val() == "") {
									$(".spanmsg").show().text("更正填写信息，不能为空");
									return false;
								}
								if (($("#bankCard").css("display") == "block" && $("#MONEY_ORDER_FROM").val() != "")|| ($("#xianjin").css("display") == "block" && $("#MONEY_ORDER_BATCH").val() != "")&& dokeyup()) {
									$("#shenqingfrom").submit();
								} else return false;

							});
						})();
						function showCont() {
							switch ($("input[name=huikuan]:checked").val()) {
							case '1':
								$("#bankCard").show();
								$("#xianjin").hide();
								break;
							case '2':
								$("#bankCard").hide();
								$("#xianjin").show();
								break;
							}
						}
						function dokeyup() {
							if (!/^\d+(\.\d{1,2})?$/.test($("#MONEY_ORDER_NUM").val())) {
								$("#moneyNum").show().text("金额格式输入错误");
								return false;
							} else {
								return true;
							}
						}
					</script>
				</div>
				<%@ include file="../public/acc_left.jsp"%>
			</div>
		</div>
		<%@ include file="../public/foot.jsp"%>
		<script type="text/javascript">
			var LINKS = [ {
				'name' : '网贷之家',
				'url' : 'http://www.wangdaizhijia.com/'
			}, {
				'name' : '网贷联盟网',
				'url' : 'http://www.wdlm.cn/'
			}, {
				'name' : '网贷天眼',
				'url' : 'http://www.p2peye.com/'
			}, {
				'name' : '融途网',
				'url' : 'http://www.erongtu.com/'
			}, {
				'name' : '理财114',
				'url' : 'http://www.licai114.com/'
			}, {
				'name' : 'P2P理财',
				'url' : 'http://www.dianpifa.com'
			} ];
		</script>
	</div>


	<iframe src="jingtais/cm.htm" scrolling="no" width="1" height="1"
		style="display: none;"></iframe>
</body>
</html>