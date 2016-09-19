<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<base href="<%=basePath%>">
	<title>融巢资本--提现</title>
      <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/drawcash.css"/>
	<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">
	<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="background:#f9f9f9">
	<%@include file="../public/header_v2.jsp" %>
	
       <div class="main">
           <div class="zhuye">
           	<%@include file="../public/left_nav.jsp" %>
               <div class="right">
               	<div class="title2">
                   	<h2><b>我要提现</b></h2>
                   </div>
                   <div class="con">
                   	<div class="wycz">
                       	<div class="tx1">
                           	<div class="list3">
                                   <ol>
                                       <li>
                                           <span>可用余额：</span>
                                           <p>${sessionScope.sessionZfUser.BALANCE}</p>
                                       </li>
                                       <li>
                                   	<span>选择银行：</span>
                                       <c:choose>
                                       	<c:when test="${pd.BANK_CARD==''||pd.BANK_CARD==null}">
                                       		<div class="no-card">
		                                       	<a href="<%=basePath%>myAccount/addBind">
		                                       		<div class="box" style="width:auto">
                                           	 			<span>
	                                          	 			<i class="fa fa-plus"></i>
	                                           	 		</span>
	                                           	 		<h5>添加银行卡</h5>
	                                           		</div>
                                           		</a>
	                                       	</div>
                                       	</c:when>
                                       	<c:otherwise>
                                       		<div class="card">
		                                       	<div class="box" style="width:auto">
                                           	 		<c:set value="${bankCardInfo.BANK_CODE}" var="bankCode"></c:set>
						                        	<c:set value="${bankCardInfo.BANK_CARD}" var="bankCard"></c:set>
						                        	<img src="https://res.baofoo.com/gw/resource/images/yh/10${fn:substring(bankCode,2,fn:length(bankCode))}.jpg">
                                                	<h5>尾号： ${fn:substring(bankCard,fn:length(bankCard)-4,fn:length(bankCard))}<em><b>工作日当天</b></em><em><b>1-3工作日</b></em>
                                                		<a href="javascript:void(0);" class="fr" id="removeBankCard" bid="${bankCardInfo.BANK_CARD_ID}">删除</a>
                                               		</h5>
	                                           	</div>
	                                       	</div>
                                       	</c:otherwise>
                                       </c:choose>
                                       <c:set value="${sessionScope.sessionZfUser.REAL_NAME}" var="REAL_NAME"></c:set>
                                       
                                       <div class="fr" style="font-size:12px; color:#999">* 银行卡必须为“*${fn:substring(REAL_NAME,1,fn:length(REAL_NAME))}”的借记卡，否则无法提现</div>
                                       <div class="clear"></div>
                                   </li>
                                       <li>
                                           <span>提现金额：</span>
                                           <input type="text" id="Amount" placeholder=" 限额5000.00元/次"><b style="margin-left:-30px">元</b>
                                       </li>
                                       <li>
                                           <span>提现方式：：</span>
                                           <div class="check-drawcash hover">1-3个工作日到账</div>
                                       </li>
                                       <li>
                                           <span>实际到账：</span>
                                           <c:set value="<%=new Date() %>" var="currDate"></c:set>
                                           <p><b id="finallyDrawAmount">0.00</b>元，预计<b id="cashTime"><fmt:formatDate value="${currDate}" type="both"/></b> 24点前到账（因银行限制，双休日及法定节假日的提现到账日期顺延）</p>
                                       </li>
                                   </ol>
                               </div>
                               <div id="alert-area2" style="color:red;text-align: center;font-size: 12px;"></div>
                               <div class="btn" style="border-top:0; ">
	                           		<button class="shi" id="submitApply">立即提现</button>
	                           </div>
                           </div>
                           <div class="tx2">
                           	<div class="title">
                               	提现记录（最近7天）
                               </div>
                           	<table class="table1">
                               	<tr>
	                                <th>提现金额</th>
	                                <th>到账金额</th>
	                                <th>提交时间</th>
	                                <th>预计到账时间</th>
	                                <th>操作</th>
                                </tr>
                                <c:forEach items="${drawcashList}" var="dc">
									<tr>
										<td>¥${dc.amount}</td>
										<td>¥${dc.amount-2}</td>
										<td>${dc.create_date}</td>
										<td>${dc.pre_date} 24点之前</td>
										<td>
											<c:if test="${dc.status==1}">
												<input type="button" class="my-btn cancelCashWithDrawal" id="cancelCashWithDrawal" style=" line-height:18px;" data-encode="${dc.id}" value="取消取现"/>
											</c:if>
											<c:if test="${dc.status==2}">
												处理中
											</c:if>
											<c:if test="${dc.status==3}">
												已完成
											</c:if>
											<c:if test="${dc.status==4}">
												失败
											</c:if>
											
										</td>
									</tr>
								</c:forEach>
								<c:if test="${empty drawcashList}">
									<tr>
										<td colspan="10">尚无提现申请</td>
									</tr>
								</c:if>
                               </table>
                           </div>
                           <div class="tx3">
                           	<h3>提现说明：</h3>
                               <p>1.提现费用2元/笔。</p>
                               <p>2.当日充值金额不可提现。</p>
                               <p>3.充值未投资的金额，每日最多提现（提现上限）10000元；投资回本金额的提现不受影响。</p>
                               <p>4.提现操作，大行T+1日完成，小行大于T+1日完成，均受节假日影响。</p>
                               <p>5.最小提现金额为100元。</p>
                               <p>6.提现银行卡姓名应与实名认证身份一致，才可提现。</p>
                           </div>
                       </div>
               	</div>
           	</div>
           	<div class="clear"></div>
           </div>
	</div>
	<%@include file="../public/foot_v2.jsp" %>
       
	<div class="mainlayout">
		<div class="wrap">
	    	<div class="close">×</div>
	    	<div class="title2">
	        	<h2><b>提现信息确认</b></h2>
	        </div>
	        <div class="box">
	        <input type="hidden" id="sessionBank" value="${sessionScope.sessionZfUser.BANK_CARD}"/>
	        <input type="hidden" id="sessionTel" value="${sessionScope.sessionZfUser.TEL}"/>
	        	<ol>
	            	<li>银行卡：${bankInfo.BANK_CARD_NAME}&nbsp;&nbsp;&nbsp;尾号：${bankInfo.BANK_CARD}&nbsp;&nbsp;&nbsp;持卡人：*${fn:substring(REAL_NAME,1,fn:length(REAL_NAME))}</li>
	                <li>提现金额：<em id="cashAmount">100</em>元</li>
	                <li>手续费：2.00</li>
	                <li>预计到账时间：<em id="cashVerifyTime"></em></li>
	                <li>预计手机号码：<em id="cashMoiblePhone"></em></li>
	                <li style="width:330px;">输入图片验证码：<input type="text" id="ImgVerifyCode"><input type="image" id="imgCode" src="" style="float:right"></li>
	                <li>输入手机验证码：<input type="text" id="VerifyCode"><button class="kong" id="btnSmsNum">获取短信验证码</button></li>
	            </ol>
	           	<div class="errorCashPanelMsg" style="color:red;text-align: center;font-size: 12px;"></div>
	            <div class="btn">
	            	<button id="cashSubmit">确认提交</button>
	            </div>
	        </div>
	    </div>
	</div> 
	<input type="hidden" id="basePath" value="<%=basePath%>"/>
	<script src="<%=basePath %>wj-static/js/sweetalert.min.js" type="text/javascript"></script>
	<script src="<%=basePath %>wj-static/rc/js/drawcash.js" type="text/javascript"></script>
</body>
</html>
