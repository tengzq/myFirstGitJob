<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head>
<meta charset="utf-8">
<title>万金先生 - 绑定银行卡</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<base href="<%=basePath%>">
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/bank.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="wj-static/css/bind-card.css" />
<link href="wj-static/css/imitateselect.css" rel="stylesheet" />
    
<script src="wj-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<!-- <script src="wj-static/js/addBind.js" type="text/javascript"></script> -->
</head>

<body  style=" background:url(wj-static/images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
<%@ include file="../public/acc_left.jsp"%>
	<div class="content">
    <div class="gerenxinxi tixianyinhangka">
    	<h3>
    		<span>添加银行卡</span>
    	</h3>
    </div>
    <div class="add-bank-card-form">
    	<input type="hidden" id="realName" value="${pd.REAL_NAME}"/>
    	<input type="hidden" id="idno" value="${pd.IDENTITY}"/>
        <ul>
            <li class="clearfix">
            	<c:set value="${pd.REAL_NAME}" var="realname"></c:set>
                <label>持卡人姓名：</label><!--<input type="text" name="" class="text" id="name">--><em>*${fn:substring(realname,1,fn:length(realname))}</em>

            </li>
            <li class="clearfix bank-id">
                <label>银行卡号：</label>
                <input type="text" name="" maxlength="19" class="text" id="bank-card-id">
                <span id="errorCardMessage" class="errorMsg">
                 	请输入正确的借记卡卡号
                </span>
            </li>
            <li class="clearfix">
                <label>银行：</label>
                <select id="selBankType" name="bank">
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
                <span class="errorMsg">请选择银行</span>
            </li>
            <li class="clearfix">
                <label>开户省份：</label>
                <select id="selProvince" name="openAccount-province">
                	<option value="">选择省份</option>
                    <c:forEach items="${areas}" var="area">
                    	<option value="${area.id}" data-pid="${area.pid}">${area.area}</option>
                    </c:forEach>
                </select>
                <span class="errorMsg">请选择省份</span>
            </li>
            <li class="clearfix">
                <label>开户城市：</label>
                <select id="selCity" name="openAccount-city">
                    <option value="">选择城市</option>
                </select>
                <span class="errorMsg">请选择城市</span>
            </li>
            <!-- <li class="clearfix" id="bankBranchName">
                <label>支行名称：</label>
                <select id="selBankBranch" name="subbranch-name"></select>
                <input type="text" name="subbranch-name" to="subbranch-name" class="text" id="subbranch-name">
                <span class="errorMsg"></span>
            </li> -->
          	
            <li class="clearfix m0" style="display: none;">
                <p id="errMsg" style="margin-left: 150px; width: 237px; text-align: center"></p>
            </li>
            <li class="clearfix">
                <input type="button" value="添加" id="submitBtn" class="btn">
            </li>
        </ul>
        <!-- <div style="margin-left: 76px;color:red;">*&nbsp;交通银行、中信银行、邮政储蓄银行暂不支持移动端充值,如给您造成不便望您谅解。</div> -->
    </div>
</div>

	
<div class="clear"></div>
</div>
<%@ include file="../public/foot.jsp"%>
<script src="wj-static/js/bind-card.js"></script>
<script src="wj-static/js/imitateselect.js"></script>
</body>
</html>
