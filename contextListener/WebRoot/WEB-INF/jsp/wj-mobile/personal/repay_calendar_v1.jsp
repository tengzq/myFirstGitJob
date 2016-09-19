<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>万金先生 - 回款日历</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/calendar.css"/>

<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="wj-mobile-static/js/calendar.js"></script>
<!-- <script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script> -->
<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>

</head>

<body>
<%@include file="../common/head.jsp" %>
<div class="mainbody member">
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
					<!-- <div class="back-cal-header">
						<a href="_project/goInvestmentRecord" title="查看已投项目">查看已投项目</a>
					</div> -->
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
<%@include file="../common/foot.jsp" %>
<div class="h80"></div>
<script type="text/javascript">
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
</body>
</html>
