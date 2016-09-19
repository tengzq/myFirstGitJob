<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>账房先生 - 专为账房打造的优质理财平台</title>
<meta name="keywords" content="账房先生,账房投资,懒理财,理财">
<meta name="description" content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、贝塔斯曼、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。">
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">
<script type="text/javascript">
</script>
<script type="text/javascript" src="jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="jingtai/js/seed.min.js"></script>
<link rel="stylesheet" type="text/css" href="jingtai/css/my.css">
	<script src="jingtai/js/PagerView.js"></script>
<script type="text/javascript" src="jingtai/js/zz.js"></script></head>
<body>
	<div id="doc">
		<style>
	.nav a i {display:block;position: absolute;width:36px;height:16px;line-height: 16px;color:#fff;background: #ff7744;border-radius:5px;top:50%;margin-top:-20px;left:50%;margin-left:38px;text-align: center;font-style: normal;font-size:12px;}
</style>
<%@ include file="../public/top.jsp"%>
		<div id="bd">
			<div class="content clearfix">
				<div class="main alignright">
					<link rel="stylesheet" type="text/css" href="jingtai/css/index.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/calendar.css">
<div id="ltz-user-index">
	<div class="ltz-user">
		<div class="ltz-user-info">
			<div class="info">
				<p>
				<span class="name">您好：${pd.USERNAME }</span>
									<a href="register/realName" title="手机号"><i class="phone"></i></a>
													<a href="register/realName" class="unfinished" title="邮箱"><i class="email"></i></a>
													<a href="register/realName" title="实名认证"><i class="idcard"></i></a>
								<em>| 信息完善度：
					<span class="process-bar process-full">
						<b></b>
					</span>
					<span class="process-num"></span>
				</em>
				</p>
			</div>
			
			<div class="account">
				<p class="amount"><i></i>我的余额<strong>
				<c:if test="${empty pd.BALANCE }">
					<span>0.00</span>
				</c:if>
				<c:if test="${not empty pd.BALANCE }">
					<span><span>${pd.BALANCE }</span></span>
				</c:if>
				</strong>元</p>
				<p class="all"><i></i>累计收益<strong>
				<c:if test="${empty pd.YISHOU }">
					<span>0.00</span>
				</c:if>
				<c:if test="${not empty pd.YISHOU }">
					<span>${pd.YISHOU }</span>
				</c:if>
				</strong>元</p>
			</div>
			<div class="method clearfix">
				<a href="myAccount/recharge" class="ltz-user-btn recharge tongji" title="充值" data-category="充值" data-label="index">充值</a>
				<a href="myAccount/draw_cash" class="ltz-user-btn withdraw" title="提现">提现</a>
			</div>
		</div>
	</div>
	<div class="ltz-user">
		<div class="ltz-user-statis clearfix">
			<h2 class="user-section-title">资产统计</h2>
			<p class="total-amount"><strong><span>${pd.CAPITALALL+pd.DAISHOU+pd.FROZEN_AMOUNT+pd.BALANCE }</span></strong>元</p>
			<p class="total-coupon">还有 <a href=""><strong><span>${pd.AMOUNTALL }</span></strong></a> 元投资劵</p>
			<div class="lljh">
				<h3 class="jh-title">账房计划</h3>
				<table class="jh-table">
					<tbody>
					<tr>
						<td style="width:40%">待收本金</td>
						<td class="money"><strong>
						<c:if test="${empty pd.CAPITALALL }">
							<span>0.00</span>
						</c:if>
						<c:if test="${not empty pd.CAPITALALL }">
							<span>${pd.CAPITALALL }</span>
						</c:if>
						</strong>元</td>
					</tr>
					<tr>
						<td>待收利息</td>
						<td class="money"><strong><span>
						<c:if test="${empty pd.DAISHOU }">
							0.00
						</c:if>
						<c:if test="${not empty pd.DAISHOU }">
							${pd.DAISHOU }
						</c:if>
						
						</span></strong>元</td>
					</tr>
					<tr>
						<td>锁定金额</td>
						<td class="money"><strong><span>
						<c:if test="${empty pd.FROZEN_AMOUNT }">
							0.00
						</c:if>
						<c:if test="${not empty pd.FROZEN_AMOUNT }">
							${pd.FROZEN_AMOUNT}
						</c:if>
						</span></strong>元</td>
					</tr>
				</tbody></table>
				<a href="_project/goProjectList" title="投资账房计划" class="ltz-user-btn">投资账房计划</a>
			</div>
			
			<div class="lljh">
				<h3 class="jh-title">邀请奖励</h3>
				<table class="jh-table">
					<tbody>
					<tr>
						<td style="width:40%">我的好友</td>
						<td class="money"><strong><span>${pd.FRIENDS_COUNT}</span></strong>个</td>
					</tr>
					<tr>
						<td>累计投资卷</td>
						<td class="money"><strong><span>${pd.UTICKET_COUNT}</span></strong>张</td>
					</tr>
					<tr>
						<td>累计返现</td>
						<td class="money"><strong><span>${pd.FROZEN_AMOUNT}</span></strong>元</td>
					</tr>
				</tbody></table>
				<a href="_project/goProjectList" title="投资账房计划" class="ltz-user-btn" style="float:left;width: 80px;margin-left: 60px;">去投资</a>
				<a href="register/userinvite?ID=pg_yaoqingjiang" title="投资账房计划" class="ltz-user-btn" style="float: right;width: 80px;margin-left: 0;margin-right: 60px;">去邀请</a>
				<div style="clear:both"></div>
			</div>
			
		</div>
	</div>
	<div class="ltz-user">
		<div class="ltz-user-calendar">
			<h2 class="user-section-title">回款计划</h2>
			<div class="my-calendar clearfix">
				<div id="calendar" class="calendar">
					<div class="cal-header clearfix">
						<a title="上月" class="prev disabled">上月</a>
						<div class="jump-today" title="回到今天"><span class="year">2015年</span><span class="month">5月</span></div>
						<a title="下月" class="next disabled">下月</a>
					</div>
					<div class="cal-days">
					<ul class="day-name clearfix">
					<li>日</li>
					<li>一</li><li>二</li><li>三</li>
					<li>四</li><li>五</li><li>六</li>
					</ul>
					<ul class="days clearfix">
					<li class="other-month">26</li>
					<li class="other-month">27</li>
					<li class="other-month">28</li>
					<li class="other-month">29</li>
					<li class="other-month">30</li>
					<li class="cur-month ck-day" data-date="Fri May 01 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="01">1</li><li class="cur-month ck-day" data-date="Sat May 02 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="02">2</li><li class="cur-month ck-day" data-date="Sun May 03 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="03">3</li><li class="cur-month ck-day" data-date="Mon May 04 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="04">4</li><li class="cur-month ck-day" data-date="Tue May 05 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="05">5</li><li class="cur-month ck-day" data-date="Wed May 06 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="06">6</li><li class="cur-month ck-day" data-date="Thu May 07 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="07">7</li>
					<li class="cur-month ck-day" data-date="Fri May 08 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="08">8</li><li class="cur-month ck-day" data-date="Sat May 09 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="09">9</li><li class="cur-month ck-day" data-date="Sun May 10 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="10">10</li><li class="cur-month ck-day" data-date="Mon May 11 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="11">11</li><li class="cur-month ck-day" data-date="Tue May 12 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="12">12</li><li class="cur-month ck-day" data-date="Wed May 13 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="13">13</li><li class="cur-month ck-day" data-date="Thu May 14 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="14">14</li><li class="cur-month ck-day" data-date="Fri May 15 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="15">15</li><li class="cur-month ck-day" data-date="Sat May 16 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="16">16</li><li class="cur-month ck-day" data-date="Sun May 17 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="17">17</li><li class="cur-month ck-day" data-date="Mon May 18 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="18">18</li>
					<li class="cur-month ck-day cur-day" data-date="Tue May 19 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="19">19</li><li class="cur-month ck-day" data-date="Wed May 20 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="20">20</li><li class="cur-month ck-day" data-date="Thu May 21 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="21">21</li><li class="cur-month ck-day" data-date="Fri May 22 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="22">22</li><li class="cur-month ck-day" data-date="Sat May 23 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="23">23</li><li class="cur-month ck-day" data-date="Sun May 24 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="24">24</li><li class="cur-month ck-day" data-date="Mon May 25 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="25">25</li><li class="cur-month ck-day" data-date="Tue May 26 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="26">26</li><li class="cur-month ck-day" data-date="Wed May 27 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="27">27</li><li class="cur-month ck-day" data-date="Thu May 28 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="28">28</li><li class="cur-month ck-day" data-date="Fri May 29 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="29">29</li><li class="cur-month ck-day" data-date="Sat May 30 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="30">30</li><li class="cur-month ck-day" data-date="Sun May 31 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="31">31</li><li class="other-month">1</li><li class="other-month">2</li><li class="other-month">3</li><li class="other-month">4</li><li class="other-month">5</li><li class="other-month">6</li></ul></div> 
				</div>
				<div id="payBackCal" class="payBackCal">
					<div class="back-cal-header">
						<a href="investrecord/investList" title="查看已投项目">查看已投项目</a>
					</div>
					<div class="back-cal-body clearfix">
						<div class="pay-cal clearfix">
							<div class="pay-day">
								<span class="dayName">星期二</span><span class="day">19</span>	
							</div>
							<div class="need-pay">
								<span class="tips"><i></i>应收本息</span>
								<span class="money"><strong></strong>元</span>	
								<span class="ahead-part">含提前还款<strong></strong>元</span>
							</div>
						</div>
					</div>
					<div class="back-cal-footer">
						<span class="year">2015</span>年<span class="month">5</span>月应收本息<strong>
						<c:if test="${empty pd.M_ACCRUALALL }">
							0.00
						</c:if>
						<c:if test="${not empty pd.M_ACCRUALALL }">
							${pd.M_ACCRUALALL }
						</c:if>
						</strong>元
					</div>
				</div>
			</div>
		</div> 
	</div>
	</div>

<script src="jingtai/js/calendar.js"></script>
<script type="text/javascript">
$(function(){
	var i=0;
	if('${pd.USERNAME}'!=''&&'${pd.USERNAME}'!=null){
		i+=1;
	}
	if('${pd.PASSWORD}'!=''&&'${pd.PASSWORD}'!=null){
		i+=1;
	}
	if('${pd.REAL_NAME}'!=''&&'${pd.REAL_NAME}'!=null){
		i+=1;
	}
	if('${pd.EMAIL}'!=''&&'${pd.EMAIL}'!=null){
		i+=1;
	}
	if('${pd.TEL}'!=''&&'${pd.TEL}'!=null){
		i+=1;
	}
	if('${pd.IDENTITY}'!=''&&'${pd.IDENTITY}'!=null){
		i+=1;
	}
	if('${pd.BANK_CARD}'!=''&&'${pd.BANK_CARD}'!=null){
		i+=1;
	}
	if('${pd.ADRESS}'!=''&&'${pd.ADRESS}'!=null){
		i+=1;
	}
	if('${pd.PAY_PASSWORD}'!=''&&'${pd.PAY_PASSWORD}'!=null&&'${pd.PAY_PASSWORD}'!='0'){
		i+=1;
	}
	$(".process-full b").css("width",Math.round(10/9*i)*10+"%");
	$(".process-num").text(Math.round(10/9*i)*10+"%");
});
</script>
<script>
//Calendar
$(document).ready(function(){
var cal = new Calendar(),
		date = new Date(),
		today = {
			year: date.getFullYear(),
			month: date.getMonth()+1
		},
		API = '';
cal.init(today.year.toString()+today.month.toString(),API);
});
</script>
				</div>
				<%@ include file="../public/acc_left.jsp"%>
			</div>			
		</div>
		<%@ include file="../public/foot.jsp"%>

<script type="text/javascript">
var LINKS = [{
	'name': '网贷之家',
	'url': 'http://www.wangdaizhijia.com/'
},{
	'name': '网贷联盟网',
	'url': 'http://www.wdlm.cn/'
}, {
	'name': '网贷天眼',
	'url': 'http://www.p2peye.com/'
},{
	'name': '融途网',
	'url': 'http://www.erongtu.com/'
},{
	'name': '理财114',
	'url': 'http://www.licai114.com/'
},{
	'name': 'P2P理财',
	'url': 'http://www.dianpifa.com'
}];

</script>


	</div>


<div class="ecope_overlay" style="margin: 0px; padding: 0px; display: none; position: fixed; top: 0px; left: 0px; width: 100%; height: 100%; z-index: 9999;"></div><div class="ecope_dialog" style="padding: 0px; display: none; z-index: 10000; position: fixed; top: 291.5px; left: 654px; margin-top: -101px; margin-left: -221px;"><div class="dg_wrapper dialog_email_first" style="display: none;">
		<span class="close-btn" title="关闭">X</span>
		<h3>完成邮箱认证，即可享受优质服务。</h3>
		<a class="btn" href="<%=basePath%>main" title="立即验证邮箱">立即验证邮箱</a>
	</div></div><iframe src="jingtai/cm.htm" scrolling="no" width="1" height="1" style="display: none;"></iframe></body></html>
