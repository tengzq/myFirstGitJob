<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1 user-scalable=false">
	
	<title>万金理财，全民加息</title>
	<base href="<%=basePath%>"/>
	<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/campaign.css" rel="stylesheet" type="text/css">
	<script src="wj-mobile-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/campaign.js" type="text/javascript"></script>
</head>

<body>
<div class="page2">
	<div class="p4">
    	<h3>——— 活动介绍 ———</h3>
    </div>
    <div class="p5">
    	<dl>
        	<dt>01</dt>
            <dd>
            	<ol>
                	<li><em></em>感谢微信TV提供平台</li>
                	<li><em></em>感谢百度TV省下竞价</li>
                	<li><em></em>感谢互相娱乐的你我</li>
                	<li><em></em>5%加息，只为金主开心</li>
                </ol>
            </dd>
        </dl>
    	<dl>
        	<dt>02</dt>
            <dd>
            	<ol>
                	<li><em></em>万金先生，互联网金融平台</li>
                	<li><em></em>清华，北大核心团队</li>
                	<li><em></em>3000万A轮投资</li>
                	<li><em></em>只做世界500强企业优质债权</li>
                	<li><em></em>一切为了金主资产安全升值</li>
                </ol>
            </dd>
        </dl>
    	<dl>
        	<dt>03</dt>
            <dd>
            	<ol>
                	<li><em></em>无耻的我</li>
                	<li><em></em>无耻的摇</li>
                	<li><em></em>无耻的加息</li>
                	<li><em></em>我无耻的要</li>
                </ol>
            </dd>
        </dl>
    </div>
</div>

<%@include file="share.jsp" %>
</body>
</html>

