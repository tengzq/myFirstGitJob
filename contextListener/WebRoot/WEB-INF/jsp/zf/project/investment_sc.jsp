<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>">
<title>融巢资本--${project.PROJECT_NAME}</title>

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
	<%@include file="../public/header_v2.jsp"%>
		转账确认
	<%-- <div id="div1111" class="main">
		<div class="qrtz">
			<div class="title1">
				<h2>
					<b>确认投资</b>
				</h2>
			</div>
			<div class="con">
				<div class="heng"></div>
				<form id="buy_form" method="post"
					action="<%=basePath%>_project/goBuy" class="clearfix">
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
						<input type="text" name="jixiquanlilv" id="ticketLv" value="${ticketList.TICKET_LV }"/>
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
		 --%>			<div class="box">
						<ol>
							<li><span>投资项目：</span>
							<p>${project.PROJECT_NAME}</p></li>
							<li><span>预计收益率：</span>
							<p>${project.BASE_INTEREST_RATE}%(年化收益率)</p>
								<p>+加息券利率 ${ticketList.TICKET_LV}.00% </p></li>
							<li><span>项目期限：</span>
							<p>${project.DEADLINE}天</p></li>
							<li><span>购买金额：</span>
							<p>${amount}元</p></li>
							<%-- <c:if test="${project.IS_USE_INVITATION==true}">
	                            <li><span>输入邀请码：</span><input type="text" id="invation_rate_in"><button class="kong">获取信息</button></li>
	                            </c:if> --%>
							<li><span>预计收益：</span>
							<p class="huang" id="income">0元</p></li>
						</ol>
						<ol>
							<li><span>已有加息券：</span><select>
									
										<option value="${ticketList.TICKET_LV}">${ticketList.TICKET_NAME }</option>
							</select></li>
					
							<li><span>可用余额：</span>
							<p class="huang">${user.BALANCE}元</p></li>
							<li><span>实际支付：</span>
							<p class="huang invest_amt">${amount}</p></li>
							<li><button class="syless" id="buy-now">立即购买</button></li>
							<li class="fl sfwe"><i class="fa fa-check-square-o"></i>我已阅读<a
								style="color:#63B8FF;">&#60;&#60;融巢借款协议&#62;&#62;&#60;&#60;变现服务协议&#62;&#62;</a></li>
						</ol>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../public/foot_v2.jsp"%>
	<script type="text/javascript">
	
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
				   url: "<%=basePath%>
		register/viewlog",
						data : val_array.join('&'),
						success : function(data) {
						}
					});
				});
	</script>
<%-- 	<script type="text/javascript"
		src="<%=basePath%>wj-static/rc/js/project-buy.js"></script> --%>
</body>
</html>
