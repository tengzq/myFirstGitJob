
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>">
<!-- fuxieyi -->
<title>融巢资本--服务协议</title>
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/article-common2.css" />
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body style="background:#f9f9f9">
	<%@include file="../../public/header_v2.jsp"%>
	<div class="main">
		<div class="mainbody">
			<%@include file="../../public/article_nav.jsp" %> 
			<div class="right">
				<div class="gsjs">
					<div class="maintit">
						<span><b>最新动态</b></span>
					</div>
				  <div class="con">
                    <!-- 	<div class="box pl0"> -->
                            <p>中企协上市公司委员会联合和讯网等四家机构成功举办上市公司研讨会&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     查看</p> 	
                            <p>中企协上市公司委员会联合和讯网等四家机构成功举办上市公司研讨会 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     查看 </p>         

                        <%--     <img src="<%=basePath%>wj-static/images/qq001.png" style="width:100%; padding:30px 0;">
                        	<p>近年来，在中央政府多种政策的推进下，中国金融市场开放革新的脚步越走越快。2015年，随着沪港通的运行走上正轨，QFII和RQFII大扩容以及A股有望纳入国际指数、即将开通的深港通等系列开放举措，都将加速人民币国际化进程。我们正行走在一个跨境融合的大时代！
11月10日下午，由和讯网、中企协上市公司委员会、香港中国金融协会、香港中资证券业协会、香港中资基金业协会联合主办，建银国际、皓天财经集团协办的主题为“沪/深港通时代的上市公司机遇”的跨境融合互联互通系列研讨会之上市公司研讨会在中环建银大厦举行。此次活动吸引了上市公司委员会会员单位、深港两地的证券行业高层50余人出席，和讯网对研讨会做全程图文直播。
委员会副主席兼理事长刘天倪先生代表中企协上市公司委员会向到会者表示欢迎，并致词：“值此中港资本市场联通之新时代，如何在双方金融资本市场互联互通的情况下，抓住机遇，发挥自身优势，在广泛的关注之下使公司的价值正确传播予投资者，以及如何发挥媒体和公关的优势并通过提升公司治理来赢得投资者的青睐，这都是值得深入探究的课题。”
本次上市公司研讨会邀请了多位来自监管机构、上市公司、券商的代表参与讨论，大家围绕“沪港通”、“深港通”对上市公司带来的机遇和挑战，探讨行业的机遇和发展，现场气氛热烈，场面活跃。
港交所内地事务科高级副总裁许正宇先生作为本地交易市场前端监管者的代表，对沪港通实施一年来的经验和得失做了较为详尽的分析和解读，他指出：“沪港通有三个通，首先是香港证监会和CS3C；其次是通是交易通和结算通。整个沪港通的核心是通，涉及跨境交易或者可能出现的违法事情，可以通过目前的法律框架，通过两地证监会加强监管合作，可以达到相对平稳的结果。沪港通一年多来，不仅是一个试点，也是一个连续不断的优化过程，我们通过类似的场合吸收各地、各类的投资者群体，对沪港通提出建议。”
交通银行香港分行副行政总裁孟羽先生指出：“香港IPO融资这一块非常值得国内借鉴，国内和目前改革的方向，不用交保证金就能根据股票市值定价。下一步如果允许IPO进行融资，对机构投资者、个人投资者都能融资，这对上市公司的估值，特别是个人投资者来讲也是一个很大的进步。</p>
                       		  <img src="<%=basePath%>wj-static/images/qq002.png" style="width:100%; padding:30px 0;"> --%>
                     		
                        </div>
                    	
                    </div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@include file="../../public/foot_v2.jsp"%>
</body>
</html>
