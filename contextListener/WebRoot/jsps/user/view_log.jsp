<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- saved from url=(0025)https://lantouzi.com/user -->
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="https://lantouzi.com/css/dialog_style.css?v2">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>懒投资 - 专为懒人打造的优质理财平台</title>
<meta name="keywords" content="懒投资,懒人投资,懒理财,理财">
<meta name="description" content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、贝塔斯曼、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。">
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">
<script async="" src="jingtai/js/analytics.js"></script><script type="text/javascript" async="" src="jingtai/js/trace.js"></script><script src="jingtai/js/hm.js"></script><script type="text/javascript">
(function(){
	window.CONFIG = {"PASSPORT_API_HOST":"https:\/\/u.dawanjia.com.cn\/user\/api\/","CAPTCHA_HOST":"https:\/\/u.dawanjia.com.cn\/captcha","ENCRYPT_TIMEOUT":120000,"SERVER_TIME":1432020387000};
	window.CONFIG.BASE_URI = 'https://lantouzi.com';
	window.CONFIG.SSO_URI  = CONFIG.BASE_URI + '/dwjsso';
	window.CONFIG.LTZ_API = CONFIG.BASE_URI + '/api/uc/';
	!window.console && (window.console = {log:function(){}});
})();
</script>
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
</script>	<link rel="stylesheet" type="text/css" href="jingtai/css/my.css">
	<script src="jingtai/js/PagerView.js"></script>
<img src="jingtai/css/v.do" height="1" width="1"><script type="text/javascript" src="jingtai/js/zz.js"></script></head>
<body>
	<div id="doc">
		<style>
	.nav a i {display:block;position: absolute;width:36px;height:16px;line-height: 16px;color:#fff;background: #ff7744;border-radius:5px;top:50%;margin-top:-20px;left:50%;margin-left:38px;text-align: center;font-style: normal;font-size:12px;}
</style>
<div id="hd">
	<div class="topbar">
	<div class="topbar-inner clearfix">
		<div class="alignleft tapbar-social">
			<p class="top-contact">
				联系电话&nbsp;&nbsp;400-807-8000&nbsp;
				<span style="color:#999;font-size:12px">（工作日 9:00-22:00）</span>
				<span class="social_contact" id="weibo_account"></span>
				<span class="social_contact" id="weixin_account"></span>
			</p>
			<div class="account_info" id="weibo_account_info">
				欢迎关注懒投资官方微博<br>
				<a href="http://weibo.com/lantouzicom" target="_blank" title="懒投资官方微博" rel="nofollow">@懒投资</a>
			</div>
			<div class="account_info" id="weixin_account_info">
				扫一扫关注懒投资微信
				<img src="jingtai/css/qrcode.png" width="150px" height="150px" title="微信号:lantouzicom">
				<p>微信号：lantouzicom</p>
			</div>
		</div>
		<div class="alignright">
			<p class="top-nav clearfix">
									<a href="jingtai/css/懒投资 - 专为懒人打造的优质理财平台.htm" rel="nofollow">欢迎，xyf200948350210</a>
					<a href="https://lantouzi.com/logout" rel="nofollow">[退出]</a>
								<a href="https://lantouzi.com/mobile/download" rel="nofollow">手机App</a>
				<a href="https://lantouzi.com/about/help">帮助中心</a>
			</p>
		</div>
	</div>
</div>	<div class="header clearfix">
		<div class="logo" style="position: relative;">
			<a href="https://lantouzi.com/" class="logoLink" title="懒投资"><span>懒投资</span></a>
			<!--Spring Festival Start-->
<!-- 			<a href="https://lantouzi.com/zt/festival" target="_blank" style="display:block;position: absolute;right: 0;top: 0;width:170px;height:65px;z-index:100"></a>
			<div style="display:block;position: absolute;right: 0;top: 0;outline: none;background:#fff;">
				<object type="application/x-shockwave-flash" name="flashad" data="https://s1.lantouzi.com/img/201502/slogan_new_year.swf" width="170" height="65" style="background:#fff;">
				<param name="quality" value="autohigh"><param name="wmode"></object>
			</div> -->
			<!--Spring Festival End-->

		</div>
		<div class="nav">
			<ul class="clearfix">
				<li>
					<a href="<%=basePath%>index2.jsp">首页</a>
				</li>
				<li>
					<a href="https://lantouzi.com/lingqianjihua" style="position:relative;">零钱计划<i class="beta">Beta</i></a>
				</li>
								<li>
					<a href="<%=basePath%>jsps/project/project_list.jsp">项目列表</a>
				</li>
				<li>
					<a href="<%=basePath%>jsps/guarantee/company_profile.jsp">安全保障</a>
				</li>
								
				<li class="my-account on">
									<a href="<%=basePath%>jsps/user/view_log.jsp" rel="nofollow">我的账户</a>
								</li>
				
			</ul>
		</div>
	</div>
</div>
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
				<span class="name">您好：xyf200948350210</span>
									<a href="https://lantouzi.com/user/account" title="手机号"><i class="phone"></i></a>
													<a href="https://lantouzi.com/user/account/verify_mail" class="unfinished" title="邮箱"><i class="email"></i></a>
													<a href="https://lantouzi.com/user/account" title="实名认证"><i class="idcard"></i></a>
								<em>| 信息完善度：
					<span class="process-bar process-full">
						<b style="width:70%"></b>
					</span>
					<span class="process-num">70%</span>
				</em>
				</p>
			</div>
			<div class="account">
				<p class="amount"><i></i>我的余额<strong>0.<span>00</span></strong>元</p>
				<p class="all"><i></i>累计收益<strong>0.<span>00</span></strong>元</p>
			</div>
			<div class="method clearfix">
				<a href="https://lantouzi.com/user/recharge" class="ltz-user-btn recharge tongji" title="充值" data-category="充值" data-label="index">充值</a>
				<a href="https://lantouzi.com/user/withdraw" class="ltz-user-btn withdraw" title="提现">提现</a>
			</div>
		</div>
	</div>
	<div class="ltz-user">
		<div class="ltz-user-statis clearfix">
			<h2 class="user-section-title">资产统计</h2>
			<p class="total-amount"><strong>0.<span>00</span></strong>元</p>
			<p class="total-coupon">还有 <a href="https://lantouzi.com/user/coupon?type=1"><strong>280.<span>00</span></strong></a> 元投资劵</p>
			<div class="lljh">
				<h3 class="jh-title">懒人计划</h3>
				<table class="jh-table">
					<tbody><tr>
						<td style="width:40%">待收本金</td>
						<td class="money"><strong>0.<span>00</span></strong>元</td>
					</tr>
					<tr>
						<td>待收利息</td>
						<td class="money"><strong>0.<span>00</span></strong>元</td>
					</tr>
					<tr>
						<td>锁定金额</td>
						<td class="money"><strong>0.<span>00</span></strong>元</td>
					</tr>
				</tbody></table>
				<a href="https://lantouzi.com/project" title="投资懒人计划" class="ltz-user-btn">投资懒人计划</a>
			</div>
			<div class="lqjh">
				<h3 class="jh-title">零钱计划</h3>
				<table class="jh-table">
					<tbody><tr>
						<td style="width:40%">持有金额</td>
						<td class="money"><strong>0.<span>00</span></strong>元</td>
					</tr>
					<tr>
						<td>昨日收益</td>
						<td class="money"><strong>0.<span>00</span></strong>元</td>
					</tr>
					<tr>
						<td>昨日年化</td>
						<td class="money"><strong>0.00</strong>%</td>
					</tr>
				</tbody></table>
				<a href="https://lantouzi.com/lingqianjihua" title="认购" class="ltz-user-btn">认购零钱计划</a>
				<a href="https://lantouzi.com/lingqianjihua/redeem" title="赎回" class="ltz-user-btn redeem">赎回</a>
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
					<div class="cal-days"><ul class="day-name clearfix"><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class="days clearfix"><li class="other-month">26</li><li class="other-month">27</li><li class="other-month">28</li><li class="other-month">29</li><li class="other-month">30</li><li class="cur-month ck-day" data-date="Fri May 01 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="01">1</li><li class="cur-month ck-day" data-date="Sat May 02 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="02">2</li><li class="cur-month ck-day" data-date="Sun May 03 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="03">3</li><li class="cur-month ck-day" data-date="Mon May 04 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="04">4</li><li class="cur-month ck-day" data-date="Tue May 05 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="05">5</li><li class="cur-month ck-day" data-date="Wed May 06 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="06">6</li><li class="cur-month ck-day" data-date="Thu May 07 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="07">7</li><li class="cur-month ck-day" data-date="Fri May 08 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="08">8</li><li class="cur-month ck-day" data-date="Sat May 09 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="09">9</li><li class="cur-month ck-day" data-date="Sun May 10 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="10">10</li><li class="cur-month ck-day" data-date="Mon May 11 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="11">11</li><li class="cur-month ck-day" data-date="Tue May 12 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="12">12</li><li class="cur-month ck-day" data-date="Wed May 13 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="13">13</li><li class="cur-month ck-day" data-date="Thu May 14 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="14">14</li><li class="cur-month ck-day" data-date="Fri May 15 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="15">15</li><li class="cur-month ck-day" data-date="Sat May 16 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="16">16</li><li class="cur-month ck-day" data-date="Sun May 17 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="17">17</li><li class="cur-month ck-day" data-date="Mon May 18 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="18">18</li><li class="cur-month ck-day cur-day" data-date="Tue May 19 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="19">19</li><li class="cur-month ck-day" data-date="Wed May 20 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="20">20</li><li class="cur-month ck-day" data-date="Thu May 21 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="21">21</li><li class="cur-month ck-day" data-date="Fri May 22 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="22">22</li><li class="cur-month ck-day" data-date="Sat May 23 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="23">23</li><li class="cur-month ck-day" data-date="Sun May 24 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="24">24</li><li class="cur-month ck-day" data-date="Mon May 25 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="25">25</li><li class="cur-month ck-day" data-date="Tue May 26 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="26">26</li><li class="cur-month ck-day" data-date="Wed May 27 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="27">27</li><li class="cur-month ck-day" data-date="Thu May 28 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="28">28</li><li class="cur-month ck-day" data-date="Fri May 29 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="29">29</li><li class="cur-month ck-day" data-date="Sat May 30 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="30">30</li><li class="cur-month ck-day" data-date="Sun May 31 2015 00:00:00 GMT+0800 (中国标准时间)" data-day="31">31</li><li class="other-month">1</li><li class="other-month">2</li><li class="other-month">3</li><li class="other-month">4</li><li class="other-month">5</li><li class="other-month">6</li></ul></div> 
				</div>
				<div id="payBackCal" class="payBackCal">
					<div class="back-cal-header">
						<a href="https://lantouzi.com/user/order/datalist" title="查看已投项目">查看已投项目</a>
					</div>
					<div class="back-cal-body clearfix">
						<div class="pay-cal clearfix">
							<div class="pay-day">
								<span class="dayName">星期二</span><span class="day">19</span>	
							</div>
							<div class="need-pay">
								<span class="tips"><i></i>应收本息</span>
								<span class="money"><strong>0.00</strong>元</span>	
								<span class="ahead-part">含提前还款<strong>0.00</strong>元</span>
							</div>
						</div>
					</div>
					<div class="back-cal-footer">
						<span class="year">2015</span>年<span class="month">5</span>月应收本息<strong>0</strong>元
					</div>
				</div>
			</div>
		</div> 
	</div>
	</div>
<script type="text/tmpl" id="dialog_email_first">
	<div class="dg_wrapper dialog_email_first">
		<span class="close-btn" title="关闭">X</span>
		<h3>完成邮箱认证，即可享受优质服务。</h3>
		<a class="btn" href="https://lantouzi.com/user/account/verify_mail" title="立即验证邮箱">立即验证邮箱</a>
	</div>
</script>
<script type="text/javascript">
$(document).ready(function(){
	//Email & Username
	var notVerifyEmailUser = !'',
			cookie_key = "email_first_" + "762323",
			needChangeUserName = '0',
			UserName = "xyf200948350210";
	var needEmailPanel = !$.cookie.get(cookie_key) && notVerifyEmailUser && needChangeUserName !== '1';
	needEmailPanel && seed.use('dialog', function(){
		var $aside = $('.aside');
		var dialogEmial = new $.ui.Dialog(document, {
				elem : $('#dialog_email_first').html(),
				drag : false,
				fixed : true,
				overlay : true,
				lock : true,
				trigger : 'email_first'
		});
		$(document).on('click', '.close-btn',function(e){
			e.preventDefault();
			dialogEmial.close();
		});
		$(document).trigger('email_first');
		$.cookie.set(cookie_key, 1, {expires : 100 * 3600 * 24 * 1000});
	});
	if (needChangeUserName==='1') {
		seed.use('dialog', function(){
			var $aside = $('.aside');
			var dialogUsename = new $.ui.Dialog(document, {
					elem : $('#dialog_username_change').html(),
					drag : false,
					fixed : true,
					left: $aside.offset().left + $aside.width() + 10 +'px',
					top: $aside.offset().top + 10 +'px',
					overlay : true,
					lock : true,
					trigger : 'username_change'
			});
			$(document).on('click', '.close-btn',function(e){
				e.preventDefault();
				dialogUsename.close();
			});
			$(document).trigger('username_change');
			setTimeout(function(){
				var $dialog = $('.dialog_username_change'),
						$username = $dialog.find('input'),
						$errorTips = $dialog.find('.err-tips'),
						$subimt = $dialog.find('a');
				var unavailableIds = [];
				function postName(){
					$subimt.addClass('disabled');
					Passport.updateUsername($.trim($username.val())).then(function(){
						window.location.reload();
					}).fail(function(err){
						$errorTips.text(err.msg || '抱歉，网络错误请重试');
						$dialog.removeClass('ok').addClass('err');
						$subimt.removeClass('disabled');
					});
				}
				function ckUsername(ele){
					var $name = ele;
					var name = $.trim($name.val());
					if (name===UserName) {
						postName();
						$dialog.removeClass('err').addClass('ok');
						return true;
					}
					if(/^[a-zA-Z]\w{3,15}$/.test(name)){
						if($.inArray(name, unavailableIds) > -1){
							$errorTips.text('抱歉，用户名已被占用');
							$dialog.removeClass('ok').addClass('err');
							return false;
						}else{
							Passport.checkName(name).then(function(){
								$dialog.removeClass('err').addClass('ok');
								postName();	
							}).fail(function(err){
								unavailableIds.push(name);
								$errorTips.text(err.msg || '抱歉，用户名已被占用');
								$dialog.removeClass('ok').addClass('err');
							});
							return true;
						}
					} else if(name.length===0) {
						$errorTips.text('用户名不能为空');
						$dialog.removeClass('ok').addClass('err');
						return false;
					} else if(!/^[a-zA-Z]/.test(name)) {
						$errorTips.text('用户名只能字母开头');
						$dialog.removeClass('ok').addClass('err');
						return false;
					} else {
						$errorTips.text('用户名需为4-16位英文/数字');
						$dialog.removeClass('ok').addClass('err');
						return false;
					}
				}
				$username.on('focus', function(e) {
					$errorTips.text('');
					$dialog.removeClass('ok err');
				});
				$subimt.on('click', function(e) {
					e.preventDefault();
					if ($(this).hasClass('disabled')) {
						return false;
					}
					ckUsername($username);
				});
			},500);
		});
	}
	//Lock Money
	var $tipsCtrl = $('.lock'),
			$tips = $('.lock-tips'),
			t;
	if ($tipsCtrl.length!==0) {
		$tips.css('left', $tipsCtrl.offset().left+30);
		$tipsCtrl.on('mouseover', function(){
			clearTimeout(t);
			$tips.show();
		}).on('mouseout', function(){
			t = setTimeout(function(){
				$tips.hide();
			}, 500);
		});
		$tips.on('mouseenter', function(){
			clearTimeout(t);
			$tips.show();
		}).on('mouseleave', function(){
			$tips.hide();
		});
	}
});
</script>
<script src="jingtai/js/calendar.js"></script>
<script>
//Calendar
$(document).ready(function(){
var cal = new Calendar(),
		date = new Date(),
		today = {
			year: date.getFullYear(),
			month: date.getMonth()+1
		},
		API = 'https://lantouzi.com/api/user/get_repay_plan';
cal.init(today.year.toString()+today.month.toString(),API);
});
</script>
				</div>
				<div class="aside alignleft">
	
	<div class="my-nav">
		<ul class="my-nav-1stlevel-list">
			<li class="my-nav-1stlevel on"><h3>
			<a href="<%=basePath%>jsps/user/view_log.jsp">账户概览</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/invest_record.jsp">投资记录</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="https://lantouzi.com/user/lingqianjihua">零钱计划<i>Beta</i></a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/funds_flow.jsp">资金流水</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/user_recharge.jsp ">我要充值</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/draw_cash.jsp">我要提现</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/draw_card.jsp">提现银行卡</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/auto_bid.jsp">自动投标</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/invest_ticket.jsp">投资券</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/experience_money.jsp">体验金<i>Beta</i></a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/user_information.jsp">个人信息</a>
			</h3></li><li class="my-nav-1stlevel"><h3>
			<a href="<%=basePath%>jsps/user/invite_history.jsp">邀请有奖</a>
			</h3></li>		</ul>
	</div>
</div>
			</div>			
		</div>
		<div id="ft">
	<div class="clearfix ft-links">
		<div class="alignleft ft-links-item about">
			<h3>关于懒投资</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about" rel="nofollow">公司介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/team" rel="nofollow">团队介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/contact" rel="nofollow">联系我们</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/joinus" rel="nofollow">加入我们</a>
				</li>
			</ul>
		</div>
		<div class="alignleft ft-links-item protocol">
			<h3>保障/协议</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about/security" rel="nofollow">安全保障</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/law" rel="nofollow">法律保障</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/agreement" rel="nofollow">服务协议</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/privacy" rel="nofollow">隐私声明</a>
				</li>				
			</ul>
		</div>
		<div class="alignleft ft-links-item help">
			<h3>帮助中心</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about/help" rel="nofollow">常见问题</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/baoli" rel="nofollow">保理业务介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/qufenqi" rel="nofollow">分期债权介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/repayment_ways" rel="nofollow">还款方式介绍</a>
				</li>
			</ul>
		</div>
		<div class="alignleft ft-links-item contact">
			<h3>联系我们</h3>
			<ul class="bd">
				<li>
					联系电话：400-807-8000&nbsp;（工作日 9:00-22:00）
				</li>
				<li>
					客服邮箱：<a href="mailto:kefu@lantouzi.com" rel="nofollow">kefu@lantouzi.com</a>
				</li>
				<li>
					公司地址：北京市朝阳区三里屯SOHO  A座1701室
				</li>
				<li>
					我要合作：<a href="mailto:bd@lantouzi.com" rel="nofollow">bd@lantouzi.com</a>
				</li>
			</ul>
		</div>
		<div class="wx_qrcode">
			<img src="jingtai/css/qrcode.png" width="120px" height="120px" title="微信号:lantouzicom">
		</div>
	</div>
	<div class="clearfix ft-bottom">
		<div class="alignleft">
			<div class="safeguard clearfix">
				<a href="http://www.yeepay.com/" class="safe-yeepay" target="_blank" rel="nofollow"></a>
				<a href="http://www.geotrust.com/" class="safe-geotrust" target="_blank" rel="nofollow"></a>
				<a href="http://webscan.360.cn/" class="safe-360" target="_blank" rel="nofollow"></a>
				<a href="https://www.sobug.com/" class="safe-sobug" target="_blank" rel="nofollow"></a>
				<a href="http://sealinfo.trustutn.org/sealinfo/P31000020121218204627106798.html" class="safe-trustutn" target="_blank" rel="nofollow"></a>
				<a href="https://s1.lantouzi.com/img/201412/renzheng.jpg" class="safe-acifi" target="_blank" rel="nofollow"></a>
			</div>
			<div class="links clearfix"></div>
		</div>
		<div class="alignright copyright">
			<p>京ICP备14023229号 京ICP证150240号</p>
			<p>北京大家玩科技有限公司&nbsp;&nbsp;版权所有</p>
			<p><a href="https://lantouzi.com/user?ua=pc" style="color:#999;padding:0px 5px;" rel="nofollow">PC版</a>
			<a href="https://lantouzi.com/user?ua=mobile" style="color:#999;padding:0px 5px;text-decoration:underline" rel="nofollow">手机版</a></p>
		</div>
	</div>
	</div>

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
$(document).ready(function(e){
	if ($.browser.ie && $.browser.version <= 9.0) {
		var placeHoldersrc = "https://lantouzi.com/js/placeholderIE.js?v=2";
		$('body').append('<script type="text/javascript" src="'+ placeHoldersrc +'"/>');
		var els = [];
		$('input[placeholder]').each(function(idx, el){
			els.push(el);
		});
		placeholderIE({margin:'8px 0px 0px 10px',fontSize:'16px'}, els);
	}

	var $social_contact = $('.social_contact'),
			$account_info = $('.account_info'),
			t;
	$social_contact.on('mouseover',function(event) {
		var $target = $('#' + this.id + '_info');
		clearTimeout();
		$target.show();
		$(this).addClass(this.id+'_hover');
	}).on('mouseout', function(event) {
		var name = this.id;
		t = setTimeout(function(){
			$account_info.hide();
			$('#'+name).removeClass(name+'_hover');
		}, 100);
	});
	$account_info.on('mouseenter', function(event){
		clearTimeout(t);
		var $target = $('#' + this.id);
		$target.show();
	}).on('mouseleave', function(event){
		var name = this.id.split('_info')[0];
		$account_info.hide();
		$('#'+name).removeClass(name+'_hover');
	});
	
	//加载友情链接
	//loadLinks();

	function loadLinks(){
		var qd_url = "https://lantouzi.com/union/hello",
			current_url = location.protocol + '//' + location.hostname + location.pathname; 
		if (current_url== qd_url) {
			return;
		}
		var xhr = $.ajax({
			type:'GET',
			url:'/api/links',
			data:"",
			dataType: "json"
		});
		xhr.done(function(r) {
			var h = '',
					i = 0,
					l = r.data.length;
			if (!l) {
				r.data = LINKS;
				l = r.data.length;
			}
			for ( ; i < l; i++) {
				var item = r.data[i];
				if (h) {
					h += '<span>|</span>';
				}
				h += '<a href="' + item.url + '" target="_blank">' + item.name + '</a>';
			}
			var href = "https://lantouzi.com/links";
			h += '<a href="' + href + '" target="_blank" class="all">查看全部链接</a>';

			h = '友情链接：' + h;
			$('#ft .links').html(h);
		});
	}
});
</script>

<script type="text/javascript">
var _zzsiteid="rnhYv03GpMt";
var _zzid = "rnhYv03GpMs";
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?6dea39ac37df9c6f3e7b096755b73949";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);

	$(document).on('mousedown', '.tongji', function(e){
		var $el = $(this);
		var category = $el.attr('data-category') || $.trim($el.text()),
				action   = $el.attr('data-action') || 'click',
				label    = $el.attr('data-label') || '',
				value    = $el.attr('data-value') || '';
		_hmt.push(['_trackEvent', category, action, label, value]);
	});
	var zz = document.createElement('script');
	zz.type = 'text/javascript';
	zz.async = true;
	zz.src = ('https:' == document.location.protocol ? 'https://ssl.trace.zhiziyun.com' : 'http://static.zhiziyun.com/trace') + '/api/trace.js';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(zz, s);

})();
</script>
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	ga('create', 'UA-60788439-1', 'auto');
	ga('send', 'pageview');
</script>
	</div>


<div class="ecope_overlay" style="margin: 0px; padding: 0px; display: none; position: fixed; top: 0px; left: 0px; width: 100%; height: 100%; z-index: 9999;"></div><div class="ecope_dialog" style="padding: 0px; display: none; z-index: 10000; position: fixed; top: 291.5px; left: 654px; margin-top: -101px; margin-left: -221px;"><div class="dg_wrapper dialog_email_first" style="display: none;">
		<span class="close-btn" title="关闭">X</span>
		<h3>完成邮箱认证，即可享受优质服务。</h3>
		<a class="btn" href="https://lantouzi.com/user/account/verify_mail" title="立即验证邮箱">立即验证邮箱</a>
	</div></div><iframe src="jingtai/cm.htm" scrolling="no" width="1" height="1" style="display: none;"></iframe></body></html>