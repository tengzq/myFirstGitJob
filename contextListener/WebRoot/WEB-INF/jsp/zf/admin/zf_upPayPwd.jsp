<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<title>绑卡</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv= "pragma " content= "no-cache "/>
<meta http-equiv= "cache-control " content= "no-cache "/>
<meta http-equiv= "expires " content= "0 "/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link type="text/css" href="jingtai/css/base.css" rel="stylesheet" />
<link type="text/css" href="jingtai/css/p2p.css" rel="stylesheet" />
<link type="text/css" href="jingtai/css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<script type="text/javascript" src="jingtai/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="jingtai/js/jquery-ui-1.8.13.min.js"></script>
<!-- <script type="text/javascript" src="jingtai/js/bha.js"></script> -->
<link type="text/css" href="jingtai/css/jquery.areaopt.css" rel="stylesheet" />
<link type="text/css" href="jingtai/css/jquery.bankcombobox.css" rel="stylesheet" />
<script type="text/javascript" src="jingtai/js/jquery.bankcombobox.js"></script>
<script type="text/javascript" src="jingtai/js/jquery.areaopt.js"></script>
<script type="text/javascript" src="jingtai/js/areaopt.data.js"></script>
<!-- <script type="text/javascript" src="jingtai/js/bha.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
	$("#acceptBtn").click(function() {
		if ($("#password").val().length == 0) {
			alert("请输入新的交易密码");
			return;
		}
		if ($("#password").val() !== $("#password2").val()) {
			alert("两次输入的交易密码不一致");
			return;
		}
		var reg=/^[a-zA-Z0-9]+\d+[a-zA-Z0-9]{4,18}$/;
		if (!reg.test($("#password").val())) {
			alert("交易密码格式非法，为6到18位数字和字母（含大小写）");
			return;
		}
		$.post("register/resetPassword",{PAY_PASSWORD:$("#password").val()},function(data){
			if(data.msg=="nolog"){
				location.href=getRootPath()+"/login_toZfLogin";
			}
			if(data.msg=="success"){
				alert("修改成功");
				location.href=getRootPath()+"/myAccount/list";
			}
		},"json");
	});

});
</script>
</head>

<body class="f12">
  






<!--头部-->
<div class="header">
  <div class="layout">
    <h1 class="logo fl mt15"><a href="http://www.yeepay.com/" target="_blank"><img src="images/logo.png" alt="易宝支付" /></a></h1>
    <div class="fr miniNav mt10"><a href="http://www.yeepay.com/" target="_blank">易宝支付首页</a></div>
  </div>
</div>
<!--头部结束--> 
  
  <div style="display: none;">
    
    <input id="platformNo" type="hidden" name="platformNo" value="10012413453"/>
    <input id="platformUserNo" type="hidden" name="platformUserNo" value="dwj_user-840753-online"/>
  </div>
  
  <!--业务信息主要内容-->
  <div class="layout infoWrap">
    <h2 class="hd pb20 f14 fb">重置密码</h2>
    <div class="innerInfo pb20 mt20">
      <div class="row">
        <span class="tit">通过手机号发送验证码方式,设置新的交易密码</span>
      </div>
    </div>
  </div>
  <!--业务信息主要内容结束-->

  <!--表单-->
  <div class="layout formWrap">
    <form id="form" method="post" class="pas ml50 mt30" return="false">>
      <div>
        <label>
          <span class="sign">手机号码：</span>
          <span>${pd.TEL }</span>
        </label>
      </div>
      <div class="mt10">
        <label>
          <span class="sign">手机验证码：</span>
          <input id="dynamicPwd" name="dynamicPwd" class="phoneCode" />
        </label>
        <input type="button" style="width:120px;height:30px;"  id="sendSmsVerify" value="点击获取"></input><span id="sendSmsVerifySpan" class="ml10 prm">发送校验码</span>
        
      </div>
      <div class="mt10">
        <label>
          <span class="sign">设置交易密码：</span>
          <input id="password" name="password" type="password" />
        </label>
      </div>
      <div class="mt10">
        <label>
          <span class="sign">确认交易密码：</span>
          <input id="password2" name="password2" type="password" />
        </label>
      </div>
      <div class="btnGroup">
        <input type="button" id="acceptBtn"   value="确认"/> 
      </div>
    </form>
  </div>
  <!--表单结束-->
  




<!--底部-->
<div class="footer">
  <div class="inStation"> <a href="http://www.yeepay.com/category/abuoutYeepZN/%E5%85%B3%E4%BA%8E%E6%98%93%E5%AE%9D" target="_blank">易宝简介</a>|<a href="http://www.yeepay.com/category/aboutYeep/AboutYeePay" target="_blank">About YeePay</a>|<a href="http://www.yeepay.com/category/aboutYeepay/contactus/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC" target="_blank">联系我们</a>|<a href="http://www.yeepay.com/category/Recruit/%E4%BA%BA%E6%89%8D%E6%88%98%E7%95%A5" target="_blank">诚聘英才</a>|<a href="http://www.yeepay.com/category/merchantServices/friendlink/%E5%8F%8B%E6%83%85%E9%93%BE%E6%8E%A5" target="_blank">友情链接</a>|<a href="http://www.yeepay.com/category/map" target="_blank">网站地图</a> </div>
  <p class="copyright">&copy; 2003-2012 易宝支付有限公司(YeePay.com)版权所有<br />
    京ICP证030831号 京ICP备08100193号-1 京公网安备110105000585</p>
  <div class="footerNew">
  <a href="http://www.yeepay.com/article?type=wireless&aid=991" target="_blank"><img src="jingtai/img/footer_icon_03.gif" /></a>
  <a href="http://www.yeepay.com/article?type=wireless&aid=990" target="_blank"><img src="jingtai/img/footer_icon_06.gif" /></a>
  <a href="http://www.yeepay.com/article?type=wireless&aid=992" target="_blank"><img src="jingtai/img/footer_icon_22.gif" /></a>
  <a href="#" target="_blank"><img src="jingtai/img/footer_icon_11.gif" /></a>
  <a href="http://www.visa.com.cn/index.shtml" target="_blank"><img src="jingtai/img/footer_icon_17.gif" /></a>
  <a href="https://sealinfo.verisign.com/splash?form_file=fdf/splash.fdf&dn=*.yeepay.com&lang=en" target="_blank"><img src="jingtai/img/footer_icon_25.gif" /></a>
  <a href="http://www.atsec.cn/cn/pci-attestation/YeePay-PCIAttestation-atsec-PCI-DSS-C-36123.jpg" target="_blank"><img src="jingtai/img/footer_icon_19.gif" /></a>
  <a href="http://www.bj.cyberpolice.cn/index.do" target="_blank"><img src="jingtai/img/footer_icon_08.gif" /></a>
  <a href="#" target="_blank"><img src="jingtai/img/footer_icon_28.gif" /></a>
  <a href="https://ss.cnnic.cn/verifyseal.dll?sn=2011051700100008785&ct=df&a=1&pa=0.6245295640708054&rf=https%3A%2F%2Fwww.yeepay.com%2F&vt=1384932064961&mk=9fc6db7293cf165a2301bd54f777d5b8" target="_blank"><img src="jingtai/img/footer_icon_31.gif" /></a>
  <a href="http://www.360.cn/" target="_blank"><img src="jingtai/img/footer_icon_14.gif" /></a>
  </div>
</div>
<!--底部-->
</body>
</html>
