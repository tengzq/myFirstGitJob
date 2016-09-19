
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
						<span><b>团队介绍</b></span>
					</div>
					<div class="con">
					<div class="tuandui">
                        	<dl>
                            	<dt><img src="<%=basePath%>wj-static/images/tuandui_03.jpg"></dt>
                                <dd>
                                	<h3>张蕴更</h3>
                                    <p>鸿蕴泷元控股集团创始人，集团董事长
资深创业者，具有丰富投资经验和实战能力，2014年以1000万元启动资金
创立鸿蕴泷元控股集团，经过一年多的发展，目前集团总资产已达9亿，
并已在艺术品投资、资产管理、教育咨询和互联网金融等领域完成初期布局，
所获得的成绩受到了业内专家和同行的高度认可。</p>
                                </dd>
                            </dl>
                            <dl>
                            	<dt><img src="<%=basePath%>wj-static/images/tuandui_03.jpg"></dt>
                                <dd>
                                	<h3>张蕴更</h3>
                                    <p>鸿蕴泷元控股集团创始人，集团董事长
资深创业者，具有丰富投资经验和实战能力，2014年以1000万元启动资金
创立鸿蕴泷元控股集团，经过一年多的发展，目前集团总资产已达9亿，
并已在艺术品投资、资产管理、教育咨询和互联网金融等领域完成初期布局，
所获得的成绩受到了业内专家和同行的高度认可。</p>
                                </dd>
                            </dl>
                            <dl>
                            	<dt><img src="<%=basePath%>wj-static/images/tuandui_03.jpg"></dt>
                                <dd>
                                	<h3>张蕴更</h3>
                                    <p>鸿蕴泷元控股集团创始人，集团董事长
资深创业者，具有丰富投资经验和实战能力，2014年以1000万元启动资金
创立鸿蕴泷元控股集团，经过一年多的发展，目前集团总资产已达9亿，
并已在艺术品投资、资产管理、教育咨询和互联网金融等领域完成初期布局，
所获得的成绩受到了业内专家和同行的高度认可。</p>
                                </dd>
                            </dl>
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
