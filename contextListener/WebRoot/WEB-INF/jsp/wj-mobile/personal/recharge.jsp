<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>

<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title>万金先生 - 充值</title>
	<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
	<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/common.css" />
	<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/recharge.css" />
	
	<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript" charset="utf-8"></script>
	<style>
		.bank-not-support{
			display: none;
		}
	</style>
</head>

<body>
	<div class="chongzhi ddd">
		<p id="cz1">可用金额（元）：<span>${pd.BALANCE}</span></p>
		<p id="cz2">注：充值最低金额为100元</p>
		<p id="cz3">
			<input type="tel" name="amount" id="rechargeAmount" placeholder="请填写充值金额"/>
			<input type="hidden" name="rechargeBank" id="rechargeBank" value=""/>
		</p>
		<p id="cz4">当前绑定银行卡</p>
		<ul class="bank-list">
			<li>
				<p class="cz5 bank-not-support" id="no-bank">
					<span style="color:red">绑定的银行卡不支持移动端充值</span><i></i>
				</p>
			</li>
			<li data-bank="ICBC" data-code="3002">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1002.png">
					<span>中国工商银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="ABC" data-code="3005">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1005.png">
					<span>中国农业银行</span>
					<i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="CCB" data-code="3003">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1003.png">
					<span>中国建设银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="BOC" data-code="3026">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1026.png">
					<span>中国银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="CMB" data-code="3001">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1001.png">
					<span>招商银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<!-- <li data-bank="BCOM" data-code="3020">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1020.png">
					<span>交通银行</span><i class="fa fa-check"></i>
				</p>
			</li> -->
			<li data-bank="CMBC" data-code="3006">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1006.png">
					<span>中国民生银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="CEB" data-code="3022" >
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1022.png">
					<span>中国光大银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="SPDB" data-code="3004">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1004.png">
					<span>浦发银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="CIB" data-code="3009">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1009.png">
					<span>兴业银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<!-- <li data-bank="CITIC" data-code="3039">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1039.png">
					<span>中信银行</span><i class="fa fa-check"></i>
				</p>
			</li> -->
			<!-- <li data-bank="PSBC" data-code="3038">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1038.png">
					<span>中国邮政储蓄银行</span><i class="fa fa-check"></i>
				</p>
			</li> -->
			<li data-bank="PAB" data-code="3035">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1035.png">
					<span>平安银行</span><i class="fa fa-check"></i>
				</p>
			</li>
			<li data-bank="GDB" data-code="3036">
				<p class="cz5">
					<img src="https://res.baofoo.com/gw/resource/images/common/s1036.png">
					<span>广发银行</span><i class="fa fa-check"></i>
				</p>
			</li>
		</ul>
		<ul class="bank-recharge-limit">
			<li data-code="ICBC">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>5000</li>
						<li>5万</li>
					</ul>
				</div>
			</li>
			<li data-code="CCB">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>5万</li>
						<li>100万</li>
					</ul>
				</div>
			</li>
			<li data-code="ABC">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>50万</li>
						<li>50万</li>
					</ul>
				</div>
			</li>
			<li data-code="CMB">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>30万</li>
						<li>无</li>
					</ul>
				</div>
			</li>
			<li data-code="BOC">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>1万</li>
						<li>1万</li>
					</ul>
				</div>
			</li>
			<li data-code="SPDB">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>2万</li>
						<li>2万</li>
					</ul>
				</div>
			</li>
			<li data-code="GDB">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>1万</li>
						<li>1万</li>
					</ul>
				</div>
			</li>
			<li data-code="CMBC">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>5000</li>
						<li>5000</li>
					</ul>
				</div>
			</li>
			<li data-code="CIB">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>5000</li>
						<li>5000</li>
					</ul>
				</div>
			</li>
			<li data-code="CEB">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>5000</li>
						<li>5000</li>
					</ul>
				</div>
			</li>
			<li data-code="PAB">
				<div class="cz6">
					<ul class="czul1 clearfix">
						<li>卡种</li>
						<li>单笔限额（元）</li>
						<li>每日限额（元）</li>
					</ul>
					<ul class="czul2 cleardix">
						<li>储蓄卡</li>
						<li>1万</li>
						<li>1万</li>
					</ul>
				</div>
			</li>
		</ul>
		<!-- <p id="cz7">如当前银行卡不能满足充值需求，可到第三方平台点击“<i class="fa fa-cog"></i>”选择其他银行</p> -->
		<p id="cz8"><a href="javascript:void(0)" id="rechargeBtn">立即充值</a></p>
	</div>
	<%@include file="../common/main_nav.jsp" %>
	<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript" charset="utf-8"></script>
	<script src="wj-mobile-static/ui2/js/recharge.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			$('#body').width($(window).width()).height($(window).height());
			
			$('.bank-list li').hide().removeClass('selectedbank');
			var bankCode = '${bankInfo.BANK_CODE}';
			if(bankCode){
				$('[data-code='+bankCode+']').css('border','0').show().click();
				$('.bank-recharge-limit li[data-code='+$('#rechargeBank').val()+']').css('display','block');
			}else{
				$('#no-bank').show();
			}
			if(!$('.bank-list li').hasClass('selectedbank')){
				$('#rechargeBank').val('');
				$('#no-bank').show();
			}
			//console.log('${bankInfo.BANK_CODE}');
		});
		
	</script>
</body>
</html>
