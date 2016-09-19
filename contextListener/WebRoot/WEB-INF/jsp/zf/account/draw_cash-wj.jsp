<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

.sms-active{
	-moz-box-shadow:2px 2px 2px #333333; 
	-webkit-box-shadow:2px 2px 2px #333333; 
	box-shadow:2px 2px 2px #333333;
	cursor : pointer;
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
						<div class="withdrawWrap bd_d5d5d5">
							<h3 class="clearfix">
								<span>可用余额：</span> <em>${sessionScope.sessionZfUser.BALANCE}</em> <span class="rmb">元</span>
							</h3>
							<!--表单-->
							<div class="withdrawFnBox">
								<div class="cardbox_nav clearfix">
					                <label>选择银行卡：</label>
					                <div class="wrap-card-item clearfix">
					                	<c:choose>
											<c:when test="${pd.BANK_CARD==''||pd.BANK_CARD==null}">
					                    <!--绑卡前-->
							                    <p style="margin: 0; width: 580px; height: 48px; border: solid 1px #bfcfe5; background: #f0f6f9;">
							                        <a class="cd-add addbank" href="javascript:void(0);">添加银行卡</a>
							                    </p>
							                 </c:when>
							                 <c:otherwise>
					                    <!--绑卡后-->
							                    <div class="cd-item-select cur" style="">
							                        <input type="radio" name="BankAccountId" id="BankAccountId" bverify="True" btype="1" bname="中国工商银行 尾号 4001" style="display: none;" value="622769" checked="checked">
							                        <div class="bank-logo clearfix">
							                        	<c:set value="${bankCardInfo.BANK_CODE}" var="bankCode"></c:set>
							                        	<c:set value="${bankCardInfo.BANK_CARD}" var="bankCard"></c:set>
							                            <img src="https://res.baofoo.com/gw/resource/images/yh/10${fn:substring(bankCode,2,fn:length(bankCode))}.jpg" alt="中国工商银行">尾号 ${fn:substring(bankCard,fn:length(bankCard)-4,fn:length(bankCard))}
							                        </div>
							                        <div class="cd-time clearfix">
							                            <span class="">工作日当天</span>
							                            <span>1-3工作日</span>
							                        </div>
							                        <a href="javascript:void(0);" id="removeBankCard" class="delete" bid="${bankCardInfo.BANK_CARD_ID}" style="float:right; padding-right:16px;">删除</a>
							                    </div>
					                   		</c:otherwise>
										</c:choose>
					                    <div class="choose-more clearfix">
					                    	<c:set value="${sessionScope.sessionZfUser.REAL_NAME}" var="REAL_NAME"></c:set>
					                        <em style="float: right;">*  银行卡必须为“<span id="userName">*${fn:substring(REAL_NAME,1,fn:length(REAL_NAME))}</span>”的借记卡，否则无法提现</em>
					                    </div>
					                </div>
					            </div>
								<div class="amount_nav clearfix">
									<label>提现金额：</label> <input type="text" id="Amount" placeholder="限额499,999元/次" maxlength="9"/> <span>元</span> 
									<!-- <em class="lineh ml20">（注：当日充值金额不可提现，充值未投资金额每日仅可提现10000元 ）</em> -->
								</div>
								<div class="paychannel_nav clearfix">
									<label>提现方式：</label>
									<div class="t1 current">
										1-3个工作日到账<span id="t1Msg">提现费用2元/笔</span>
									</div>
								</div>
								<div class="actual_account clearfix">
									<c:set value="<%=new Date() %>" var="currDate"></c:set>
									<label>实际到账：</label> <span> <em id="finallyDrawAmount">0.00</em>元，预计<em id="cashTime"><fmt:formatDate value="${currDate}" type="both"/></em> 24点前到账（因银行限制，双休日及法定节假日的提现到账日期顺延）
									</span>
								</div>
							</div>
							<div id="alert-area2" style="color:red;text-align: center"></div>
							<div class="submitDiv">
								<input id="submitApply" type="button" value="立即申请"/>
							</div>
							<!--表单end-->
						</div>
						<!--弹框-->
						<div id="modalbackdroptrue" class="modal hide fade in" aria-hidden="false" style="display: block;">
							<div class="modal-header">
								<a class="close" data-dismiss="modal">×</a>
								<h3 style="font-weight: normal;">提现信息确认</h3>
							</div>
							<div class="modal-body" style="max-height:400px">
								<div id="cashInfo" class="modal-body registerDialog" style="max-height: 400px; padding-bottom: 0px;">
									<form id="cashForm">
										<p style="text-align: left;">
											<label style="width: 120px;">银行卡：</label> <label id="cashCardNum" style="width: 260px; text-align: left;">${bankInfo.BANK_CARD_NAME} 尾号${bankInfo.BANK_CARD}&nbsp;&nbsp;持卡人：${bankInfo.REAL_NAME}</label>
											<input type="hidden" id="sessionBank" value="${sessionScope.sessionZfUser.BANK_CARD}"/>
										</p>
										<p style="text-align: left;">
											<label style="width: 120px;">提现金额：</label> <label id="cashAmount" style="width: 200px; text-align: left;">100.00 元</label>
										</p>
										<p style="text-align: left;">
											<label style="width: 120px;">手续费：</label> <label id="cashFee" style="width: 200px; text-align: left;">2.00 元</label>
										</p>
										<p style="text-align: left;">
											<label style="width: 120px;">预计到账时间：</label> <label id="cashVerifyTime" style="width: 200px; text-align: left;">2015-07-29 24点前</label>
										</p>
										<p style="text-align: left;">
											<label style="width: 120px;">预留手机号码：</label> <label id="cashMoiblePhone" style="width: 200px; text-align: left;">150****8011</label>
											<input type="hidden" id="sessionTel" value="${sessionScope.sessionZfUser.TEL}"/>
										</p>
										<p id="imgVerify" style=" text-align: left;">
											<label style="width: 120px;">输入图片验证码：</label> 
											<input type="text" id="ImgVerifyCode" maxlength="6" name="imgVerifyCode" class="identifyingCode verifyInput"/> 
											<img alt="点击刷新" src="" id="imgCode"/>
											<!-- <input type="button" value="获取语音验证码" class="identifyingBtn" id="btnVoiceNum" style="cursor: pointer;"/> -->
										</p>
										<p id="verifyCodePanel" style=" text-align: left;">
											<label style="width: 120px;">输入手机验证码：</label> 
											<input type="text" id="VerifyCode" maxlength="6" name="VerifyCode" class="identifyingCode verifyInput" onkeyup="value=value.replace(/[^\d]/g,'') "/> 
											<input type="button" value="获取短信验证码" class="identifyingBtn sms-active" id="btnSmsNum" style="cursor: pointer;"/> 
											<!-- <input type="button" value="获取语音验证码" class="identifyingBtn" id="btnVoiceNum" style="cursor: pointer;"/> -->
										</p>
										<p id="cashPanel" style="height: 35px; display: none;">
											<label class="errorCashPanelMsg" style="color: red; width: 90%; text-align: center;"></label>
										</p>
									</form>
								</div>
							</div>
							<div style="text-align:center" class="modal-footer">
								<span></span> <input type="button" id="cashSubmit" style="padding: 10px 0px; width: 130px; outline: none;" class="bluepop-btn" value="确认提交"/> <span></span>
							</div>
						</div>
						<div class="modal-backdrop fade in"></div>
						<!--提现记录-->
						<div class="drawrecord_nav">
							<div class="tit">提现记录（最近7天）</div>
							<div style="margin: 29px 9px 0 9px;">
								<table ellpadding="0" cellspacing="0" name="drawrecord_table" id="drawrecord_table">
									<tbody>
										<tr>
											<th>提现金额</th>
											<th>到账金额</th>
											<th>提交时间</th>
											<th>预计到账时间</th>
											<th>操作</th>
										</tr>
										<c:forEach items="${drawcashList}" var="dc">
											<tr>
												<td>¥${dc.amount}</td>
												<td>¥${dc.amount-2}</td>
												<td>${dc.create_date}</td>
												<td>${dc.pre_date} 24点之前</td>
												<td>
													<c:if test="${dc.status==1}">
														<input type="button" class="my-blue-btn cancelCashWithDrawal" id="cancelCashWithDrawal" style=" line-height:18px;" data-encode="${dc.id}" value="取消取现"/>
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
							</div>
						</div>	
					</div>
				</div>
				<div class="wycz3">
	            	<h3>提现说明：</h3>
	                <p>1.提现费用2元/笔。</p>
	                <p>2.当日充值金额不可提现。</p>
	                <p>3.充值未投资的金额，每日最多提现（提现上限）10000元；投资回本金额的提现不受影响。</p>
	                <p>4.提现操作，大行T+1日完成，小行大于T+1日完成，均受节假日影响。</p>
	                <p>5.最小提现金额为100元。</p>
	                <p>6.提现银行卡姓名应与实名认证身份一致，才可提现。</p>
	            </div>
			</div>
			<div class="clear"></div>
			
		</div>
	</div>
	<script type="text/javascript">
	$(function() {
		$('.cd-add.addbank').on('click',function(){
			location.href = getRootPath() + "/myAccount/addBind";
		});
	
		$('#removeBankCard').on('click', function(e){
			swal({
				title : "确定解绑银行卡？",
				text : "银行卡解绑之后将进行无法提现操作。",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "是,解绑",
				cancelButtonText : "不",
				closeOnConfirm : false,
				closeOnCancel : true
			},
			function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						type:'post',
						url:'myAccount/deleteBankCard',
						data : {},
						async : false,
						dataType : 'json',
						success : function(data) {
							if (data.msg == "success") {
								window.location.href = getRootPath()+"/myAccount/draw_cash";
								return;
							}
							if(data.msg=='nologin'){
								window.location.href = getRootPath()+"/login_toZfLogin";
								return;
							}
						}
					});
				}else{
					
				}
			});
		});
		
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
});
</script>
	<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
	<div id="tools-div" style="display: none;">
		<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
		<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
		<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
	</div>
	<%@ include file="../public/foot.jsp"%>
	<script type="text/javascript" src="wj-static/js/drawcash.js"></script>
</body>
</html>