<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>提现</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link rel="stylesheet" href="wj-mobile-static/css/sweetalert.css"/>
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/layout2.css"/>

<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="wj-mobile-static/js/sweetalert.min.js"></script>
</head>

<body>
<%@include file="../common/head.jsp" %>
<div class="mainbody withdraw">
	<c:choose>
		<c:when test="${pd.BANK_CARD==''||pd.BANK_CARD==null}">
			<div class="invest2">
		    	<div class="box1">
		        	<div class="card">
		            	<h3>您还未绑定银行卡</h3>
		                <p style="text-align: center"><a href="javascript:void(0)" class="bind">绑定银行卡</a></p>
		            </div>
				</div>
		    </div>
    	</c:when>
		<c:otherwise>
		    <div class="invest2">
		    	<div class="box1">
		    		<input type="hidden" id="now-amount" value="${pd.BALANCE }">
		        	<h2>可提额度（元）：${pd.BALANCE }</h2>
		            <h3><input type="text" placeholder="提现金额" id="amount"><b>元</b></h3>
		            <p style="color:red;text-align: center;"><span class="f-e valid-amount-em"> <em></em></span></p>
					<p style="text-align: center;">每笔提现要收取<b style="font-weight: bold;color: #E9953F;">2</b>元手续费<br>该手续费为<b style="font-weight: bold;color: #E9953F;">第三方资金托管平台</b>收取</p>
		        </div>
		    </div>
		    <div class="btn1">
		    	<button class="btn-1">立即提现</button>
		    </div>
	    </c:otherwise>
	</c:choose>
    <!-- <div class="recharge2">
    	<a href="#">提现说明</a>
    </div> -->
</div>

<%@include file="../common/foot.jsp" %>


<div class="h80"></div>
<script type="text/javascript">
	$(function() {
		$('.bind').on("click",function(){
		$.ajax({
			type:'post',
			url:'mobile/personal/addBindAjax',
			data : {},
			async : false,
			dataType : 'json',
			success : function(data) {
				if (data.msg == "nobind") {
					swal("已申请", "申请已提交请耐心等待", "error");
				}
				if (data.msg == "success") {
					window.location.href = "mobile/personal/addBind";
					return;
				}
				if(data.msg=='nologin'){
					window.location.href = "mobile/login";
					return;
				}
			}
		});
	});

	
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

		$('.btn-1').one('click',function(e) {
			console.log('提现点击触发');
			doSubmit()
		});
		function doSubmit(){
			var nowAmount = parseInt($('#now-amount').val()), 
				$amount = $('#amount'), 
				$amountValidEm = $('.valid-amount-em>em');
			if ($('#amount').val()=='') {
				$amountValidEm.text('请输入提现金额');
				e.preventDefault();
				$('.btn-1').one('click',function(e) {
					console.log('提现点击触发');
					doSubmit()
				});
				return;
			}
			if (!ckAmount()) {
				$('.btn-1').one('click',function(e) {
					console.log('提现点击触发');
					doSubmit()
				});
				return;
			}
			if (ckAmount()) {
				$.ajax({
					url : 'drawcash/drawcashApply',
					type : 'post',
					data : {amount : $("#amount").val()},
					async : false,
					dataType : 'json',
					success : function(data) {
						if (data.msg == "tologin") {
							window.location.href = "mobile/login";
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
									window.location.href = "mobile/personal/drawcash";
								} else {
									window.location.href = "mobile/personal/info";
								}
							});
						}
						if (data.msg == "success") {
							swal({
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
							function(isConfirm) {
								if (isConfirm) {
									window.location.href = "mobile/personal/drawcash";
								} else {
									window.location.href = "mobile/personal/info";
								}
							});
						}
					}
				});
			}
		}
		
});

</script>
</body>
</html>
