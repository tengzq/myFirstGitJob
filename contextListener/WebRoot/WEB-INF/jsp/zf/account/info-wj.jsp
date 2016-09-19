<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 账户概览</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/info.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/calendar.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/calendar.js" type="text/javascript"></script>
</head>

<body style=" background:url(wj-static/images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
<%@ include file="../public/acc_left.jsp"%>
    <div class="content">
    	<div class="zhanghugailan">
        	<div class="box1">
            	<div class="title">
                	<b>您好：${pd.USERNAME }</b>
                    <em>
                    	<a href="register/realName" title="手机号"><i class="fa fa-phone"></i></a>
                        <a href="register/realName" title="邮箱"><i class="fa fa-envelope"></i></a>
                        <a href="register/realName" title="实名认证"><i class="fa fa-user"></i></a>
                    </em>
                    <div class="bar">
                    	信息完整度：
                        <p><i></i></p>
                    </div>
                </div>
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
						/* if('${pd.PAY_PASSWORD}'!=''&&'${pd.PAY_PASSWORD}'!=null&&'${pd.PAY_PASSWORD}'!='0'){
							i+=1;
						} */
						$(".bar p i").css("width",Math.round(10/8*i)*10+"%");
						$(".bar p").after(Math.round(10/8*i)*10+"%");
					});
				</script>
                <div class="con">
                	<div class="fr">
                    	<button><a href="myAccount/recharge" title="充值">充值</a></button>
                    	<button><a href="myAccount/draw_cash" title="提现">提现</a></button>
                    </div>
                    <ol>
                    	<li><img src="wj-static/images/member_03.png">我的余额：<b>
                    		<c:if test="${empty pd.BALANCE }">
								0.00
							</c:if>
							<c:if test="${not empty pd.BALANCE }">
								${pd.BALANCE }
							</c:if>
                    		</b>元</li>
                    	<li><img src="wj-static/images/member_06.png">累计收益：<b>
                    		<c:if test="${empty pd.YISHOU }">
								0.00
							</c:if>
							<c:if test="${not empty pd.YISHOU }">
								${pd.YISHOU }	
							</c:if>
                    		</b>元</li>
                    </ol>
                </div>
            </div>
            <div class="box2">
            	<div class="title3">
                	资产统计
                    <b><i>${pd.totalCapital+pd.totalAccrual+pd.FROZEN_AMOUNT+pd.BALANCE }</i>元</b>
                    <div class="fr">
                    	<b>还有<i>${pd.AMOUNTALL==null || pd.AMOUNTALL==''?'0.00':pd.AMOUNTALL}</i>元投资券 </b>
                    </div>
                    
                </div>
                <div class="box3">
                	<dl>
                    	<dt>万金计划</dt>
                        <dd>
                        	<ol>
                            	<li><i class="fr">
                            		<c:if test="${empty pd.totalCapital }">
										0.00	
									</c:if>
									<c:if test="${not empty pd.totalCapital }">
										${pd.totalCapital }	
									</c:if>
                            		元</i>待收本金</li>
                            	<li><i class="fr">
                            		<c:if test="${empty pd.totalAccrual }">
										0.00
									</c:if>
									<c:if test="${not empty pd.totalAccrual }">
										${pd.totalAccrual }
									</c:if>
                            		元</i>待收利息</li>
                            	<li><i class="fr">
                            		<c:if test="${empty pd.totalCapital && empty pd.totalAccrual }">
										0.00
									</c:if>
									<c:if test="${not empty pd.totalCapital }">
										${pd.totalCapital+pd.totalAccrual}
									</c:if>
                            		元</i>待收金额</li>
                            </ol>
                            <div class="btn">
                            	<button><a href="_project/goProjectList" title="计划投资"">投资万金计划</a></button>
                            </div>
                        </dd>
                    </dl>
                	<dl>
                    	<dt>邀请记录</dt>
                        <dd>
                        	<ol>
                            	<li><i class="fr">${pd.FRIENDS_COUNT}个</i>我的好友</li>
                            	<li><i class="fr">${pd.UTICKET_COUNT}张</i>累计投资券</li>
                            	<li><i class="fr">${totalEarningsAmount=='' || totalEarningsAmount==null?'0.00':totalEarningsAmount}元</i>累计返现</li>
                            </ol>
                            <div class="btn">
                            	<button><a href="_project/goProjectList" title="计划投资"">去投资</a></button>
                            	<button><a href="myAccount/userinvite" title="邀请好友">去邀请</a></button>
                            </div>
                        </dd>
                    </dl>
                </div>
                
            </div>
            <div class="box4">
            	<div class="title3">
                	回款计划
                </div>
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
						<a href="_project/goInvestmentRecord" title="查看已投项目">查看已投项目</a>
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
						<span class="year">2015</span>年<span class="month">5</span>月应收本息
						<strong>
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
    <div class="clear"></div>
</div>

<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
<script type="text/javascript">
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
	
	$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=8");
		val_array.push("WEB_OR_MOBILE=1");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	});
});	
</script>
</body>
</html>
