<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 借款</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">

<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/loan.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/loan.js"></script>
<script src="wj-static/js/cityu.js"></script>
</head>
<body>
<%@include file="../public/top.jsp" %>
<div class="jiekuan-banner">
	<div class="main">
    	<img src="wj-static/images/woyao_02.jpg">
        <div class="layer">
        	<form method="post" id="loadForm" onsubmit="return false;">
            	<ul>
                	<li>
                    	<span>姓名：</span>
                        <input type="text" name="NAME" id="name">
                    </li>
                	<li>
                    	<span>手机号：</span>
                        <input type="text" name="TEL" id="tel">
                    </li>
                	<!-- <li id="sex-li" style="padding:0 0 0 90px;">
                    	<span>性别：</span>
                        <label><input name="sex" type="radio" checked="checked">男</label>
                        <label><input name="sex" type="radio">女</label>
                    </li> -->
                	<li>
                    	<span>真实年龄：</span>
                        <input type="text" placeholder="周岁" name="age" id="age">
                    </li>
                	<!-- <li>
                    	<span>客户类别：</span>
                        <select id="client_sort">
                        	<option></option>
							<option>公司职员</option>
							<option>公司管理层</option>
							<option>公司总裁</option>
							<option>私营业主</option>
                        </select>
                    </li> -->
                    <li>
                    	<span>工作时间：</span>
                        <select id="worktime">
                        	<option></option>
							<option>1年以下</option>
							<option>1-2年</option>
							<option>2-3年</option>
							<option>3年以上</option>
                        </select>
                    </li>
                	<li>
                    	<span>居住城市：</span>
                        <input  id="city" name="adress" tabindex="5" placeholder="中文/拼音" autocomplete="off" value="北京" name="s_cities" onclick="this.value='';GetCityList(this);" onkeyup="selCity(event)" style="height:25px;width:230px;margin:1px 0;">
                    </li>
                	<!-- <li>
                    	<span>居住时间：</span>
                        <select id="residence_time">
							<option selected = "selected"></option>
							<option >1~5个月</option>
							<option >6~12个月</option>
							<option >一年以上</option>
						</select>
                    </li> -->
                	<li>
                    	<span>税后薪资：</span>
                        <select id="monthly_pay">
							<option selected = "selected"></option>
							<option>4000以下</option>
							<option>4000~10000</option>
							<option>1000~20000</option>
							<option>20000以上</option>
						</select>
                    </li>
                    <p>您提交的资料完全保密，详见<span><a href="zfarticle/inform?ARTICLE_ID=37" target="_blank">《隐私条款》</a></span></p>
                    <div class="btn-layout">
                    <button id="subbtn">立即申请</button>
                    </div>
                    
                </ul>
            </form>
        </div>
        <div class="resp">
        	<div class="response-info">
	        	<label>提交成功,我们会24小时之内联系您</label>
	        	<br>
	        	<label>请您保持联系畅通</label>
	        	<br>
	        	<label>将在<span class="countdown" style="font-size:20px">3</span>秒后返回主页</label>
        	</div>
        </div>
    </div>
</div>
<div class="maibody">

	<div class="loan-tab">
    	<div class="main">
            <ul>
                <li><a href="javascript:void(0);" class="hover">产品优势</a></li>
                <li><a href="javascript:void(0);">产品介绍</a></li>
                <li><a href="javascript:void(0);">申请条件</a></li>
                <li><a href="javascript:void(0);">申请流程</a></li>
            </ul>
        </div>
    </div>
    <div class="main">
    	
        <div class="loan-info1">
            <div class="title2"><a id="anchor1">产品优势</a></div>
            <div class="con">
            	<div class="box">
                	<img src="wj-static/images/woyao_09.png">
                    <h3>产品丰富&nbsp;&nbsp;选择多</h3>
                    <p>只要<b>有车/有房/有保险</b>,就能申请</p>
                </div>
            	<div class="box">
                	<img src="wj-static/images/woyao_14.png">
                    <h3>全自动&nbsp;&nbsp;流程简</h3>
                    <p>7×24小时网上自助申请，<b>仅需3步</b></p>
                </div>
            	<div class="box">
                	<img src="wj-static/images/woyao_15.png">
                    <h3>低门槛&nbsp;&nbsp;放款快</h3>
                    <p><b>月入3000元即可申请</b>,最快一天放款</p>
                </div>
                <!-- <div class="box">
                	<img src="wj-static/images/woyao_14.png">
                    <h3>大品牌，可信赖</h3>
                    <p>中国平安大品牌，<b>世界200强</b></p>
                </div>
            	<div class="box">
                	<img src="wj-static/images/woyao_15.png">
                    <h3>大品牌，可信赖</h3>
                    <p>中国平安大品牌，<b>世界200强</b></p>
                </div>
            	<div class="box">
                	<img src="wj-static/images/woyao_16.png">
                    <h3>大品牌，可信赖</h3>
                    <p>中国平安大品牌，<b>世界200强</b></p>
                </div> -->
            </div>
        </div>
        <div class="loan-info2">
            <div class="title2"><a id="anchor2">产品介绍</a></div>
            <div class="con">
            	<div class="box">
                	<div class="top">
                    	<img src="wj-static/images/woyao_21.png">
                        <h3>有房就能贷</h3>
                    </div>
                    <div class="txt">
                    	<ol>
                        	<li>
                            	<h3>贷款对象</h3>
                                <p>有房贷人士</p>
                            </li>
                        	<li>
                            	<h3>申请要求</h3>
                                <p>拥有按揭房产，并正常还款，无不良信用记录</p>
                            </li>
                        	<li>
                            	<h3>贷款额度</h3>
                                <p>10-50万</p>
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="box">
                	<div class="top">
                    	<img src="wj-static/images/woyao_23.png">
                        <h3>有车就能贷</h3>
                    </div>
                    <div class="txt">
                    	<ol>
                        	<li>
                            	<h3>贷款对象</h3>
                                <p>有车辆人士</p>
                            </li>
                        	<li>
                            	<h3>申请要求</h3>
                                <p>须为8年以内非营运车辆，车险必须在有效期内，被保险人和车主必须一致。</p>
                            </li>
                        	<li>
                            	<h3>贷款额度</h3>
                                <p>2-30万</p>
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="box">
                	<div class="top">
                    	<img src="wj-static/images/woyao_25.png">
                        <h3>有保单就能贷</h3>
                    </div>
                    <div class="txt">
                    	<ol>
                        	<li>
                            	<h3>贷款对象</h3>
                                <p>有保单人士</p>
                            </li>
                        	<li>
                            	<h3>申请要求</h3>
                                <p>提供投保两年以上并且保险账户存在现金价值的保单。</p>
                            </li>
                        	<li>
                            	<h3>贷款额度</h3>
                                <p>2-15万</p>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="loan-info3">
            <div class="title2"><a id="anchor3">申请条件</a></div>
            <div class="con">
            	<div class="box fl" style="background: url(wj-static/images/tiaojian-icon01.png) no-repeat 315px 60px;  background-size:140px;">
                	<div class="tit">
                    	申请条件
                    </div>
                    <div class="txt">
                    	<ol>
                        	<li>年龄：20-55岁</li>
                            <li>现居住地满6个月以上</li>
                            <li>工作要求：<br/>(1)企业职员：闲职工作6个月以上。<br/>(2)私营企业主：营业执照注册12个月以上</li>
                        </ol>
                    </div>
                </div>
                <div class="box fr" style="background: url(wj-static/images/tiaojian-icon02.png) no-repeat 330px 60px;  background-size: 115px;">
                	<div class="tit">
                    	所需材料
                    </div>
                    <div class="txt">
                    	<ol>
                        	<li style="line-height: 2.7">身份证</li>
                            <li style="line-height: 2.7">居住证明文件：银行对账单、公共事业缴费单、房产证、户口本</li>
                            <li style="line-height: 2.7">收入证明文件：央行征信记录、交易流水或银行存折、行驶证</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="loan-info4">
            <div class="title2"><a id="anchor4">申请流程</a></div>
            <div class="con">
            	
                
            </div>
        </div>
    </div>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=4");
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