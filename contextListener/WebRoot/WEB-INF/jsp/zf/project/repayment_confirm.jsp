<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%-- <script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>wj-static/js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script> --%>
<!-- <script type="text/javascript">
		$(function(){
			$("#div1111").show(1000);
		})
</script> -->
<style>
.syless {
	margin-left: -11%;
	float: left;
}
</style>

<%@include file="../public/header_v2.jsp"%>
<base href="<%=basePath%>">
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/buy-confirm.css" />
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js"
	type="text/javascript" charset="utf-8"></script>
</head>

<script type="text/javascript">
/* function selectOn(){
	alert($('#rate').val());
	var b=$('#rate').val();
	var b1=$("select option:selected").attr("value");
	alert(parseFloat(b)+parseFloat(b1))
	$('#rate').attr("value",parseFloat(b)+parseFloat(b1));
	alert($('#rate').val());
	refreshIncome();
} */

</script>
 
<body style="background:#f9f9f9">


	<div id="div1111" class="main">
		<div class="qrtz">
			<div class="title1">
				<h2>
					<b>确认还款</b>
				</h2>
			</div>
			<div class="con">
				<div class="heng"></div>
					<input type="hidden" name="ID" value="${project.ID}"> <input
						type="hidden" name="PROJECT_NAME" value="${project.PROJECT_NAME}">
					<input type="hidden" id="deadline" value="${project.DEADLINE}">
					<input type="hidden" name="inviteRate" id="inviteRate" value="none">
					<input type="hidden" id="prj-surplus"
						value="${project.SURPLUS_RAISE_AMOUNT}"> 
						<input type="hidden" id="rate" value="${total_rate}"> 
						<input type="hidden"  name="TOTAL_RAISE_AMOUNT" value="${project.TOTAL_RAISE_AMOUNT}"/> 
						
						<input
						type="hidden" name="exchange_rate" id="exchange_rate" value="0">
					<input type="hidden" id="repay-type" value="1"> <input
						type="hidden" id="stime" value="${project.STIME}"> <input
						type="hidden" id="etime" value="${project.ETIME}"> <input
						type="hidden" name="coupon_type" id="coupon_type" value="1">
						<input type="hidden" name="jixiquanlilv" id="ticketLv" value="${ticketList.TICKET_LV }"/>
						<input type="hidden" name="zonglilv" id="zonglilv" value="0"/>
					<input type="hidden" name="user_id" id="user_id"
						value="${user.USER_ID }"> <input type="hidden"
						id="invation_code" name="invation_code" value=""> <input
						type="hidden" id="invation_rate" value="0.00"> <input
						type="hidden" id="LOWEST_AMOUNT" value="${project.LOWEST_AMOUNT}" />
						<input type="hidden" name="touzhiquanid" value="${ticketList.ID }"/>
					<input type="hidden" name="amount" id="amount" value="${amount}">
					<input type="hidden" name="fanlijine" id="fanlijine" value="0">
					<input type="hidden" id="ticket-amount" name="TICKET_AMOUNT"
						value=""> <input type="hidden" id="userBalance"
						value="${user.BALANCE}">
					<div class="box">
						<ol>
							<li><span style="width: 145px;">还款项目：</span>
							<p style="margin-left: 60px;">${pd.PROJECT_NAME}</p></li>
							<li><span style="width: 145px;">募集总额：</span>
							<p style="margin-left: 60px;">${pd.TOTAL_RAISE_AMOUNT}元</p></li>
							<li><span style="width: 145px;">年化收益：</span>
							<p style="margin-left: 60px;">${pd.BASE_INTEREST_RATE}%</p></li>
							<li><span style="width: 145px;">募集开始时间：</span>
							<p style="margin-left: 60px;"><fmt:formatDate value="${pd.STIME}" pattern="yyyy-MM-dd HH:mm:ss" />  </p></li>
							
							<li><span style="width: 145px;">募集结束时间：</span>
							<p style="margin-left: 60px;">${pd.END_DATE}</p></li>
							<li><span style="width: 145px;">还款金额：</span>
							<p style="margin-left: 60px;"><font id="repayment_money" style="color: #d6b470;font-size: 22px">
							<fmt:formatNumber type="number" value="${totalHuan }" pattern="0.00" maxFractionDigits="2"/>
							</font><font  style="color: #d6b470;font-size: 22px">&nbsp;元</font></p></li>
						</ol>
						<ol>
							
					
							<li><span>可用余额：</span><a href="<%=basePath%>pluginsyPay/toRecharge"><button class="sbtn1" style="width: 60px;">充值</button></a>
							<p class="huang"><font id="yue" style="color: #d6b470;font-size: 22px">${user.yue}</font><font style="color: #d6b470;font-size: 22px"> &nbsp;元</font></p></li>
							
							<li><button class="syless" align="center" style="margin-left: 230px;" onclick="huan();">确认还款</button></li>
						</ol>
					</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
			function huan() {
				var repayment = $("#repayment_money").html();
				var yue = $("#yue").html();
				var rechange = "<%=basePath%>pluginsyPay/toRecharge";
				var repaymentUrl = "<%=basePath%>_project/goRepayment.do?PROJECT_ID=${pd.ID}";
				console.log(repayment + "..." + yue);
				if (repayment > yue) {
					location.href = rechange;
				} else {
					location.href = repaymentUrl;
				}
			}
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
						data : val_array.join('&'),
						success : function(data) {
						}
					});
				});
	</script>
	<script type="text/javascript" src="<%=basePath%>wj-static/rc/js/project-buy.js"></script>
<%@include file="../public/foot_v2.jsp"%>