<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/page-view.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/investrecord.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
</head>

<body style=" background:url(images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
	<%@ include file="../public/acc_left.jsp"%>
    <div class="content">
    	<div class="gerenxinxi touzijilu">
        	<h3>
            	<span>投资记录</span>
            </h3>
            <div class="nav">
            	<ul>
                	<li class="hover"><a href="_project/goInvestmentRecord">全部</a></li>
                	<li class="1"><a href="_project/goInvestmentRecord?PROJECT_STATE=1">募集中</a></li>
                	<li class="2"><a href="_project/goInvestmentRecord?PROJECT_STATE=2">还款中</a></li>
                	<li class="3"><a href="_project/goInvestmentRecord?PROJECT_STATE=3">已结束</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <form action="<%=basePath %>_project/goInvestmentRecord?PROJECT_STATE=${PROJECT_STATE}" method="post" name="Form" id="Form">
            <div class="con">
            <c:forEach items="${buyRecordList}" var="var" varStatus="vs">
            	<div class="box">
                	<div class="top"><span>投资时间：<fmt:formatDate value="${var.cc_date }" type="both" /></span>
                	<span>类型：${var.type == 1?'手动投标':'自动投标'}</span>
                	<b class="fr">订单状态：
                		<span class="status-icon" style="color:#327DC3;">
                			<c:if test="${var.PROJECT_STATE==1}">正在募集</c:if> 
							<c:if test="${var.PROJECT_STATE==2}">正在还款</c:if> 
							<c:if test="${var.PROJECT_STATE==3}">已结束</c:if>
                		</span>
                	</b>
                	</div>
                    <div class="center">
                    	<h3><a href="_project/goDetails.do?ID=${var.ID}" style="font-size: 20px;color:black;"><b>${var.PROJECT_NAME }</b><span >
                    		<c:if test="${var.PROJECT_STATE==1}">
								<span class="status-icon">正在募集</span>
							</c:if> 
							<c:if test="${var.PROJECT_STATE==2}">
								<span class="status-icon">正在还款</span>
							</c:if> 
							<c:if test="${var.PROJECT_STATE==3}">
								<span class="status-icon">已结束</span>
							</c:if>
                    	</span></a>
                    	</h3>
                    	
                        <p>还款方式：${var.REPAYMENT_MODE_DES }</p>
                        <div class="ollist">
                        	<ol>
                            	<li>预期年化收益：${var.interest_rate+var.sys_interest_rate+var.exchange_rate+var.invation_rate}%</li>
                            	<li>计息天数：${var.DEADLINE}天</li>
                            	<li>到期时间：<fmt:formatDate value="${var.ETIME}" type="date" /></li>
                            </ol>
                        	<ol>
                            	<li>投资金额：<fmt:formatNumber value="${var.amount }"/>元</li>
                            	<li>下次还款金额：
                            	<c:if test="${var.NEXT_AMOUNT==null}">
                            	0.00
                            	</c:if>
                            	<c:if test="${var.NEXT_AMOUNT!=null}">
                            	<fmt:formatNumber value="${var.NEXT_AMOUNT}" minFractionDigits="2" maxFractionDigits="2"/>
                            	</c:if>
                            	元</li>
                            	<li>下次还款时间：
                            	<c:if test="${var.NEXT_TIME==null}">
                            	无
                            	</c:if>
                            	<c:if test="${var.NEXT_TIME!=null}">
                            	${var.NEXT_TIME}
                            	</c:if>
                            	</li>
                            </ol>
                        	<ol>
                            	<li>应收本息：<fmt:formatNumber value="${var.ALREADY_PAY+var.UN_PAY}" minFractionDigits="2" maxFractionDigits="2"/>元</li>
                            	<li>已收本息：
                            	<c:if test="${var.ALREADY_PAY==null}">
                            	0.00
                            	</c:if>
                            	<c:if test="${var.ALREADY_PAY!=null}">
                            	<fmt:formatNumber value="${var.ALREADY_PAY}" minFractionDigits="2" maxFractionDigits="2"/>
                            	</c:if>
                            	元</li>
                            	<li>未收本息：
                            	<c:if test="${var.UN_PAY==null}">
                            	0.00
                            	</c:if>
                            	<c:if test="${var.UN_PAY!=null}">
                            	<fmt:formatNumber value="${var.UN_PAY}" minFractionDigits="2" maxFractionDigits="2"/>
                            	</c:if>
                            	元</li>
                            </ol>
                        </div>
                    </div>
                     
                    <c:if test="${var.ID != '15bc35072c72499ebb594f1ac516d27e'}">
	                 	<div class="bot">
	                    	<a href="javascript:openPDF('${var.ID }','${var.buyerId }')" >我的投资合同（密码为身份证后六位）</a>
	                    </div>
	                </c:if>
                     
                </div>
               </c:forEach>
            </div>
               <!-- 分页begin -->		
				<div id="pager">
					<div class="PagerView">${page.portalPageStr}</div>
                </div>
		       <!-- 分页end --> 
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
             <script type="text/javascript">
				$(function() {
					if ('${pd.PROJECT_STATE}' == '1') {
						$(".1").addClass('hover').siblings().removeClass('hover');
					}
					if ('${pd.PROJECT_STATE}' == '2') {
						$(".2").addClass('hover').siblings().removeClass('hover');
					}
					if ('${pd.PROJECT_STATE}' == '3') {
						$(".3").addClass('hover').siblings().removeClass('hover');
					}
				});
				
				//下载投资合同
				function openPDF(projectId,buyerId){
					window.location.href= "_project/contracts?ID="+projectId+"&buyerId="+buyerId+"&t="+Math.random();
// 					$.ajax({
// 						url: "_project/contracts?ID="+projectId+"&t="+Math.random(),
// 						success:function(data){
// 							if(data != null || data !=''){
// 								data = encodeURIComponent(data);
// 								data=encodeURI(data);
// 								window.location="_project/downLoadFile?filePath="+data;
// 							}
// 						}
// 					});
				}
			</script>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
</body>
</html>
