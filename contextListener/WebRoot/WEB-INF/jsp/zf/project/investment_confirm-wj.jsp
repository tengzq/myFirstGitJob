<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html><!--<![endif]-->
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生--${project.PROJECT_NAME}</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/page-view.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/buy.css">
<script type="text/javascript" src="<%=basePath %>jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/seed.min.js"></script>
<script src="jingtai/js/PagerView.js"></script>
<script type="text/javascript" src="jingtai/js/zz.js"></script>
<style type="text/css">
.exchangeRate{
display: block;
}
</style>
</head>
<body>
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
<div class="clearfix">
	<div class="inner">
		<h3><span>确认投资</span></h3>
		<div class="info-box">
			<div class="alert"></div>
			<div class="bd">
			<form id="buy_form" method="post" action="<%=basePath %>_project/goBuy" class="clearfix">
					<input type="hidden" name="ID" value="${project.ID}">
					<input type="hidden" name="PROJECT_NAME" value="${project.PROJECT_NAME}">
					<input type="hidden" name="inviteRate" id="inviteRate" value="none">
					<input type="hidden" id="prj-surplus" value="${project.SURPLUS_RAISE_AMOUNT}">
					<input type="hidden" id="rate" value="${total_rate}">
					<input type="hidden" name="exchange_rate" id="exchange_rate" value="0">
					<input type="hidden" id="repay-type" value="1">
					<input type="hidden" id="stime" value="${project.STIME}">
					<input type="hidden" id="etime" value="${project.ETIME}">
					<input type="hidden" name="coupon_type" id="coupon_type" value="1">
					<input type="hidden" name="user_id" id="user_id" value="${user.USER_ID }">
					<input type="hidden" id="invation_code" name="invation_code" value="">
					<input type="hidden" id="invation_rate" value="0.00">
					<input type="hidden" id="LOWEST_AMOUNT" value="${project.LOWEST_AMOUNT}"/>
					<div class="prj_info">
						<div class="line">
							<div class="left">投资项目：</div>
							<div class="right">${project.PROJECT_NAME}</div>
						</div>
						<div class="line">
							<div class="left">预计收益率：</div>
							<div class="right">
								${project.BASE_INTEREST_RATE}%(年化收益率)+
								${project.BOSS_INTEREST_RATE}%(老板贴息利率)
								</div>
						</div>
						<div class="line">
							<div class="left">项目期限：</div>
							<div class="right">${project.DEADLINE}天</div>
						</div>
						<div class="line">
							<div class="left">购买金额：</div>
							<div class="right">
								<!-- <input type="text" name="amount" id="amount" value="100"> 元 -->
								<input type="hidden" name="amount" id="amount" value="${amount}">
								${amount} 元
							</div>
						</div>
						<c:if test="${project.IS_USE_EXCHANGE_RATE==true && 1==2}">
							<div class="line">
								<div class="left" style="padding-top:11px;">试试换手气：</div>
								<div class="right">
									<div class="btns">
										<button class="btn btn_exchange_rate" type="button" id="" data-category="万金计划-立即购买" data-label="project">换手气</button>
									</div>
								</div>
								<div class="right" id="exchangeRate">
								    <div class="right" id="exchangeRate_right" style="padding-top:11px;">获得<span style="color: red;font-weight: bolder;">0.00</span>%加息。</div>
								</div>
							</div>
						</c:if>
						<c:if test="${project.IS_USE_INVITATION==true}">
						<div class="line">
								<div class="left">输入邀请码：</div>
								<div class="right">
									<input type="text" class="input" id="invation_rate_in"  style="padding:6px 4px;text-align:right;margin-bottom:6px;margin-top:4px; "/>
								     <div class="right">
										<div class="btns" style="margin-top:5px;">
											<button class="btn  invation_code_rate" style="float: left;width: 150px;" type="button" id="" data-category="万金计划-立即购买" data-label="project">获取加息</button>
										    <div class="right" id="invation_info_error" style="padding-top:-4px;float: left;display: none;"></div>
										    <div class="right" id="invation_info" style="padding-top:-4px;float: left;display: none;">获得<span style="color: red;font-weight: bolder;">0.00</span>%加息。</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${project.IS_USE_TICKET==true}">
						<div class="line">
							<div class="left">现金券：</div>
							
							<c:choose>
								<c:when test="${not empty ticketList}">
									 	<div class="right" style="positon:relative;">
											<div class="coupon_display">
												<span class="coupon_name">不使用现金券</span>
												<div class="arrow"></div>
											</div>
											<ul class="coupon_list">
												<li class="on">
												<input type="radio" name="coupon_id" class="coupon" data-value="0" data-minava="0" data-endtime="" data-id="0" data-type="1" value="0" checked=""><label>不使用现金券</label></li>
													<c:forEach items="${ticketList}" var="var" varStatus="vs">
																<li class="dis">
																	<input type="radio" name="coupon_id" class="coupon" data-value="${var.DISCOUNT_AMOUNT}" data-minava="${var.ENABLE_MIN_AMOUNT}" data-endtime="${var.UT_ENABLE_DATE}" data-type="1" value="${var.UT_ID}"><label>${var.TICKET_NAME}</label><span class="valid_etime">有效期至${var.UT_ENABLE_DATE}</span>
																</li>
													</c:forEach>
											</ul>
											<span class="coupon-count-desc"></span>
										</div>
								</c:when>
								<c:otherwise>
									<div class="right" style="positon:relative;">
										<div class="coupon_display  show">
											<span class="coupon_name">没有现金券可以使用</span>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						</c:if>
						<div class="line">
							<div class="left">预计收益：</div>
							<div class="right" style="font-weight: bolder;color:red;font-size: 18px;"><span id="income"></span> 元</div>
						</div>
					</div>
					<div class="invest_info">
						<span class="balance">可用余额：${user.BALANCE} 元</span>
						<input id="now-amount" type="hidden" value="${user.BALANCE}">
						<span class="invest">实际支付：<span class="high"><span class="invest_amt">${amount}</span>元</span></span>
						<input type="hidden" id="ticket-amount" name="TICKET_AMOUNT" value="">
					</div>
					<div class="btns">
						<button class="btn btn_buy_now" type="submit" data-category="万金计划-立即购买" data-label="project" >立即购买</button>
					</div>
				</form>
					<c:if test="${user.BALANCE-amount<0}">
						<form id="recharge_form" action="myAccount/recharge" method="post" target="_blank" class="clearfix" style="display: block;">
						<input type="hidden" name="recharge_amount" id="realpay" value="${amount-user.BALANCE}">
						<div class="summary">账户余额不足，充值<span id="realpay-show" name="f[amount]">${amount-user.BALANCE}</span>元后可购买 
							<button class="btn btn_recharge tongji" type="submit" style="" data-category="充值" data-label="project">
								充值						</button>
						</div>
						</form>
					</c:if>
							</div>
			<div class="ft"></div>
		</div>
	</div>
</div>
<div id="tmpl_recharge" class="tmpl">
	<div class="dg_wrapper dialog-chongzhi" style="height:auto">
		<div class="hd">
			<h3>确认是否充值成功！</h3>
		</div>
		<div class="bd">
			<p></p>
			<div class="ret">
				<p><span class="t">充值成功：</span><a href="<%=basePath %>_project/goInvestment?ID=${project.ID}&amount=${amount}" class="btn btn-4 ok-btn">确认成功</a></p>
				<p><span class="t">充值失败：</span><a href="<%=basePath %>_project/goInvestment?ID=${project.ID}&amount=${amount}" class="btn btn-3 close-btn">重新充值</a>&nbsp;&nbsp;<span class="help">查看&nbsp;<a href="zfarticle/footFind?ARTICLE_ID=49a46b344daf412294aae5cb86ff2784" class="highlight" target="_blank">帮助中心</a></span></p>
				<p style="font-size:14px">遇到问题请拨打我们的客服热线：400-807-8000（工作日 9:00-22:00）</p>
			</div>
		</div>
		<a href="javascript:void(0)" class="close"></a>
	</div>
</div>
<!-- <div id="tmpl_buy" class="tmpl">
	<div class="dg_wrapper dialog-touzi">
		<div class="hd">
			<h3>登录到易宝支付平台付款</h3>
		</div>
		<div class="bd">
			<p>请在新打开的易宝页面完成付款后选择：</p>
			<div class="ret">
				<p>付款成功：<a href="https://lantouzi.com/user/order/datalist" class="btn btn-4">确认成功</a></p>
				<p>付款失败：<a href="https://lantouzi.com/user/order/datalist" class="btn btn-3">重新付款</a>&nbsp;&nbsp;<span class="help">查看&nbsp;<a href="https://lantouzi.com/about/help" class="highlight" target="_blank">帮助中心</a></span></p>
			</div>
		</div>
	</div>
</div> -->
<script type="text/javascript">
var is_auto_bid = 0;
var recharge_url = "";
var channel_id = 570175;
$(document).ready(function(){
	var numberFormat = $.Utils.numberFormat;//格式化数字函数
	var $at = $('#amount'), //用户输入的投资金额
		na = parseInt($('#now-amount').val(), 10), //实际支付金额
		surplus = parseInt($('#prj-surplus').val(), 10) / 100, //项目剩余金额
		$invest_amt = $('.invest_amt'),//实际支付金额
		$ticket_amount = $('#ticket-amount'),
		$coupon_display = $('.coupon_display'),//优惠券
		$coupon_name = $('.coupon_name'),//优惠券名称
		$coupon_list = $('.coupon_list'),//优惠券list
		$coupons = $('input[name=coupon_id]'),//优惠卷list
		$buy_form = $('#buy_form'),//确认购买 form
		$recharge_form = $('#recharge_form'),//充值form
		rp = $('#realpay'),//用户账户
		rps = $('#realpay-show'),//缺少金额
		$btn_buy_now = $('.btn_buy_now'),//立即购买按钮
		$btn_recharge = $('.btn_recharge'),//立即充值按钮
		$btn_exchange_rate = $('.btn_exchange_rate'),//换手气按钮
		$invation_code_rate = $('.invation_code_rate'),//获取邀请码按钮
		sTime   = new Date($('#stime').val().replace(/\-/g, '/')).getTime(),//项目开始时间
		eTime   = new Date($('#etime').val().replace(/\-/g, '/')).getTime(),//项目结束时间
		rate    = parseFloat($('#rate').val()),//总利率
		repayType = $('#repay-type').val(),//方式
		repayPlan = $.Utils.repayPlan(repayType),//
		submitLock = false,
		times ='${exchangeRote.EXCHANGE_NUM}';
		BALANCE ='${user.BALANCE}';
	/* function exchangeRate(){
	  var exchange_rate = Math.random()*${exchangeRote.EXCHANGE_MAX_RATE};
		if(times!=0){
		times--;
		$('#exchangeRate_left span').text(times);
		$('#exchangeRate_right span').text(exchange_rate.toFixed(2));
		$("#exchange_rate").val(exchange_rate.toFixed(2));
		}
		refreshIncome();
	} */
	
	/**换手气exchangeRate*/
	$btn_exchange_rate.on('click', function(e){
		var exchange_rate = Math.random()*0.5;
			$('#exchangeRate_right span').text(exchange_rate.toFixed(2));
			$("#exchange_rate").val(exchange_rate.toFixed(2));
		refreshIncome();
	});
	
	/**获取邀请码利率*/
	$invation_code_rate.on('click', function(e){
		var code = $("#invation_rate_in").val();
		if(!/(\d{6})|(V\d+)/ig.test(code) && code != '88888' && code !=''){
			$("#invation_info").css("display","none");
	   		$("#invation_info_error").css("display","block");
	  	 	$("#invation_info_error").css("color","red");
			$("#invation_info_error").text("请输入正确格式的邀请码!");
			$("#invation_code").val('');
			$("#invation_rate").val('0.00');
			$("#inviteRate").val('none');
			refreshIncome();
		}else{
			$.post("_project/checkCode",{USER_ID:$("#user_id").val(),CODE:$("#invation_rate_in").val()},function(data){
			   	//console.log('ajax返回data为：',data);
			   	if(data.msg=='none'){
			   		$("#invation_info").css("display","none");
					$("#invation_info_error").css("display","block");
	  	 			$("#invation_info_error").css("color","red");
	  	 			if(code!=''){
	  	 				$("#invation_info_error").text("输入邀请码无效!");
	  	 			}else{
	  	 				$("#invation_info_error").text("");
	  	 			}
					$("#invation_code").val('');
					$("#invation_rate").val('0.00');
					$("#inviteRate").val('none');
					refreshIncome();
				}else if(data.msg=='commoncant'){
			   		$("#invation_info").css("display","none");
			   		$("#invation_info_error").css("display","block");
	  	 			$("#invation_info_error").css("color","red");
					$("#invation_info_error").text("您已使用过万能邀请码!");	
					$("#invation_code").val('');
					$("#invation_rate").val('0.00');
					$("#inviteRate").val('none');
					refreshIncome();
				}else if(data.msg=='common' || data.msg=='simple' || data.msg=='other' || data.msg=='self'){
			   		//console.log('配置邀请码',data.rate);
			   		$("#invation_info_error").css("display","none");
			   		$("#invation_info").css("display","block");
					$("#invation_code").val($("#invation_rate_in").val());
					$("#invation_rate").val(data.rate);
					$("#inviteRate").val(data.msg);
					$("#invation_info span").text(data.rate);	
					refreshIncome();	
			  	}else if(data.msg=='fail'){
			   		$("#invation_info").css("display","none");
			   		$("#invation_info_error").css("display","block");
	  	 			$("#invation_info_error").css("color","red");
					$("#invation_info_error").text("输入邀请码无效!");	
					$("#invation_code").val('');
					$("#invation_rate").val('0.00');
					$("#inviteRate").val('none');
					refreshIncome();
			   }else{
			   		$("#invation_info").css("display","none");
					$("#invation_info_error").css("display","block");
	  	 			$("#invation_info_error").css("color","red");
					$("#invation_info_error").text("输入邀请码无效!");
					$("#invation_code").val('');
					$("#invation_rate").val('0.00');
					$("#inviteRate").val('none');
					refreshIncome();		
			   };
		},"json");
		}
		
	});
	
	/* $('#buy_form').on('submit', function(e){
	   if(confirm("确认购买！")){
	   return true;
	   }else{
	    return false;
	   }
		
	}); */
	
	countAmount();
	if (!$coupon_display.hasClass('none')) {//有投资券可用
		$coupon_display.addClass('show');//显示箭头
		function closeCouponList() {//js内部方法，关闭可用投资卷列表
			$coupon_display.removeClass('expanded');
			$coupon_list.hide();
			$(document).off('click.couponlist');
		}
		$coupon_display.on('click', function(e) {
			var choosed = $coupons.filter(':checked');
			if ($coupon_display.hasClass('expanded')) {
				closeCouponList();
			} else {
				$coupon_display.addClass('expanded');
				$coupon_list.show().scrollTop(choosed.offset().top - $coupon_list.offset().top + $coupon_list.scrollTop() - 20);
				$(document).on('click.couponlist', function(e) {
					var el = $(e.target);
					if (!el.hasClass('coupon_display') && !el.parents('.coupon_display').length && !el.hasClass('coupon_list') && !el.parents('.coupon_list').length) {
						closeCouponList();
					}
				});
			}
		});
		$coupon_list.find('li').on('click', function(e) {
			$(e.currentTarget).find('input:radio:not(:disabled)').prop('checked', true);
			$(document).trigger('coupon_change');
		});
		$(document).on('coupon_change', function(e) {
			var choosed = $coupons.filter(':checked');
			$coupon_name.text(choosed.next('label').text());
			$coupon_list.find('li').removeClass('on').find('input:checked').parent('li').addClass('on');
			countAmount();
			//refreshIncome();没有加息卷，暂时不用
		});
		refreshCoupons();
		///autoChooseCoupon();//自动选择优惠券去掉
	}
	/**重新计算价格*/
	refreshIncome();

	$(document).on('keydown', function(e) {
		if (e.keyCode === 13) {
			e.preventDefault;
			return false;
		}
	});

	$buy_form.on('submit', function(e){
		if(submitLock){
			e.preventDefault();
			return;
		}
		submitLock = true;
		var LOWEST_AMOUNT =  parseInt($("#LOWEST_AMOUNT").val() || 0);;
		var amt = parseInt($at.val() || 0);
		if(LOWEST_AMOUNT>amt){
		  alert("投资金额不能小于该项目的最小起投金额！");
		  e.preventDefault();
		  return false;
		}
		$btn_buy_now.addClass('disabled').prop('disabled');
		var choosed_coupon = $coupons.filter(':checked');
		$('#coupon_type').val(choosed_coupon.data('type'));
	});


	function refreshIncome() {
		var amt = parseFloat($at.val() || 0);
		var inv = parseFloat($("#invation_rate").val() || 0);
		//console.log('邀请码利率为：','inv:'+inv,$("#invation_rate").val());
		var r = rate+parseFloat($('#exchange_rate').val()||0)+inv;
		var incomeMoney = numberFormat(repayPlan(amt, r, sTime, eTime), 2);
		$('#income').text(incomeMoney);
	}
	
	function refreshCoupons() {
		var amt = parseInt($at.val() || 0), minava, item;
		$coupon_list.find('li').removeClass('dis');
		$.each($coupons, function(i, v){
			item = $(v);
			minava = parseInt(item.data('minava'), 10);
			item.prop('disabled', minava > amt);
			if (item.prop('disabled')) {
				item.parents('li').addClass('dis');
			}
		});
		
		var str = '';
		if ($coupons.filter(':not(:disabled)').length > 1) {//有投资券可用
			var reduce_count = $coupons.filter('[data-type=1]:not(:disabled)').length - 1,
				int_count = $coupons.filter('[data-type=2]:not(:disabled)').length;
			str = '您有';
			if (reduce_count) {
				str += reduce_count + '张满减券';
			}
			/* if (int_count) {
				str += (reduce_count ? '、' : '') + int_count + '张加息券';
			} */
			str += '可用';
		} 
		$('.coupon-count-desc').text(str);
	}
	
	
	/* function autoChooseCoupon() {
		var max = findMaxCoupon();
		var choosed = $coupons.filter('[value="'+max.coupon_id+'"][data-type="'+max.type+'"]').eq(0);
		choosed.prop('checked', true);
		$(document).trigger('coupon_change');
	} */
	/* function findMaxCoupon(){
		var max = {val: 0, coupon_id: 0, etime: '', type: 1}, item, val, etime, coupon_type;
		$.each($coupons.filter(':not(:disabled)'), function(i, v) {
			item = $(v);
			coupon_type = item.data('type');
			if (coupon_type == 2) {return;}//只比较满减券，不比较加息券

			val = parseInt(item.data('value'), 10);
			etime = item.data('endtime');
			if ( val > max.val || (val == max.val && format_time(etime) < format_time(max.etime)) ) {
				max = {
					val: item.data('value'),
					coupon_id: item.val(),
					etime: etime,
					type: coupon_type
				};
			}	
		});
		if (max.val == 0 && $coupons.filter('[data-type=2]:not(:disabled)').length > 0) {
			var coupon_int = $coupons.filter('[data-type=2]:not(:disabled)').eq(0);
			max = {
				val: coupon_int.data('value'),
				coupon_id: coupon_int.val(),
				etime: coupon_int.data('endtime'),
				type: coupon_int.data('type')
			};
		}
		return max;
	} */
	
	function format_time(t) {
		return (t ? new Date(t.replace(/-/g, '/')) : '');
	}
	function countAmount() {
		//console.log('count amount');
		var choosed_coupon = $coupons.filter(':checked'),
			ca = parseInt(choosed_coupon.data('value')),
			ct = choosed_coupon.data('type'),
			ta = parseInt($at.val() || 0),
			needMoney = Math.max(0, ct == 1 ? (ta - na - ca) : (ta - na) ),
			//needMoney = (parseFloat($at.val()) - ca) < 0 ? 0 : (parseFloat($at.val()) - ca);
			investMoney = ct == 1 ? ((ta - ca)) : (ta);
		//console.log(ca,ct,ta,na,needMoney);
		rp.val(needMoney);
		rps.text(numberFormat(needMoney, 2));
		//console.log(numberFormat(needMoney, 2));
		$invest_amt.text(numberFormat(investMoney, 2) < 0?0:numberFormat(investMoney, 2));
		//$invest_amt.text(numberFormat(needMoney, 2));
		//console.log($at.val(),$invest_amt.text().replace(',',''))
		var ticketAmt = parseFloat($at.val())-parseFloat($invest_amt.text().replace(',',''));
		//console.log(parseFloat(ticketAmt),ca);
		$ticket_amount.val(parseFloat(ca));
		//console.log($ticket_amount.val());
		if (needMoney > 0) {
			$recharge_form.css('display', 'block');
			$btn_buy_now.addClass('disabled').prop('disabled', true);
		} else {
			$recharge_form.css('display', 'none');
			$btn_buy_now.removeClass('disabled').prop('disabled', false);
		}
		return needMoney;
	}
	
	seed.use('dialog', function(){
		var dialogPay = new $.ui.Dialog('button.btn_recharge', {
			elem : $('#tmpl_recharge').html(),
			drag : false,
			fixed : true,
			overlay : true,
			lock : true
		});
		$(document).on('click', '.ecope_dialog .close-btn, .ecope_dialog .close', function(e){
			e.preventDefault();
			dialogPay.close();
		});
	});
	
	if(is_auto_bid==1){
		$recharge_form.submit(function(e){
			var choosed_coupon = $coupons.filter(':checked');
			var ps = {
				bid_amount : $('[name="amount"]').val(),
				coupon_id  : choosed_coupon.val(),
				coupon_type: choosed_coupon.data('type'),
				prj_id     : $('[name="prj_id"]').val(),
				channel_id : channel_id
			};
			$recharge_form.attr('action', recharge_url + '?' + $.param(ps));
		});
	}
	//初始调用一下计算优惠码  wangpeng 20150718
	$invation_code_rate.trigger("click");
});

$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=${project.ID}");
	val_array.push("SUB_PAGE=2");
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
		</div>
		<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
		<div id="tools-div" style="display: none;">
			<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
			<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
			<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
		</div>
		<%@ include file="../public/foot.jsp"%>
</body></html>