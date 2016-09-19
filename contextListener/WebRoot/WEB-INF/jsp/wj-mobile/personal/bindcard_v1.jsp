<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>绑定银行卡</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/sweetalert.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/bindcard.css"/>
<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="wj-mobile-static/js/jquery.tips.js"></script>
<!-- <script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script> -->
<script src="wj-mobile-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/bindcard.js" type="text/javascript"></script>
</head>

<body style="background:#48b4e2">
<%@include file="../common/head.jsp" %>
<div class="mainbody">
    <div class="reg">
    	<!-- <div class="head">
    		<a href="mobile/main">
        		<img src="wj-mobile-static/images/logo_03.png">
            </a>
        </div> -->
        <h2 style="text-align: center;font-size: 24px;margin:15px;">绑定银行卡</h2>
        <c:set value="${pd.REAL_NAME}" var="RN"></c:set>
        <input type="hidden" id="userName" name="REAL_NAME" value="${pd.REAL_NAME }" readonly="readonly">
        <input type="hidden" id="identityNo" name="IDENTITY" placeholder="身份证号" value="${pd.IDENTITY }" readonly="readonly">
        <ol>
        	<li><p><input type="text" value="持卡人姓名：*${fn:substring(RN,1,fn:length(RN))}" placeholder="持卡人姓名" readonly="readonly" style="border:0"><i class="fa fa-user"></i></p></li>
        	<li><p>
        		<select name="BANK_CARD_NAME" id="bankCode" class="select" onchange="bank();">
   					<option value="">选择银行</option>
                    <option value="3001">招商银行</option>
                    <option value="3026">中国银行</option>
                    <option value="3002">中国工商银行</option>
                    <option value="3003">中国建设银行</option>
                    <option value="3005">中国农业银行</option>
                    <option value="3020">交通银行</option>
                    <option value="3004">上海浦东发展银行</option>
                    <option value="3006">中国民生银行</option>
                    <option value="3009">兴业银行</option>
                    <option value="3039">中信银行</option>
                    <option value="3022">中国光大银行</option>
                    <option value="3038">中国邮政储蓄所</option>
                    <option value="3035">平安银行</option>
                    <option value="3036">广发银行</option>        
					</select>
					<i class="fa fa-university"></i>
       		</p></li>
        	<li><p><input type="text" id="cardNo" name="BANK_CARD" id="BANK_CARD" placeholder="银行卡号"><i class="fa fa-lock"></i></p></li>
        	<li><p>
        		<!-- <input type="text" id="region" name="SUER_ADRESS" placeholder="省市信息"> -->
        		<select id="region">
        			<option value="">开户省份</option>
        		</select>
        		<i class="fa fa-link"></i>
        		</p>
        	</li>
        	<li><p>
        		<!-- <input type="text" id="region" name="SUER_ADRESS" placeholder="省市信息"> -->
        		<select id="city">
        			<option value="">开户城市</option>
        		</select>
        		<i class="fa fa-link"></i>
        		</p>
        	</li>
        	<!-- <li><p>
        		<input type="text" id="bankBranch" name="BANK_ADRESS" placeholder="支行信息">
        		<i class="fa fa-link"></i>
        	</p></li> -->
        	
            <div class="clear"></div>
            <!-- <div style="text-align: center;color:#000;font-size: 12px;margin-bottom: 5px;line-height: 16px;">交通银行、中信银行、邮政储蓄银行<br>暂不支持移动端充值<br>如给您造成不便望您谅解</div> -->
            <li style="margin-top: 15px;">
            	<p>
            		<input type="button" id="acceptBtn" value="提交" style="width:100% !important;margin-left:0 !important;">
            		<input type="button" id="fakeBtn" value="正在提交" style="background: #909090;display: none;width:100% !important;margin-left:0 !important;">
                </p>
            </li>
            
        </ol>
        <!-- <div class="footer">
			<p>©万金先生 京ICP备15033688号</p>
   			 <p><a href="mobile/main">手机版</a><a href="www.wanjinxiansheng.com/main">PC版</a><span>4008-337-520</span></p>
		</div> -->
		<%@include file="../common/foot.jsp" %>
    </div>
</div>

</body>
</html>
