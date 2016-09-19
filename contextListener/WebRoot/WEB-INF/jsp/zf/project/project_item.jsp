<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@include file="../public/header_v2.jsp"%>
</div>
<div class="content main">
	<div class="cpxq1">
		<div class="left fl">
			<h3>${pd.PROJECT_NAME}</h3>
			<h2>
				<b>${pd.BASE_INTEREST_RATE + pd.BOSS_INTEREST_RATE }%</b>年化收益率
			</h2>
			<ol>
				<li><b>项&nbsp; 目&nbsp; 期&nbsp; 限 :</b><em><i>${pd.DEADLINE}天</i></em></li>
				<li><b>募&nbsp; 集&nbsp; 总&nbsp; 额 ：</b><em>${pd.TOTAL_RAISE_AMOUNT}元</em></li>
				<li><b>还&nbsp; 款&nbsp; 方&nbsp; 式 ：</b><em><c:if test="${pd.REPAYMENT_MODE_DES == 1}">到期还本还息</c:if></em></li>
				<li><b>募集开始时间：</b><em><fmt:formatDate value="${pd.STIME}" pattern="yyyy-MM-dd HH:mm:ss" /> </em></li>
				<li><b>募集结束时间：</b><em><fmt:formatDate value="${pd.ETIME}" pattern="yyyy-MM-dd HH:mm:ss" /></em></li>
			</ol>
			<p>投资要求：${pd.LOWEST_AMOUNT}元起投，递增金额为：${pd.INVEST_STEP}元。</p>
		</div>
		<div class="right fr">
			<h3>
				正在募集
				<c:set value="${(pd.TOTAL_RAISE_AMOUNT-pd.SURPLUS_RAISE_AMOUNT)/pd.TOTAL_RAISE_AMOUNT * 100}" var="pRate"></c:set>
				<div class="fr"><fmt:formatNumber pattern="##" value="${pRate}"/>%</div>
			</h3>
			<div class="line">
				<h5>
					<span style="width:<fmt:formatNumber pattern="##" value="${pRate * 0.98}"/>%"><i></i></span>
				</h5>
			</div>
			<ol>
				<li>可投金额<i><b>${pd.SURPLUS_RAISE_AMOUNT}</b>元</i></li>
				<c:if test="${sessionScope.sessionZfUser.USERNAME != null}">
					<li>账户余额<i><b>${BALANCE}</b>元</i></li>
				</c:if>
			</ol>
			<c:if test="${sessionScope.sessionZfBuUser.USERNAME == null}">
			<form action="<%=basePath %>_project/goInvestment" id="buy-form" method="get">
				<h4>投资金额：</h4>
				<input type="hidden" name="ID" value="${pd.PROJECT_ID }">
				<input type="number" onchange="yuJiShouYi();" name="amount" id="amount" max="<fmt:formatNumber pattern="########" value="${pd.SURPLUS_RAISE_AMOUNT}"/>" min="<fmt:formatNumber pattern="########" value="${pd.LOWEST_AMOUNT}"/>" step="<fmt:formatNumber pattern="########" value="${pd.INVEST_STEP}"/>" value="<fmt:formatNumber pattern="#####" value="${pd.LOWEST_AMOUNT}"/>">
				<p>
					预期收益<b id="profit">0.00元</b>
				</p>
			</form>
			<div class="btn1">
			<c:choose>
			       <c:when test="${flag == false || pd.PROJECT_STATE==2 || flag1 == false || pd.SURPLUS_RAISE_AMOUNT == '0.00'}">
			            <button style="background: #A8A8A8;">立即购买</button>
			       </c:when>
			       <c:otherwise>
			            <button onclick="submit();">立即购买</button>
			       </c:otherwise>
			</c:choose>
			</div>
			</c:if>
		</div>
	</div>
	<div class="cpxq2">
		<div class="smenu1">
			<ul>
				<li class="detail hover"><a href="javascript:;" onclick="tab('detail');">项目详情</a></li>
				<li class="reminds"><a href="javascript:;" onclick="tab('reminds');">风险提示</a></li>
				<li class="controller"><a href="javascript:;" onclick="tab('controller');">风险控制</a></li>
				<li class="record"><a href="javascripts:;" onclick="tab('record');">投资记录</a></li>
			</ul>
		</div>
		<div id="detail">
			${projectDtail.PROJECT_DETAIL_TEXT}
		</div>
		<div id="reminds" style="display: none;">
			${projectDtail.PROJECT_RISK_JS}
		</div>
		<div id="controller" style="display: none;">
			${ projectDtail.PROJECT_RISK_CONTROL}
		</div>
		<div id="record" style="display: none;">
			<table>
				<tr>
					<th>序号</th>
					<th>投资人</th>
					<th>投资金额</th>
					<th>投资时间</th>
				</tr>
				<c:choose>
                	<c:when test="${not empty buyRrcordList}">
                		<c:forEach items="${buyRrcordList}" var="var" varStatus="vs">
							<tr>
								<td>${vs.index+1}</td>
								<td>${fn:substring(var.USERNAME, 0, 4)}***</td>
								<td>${var.amount }元</td>
								<td><fmt:formatDate value="${var.create_date }" type="both"/></td>
							</tr>
						</c:forEach>
                	</c:when>
                    <c:otherwise>
                        <tr>
                        	<td colspan="100">暂无投资记录</td>
                    	</tr>
                	</c:otherwise>
            	</c:choose>
			</table>
			<!-- <div class="Bnav">
				<ul>
					<li><a href="#">上一页</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li>...</li>
					<li><a href="#">10</a></li>
					<li><a href="#">11</a></li>
					<li><a href="#">12</a></li>
					<li><a href="#">下一页</a></li>
				</ul>
				<div class="tz">
					到第<input type="text">页
					<button>确定</button>
				</div>
			</div> -->
		</div>
	</div>
</div>

<script>
function submit() {
	$('#buy-form').submit();
}
function tab(str) {
	$("." + str).addClass('hover').siblings().removeClass('hover');
	$("#detail").attr("style", "display: none;");
	$("#reminds").attr("style", "display: none;");
	$("#controller").attr("style", "display: none;");
	$("#record").attr("style", "display: none;");
	$("#" + str).attr("style", "display: block;");
}

function yuJiShouYi() {
	var amount = $("#amount").val();
	var liLv = ${pd.BASE_INTEREST_RATE + pd.BOSS_INTEREST_RATE };
	var shouYi = amount * liLv / 100 / 365;
	$("#profit").html(shouYi.toFixed(2) + "元");
}
yuJiShouYi();

function toDate(str){
    var sd=str.split("-");
    return new Date(sd[0],sd[1]-1,sd[2]);
}	
$(document).ready(function(){
		var etime = $("#etime").val();
		var etime = toDate(etime);
		var e = etime.getTime();
		var now = new Date().getTime();
		var left = (now - e)/1000;
		console.log(left);
		
		
		
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=${pd.ID}");
		val_array.push("SUB_PAGE=1");
		val_array.push("WEB_OR_MOBILE=1");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	
		
		var stime = $("#STIME").html();
		str = str.replace(/-/g,"/");
		var starTime = new Date(str );
		if (starTime > new Date()) {
			console.log(starTime.getTime - new Date().getTime);					
		}
});
	
</script>
<%@include file="../public/foot_v2.jsp"%>