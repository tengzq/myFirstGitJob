<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html><!--<![endif]--><head>
<title>万金先生 - 自动投标</title>
<meta charset="utf-8">
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<base href="<%=basePath%>">
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e"> -->
<meta name="renderer" content="webkit">
<!-- <link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/my.css"> -->
<!-- <script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="jingtai/js/trace.js"></script>
<script src="jingtai/js/hm.js"></script>
<script type="text/javascript">
(function(){
	window.CONFIG = {"PASSPORT_API_HOST":"https:\/\/u.dawanjia.com.cn\/user\/api\/","CAPTCHA_HOST":"https:\/\/u.dawanjia.com.cn\/captcha","ENCRYPT_TIMEOUT":120000,"SERVER_TIME":1432806515000};
	window.CONFIG.BASE_URI = 'https://lantouzi.com';
	window.CONFIG.SSO_URI  = CONFIG.BASE_URI + '/dwjsso';
	window.CONFIG.LTZ_API = CONFIG.BASE_URI + '/api/uc/';
	!window.console && (window.console = {log:function(){}});
})();
</script>

<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="./auto_bid2_files/trace.js"></script>
<script src="./auto_bid2_files/hm.js"></script>
<script type="text/javascript" src="jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="jingtai/js/seed.min.js"></script>
<script type="text/javascript">
seed.config({
    baseUrl : CONFIG.BASE_URI + '/js/components/',
    alias : {
       jquery : CONFIG.BASE_URI + '/js/'+'jquery-1.11.1.min'
   } 
});
var _hmt = _hmt || [];
</script>
<link rel="stylesheet" type="text/css" href="./auto_bid2_files/my.css">
<script src="./auto_bid2_files/PagerView.js"></script>
<img src="./auto_bid2_files/v.do" height="1" width="1"></head> -->
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/autobid.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/autobid.js" type="text/javascript"></script>
</head>

<body style=" background:url(wj-static/images/logo_03.png)">
<%@include file="../public/top.jsp" %>
<div class="mainbody main">
	<%@include file="../public/acc_left.jsp" %>
    <div class="content">
    	<div class="gerenxinxi zidongtoubiao">
        	<h3>
            	<span>自动投标</span>
            </h3>
            
            <div class="con">
            	<div class="autobid-1">
                	<span>注意：</span>
                    <p>自动投标一旦设置并保存成功，将在次日零点自动进行投标。
如不想复投，请提前关闭自动投标，以免影响提现。</p>
                </div>
                <div class="autobid-2">
                	<ol style="padding-bottom:0px !important;">
                    	<li>
                    		<div id="radio-div">
	                        	<span><img src="wj-static/images/toubiao_03.png">功能状态</span>
	                            <label><input type="radio" name="auto_bid_status" id="auto_bid_status_on" value="1" <c:if test="${abInfo.IS_OPEN=='1'}">checked=""</c:if>>开启</label>
	                            <label><input type="radio" name="auto_bid_status" id="auto_bid_status_off" value="0" <c:if test="${abInfo.IS_OPEN=='0' || abInfo.IS_OPEN=='' || abInfo.IS_OPEN==null}">checked=""</c:if>>关闭并保存</label>
                        	</div>
                        </li>
                     </ol>
                     <div id="autobid_detail" style="display: none">
	                     <ol style="padding-top:0px !important;">
	                    	<li>
	                        	<span><img src="wj-static/images/toubiao_06.png">投资金额</span>
	                            <input type="text" id="min_amount" maxlength="7">---
	                            <input type="text" id="max_amount" maxlength="7">元
	                        </li>
	                    	<li>
	                        	<span><img src="wj-static/images/toubiao_08.png">保留金额</span>
	                            <input type="text" id="keep_amount">元 （不会加入自动投标的金额）
	                        </li>
	                    	<li>
	                        	<span><img src="wj-static/images/toubiao_10.png">本金复投</span>
	                            <p>本金收回后将在次日零点继续自动投标，</p>
	                            <p>若想提现请提前设置保留金额或关闭自动投标。</p>
	                            
	                        </li>
	                    	<li>
	                        	<span><img src="wj-static/images/toubiao_12.png">项目期限</span>
	                            <ul id="month_select">
	                            	<li data-month="1">1月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="2">2月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="3">3月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="4">4月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="5">5月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="6">6月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="7">7月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="8">8月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="9">9月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="10">10月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="11">11月期<i class="fa fa-check-circle"></i></li>
	                            	<li data-month="12">12月期<i class="fa fa-check-circle"></i></li>
	                            </ul>
	                        </li>
	                        <li>
	                            <label><input type="checkbox" id="agree">我已阅读并同意万金先生的<a href="zfarticle/toNotice?id=46" target="_blank">《隐私协议》</a></label>
	                            
	                        </li>
	                        <li>
	                            <input type="button" value="保存" id="save">
	                            <input type="button" value="正在保存" id="sending" style="cursor:not-allowed;display:none;background:#ccc !important;">
	                        </li>
	                    </ol>
                    </div>
                </div>
                
                <!-- <div class="bid-explain">
                	<h3>提现说明：</h3>
                    <p>1.每日仅限提现一笔，该笔提现操作免除手续费。</p>
                    <p>2.如当日有过充值行为，则当日不可进行提现。</p>
                    <p>3.充值未投资的金额，每日最多提现（提现上限）10000元；投资回本金额的提现不受影响。</p>
                    <p>4.提现操作，大行T+1日完成，小行大于T+1日完成，均受节假日影响。</p>
                    <p>5.最小提现金额为50元。</p>
                    <p>6.提现银行卡姓名应与实名认证身份一致，才可提现。</p>
                </div> -->
            </div>
            
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@include file="../public/foot.jsp" %>
<script type="text/javascript">
var DEFAULT_DATA = {
	min_amount: 100,
	max_amount: 1000000,
	keep_amount: 0,
	month_info: '1,2,3,4,5,6,7,8,9,10,11,12'
};
var BID_DATA = {
	status: ${abInfo.IS_OPEN},
	min_amount: ${(abInfo.MIN_MONEY==null || abInfo.MIN_MONEY=='')?false:abInfo.MIN_MONEY} || DEFAULT_DATA.min_amount,//自动投标投资最小额
	max_amount: ${(abInfo.MAX_MONEY==null || abInfo.MAX_MONEY=='')?false:abInfo.MAX_MONEY} || DEFAULT_DATA.max_amount,//自动投标投资最大额
	keep_amount: ${(abInfo.RESERVED_AMOUNT==null || abInfo.RESERVED_AMOUNT=='')?false:abInfo.RESERVED_AMOUNT} || DEFAULT_DATA.keep_amount,//自动投标保留金额
	// is_invested_amount: 1 || 2,//是否复投，1是复投，2是不复投
	// reinvest_days:1 || 1,//复投时间，1次日，3三日，7七日 
	month_info: '${abInfo.DEADLINE}' || DEFAULT_DATA.month_info//项目期限
};



$(document).ready(function() {
	$('.check').addClass('hover');


	var elements = {
		detail : $('#autobid_detail'),
		min_amount : $('#min_amount'),
		max_amount : $('#max_amount'),
		keep_amount : $('#keep_amount'),
		month : $('#month_select'),
		radio : $('input[name=auto_bid_status]'),
		agree : $('#agree'),
		saveBtn : $('#save'),
		sending : $('#sending'),
		msg_showtime : 2000,
		change : false,
	}
	$(window).on('beforeunload',function(w){
		if (change) {
			var confirmationMessage = "您还未保存刚刚的设置，请先保存设置。";
			return confirmationMessage;
   		 }
	});
	var is_open = '${abInfo.IS_OPEN}';
	console.log('is_open='+is_open);
	if('${abInfo.IS_OPEN}'=='1'){
		elements.detail.show();
	}
	
	function checkIfChanged() {//检查是否有修改数据
		if ($('[name=auto_bid_status]:checked').val() != BID_DATA.status) {
			changed = true;
			return;
		}
		if (elements.min_amount.val() != BID_DATA.min_amount || elements.max_amount.val() != BID_DATA.max_amount || elements.keep_amount.val() != BID_DATA.keep_amount) {
			changed = true;
			return;
		}
		var m =	elements.month.find('li.on'),
			l = m.length,
			arr = [],
			i = 0;
		for (;i<l;i++) {
			arr.push($(m[i]).data('month'));
		}
		if (arr.join(',') != BID_DATA.month_info) {
			changed = true;
			return;
		}
	}
	
	/* 开启关闭 */
	elements.radio.on('click',function(e){
		console.log('radio监听事件触发',e.target.value);
		if(e.target.value==1){
			console.log(elements.detail);
			checkIfChanged();
			elements.detail.show();
		}else{
			console.log('关闭并保存');
			change=false;
			elements.detail.hide();
			BID_DATA.status = 0;
			elements.saveBtn.click();
		}
	});
	
	elements.min_amount.on('blur',function(e){
		checkInvestAmount();
	});
	
	elements.max_amount.on('blur',function(e){
		checkInvestAmount();
	});
	
	elements.keep_amount.on('blur',function(e){
		checkKeepAmount();
	});
	elements.month.find('li').on('click',function(e){
	var el = $(e.target);
	console.log(el);
		if(el.hasClass('on')){
			el.removeClass('on');
			checkIfChanged();
		}else{
			
			el.addClass('on');
			checkIfChanged();
		}
	});
	
	elements.saveBtn.on('click',function(e){
		if(!ckAgree() && !confirm("您需要阅读并同意《自动投标协议》\n如您已仔细阅读并同意可直接点击确定")){
			if ($('[name=auto_bid_status]:checked').val() == 0) {
				$('#auto_bid_status_on').click();
			}
			return false;
		}else{
			elements.agree.prop('checked', true);
			if (checkData()) {
				sentBidData();
				changed = false;
			}
		}
	});
	
	function ckAgree(){
		if(elements.agree.length===0){
			return true;
		}
		if(!elements.agree.prop('checked')){
			return false;
		}
		return true;
	}
	
	
	function checkInvestAmount() {
		var min = elements.min_amount.val(),
			max = elements.max_amount.val();
			min = parseInt(min.replace(/[^\d^\.]/g, '').replace(/\..*/g, ''), 10) || 100; 
			max = parseInt(max.replace(/[^\d^\.]/g, '').replace(/\..*/g, ''), 10) || 1000000; 
		elements.min_amount.val(min);
		elements.max_amount.val(max);
		var flag = false, errMsg = '',ele;
		if (min%100 !== 0) {
			errMsg = '最小投资金额必须是100的整数倍';
			ele = elements.min_amount;
		} else if (min < 100) {
			errMsg = '最小投资金额不能小于100';
			ele = elements.min_amount;
		} else if (min > 1000000) {
			errMsg = '最小投资金额不能大于1000000';
			ele = elements.min_amount;
		} else if (max%100 !== 0) {
			errMsg = '最大投资金额必须是100的整数倍';
			ele = elements.max_amount;
		} else if (max < 100) {
			errMsg = '最大投资金额不能小于100';
			ele = elements.max_amount;
		} else if (max > 1000000) {
			errMsg = '最大投资金额不能大于1000000';
			ele = elements.max_amount;
		} else if (min > max) {
			errMsg = '最小金额应小于等于最大金额';
			ele = elements.min_amount;
		} else {
			flag = true;
		}
		if(!flag){
			tips(2,ele,errMsg);
		}
		
		return flag;
	}
	
	function checkKeepAmount() {
		var keep = elements.keep_amount.val();
		keep = parseFloat(keep.replace(/[^\d^\.]/g, '').replace(/^\./g, '')) || 0;
		elements.keep_amount.val(keep);
		if ( keep.toString().match(/\.\d{3,}/g) ) {
			tips(2,elements.keep_amount,'小数点后最多保留2位');
			return false;
		} else {
			return true;
		}
	}
	
	function checkMonth() {
		var months = elements.month.find('li.on');
		if(months.length===0){
			tips(3,elements.month,'以上12个项目期限至少选择1个。');
			return false;
		}else{
			return true;
		}
	}
	
	function checkData() {
		var is_off = $('[name=auto_bid_status]:checked').val() == 0;
		if (!checkInvestAmount()) {
			if (is_off) {
				console.log('原版重置为初始数据--amount');
				//resetInvestData();
			} else {
				return false;
			}
		}
		if (!checkKeepAmount()) {
			if (is_off) {
				console.log('原版重置为初始数据--keep amount');
				//resetKeepData();
			} else {
				return false;
			}
		}
		if (!checkMonth()) {
			if (is_off) {
				console.log('原版重置为初始数据--month');
				//resetMonthData();
			} else {
				return false;
			}
		}
		updateData();
		return true;
	}
	
	
	function setBidData(data){
		$.extend(BID_DATA, data);
	}
	
	function updateBidAmount(){
		var min = parseInt($.trim($('#min_amount').val()) || 100),
			max = parseInt($.trim($('#max_amount').val()) || 1000000),
			keep = parseFloat($.trim($('#keep_amount').val()) || 0),
			amountData = {
				min_amount: min,
				max_amount: max,
				keep_amount: keep
			};
		setBidData(amountData);
	}
	function updateBidMonth(){
		var monthArray = [];
		$('#month_select li').each(function(){
			if($(this).hasClass('on')){
				monthArray.push($(this).data('month'));
			}
		});
		setBidData({month_info:monthArray.join(',')});
	}
	function updateData() {
		BID_DATA.status = $('[name=auto_bid_status]:checked').val();		
		updateBidAmount();
		updateBidMonth();
	}
	function sentBidData(){
		elements.saveBtn.hide();
		elements.sending.show();
		$.ajax({
			url: 'autobid/saveOrUpdate',
			type: 'POST',
			dataType: 'json',
			data:BID_DATA
			
		})
		.done(function(d) {
			if (d.msg=="success") {
				var ele=elements.sending;
				if(BID_DATA.status=='0'){
					ele=$('#auto_bid_status_off').parent();
				}
				console.log(ele);
				tips(2,ele,'保存成功！');
				setTimeout(function(){
					window.location = getRootPath()+'/autobid/check';
				},elements.msg_showtime);
			}else{
				elements.sending.hide();
				elements.saveBtn.show();
				tips(2,elements.saveBtn.parent(),'保存失败，请重新尝试');
				setTimeout(function(){
					
					if ($('[name=auto_bid_status]:checked').val() == 1) {
						$('#auto_bid_status_on').click();
					}
				},elements.msg_showtime);
			}
		})
		.fail(function() {
			tips(2,elements.saveBtn,'网络出错,稍后请重新尝试');
			setTimeout(function(){
					
					if ($('[name=auto_bid_status]:checked').val() == 2) {
						$('#auto_bid_status_on').click();
					}
				},elements.msg_showtime);
		});
	}
	
	function tips(position,element,message){
		console.log(position,element,message);
		$(element).tips({
			side : position,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
	
	function initPage() {
		elements.min_amount.val(BID_DATA.min_amount);
		elements.max_amount.val(BID_DATA.max_amount);
		elements.keep_amount.val(BID_DATA.keep_amount);
		$.each(BID_DATA.month_info.split(','), function(i, v) {
			elements.month.find('li[data-month="'+v+'"]').addClass('on');
		});
		console.log('initPage');
	}
	initPage();
});
</script>


