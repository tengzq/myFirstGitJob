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
  <head>
    <base href="<%=basePath%>">
    
    <title>投资记录</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	
	
	<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/ui2/css/common.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="wj-mobile-static/ui2/css/record.css"/>
	
	<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/sweetalert.min.js" type="text/javascript"></script>
	<!-- <script src="wj-mobile-static/js/layout.js" type="text/javascript"></script> -->
	<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript"></script>
  </head>
  
  <body>
  	<div class="tztop">
		<p class="tzp1 clearfix"><i class="fa fa-clock-o"></i><span id="tzsj"> 投资时间</span></p>
		<p class="tzp2 clearfix"><i class="fa fa-file-text-o"></i><span id="ddzt"> 订单状态</span></p>
	</div>
	<div class="tzdiv">
		<ul class="tzul">
			<c:forEach items="${buyRecordList}" var="var" varStatus="vs">
				<li class="tzlist" id="tzlist1">
					<span class="tlist1 clearfix" id="tzs11"><fmt:formatDate value="${var.cc_date }" type="both" /></span>
					<a class="tlist2 clearfix" id="tzs12">
						<c:if test="${var.PROJECT_STATE==1}">正在募集</c:if> 
						<c:if test="${var.PROJECT_STATE==2}">正在还款</c:if> 
						<c:if test="${var.PROJECT_STATE==3}">已结束</c:if>
					<i class="fa fa-angle-down"></i></a>
				</li>
				<ul class="hklist1" id="hkul">
					<li class="alt">
						<p id="hkid1">${var.PROJECT_NAME }</p>
						<p id="hkid2">还款方式：${var.REPAYMENT_MODE_DES }</p>
					</li>
					<li class="alt">
						<p id="hkid3">
							<span class="hks" id="hks1">预期年化收益（%）</span>
							<span class="hkr" id="hks2">${var.interest_rate+var.sys_interest_rate+var.exchange_rate+var.invation_rate}</span>
						</p>
						<p id="hkid4">
							<span class="hks" id="hks3">计息天数</span>
							<span class="hkr" id="hks4">${var.DEADLINE}天</span>
						</p>
						<p id="hkid5">
							<span class="hks" id="hks4">到期时间</span>
							<span class="hkr" id="hks6"><fmt:formatDate value="${var.ETIME}" type="date" /></span>
						</p>
					</li>
					<li class="alt">
						<p id="hkid3">
							<span class="hks" id="hks1">投资金额</span>
							<span class="hkr" id="hks2"><fmt:formatNumber value="${var.amount }"/>元</span>
						</p>
						<p id="hkid4">
							<span class="hks" id="hks3">下次还款金额</span>
							<span class="hkr" id="hks4">
								<c:if test="${var.NEXT_AMOUNT==null}">
                            	0.00
                            	</c:if>
                            	<c:if test="${var.NEXT_AMOUNT!=null}">
                            	<fmt:formatNumber value="${var.NEXT_AMOUNT}" minFractionDigits="2" maxFractionDigits="2"/>
                      			</c:if>
							</span>
						</p>
						<p id="hkid5">
							<span class="hks" id="hks4">下次还款日期</span>
							<span class="hkr" id="hks6">
								<c:if test="${var.NEXT_TIME==null}">
                            	无
                            	</c:if>
                            	<c:if test="${var.NEXT_TIME!=null}">
                            	${var.NEXT_TIME}
                            	</c:if>
							</span>
						</p>
					</li>
					<li class="alt">
						<p id="hkid3">
							<span class="hks" id="hks1">应收本息</span>
							<span class="hkr" id="hks2"><fmt:formatNumber value="${var.ALREADY_PAY+var.UN_PAY}" minFractionDigits="2" maxFractionDigits="2"/>元</span>
						</p>
						<p id="hkid4">
							<span class="hks" id="hks3">已收本息</span>
							<span class="hkr" id="hks4">
								<c:if test="${var.ALREADY_PAY==null}">
                            	0.00
                            	</c:if>
                            	<c:if test="${var.ALREADY_PAY!=null}">
                            	<fmt:formatNumber value="${var.ALREADY_PAY}" minFractionDigits="2" maxFractionDigits="2"/>
                            	</c:if>元
							</span>
						</p>
						<p id="hkid5">
							<span class="hks" id="hks4">剩余本息</span>
							<span class="hkr" id="hks6">
								<c:if test="${var.UN_PAY==null}">
                            	0.00
                            	</c:if>
                            	<c:if test="${var.UN_PAY!=null}">
                            	<fmt:formatNumber value="${var.UN_PAY}" minFractionDigits="2" maxFractionDigits="2"/>
                            	</c:if>元
							</span>
						</p>
					</li>
				</ul>
			</c:forEach>
			
			
		</ul>
	</div>
	<%@include file="../common/main_nav.jsp" %>
	<script type="text/javascript">
		$(function(){
			$('.tzlist').on('click',function(){
				var ul=$(this).next('ul');
				if($(ul).is(':hidden')){
					$(this).find('i').removeClass("fa-angle-down").addClass("fa-angle-up");	
					$(this).addClass('active');					
					$(ul).show();
				}else{
					$(this).find('i').removeClass("fa-angle-up").addClass("fa-angle-down");
					$(this).removeClass('active');	
					$(ul).hide();
				}
			});
		});
	</script>
  </body>
</html>
