<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 我要理财</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/page-view.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/project.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<style type="text/css">
.rank-money{
text-align: right;padding-left: 30%;
}
</style>
<script>
// jquery 主体
$(document).ready(function(){
    $(function(){
    	//投资风云榜
		$.ajax({
			type : 'POST',
			data : {},
			url : 'rechargeData/prechargeList',
			dataType : 'json',
			success : function(data) {
				for (var i = 1; i <11; i++){
				$("#rechargeName"+i).text((data.rechargedataList[i-1].username).substr(0,1)+"***"+(data.rechargedataList[i-1].username).substr(-1));    
				$("#rechargeAmount"+i).text("￥"+(data.rechargedataList[i-1].amount).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('')+".00");
				}
    		},
    	});
});  
});
</script>
</head>
<body>
<!-- top -->
<%@ include file="../public/top.jsp" %>
<!-- main -->
<div class="maibody main" style="margin-top:20px;min-height: auto;">
	<div class="listleft fl">
    	<div class="title2">
               我要理财
        </div>
        <form action="<%=basePath %>_project/goProjectList.do" method="post" name="Form" id="Form">
        <div class="con">
        <!-- project list -->
        <c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<div class="box">
            	<h2>
            	<c:if test="${var.PROJECT_STATE=='2'}">
								<a href="<%=basePath%>_project/goDetails?ID=${var.ID}" class="buyPro fr" style="background: #ccc;">&nbsp;&nbsp;已卖光&nbsp;</a>
							</c:if>
							<c:if test="${var.PROJECT_STATE=='1'}">
								<a href="<%=basePath%>_project/goDetails?ID=${var.ID}" class="buyPro fr">马上投资</a>
							</c:if>
							<c:if test="${var.PROJECT_STATE=='3'}">
								<a href="<%=basePath%>_project/goDetails?ID=${var.ID}" class="buyPro fr" style="background: #ccc;">项目已结束</a>
							</c:if>
            	
            	<a href="<%=basePath%>_project/goDetails.do?ID=${var.ID}" title="${var.PROJECT_NAME}">${var.PROJECT_NAME}</a></h2>
                <div class="txt">
                	<span style="width: 40%;">年化收益<i><b>${var.BASE_INTEREST_RATE}%</b></i>
                	<c:if test="${var.BOSS_INTEREST_RATE  ne '0.00'}">
						<i title="额外补贴">+${var.BOSS_INTEREST_RATE}%</i>
				   </c:if>  
                	</span>
                	<span style="width: 30%;">项目期限<b>${var.DEADLINE}天</b></span>
                	<span style="width: 30%;">剩余余额<b>${var.SURPLUS_RAISE_AMOUNT/10000}万元</b></span>
                </div>
            </div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="100" class="center" >网络异常，请尝试刷新！</td>
				</tr>
			</c:otherwise>
		</c:choose>
        </div>
        <!-- 分页begin -->		
		<div id="pager">
			<div class="PagerView">
				${page.portalPageStr}
			</div>
		</div>
		<!-- 分页end -->
        </form>
    </div>
    <!-- 公告 -->
    <div class="listright fr">
    	<div class="title2" style="display: none">
            最新公告
        </div>
        <div class="con" style="display: none">
        	<ol>
        	  <c:forEach items="${noticePgList }" var="val" varStatus="vs">
            	<li>
	            	<a href="zfarticle/toNotice?id=${val.ARTICLE_ID}"><b class="fr">${val.CREATE_DATE}</b>${val.TITLE}</a>
            	</li>
        	  </c:forEach>
        	    <!-- 
            	<li><a href="#"><b class="fr">05-06</b>2015年6月7日项目回款完毕公告</a></li>
            	<li><a href="#"><b class="fr">05-06</b>2015年6月7日项目回款完毕公告</a></li>
            	<li><a href="#"><b class="fr">05-06</b>2015年6月7日项目回款完毕公告</a></li>
            	<li><a href="#"><b class="fr">05-06</b>2015年6月7日项目回款完毕公告</a></li>
            	<li><a href="#"><b class="fr">05-06</b>2015年6月7日项目回款完毕公告</a></li>
            	<li><a href="#"><b class="fr">05-06</b>2015年6月7日项目回款完毕公告</a></li>
            	<li><a href="#"><b class="fr">05-06</b>2015年6月7日项目回款完毕公告</a></li>
            	 -->
            </ol>
        </div>
        
        <div class="title2" style="margin-top:30px;">投资风云榜</div>
        <div class="con">
            	<marquee direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()" style="height:200px;">
        	<ol>
											<li class="clearfix">
							<span class="rank-num"><em>1</em></span>
							<span class="rank-user" id="rechargeName1"></span>
							<span class="rank-money" id="rechargeAmount1"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>2</em></span>
							<span class="rank-user" id="rechargeName2"></span>
							<span class="rank-money" id="rechargeAmount2"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>3</em></span>
							<span class="rank-user" id="rechargeName3"></span>
							<span class="rank-money" id="rechargeAmount3"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>4</em></span>
							<span class="rank-user" id="rechargeName4"></span>
							<span class="rank-money" id="rechargeAmount4"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>5</em></span>
							<span class="rank-user" id="rechargeName5"></span>
							<span class="rank-money" id="rechargeAmount5"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>6</em></span>
							<span class="rank-user" id="rechargeName6"></span>
							<span class="rank-money" id="rechargeAmount6"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>7</em></span>
							<span class="rank-user" id="rechargeName7"></span>
							<span class="rank-money" id="rechargeAmount7"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>8</em></span>
							<span class="rank-user" id="rechargeName8"></span>
							<span class="rank-money" id="rechargeAmount8"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>9</em></span>
							<span class="rank-user" id="rechargeName9"></span>
							<span class="rank-money" id="rechargeAmount9"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>10</em></span>
							<span class="rank-user" id="rechargeName10"></span>
							<span class="rank-money" id="rechargeAmount10"></span>
						</li>
											<!-- <li class="clearfix">
							<span class="rank-num"><em>11</em></span>
							<span class="rank-user" id="rechargeName11"></span>
							<span class="rank-money" id="rechargeAmount11"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>12</em></span>
							<span class="rank-user" id="rechargeName12"></span>
							<span class="rank-money" id="rechargeAmount12"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>13</em></span>
							<span class="rank-user" id="rechargeName13"></span>
							<span class="rank-money" id="rechargeAmount13"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>14</em></span>
							<span class="rank-user" id="rechargeName14"></span>
							<span class="rank-money" id="rechargeAmount14"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>15</em></span>
							<span class="rank-user" id="rechargeName15"></span>
							<span class="rank-money" id="rechargeAmount15"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>16</em></span>
							<span class="rank-user" id="rechargeName16"></span>
							<span class="rank-money" id="rechargeAmount16"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>17</em></span>
							<span class="rank-user" id="rechargeName17"></span>
							<span class="rank-money" id="rechargeAmount17"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>18</em></span>
							<span class="rank-user" id="rechargeName18"></span>
							<span class="rank-money" id="rechargeAmount18"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>19</em></span>
							<span class="rank-user" id="rechargeName19"></span>
							<span class="rank-money" id="rechargeAmount19"></span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>20</em></span>
							<span class="rank-user" id="rechargeName20"></span>
							<span class="rank-money" id="rechargeAmount20"></span>
						</li> -->
            </ol>
				</marquee>
        </div>
        
        
        
        
    </div>
    <div class="clear"></div>


</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<!-- foot -->
<%@ include file="../public/foot.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=1");
		val_array.push("WEB_OR_MOBILE=1");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	});
</script>
</body>
</html>