<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生--${pd.PROJECT_NAME}</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/page-view.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/common.css">
<link rel="stylesheet" type="text/css" href="wj-static/css/detail.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/magnific-popup.css">
<link rel="stylesheet" href="wj-static/css/zoom.css" media="all"/>

<script src="jingtai/js/hm.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/seed.min.js"></script>
<script type="text/javascript" src="jingtai/js/zz.js"></script>
<script type="text/javascript" src="wj-static/js/layout.js"></script>
<style>
	.nav a i {display:block;position: absolute;width:36px;height:16px;line-height: 16px;color:#fff;background: #ff7744;border-radius:5px;top:50%;margin-top:-20px;left:50%;margin-left:38px;text-align: center;font-style: normal;font-size:12px;}
</style>
</head>
<body>
<!-- <div id="doc"> -->
<%@ include file="../public/top.jsp"%>
		<div class="maibody main">
		<div class="listconnav" style="margin-top: 10px">
    	<a href="">万金先生</a> > <a href="_project/goProjectList">我要理财</a>><b>${pd.PROJECT_NAME}</b>
    	</div>
	<div class="project-detail project-plan-lanren" style="border: 1px solid #ddd;">
	<div class="detail-info lanren-detail-info">
	
	<%-- <p class="platform_rate_tips"></p>
		<c:if test="${pd.BOSS_INTEREST_RATE ne '0.00'}">
			<span title="额外补息" class="platform_rate" data-rate="${pd.BOSS_INTEREST_RATE}"><sub>+</sub>${pd.BOSS_INTEREST_RATE}%</span>
		</c:if>
	<div class="lanren-detail-income">
		<h4>${pd.BASE_INTEREST_RATE}<sub>%</sub></h4>
		<p>年化收益率</p>
		
	</div> --%>
	
	<div class="project-profit" data-rate="${(1-pd.SURPLUS_RAISE_AMOUNT/pd.TOTAL_RAISE_AMOUNT)}">
			<c:if test="${pd.BOSS_INTEREST_RATE ne '0.00'}">
				<span title="额外补息" class="platform_rate" data-rate="${pd.BOSS_INTEREST_RATE}"><sub>+</sub>${pd.BOSS_INTEREST_RATE}%</span>
			</c:if>
			
			<p><strong>${pd.BASE_INTEREST_RATE}</strong><span>%</span><br>年化收益率</p>
			<canvas width="210px" height="210px"></canvas>
	</div>
	
	<h1>${pd.PROJECT_NAME}</h1>
	<ul class="lanren-detail-list">
		<li>项目期限：${pd.DEADLINE}天</li>
		<li>还款方式：按月付息，到期还本</li>
					<li>起息时间：<span>${pd.INTEREST_BEARING_TIME_DES}</span></li>
			</ul>
	<p class="user-require">
		<span class="k">投资要求</span>
		<span>${pd.LOWEST_AMOUNT}元起投，投资金额为<fmt:parseNumber integerOnly="true" value="${pd.LOWEST_AMOUNT}" />的整数倍。</span>
	</p>
</div>	
	<input type="hidden" id="rate" value="${pd.BASE_INTEREST_RATE}">
	<input type="hidden" id="days" value="${pd.DEADLINE}">
	<input type="hidden" id="repay-type" value="1">
	<input type="hidden" id="stime" value="${pd.STIME}">
	<input type="hidden" id="etime" value="${pd.ETIME}">
		<div class="detail-buy" style="border: 5px solid #f5f5f5;">
		<div class="bd">
					<!-- 投资阶段-->
			<c:if test="${pd.PROJECT_STATE == 1}">
			<div class="status-buy">
				<form action="<%=basePath %>_project/goInvestment" id="buy-form" method="post">
				<input type="hidden" name="ID" value="${pd.ID}">				
				<ul class="project-process">
					<li class="clearfix">
						<span class="k">项目进度：</span>
						<span class="v">
							<span class="process-bar"><b style="width:${100-pd.SURPLUS_RAISE_AMOUNT/pd.TOTAL_RAISE_AMOUNT*100}%"></b></span><fmt:parseNumber integerOnly="true" value="${100-pd.SURPLUS_RAISE_AMOUNT/pd.TOTAL_RAISE_AMOUNT*100}" />%
						</span>
					</li>
					<li class="clearfix">
						<span class="k">项目剩余金额：</span>
						<span class="v">
							<input type="hidden" id="prj-surplus" value="${pd.SURPLUS_RAISE_AMOUNT}" />
							<em class="money"><fmt:parseNumber integerOnly="true" value="${pd.SURPLUS_RAISE_AMOUNT}" />.</em><span style="color: red;">00</span>元
						</span>
					</li>
					<li class="clearfix">
						<span class="k">投资金额：</span>
						<span class="v">
							<input type="text" name="amount" id="amount" style="background: #f6f4f5;"  maxlength="10" autocomplete="off">元
						</span>
					</li>
				</ul>
				<p class="income-guess">
				   <!-- <em id="income">1,397.26</em> -->
					<span class="no-amount-tips">每投资10万元，</span>预计收益<em id="income">${pd.UNIT_INTEREST_RATE}</em>元
									</p>
				<div class="pop-tips">
										预期收益=投资额 * 年化收益率 / 365 * 项目期限
										<b></b>
				</div>

					<button type="submit" class="btn btn-buy tongji"  data-label="project">马上投资</button>
				</form>
			</div>

			</c:if>
			<c:if test="${pd.PROJECT_STATE == 2}">
				<div class="status-buy" style="background: url(wj-static/images/repayment.png); height: 70%; background-position: 70px 30px; background-repeat: no-repeat;" >	
					<a href="<%=basePath %>_project/goProjectList" class="btn btn-buy tongji">查看其他项目</a>
				</div>
			</c:if>
			<c:if test="${pd.PROJECT_STATE == 3}">
				<div class="status-buy"  style="background: url('wj-static/images/finished.png'); height: 70%; background-position: 70px 30px; background-repeat: no-repeat;">
					<a href="<%=basePath %>_project/goProjectList" class="btn btn-buy tongji">查看其他项目</a>
				</div>
			</c:if>
				</div>
		<div class="ft">
		   	<p>可用余额：${BALANCE}元</p>
			<a href="myAccount/recharge" target="_blank" class="btn">充值</a>
		</div>
	</div>
	</div>

<div class="project-info" style="border: 1px solid #ddd;">
	<div class="hd">
		<ul class="info-type clearfix">
			<li class="on">
				项目详情			</li>
			<li class="">
				风险控制			</li>
			<li class="">
				还款计划			</li>
			<li class="">
				投资记录			</li>
					</ul>
					<a href="" class="btn btn-in-tab">马上投资</a>
			</div>
		<div class="bd">
		<div class="info-details">
			<div class="info info-prj-detail lazyload gallery" style="display: block;">
				<!-- <div class="rich-text"> -->
				<div>
					${projectDtail.PROJECT_DETAIL_TEXT}
			    </div>
		
			</div>
			<div class="info info-risk lazyload" style="display: none;">
				<div class="rich-text gallery">
					${ projectDtail.PROJECT_RISK_CONTROL}
				</div>					
			</div>
			<div class="info info-plain lazyload" style="display: none;">
				<p style="margin-left:100px;text-align:center;padding-bottom:20px;">
											注：还款计划以实际生成的投资合同为准，项目起息时间为投资次日。
									</p>
				<table class="table table-info-record table-class">
					<tbody><tr>
						<th>还款批次</th>
						<th>还款时间</th>
						<th>应还本息</th>
						<th>应还本金</th>
						<th>应还利息</th>
						<!-- <th>还款方式</th>
						<th>还款状态</th> -->
					</tr>
					<c:choose>
					<c:when test="${not empty repaymentList}">
						<c:forEach items="${repaymentList}" var="var" varStatus="vs">
						   <tr>
							<td class="t-no">${var.BATCH}</td>
							<td class="t-time">${var.REPAYMENT_DATE}</td>
							<td class="t-money">${var.CAPITAL+var.ACCRUAL}元</td>
							<td class="t-money">${var.CAPITAL}元</td>
							<td class="t-money">${var.ACCRUAL}元</td>
							<%-- <td>${var.REPAYMENT_WAY}</td>
							<td class="t-status">
							<c:if test="${var.STATUS==1}">待还款</c:if>
							<c:if test="${var.STATUS==2}">已还款</c:if>
							</td> --%>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="t-money">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody></table>
			</div>
			<div class="info info-record lazyload" style="display: none;">
				
				<table class="table table-info-record table-class">
					<tbody><tr>
						<th>序号</th>
						<th>投资人</th>
						<th>投资金额</th>
						<th>投资时间</th>
						<th>投资方式</th>
						<th>状态</th>
					</tr>
					
					<c:choose>
					<c:when test="${not empty buyRrcordList}">
						<c:forEach items="${buyRrcordList}" var="var" varStatus="vs">
						   <tr>
						<td class="t-no">${vs.index+1}</td>
						<td class="t-user">${fn:substring(var.USERNAME, 0, 1)}***${fn:substring(var.USERNAME, fn:length(var.USERNAME)-1, fn:length(var.USERNAME))}
							
						</td>
						<td class="t-money t-money-bj">${var.amount }元</td>
						<td class="t-time"><fmt:formatDate value="${var.create_date }" type="both"/>  </td>
						<td class="t-type">${var.type==1?'手动投标':'自动投标'}</td>
						<td class="t-status">成功</td>
					</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="t-money">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
				</table>
			</div>
					</div>
	</div>
</div>
<script type="text/javascript" src="<%=basePath %>jingtai/js/lazyload.min.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/magnific.js"></script>
<script type="text/javascript">
var progress = $('.project-profit');
function circle (elements,color,lineWidth) {
	$.each(elements, function(index,element){
		var canvas = $(element).find('canvas').eq(0)[0],
				speed = $(element).data('rate'),
				context = canvas.getContext('2d'),
				percentage = 0,
				per = 0,
				x = 100,
				y = x,
				r = 90,
				s = 1.5 * Math.PI;
		if(rate < 0.1){
			percentage =  0.12;
		}else{
			percentage = speed;
		}
		function update(){
			per += 0.015;
			context.clearRect(0,0,canvas.width,canvas.height);
			context.beginPath();
			context.strokeStyle = color;
			context.lineWidth = lineWidth;
			context.arc(x, y, r, s, ((per * 360.0) * (Math.PI / 180))+s, false);
			context.stroke();
			if (per < percentage) {
				requestAnimationFrame(update);
			}
		}
		requestAnimationFrame(update);
	});
}


(function (){
	if (!($.browser.ie && (+$.browser.version) < 9)) {
		$(window).on('load',function(e){
				circle(progress,'#299bd2',10);
		});
		
	}
	
}());



$(document).ready(function(){
	

	var prjSurplus = parseInt($('#prj-surplus').val()),//项目剩余金额
		$amount = $('#amount'),//输入的投资金额
		$income = $('#income'),//预计收入
		$noAmountTips = $('.no-amount-tips'),//根据填写投资金额，提示收益
		days    = parseInt($('#days').val(), 10),//项目期限--天
		rate    = parseFloat($('#rate').val()),//平台基准利率
		platform_rate = parseFloat($('.platform_rate').data('rate')||0),//老板补贴
		total_rate = rate + platform_rate,//总利率
		repayType = $('#repay-type').val(),//还款方式
		sTime   = new Date($('#stime').val().replace(/\-/g, '/')).getTime(),//项目开始时间
		eTime   = new Date($('#etime').val().replace(/\-/g, '/')).getTime(),//项目结束时间
		numberFormat = $.Utils.numberFormat,
		repayPlan = $.Utils.repayPlan(repayType);
		
		deadLine = '${pd.DEADLINE}';
	var prjID = '994',
			cookie_key = 'prj_pay_amount_'+prjID,
			is_douniu = '1048' == prjID;
	function setAmount(){
		var value = $.cookie.get(cookie_key);
		if(value && value.length!==0){
			$amount.val(value);
		}
	}
	
	setAmount();
	
		function countIncome(){
		$amount.val($amount.val().replace(/[^\d]/g, ''));
		var money = parseInt($amount.val() || 0, 10);
		if(!money){
			$noAmountTips.show();
			money = 100000;
		} else {
			$noAmountTips.hide();
		}
		var incomeMoney = numberFormat(repayPlan(money, total_rate, sTime, eTime), 2);
		//var incomeMoney = parseFloat(money)
		$income.text(incomeMoney);
	}
	
	<c:if test="${pd.PROJECT_STATE != 3 && pd.PROJECT_STATE != 2}">
	if($('.status-buy').length){
		countIncome();
	}
	</c:if>
	$amount.on('keyup', countIncome).on('blur', countIncome).focus();
	
	$('#buy-form').on('submit', function(e){
		var amount = $amount.trimVal();
		if(amount<${pd.LOWEST_AMOUNT}){
			  alert('未达到最低起投金额'+${pd.LOWEST_AMOUNT}+'元，详见左侧投资要求');
			  e.preventDefault();
		}else if ((amount % 100) != 0 || amount> prjSurplus) {
			alert('购买金额错误，必须为100元的整数倍且不能超过项目总额');
			e.preventDefault();
		}else{
			$.cookie.set(cookie_key, amount, {expires : 1000 * 3600 * 1});
		}
	});

	var $prjInfo = $('.project-info'),
		$tab     = $('.project-info>.hd'),
		tabTop   = $tab.offset().top,
		flagT    = new Date();
	$(window).on('scroll', function(e){
		var nowT = new Date();
		if(nowT - flagT > 100){
			$prjInfo[$(window).scrollTop() > tabTop ? 'addClass' : 'removeClass']('project-info-fixed');
			flagT = nowT;
		}
	});
	$('.btn-in-tab').on('click', function(e){
		e.preventDefault();
		$(window).scrollTop(0);
	});
	$prjInfo[$(window).scrollTop() > tabTop ? 'addClass' : 'removeClass']('project-info-fixed');

	$('.info-details img').each(function(index, img) {
		var $img = $(img);
		$img.addClass('lazy');
	});	

	function lazyLoadImg(){
		if (!$('.info:visible').hasClass('lazyload')) {
			$('.info:visible').find('img.lazy').lazyload({
				effect : "fadeIn",
				threshold : 200
			}).end().addClass('lazyload');
		}
	}
	/* --  tab control -- */
	$("ul.info-type.clearfix").find("li").each(function(i) {
		$(this).click(function() {
			$(this).siblings("li").removeClass("on");
			$(this).attr("class", "on");
			$("div.info-details").find('>div').hide().eq(i).show();
			lazyLoadImg();
			$(window).scrollTop(tabTop+1);
		});
	});

	var popTips = $('.pop-tips');
	$('.income-tips-ctrl').hover(function(){
		popTips.show();
	}, function(){
		popTips.hide();
	});

	$('.info-details>div table').addClass('table');

	if(!($.browser.ie && parseInt($.browser.version) < 7)){
		$('.info-details>.info img').each(function(idx, img){
			var $img = $(img);
			if($img.parents('a').length){
				$img.parents('a').addClass('withimg');
			} else {
				var src  = $img.attr('data-original'),
					a    = $('<a href="' + src + '" class="withimg"></a>');
				a.append($img.clone());
				$img.replaceWith(a);
			}
		});
		$('.info-details>.info').each(function(idx, el){
			$(el).magnificPopup({
				delegate: 'a.withimg',
				type: 'image',
				gallery:{
					enabled:true
				}
			});
		});
	}
	//斗牛行动
	/* if (is_douniu) {
		$('.info-details a').eq(0).removeClass('withimg').prop('href', window.CONFIG.BASE_URI + '/douniuxingdong').prop('target', '_blank');
	} */

	lazyLoadImg();
	/* --  interest rate tips -- */
	$('.platform_rate').on('mouseenter', function(event) {
		event.preventDefault();
		$(this).siblings('.platform_rate_tips').show();
	});
	$('.platform_rate').on('mouseleave', function(event) {
		event.preventDefault();
		$(this).siblings('.platform_rate_tips').hide();
	});
	
	
	/* $('.infomation').find('p').each(function(){
		console.log($(this).html());
		if($(this).html().length<=0){
			$(this).parent('li').remove();
		}
	});	
	$('.infomation').find('li').each(function(){
		console.log($(this).html());
		if($(this).html().length<=0){
			$(this).remove();
		}
	});	 */
	
	
	
	
});
$(function(){
	
	var htmlx=$('.info-details').html();
	var html1=htmlx.replace(/(<li>\s*<\li>)/,'').replace(/(<p>((\s*)|(<br>))<\/p>)/,'');
	
	$('.info-details').html(html1);
	//console.log('替换完成',html1);
	
});

$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=${pd.ID}");
	val_array.push("SUB_PAGE=1");
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
<script type="text/javascript" src="wj-static/js/zoom.js"></script>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
</body></html>