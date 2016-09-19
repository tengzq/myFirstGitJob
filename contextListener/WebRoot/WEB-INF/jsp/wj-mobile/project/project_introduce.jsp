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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>万金先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css" />
<link rel="stylesheet" href="wj-mobile-static/ui2/css/project.css" />
<link rel="stylesheet" href="wj-mobile-static/css/project.css" />
<link rel="stylesheet" href="wj-mobile-static/css/follow_common.css" />
<link rel="stylesheet" href="wj-mobile-static/css/lightgallery.css" />
<script type="text/javascript" src="wj-mobile-static/js/jquery-1.11.1.min.js"></script>
<!-- <script type="text/javascript" src="wj-mobile-static/js/follow.js"></script> -->
<style>
	.page-title{
		font-family: "ltyh";
	}
</style>
</head>

<body style="font-family: ltyh">


	<div class="bd">
		<div class="bd1">
			<p><span id="pt1">${pd.PROJECT_NAME}</span><!-- <span id="pt2">6月期10102</span> --></p>
			<p><span id="pt3">年化收益率</span>
				<span id="zi_1">${pd.BASE_INTEREST_RATE}</span><span id="zi_2">%</span>
				<span id="hui1">+${pd.BOSS_INTEREST_RATE}%</span>
				<span id="hui2">${pd.DEADLINE}天</span>
			</p>
		</div>
	</div>
    <div class="page-title" style="">
    	<c:if test="${type=='1'}">
    		项目描述
    	</c:if>
    	<c:if test="${type=='2'}">
    		风险控制
    	</c:if>
    	<c:if test="${type=='3'}">
    		还款计划
    	</c:if>
    	<c:if test="${type=='4'}">
    		投资记录
    	</c:if>
    </div>
    <div class="detail-info">
    	<c:if test="${type=='1'}">
    		${projectDtail.PROJECT_DETAIL_TEXT}
    	</c:if>
    	<c:if test="${type=='2'}">
    		${ projectDtail.PROJECT_RISK_CONTROL}
    	</c:if>
    	<c:if test="${type=='3'}">
    		<table class="repay-table">
    			<thead>
    				<tr>
    					<th>还款时间</th>
    					<th>应还本息</th>
    					<th>还款状态</th>
    				</tr>
    			</thead>
    			<tbody>
    				<c:choose>
						<c:when test="${not empty repaymentList}">
							<c:forEach items="${repaymentList}" var="var" varStatus="vs">
							   <tr>
									<td class="t-time">
										<fmt:parseDate value="${var.REPAYMENT_DATE}" var="repay_date" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${repay_date}" pattern="yyyy-MM-dd"/>
									</td>
									<td class="t-money">${var.CAPITAL+var.ACCRUAL}元</td>
									<td class="t-status">
										<c:if test="${var.STATUS==1}">待还款</c:if>
										<c:if test="${var.STATUS==2}">已还款</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="t-money">
								<td colspan="100" class="center" >网络出现问题，请尝试刷新！</td>
							</tr>
						</c:otherwise>
					</c:choose>
    			</tbody>
    		</table>
    	</c:if>
    	<c:if test="${type=='4'}">
    		<table class="repay-table">
    			<thead>
    				<tr>
    					<th>投资人</th>
    					<th>投资金额</th>
    					<th>投资时间</th>
    				</tr>
    			</thead>
    			<tbody>
    				<c:choose>
						<c:when test="${not empty buyRrcordList}">
							<c:forEach items="${buyRrcordList}" var="var" varStatus="vs">
							   <tr>
									<td class="t-time">
										${fn:substring(var.USERNAME, 0, 1)}***${fn:substring(var.USERNAME, fn:length(var.USERNAME)-1, fn:length(var.USERNAME))}
									</td>
									<td class="t-money">${var.amount }元</td>
									<td class="t-status">
										<fmt:formatDate value="${var.create_date }" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="t-money">
								<td colspan="100" class="center" >网络出现问题，请尝试刷新！</td>
							</tr>
						</c:otherwise>
					</c:choose>
    			</tbody>
    		</table>
    	</c:if>
    </div>
    
<!-- <a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
<div class="concerned-mask">
	<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
	<img src="wj-mobile-static/images/index1_31.png" class="concerned-QRCode"/>
	<p class="msg">长按二维码点击“识别图中的二维码”即可关注</p>
</div> -->
<c:if test="${type =='2'}">
	<script type="text/javascript" src="wj-mobile-static/js/lightgallery.min.js"></script>
	<script type="text/javascript" src="wj-mobile-static/js/lg-thumbnail.min.js"></script>
	<script type="text/javascript" src="wj-mobile-static/js/lg-zoom.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.imgList img').each(function(idx, img){
				var $img = $(img);
				var src  = $img.attr('src');
				if($img.parents('a').length){
					$img.parents('a').attr('href',src);
				} else {
					var	a = $('<a href="' + src + '"></a>');
					a.append($img.clone());
					$img.replaceWith(a);
				}
			});
	        $(".imgList").lightGallery(); 
	    });
	</script>
</c:if>
<script type="text/javascript">
	$(function(){
		$('section').last().hide();
	
		$('.data3').on('click',function(){
			$('form').eq(0).submit();
		});
	});
	
</script>
</body>
</html>
