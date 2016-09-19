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
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
	
	<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/sweetalert.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript"></script>
  </head>
  
  <body>
  	<%@include file="../common/head.jsp" %>
    <div class="mainbody record">
		<ul>
	    	<li>
	        	<h3>
	                <span>投资时间</span>
	                <span class="fr">订单状态</span>
	            </h3>
	        </li>
	      
	         <c:forEach items="${buyRecordList}" var="var" varStatus="vs">
	         	<li>
		        	<dl>
		            	<dt><i class="fa fa-chevron-down fr"></i><b class="fr">
			            	<c:if test="${var.PROJECT_STATE==1}">正在募集</c:if> 
							<c:if test="${var.PROJECT_STATE==2}">正在还款</c:if> 
							<c:if test="${var.PROJECT_STATE==3}">已结束</c:if>
						</b><fmt:formatDate value="${var.cc_date }" type="both" /></dt>
		                <dd>
		                	<div class="title">
		                    	<p style="color:#FEB00F;">${var.PROJECT_NAME }<!-- <b>A股送钱</b> --></p>
		                        <p>还款方式：${var.REPAYMENT_MODE_DES }</p>
		                    </div>
		                	<ol>
		                    	<li>
		                        	预期年化收益（%）
		                            <b>${var.interest_rate+var.sys_interest_rate+var.exchange_rate+var.invation_rate}</b>
		                        </li>
		                        <li>
		                        	计息天数
		                            <b>${var.DEADLINE}天</b>
		                        </li>
		                        <li>
		                        	到期时间
		                            <b><fmt:formatDate value="${var.ETIME}" type="date" /></b>
		                        </li>
		                    </ol>
		                	<ol>
		                    	<li>
		                        	投资金额
		                            <b><fmt:formatNumber value="${var.amount }"/>元</b>
		                        </li>
		                        <li>
		                        	下次还款金额
		                            <b>
		                            	<c:if test="${var.NEXT_AMOUNT==null}">
		                            	0.00
		                            	</c:if>
		                            	<c:if test="${var.NEXT_AMOUNT!=null}">
		                            	<fmt:formatNumber value="${var.NEXT_AMOUNT}" minFractionDigits="2" maxFractionDigits="2"/>
                            			</c:if>
		                            </b>
		                        </li>
		                        <li>
		                        	下次还款日期
		                            <b>
		                            	<c:if test="${var.NEXT_TIME==null}">
		                            	无
		                            	</c:if>
		                            	<c:if test="${var.NEXT_TIME!=null}">
		                            	${var.NEXT_TIME}
		                            	</c:if>
		                            </b>
		                        </li>
		                    </ol>
		                	<ol>
		                    	<li>
		                        	应收本息
		                            <b><fmt:formatNumber value="${var.ALREADY_PAY+var.UN_PAY}" minFractionDigits="2" maxFractionDigits="2"/>元</b>
		                        </li>
		                        <li>
		                        	已收本息
		                            <b>
		                            	<c:if test="${var.ALREADY_PAY==null}">
		                            	0.00
		                            	</c:if>
		                            	<c:if test="${var.ALREADY_PAY!=null}">
		                            	<fmt:formatNumber value="${var.ALREADY_PAY}" minFractionDigits="2" maxFractionDigits="2"/>
		                            	</c:if>元
		                            </b>
		                        </li>
		                        <li>
		                        	剩余本息
		                            <b>
		                            	<c:if test="${var.UN_PAY==null}">
		                            	0.00
		                            	</c:if>
		                            	<c:if test="${var.UN_PAY!=null}">
		                            	<fmt:formatNumber value="${var.UN_PAY}" minFractionDigits="2" maxFractionDigits="2"/>
		                            	</c:if>元
		                            </b>
		                        </li>
		                    </ol>
		                </dd>
		            </dl>
		        </li>
	         </c:forEach>
	    </ul>
	</div>
	<%-- <%@include file="../common/footer.jsp" %> --%>
  </body>
</html>
