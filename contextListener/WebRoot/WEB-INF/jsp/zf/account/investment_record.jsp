<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@include file="../public/header_v2.jsp" %>
</div>
<%@include file="../public/left_nav.jsp" %>
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/invest-record.css"/>
<link href="<%=basePath%>wj-static/css/kkpager_rongchao.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
        <div class="main">
            <div class="zhuye" style="padding-left: 0px;">
            	
                <div class="right">
                	<div class="title2">
                    	<h2><b>投资记录</b></h2>
                    </div>
                    <div class="con">
                    	<div class="tzjl">
                        	<nav>
                                <ul>
                                    <li class="hover"><a href="<%=basePath %>_project/goInvestmentRecord">全部</a></li>
                                    <li><a href="<%=basePath %>_project/goInvestmentRecord?PROJECT_STATE=1">募集中</a></li>
                                    <li><a href="<%=basePath %>_project/goInvestmentRecord?PROJECT_STATE=2">还款中</a></li>
                                    <li><a href="<%=basePath %>_project/goInvestmentRecord?PROJECT_STATE=3">已结束</a></li>
                                </ul>
                            </nav>
                            <c:forEach items="${buyRecordList}" var="var" varStatus="vs">
                            	<c:if test="${var != null}"> 
                            	<div class="box">
	                            	<h3><b class="fr">订单状态：
	                            		<c:if test="${var.PROJECT_STATE==1}">正在募集</c:if> 
										<c:if test="${var.PROJECT_STATE==2}">正在还款</c:if> 
										<c:if test="${var.PROJECT_STATE==3}">已结束</c:if>
										</b>投资时间：<fmt:formatDate value="${var.cc_date }" type="both" />  <%-- 类型：${var.type == 1?'手动投标':'自动投标'} --%></h3>
	                                <div class="center">
	                                	<h4>
	                                    	<a href="<%=basePath %>_project/goDetails?ID=${var.ID}" style="color: #d6b470;" target="_blank"><b>${var.PROJECT_NAME }</b></a>
	                                        <i>
	                                        	<c:if test="${var.PROJECT_STATE==1}">正在募集</c:if> 
												<c:if test="${var.PROJECT_STATE==2}">正在还款</c:if> 
												<c:if test="${var.PROJECT_STATE==3}">已结束</c:if>
	                                        </i>
	                                        <em>还款方式：${var.REPAYMENT_MODE_DES == 1?'到期还本还息':'到期还本还息'}</em>
	                                    </h4>
	                                    <div class="list">
	                                    	<ol>
	                                        	<li>预期年化收益：${var.interest_rate+var.sys_interest_rate+var.exchange_rate+var.invation_rate}%</li>
	                                        	<li>计息天数：${var.DEADLINE}天</li>
	                                        	
	                                        </ol>
	                                    	<ol>
	                                        	<li>投资金额：
	                                        	<fmt:formatNumber type="number" value="${var.amount }" pattern="0.00" maxFractionDigits="2"/>元</li>
	                                        	<li>到期时间：<fmt:formatDate value="${var.ETIME}" type="date" /></li>
	                                        	<%-- <li>下次还款金额： 
	                                        		<c:if test="${var.NEXT_AMOUNT==null}">
					                            		0.00
					                            	</c:if>
					                            	<c:if test="${var.NEXT_AMOUNT!=null}">
					                            		<fmt:formatNumber value="${var.NEXT_AMOUNT}" minFractionDigits="2" maxFractionDigits="2"/>
					                            	</c:if>
					                            	元
	                                        	</li> --%>
	                                        <%-- 	<li>下次还款时间：
	                                        		<c:if test="${var.NEXT_TIME==null}">
					                            		无
					                            	</c:if>
					                            	<c:if test="${var.NEXT_TIME!=null}">
					                            		${var.NEXT_TIME}
					                            	</c:if>
	                                        	</li> --%>
	                                        </ol>
	                                    	<ol>
	                                        	<li>应收本息：<fmt:formatNumber value="${var.BENXI}" pattern="#,###" minFractionDigits="2" maxFractionDigits="2"/>元</li>
	                                        	<li>已收本息：
	                                        		<c:if test="${var.ALREADY_PAY==null}">
					                            		0.00
					                            	</c:if>
					                            	<c:if test="${var.ALREADY_PAY!=null}">
					                            		<fmt:formatNumber value="${var.ALREADY_PAY}" pattern="#,###" minFractionDigits="2" maxFractionDigits="2"/>
					                            	</c:if>
	                                        	 元</li>
	                                        	<%-- <li>未收本息：
	                                        		<c:if test="${var.UN_PAY==null}">
					                            		0.00
					                            	</c:if>
					                            	<c:if test="${var.UN_PAY!=null}">
					                            		<fmt:formatNumber value="${var.UN_PAY}" pattern="#,###" minFractionDigits="2" maxFractionDigits="2"/>
					                            	</c:if>
	                                        	 元</li> --%>
	                                        </ol>
	                                    </div>
	                                </div>
	                                <!-- <h6>我的投资合同（密码为身份证后六位）</h6> -->
	                            </div>
	                            </c:if>
                            </c:forEach>
                            
                            <div id="kkpager" style="margin-top: 15px;">
                            	
                            </div>
                        </div>
                	</div>
            	</div>
            	<div class="clear"></div>
            </div>
		</div>
		
		<script src="<%=basePath%>wj-static/js/kkpager.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(function() {
			if ('${pd.PROJECT_STATE}' != '') {
				$('.tzjl nav ul li').eq(${pd.PROJECT_STATE}).addClass('hover').siblings().removeClass('hover');
			}
			
			kkpager.generPageHtml({
				pno : ${page.currentPage} || 1,
				//总页码
				total : ${page.totalPage} || 1,
				//总数据条数
				totalRecords : ${page.totalResult} || 0,
				mode : 'click',//默认值是link，可选link或者click
				click : function(n){
					// do something
					window.location.href = "<%=basePath%>_project/goInvestmentRecord?PROJECT_STATE=${pd.PROJECT_STATE}&currentPage="+n+"&showCount=10";
				}
				
			});
		});
		</script>
<%@include file="../public/foot_v2.jsp" %>

