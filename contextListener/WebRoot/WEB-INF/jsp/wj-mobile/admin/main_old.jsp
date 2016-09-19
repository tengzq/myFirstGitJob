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
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>万金先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>

<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
	// 填充需要记录的数据
		var val_array = new Array();
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=0");
		val_array.push("USER_ID=${sessionScope.sessionZfUser.USER_ID}");
		val_array.push("RANDOM_CODE=${RANDOM_CODE}");
		
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/log",
		   data: val_array.join('&'),
		   success: function(msg){}
		});
	});
	
	$(function(){
		//明星项目进度条
   		var baifenbi=Math.floor(${(onlyStar.TOTAL_RAISE_AMOUNT-onlyStar.SURPLUS_RAISE_AMOUNT)/onlyStar.TOTAL_RAISE_AMOUNT*100});
   		$(".barbox.${onlyStar.PROJECT_ID}").find("i").css("width",baifenbi+"%");
   		$(".txt.${onlyStar.PROJECT_ID}").text(baifenbi+"%");
	});
</script>

</head>

<body>
<%@include file="../common/head.jsp" %>
<div class="mainbody">
	<div class="banner">
    	<a href="javascript:void(0)"><img src="wj-mobile-static/images/index_06.png"></a>
    </div>
    <div class="index1">
    	<a href="javascript:void(0)">
        	<img src="wj-mobile-static/images/index_09.png">
            <p>安全保障</p>
        </a>
    	<a href="javascript:void(0)">
        	<img src="wj-mobile-static/images/index_11.png">
            <p>专业团队</p>
        </a>
    	<a href="javascript:void(0)">
        	<img src="wj-mobile-static/images/index_13.png">
            <p>简单赚钱</p>
        </a>
    </div>
    <div class="index2">
    	<h3>年计划</h3>
        <div class="con">
        	<div class="box">
            	<img src="wj-mobile-static/images/index_19.png">
                <h3>单笔投资</h3>
                <h4><fmt:formatNumber value="${onlyStar.LOWEST_AMOUNT }" pattern="0"/>元起</h4>
            </div>
        	<div class="box">
            	<img src="wj-mobile-static/images/index_21.png">
                <h3>预期年化收益</h3>
                <h4><c:set var="baseRate" value="${onlyStar.BASE_INTEREST_RATE }"></c:set><c:if test="${fn:substringAfter(baseRate,'.') ==0}"><fmt:formatNumber value="${onlyStar.BASE_INTEREST_RATE }" pattern="0"/></c:if><c:if test="${fn:substringAfter(baseRate,'.') >0}">${onlyStar.BASE_INTEREST_RATE }</c:if>%</h4>
            </div>
        	<div class="box">
            	<img src="wj-mobile-static/images/index_23.png">
                <h3>锁定期</h3>
                <h4>${onlyStar.DEADLINE }天</h4>
            </div>
        </div>
    </div>
    <div class="barbox ${onlyStar.PROJECT_ID}">
    	<div class="fl">
        	剩余<b>${onlyStar.SURPLUS_RAISE_AMOUNT }</b>元
        </div>
        <div class="fr">
        	<div class="bar">
                <p><i></i></p>
                <em class="txt ${onlyStar.PROJECT_ID}">28%</em>
            </div>
        </div>
    </div>
    <div class="index3">
    	<a href="mobile/project/detail?ID=${onlyStar.PROJECT_ID}" >
    		<h3>立即投资</h3>
    	</a>
    	
        <div class="con">
        	<!-- <div class="box">
            	<img src="wj-mobile-static/images/index_29.png">
                <h4>
                	<p class="p1">剩余<b>100,000</b>元</p>
                    <p class="p2"><b>3</b>个月</p>
                    <p class="p3">立即投资</p>
                </h4>
            </div> -->
         <c:forEach items="${recommend }" var="list">
        	<div class="box">
            	<div class="project-profit" data-rate="${(list.TOTAL_RAISE_AMOUNT-list.SURPLUS_RAISE_AMOUNT)/list.TOTAL_RAISE_AMOUNT}">
					<div class="platform_rate_tips" style="display: none;"></div>
					<span title="额外补息" class="platform_rate"><sub>+</sub>${list.BOSS_INTEREST_RATE }</span>
					<c:set var="base" value="${list.BASE_INTEREST_RATE }"></c:set>
						<p><strong>${fn:substringBefore(base,'.') }</strong><span class="zero">.${fn:substringAfter(base,'.')}</span><p class="pb">%</p><p class="yearp">年化</p></p>
					<canvas width="116px" height="116px"></canvas>
				</div>
				<script type="text/javascript">
						var progress = $('.project-profit');
						
						
						
						(function() {
							circle(progress, '#299ad2', 6);
						}());
						 //Painting
						function circle(elements, color, lineWidth) {
							$.each(elements, function(index, element) {
								var canvas = $(element).find('canvas').eq(0)[0],
									rate = $(element).data('rate'),
									context = canvas.getContext('2d'),
									percentage = 0,
									per = 0,
									x = 58,
									y = x,
									r = 53,
									s = 1.5 * Math.PI;
								if (rate < 0.1) {
									percentage = 0;
								} else if (rate > 0.98 && rate !== 1) {
									percentage = 0.98;
								} else {
									percentage = rate;
								}
								function update() {
									per += 0.015;
									context.clearRect(0, 0, canvas.width, canvas.height);
									context.beginPath();
									context.strokeStyle = color;
									context.lineWidth = lineWidth;
									context.arc(x, y, r, s, ((per * 360.0) * (Math.PI / 180)) + s, false);
									context.stroke();
									if (per < percentage) {
										requestAnimationFrame(update);
									}
								}
								requestAnimationFrame(update);
							});
						}
					</script>	
					<div class="clear"></div>
                	<h4>
                	<p class="p1">剩余<b>${list.SURPLUS_RAISE_AMOUNT }</b>元</p>
                	<c:set var="day" value="${list.DEADLINE/30}"></c:set>
                	<c:if test="${fn:substringAfter(day,'.') >0}">
                		<p class="p2"><b>${fn:substringBefore(day,'.')+1}</b>个月</p>
                	</c:if>
                	<c:if test="${fn:substringAfter(day,'.') ==0}">
                		<p class="p2"><b>${fn:substringBefore(day,'.')}</b>个月</p>
                	</c:if>
                    <a href="mobile/project/detail?ID=${list.ID}">
                    	<p class="p3">立即投资</p>
                	</a>
                </h4>
            </div>
        </c:forEach>
        </div>
    </div>
</div>
<div class="footer">
</div>
</body>
</html>
