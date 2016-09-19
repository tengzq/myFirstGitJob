<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="leftmenu">
    	<ul>
        	<li class="list"><a href="myAccount/list">账户概览</a></li>
        	<li class="realName"><a href="register/realName">个人信息</a></li>
        	<li class="goInvestmentRecord"><a href="_project/goInvestmentRecord">投资记录</a></li>
        	<li class="fundsList"><a href="fundsflow/fundsList">资金流水</a></li>
        	<li class="recharge moneyOrderReques chooseRechargeWay"><a href="myAccount/recharge">我要充值</a></li>
        	<li class="draw_cash"><a href="myAccount/draw_cash">我要提现</a></li>
        	<!-- <li class="bindcard addBind"><a href="myAccount/bindcard">提现银行卡</a></li> -->
        	<li class="check"><a href="autobid/check">自动投标</a></li>
        	<li class="userinvite hover"><a href="myAccount/userinvite" style="background-color: #ff6264">邀请码机制</a></li>
        	<li class="investTicket"><a href="investrecord/investTicket">现金券</a></li>
        	<li class="message"><a href="myAccount/message" style="position:relative;">站内信<span style="display:none; position: absolute;right: 0;width: 0; height: 0;border-color: rgba(255, 0, 0,1) rgba(255, 0, 0,1) rgba(255, 255, 255,0) rgba(255, 255, 255,0); float: right;border-width: 6px;border-style: solid;filter: alpha(opacity=0);" ></span></a></li>
        </ul>
</div>
<script type="text/javascript" >
$(function(){
	var url = top.location.href;
	var urls = url.split('/');
	var thisTab = urls[urls.length-1].split('?')[0];
	$('.leftmenu').find('.'+thisTab).addClass('hover').siblings().removeClass('hover');
	$('.userinvite').addClass('hover');
	
	//查询用户有没有未读站内信
	$.ajax({
		type : 'get',
		url : 'myAccount/havaUnreadMsg',
		dataType : 'json',
		success : function(rs){
			if(rs.msg == 'show'){
				$('.message span').show();
			}
		}
	});
});
</script>