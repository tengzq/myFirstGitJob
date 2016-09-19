<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="now" class="java.util.Date"/>
<%@include file="../public/header_v2.jsp" %>
<div class="mainbanner">
	<div class="main">
    	<div class="window">
    		<a href="#"><img src="<%=basePath%>wj-static/rc/images/banner.jpg"></a>
        </div>
        <div class="index1">
        <dl>
            <dt><img src="<%=basePath%>wj-static/rc/images/i11.png"></dt>
            <dd>
                <h3>安全才是王道</h3>
                <p>风险备用金提供全年安全保障<br/>风险备用金1亿元</p>
            </dd>
        </dl>
        <dl>
            <dt><img src="<%=basePath%>wj-static/rc/images/i12.png"></dt>
            <dd>
                <h3>有钱才能任性</h3>
                <p>会理财，好先<br/>生最高18%年化收益</p>
            </dd>
        </dl>
        <dl>
            <dt><img src="<%=basePath%>wj-static/rc/images/i13.png"></dt>
            <dd>
                <h3>有心才有服务</h3>
                <p>7X12小时贴心客<br/>服9:00am-9:00pm</p>
            </dd>
        </dl>
        <dl>
            <dt><img src="<%=basePath%>wj-static/rc/images/i14.png"></dt>
            <dd>
                <h3>信任才有远行</h3>
                <p>会理财，好先生<br/>最高18%年化收益</p>
            </dd>
        </dl>
    </div>
    </div>
</div>
<div class="content main">
    <div class="styletitle1">
    	<h3>精选项目</h3>
        <h6><span>适合闲置资金，长期投资，赚钱高收益</span></h6>
    </div>
    <div class="index2">
	    	<c:forEach items="${onlyStar }" var="p">
		    	<div class="box">
		        	<h3>${p.PROJECT_NAME}</h3>
		            <h4><b>${p.BASE_INTEREST_RATE + p.BOSS_INTEREST_RATE }%</b><i>年化收益率</i></h4>
		            <ol>
		            	<li><b>项目期限（天）</b><i>${p.DEADLINE}</i></li>
		            	<li><b>借款金额（元）</b><i>${p.TOTAL_RAISE_AMOUNT}</i></li>
		            	<li><b>项目进度（%）</b><em class="fr">${p.BASE_INTEREST_RATE + p.BOSS_INTEREST_RATE }%</em></li>
		            </ol>
		            <div class="line">
		            	<c:set value="${(p.TOTAL_RAISE_AMOUNT-p.SURPLUS_RAISE_AMOUNT)/p.TOTAL_RAISE_AMOUNT * 100}" var="pRate"></c:set>
		            	<h5><span style="width:<fmt:formatNumber pattern="##" value="${pRate * 0.98}"/>%"><i></i></span></h5>
		            </div>
		            <div class="btn1">
			            <c:choose>
						   <c:when test="${pd.PROJECT_STATE != 1 || pd.flag == false}"> 
						   	<a href="_project/goDetails?ID=${p.PROJECT_ID}" target="_blank"><button  style="background:#A8A8A8;">查看详情</button></a>
						   </c:when>
						   <c:otherwise> 
						   	<a href="_project/goDetails?ID=${p.PROJECT_ID}" target="_blank"><button>我要投资</button></a>
						   </c:otherwise>
						</c:choose>
		            </div>
		        </div>
			</c:forEach>
        <div class="clear"></div>
      <!--   <div class="LRbtn">
        	<div class="left">
            </div>
            <div class="right">
            </div>
        </div> -->
    </div>
    <div class="styletitle1">
    	<h3>媒体报道</h3>
        <h6><span>感谢媒体的支持，融巢资本永远把投资者的资金安全放在第一位</span></h6>
    </div>
</div>
<div class="index2">
	<div class="main">
    	<ul>
    		<c:forEach items="${lis }" var="vars">
	        	<li>
	            	<a href="<%=basePath%>information/pressRelease?ARTICLE_ID=${vars.ARTICLE_ID }" style="color: #fffffb;" target="_blank"><img src="<%=basePath%>${vars.MARK_PATH }"><
	                <a href="<%=basePath%>information/pressRelease?ARTICLE_ID=${vars.ARTICLE_ID }" style="color: #878785;" target="_blank"><h3>${vars.TITLE }</h3></a>
	                <p>${vars.KEYWORDS }</p>
	                <div class="fr"><a href="<%=basePath%>information/pressRelease?ARTICLE_ID=${vars.ARTICLE_ID }" target="_blank">详情>></a></div>
	            </li>
        	</c:forEach>
        </ul>
       <!--  <div class="LRbtn">
        	<div class="left">
            </div>
            <div class="right">
            </div>
        </div> -->
    </div>
</div>
<%@include file="../public/foot_v2.jsp" %>
