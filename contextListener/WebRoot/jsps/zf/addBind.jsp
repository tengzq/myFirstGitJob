<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>绑卡</title>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv= "pragma " content= "no-cache "/>
<meta http-equiv= "cache-control " content= "no-cache "/>
<meta http-equiv= "expires " content= "0 "/>
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
var cardFlag=true;
$(document).ready(function() {
	$("#region").areaopt();
	$("#bankCode").live("change",function(){
		$("#region").val('');
		$("input[name='region']").val('');
		$("input[name='bankBranch']").val('');
		$("#bankCodeSpan").css('color', '');
		$("#bankCodeSpan").html('');
	});
	function validateCardNumber(){
		var cardNo = $("#cardNo").val();
		var url ="validateMemberAndCard.action";
		$.ajax({
	        async : false,
			type : "post",
			timeout : 45000,
			data:{'cardNo':cardNo},
			dataType : 'json',
			url :url,
			success : function(data) {
				data=eval("("+data+")");

			if(data.result=='null'){
				$("#cardNoSpan").css('color', 'red');
				$("#cardNoSpan").html("无法识别您的卡号，请填写正确的储蓄卡卡号");
				cardFlag=false;
			}
			if(data.result=="CREDIT"||data.result=="PASSBOOK"){
				$("#cardNoSpan").css('color', 'red');
				$("#cardNoSpan").html("请按照要求填写正确的储蓄卡卡号");
				cardFlag=false;
			}
			if(data.result=="exception"){
				$("#cardNoSpan").css('color', 'red');
				$("cardNoSpan").html("网络繁忙，请重新发起绑定");
				cardFlag=false;
			}
			},
			error: function(response){
			alert("error");
				}
			});
	  
	}
$("#acceptBtn").click(function() {
		var region = $("#region").val();
		var bankBranch = $("#bankBranch").val();
		var cardNo = $("#cardNo").val();
		var bankCode = $("#bankCode").val();
		var flag = true;
		if (!bankCode) {
			$("#bankCodeSpan").css('color', 'red');
			$("#bankCodeSpan").html('请选择银行信息');
			return;
		}
		$("select[name='bankBranchCode'] option").each(function(index){
			if($(this).text()==bankBranch){
				flag=false;
			}
		});
		if(flag||bankBranch==null||bankBranch==""){
			$
			$("input[name='bankBranch']").val('');
			$("#bankBranchCode").val('');
		}
		if (!cardNo) {
			$("#cardNoSpan").css('color', 'red');
			$("#cardNoSpan").html('请填写卡号信息');
			return;
		}
		if(!validate(cardNo)){
			$("#cardNoSpan").css('color', 'red');
			$("#cardNoSpan").html('卡号信息必须为整数，并且不能小于6');
			return;
		}
		if (!region) {
			$("#regionSpan").css('color', 'red');
			$("#regionSpan").html('请选择省市');
			return;
		}		
		//validateCardNumber();
		if(cardFlag==false){
			return false;
		}
		showMaskMessage("正在处理,请稍后,请勿刷新页面");
		$("#Form").submit();
	});
	
	$("#cardNo").live("focus",function(){
		var psw = $(this).val();
		$("#cardNoSpan").css('color', '');
		$("#cardNoSpan").html('');
		cardFlag=true;
	}).live("blur",function(){
		var psw = $(this).val();
		if (psw) {
			psw = $.trim(psw);
			//console.log(validate(psw));
			if(validate(psw)){
				
				$("#cardNoSpan").css('color', '');
				$("#cardNoSpan").html('');
				// validateCardNumber();
				return;
			}else{
				$("#cardNoSpan").css('color', 'red');
				$("#cardNoSpan").html('卡号信息必须为整数，并且不能小于6');
				return;
			}
			$("#cardNoSpan").css('color', '');
			$("#cardNoSpan").html('');
		   
		} else {
			$("#cardNoSpan").css('color', 'red');
			$("#cardNoSpan").html('请填写卡号信息');
		}
	});
	$("#region").live("focusin",function(){
		var psw = $(this).val();
		$("#regionSpan").css('color', '');
		$("#regionSpan").html('');
	}).live("focusout",function(){
		var psw = $(this).val();
		$("#regionSpan").css('color', '');
		$("#regionSpan").html('');
	});
	
});
function validate(obj){
    var reg = new RegExp("^[0-9]{6,64}$");
 if(!reg.test(obj)){
     return false;
 }
 return true;
}


</script>
<style>
	.select{
		width: 240px; height: 27px; line-height: 27px; padding-left: 3px; vertical-align: middle; color: #666;
	}
</style>
</head>

<body class="f12">
  






<!--头部-->
<div class="header">
  <div class="layout">
    <h1 class="logo fl mt15"><a href="http://www.yeepay.com/" target="_blank"><img src="jingtai/img/logo.png" alt="易宝支付" /></a></h1>
    <div class="fr miniNav mt10"><a href="http://www.yeepay.com/" target="_blank">易宝支付首页</a></div>
  </div>
</div>
<!--头部结束--> 
<!--头部结束-->
<!--业务信息主要内容-->
  <div style="display: none;">
    <input id="platformNo" type="hidden" name="platformNo" value="10012413453"/>
    <input id="platformUserNo" type="hidden" name="platformUserNo" value="dwj_user-826773-online"/>
  </div>
<div class="layout infoWrap">
  <div class="innerInfo regIn pb20 mt20">
    <div class="row"><span class="tit">业务类型：</span><span class="fb">绑卡</span></div>
    <!--表单-->
    <div class="layout formWrap">
      <form id="Form" action="myAccount/bindBankCardInfo" method="post" class="reg">
      	<input type="hidden" name="data_finger_sign"  value="30d2ty3nx87jsihd074acq8264jc1a9v"/>
        <div>
        	<label ><span class="sign">开户银行：</span>
				<tr>
    <td class="tdLabel"></td>
    <td>
    <select name="BANK_CARD_NAME" id="bankCode" class="select">
    <option value="">请选择</option>
    <option value="BOCO">交通银行</option>
    <option value="CEB">光大银行</option>
    <option value="SPDB">上海浦东发展银行</option>
    <option value="ABC">农业银行</option>
    <option value="ECITIC">中信银行</option>
    <option value="CCB">建设银行</option>
    <option value="CMBC">民生银行</option>
    <option value="SDB">平安银行</option>
    <option value="POST">中国邮政储蓄</option>
    <option value="CMBCHINA">招商银行</option>
    <option value="CIB">兴业银行</option>
    <option value="ICBC">中国工商银行</option>
    <option value="BOC">中国银行</option>
    <option value="BCCB">北京银行</option>
    <option value="GDB">广发银行</option>
    <option value="HXB">华夏银行</option>
    <option value="XAYH">西安市商业银行</option>
    <option value="SHYH">上海银行</option>
    <option value="TJYH">天津市商业银行</option>
    <option value="SZNCSYYH">深圳农村商业银行</option>
    <option value="BJNCSYYH">北京农商银行</option>
    <option value="HZYH">杭州市商业银行</option>
    <option value="KLYH">昆仑银行</option>
    <option value="ZHENGZYH">郑州银行</option>
    <option value="WZYH">温州银行</option>
    <option value="HKYH">汉口银行</option>
    <option value="NJYH">南京银行</option>
    <option value="XMYH">厦门银行</option>
    <option value="NCYH">南昌银行</option>
    <option value="JISYH">江苏银行</option>
    <option value="HKBEA">东亚银行(中国)</option>
    <option value="CDYH">成都银行</option>
    <option value="NBYH">宁波银行</option>
    <option value="CSYH">长沙银行</option>
    <option value="HBYH">河北银行</option>
    <option value="GUAZYH">广州银行</option>
    <option value="NXS">农村商业银行合集</option>


</select>

</td>
</tr>


            	</label><span id="bankCodeSpan" class="ml10 prm"></span>
        </div>
        <div class="mt10">
          <label><span class="sign">银行卡种：</span>
          	借记卡
            <input id="cardType" name="cardType" type="hidden"  value="DEBITCARD"/> 
          </label>
        </div>
        <div class="mt10">
        
        	
        		 <label><span class="sign">银行卡号：</span>
		            <input id="cardNo" name="BANK_CARD" type="text"  /><span id="cardNoSpan" class="ml10 prm"></span>
		          </label>
        	
        	
        
         
        </div>
        <div class="mt10">
          <label><span class="sign">省市信息：</span>
          	<input id="region" type="text" class="TextInput" name="SUER_ADRESS" readonly="readonly"/><span id="regionSpan" class="ml10 prm"></span>
    		<div class="clew" style="display: none">请选择开户行所在地市</div>
          </label>
        </div>
       <div class="mt10">
          <ul class="fix">
			<li><label ><span class="sign">支行信息：</span></label>
				 	<input id="bankBranch" name="BANK_ADRESS" class="input_text" /><span id="bankBranchSpan" class="ml10 prm"></span>
        			<div style="display: none;">
        			<tr>
    <td class="tdLabel"></td>
    <td
><select name="bankBranchCode" id="bankBranchCode" class="select ">
    <option value=""
    ></option>


</select>

</td>
</tr>


        			</div>
        			<div class="prm" style="width:500px;float:right;margin-right:120px">支行信息选填，您的银行卡支行信息可联系开户银行获取，如您正确提供可加快到账时效；
	 如不能提供或提供了不准确的信息可能产生到账延时或被银行退回</div>
       		</li>
			</ul>
        </div>
        <div class="mt10">
         <label><span class="sign">开户名：</span>
           <input id="userName" name="REAL_NAME" type="text"  value="${pd.REAL_NAME }" readonly/>
         </label>
        </div>
         <div class="mt10">
         <label><span class="sign">证件类型：</span>
         	身份证<input id="identityType" name="memberFastAuthInfoParam.identityType" type="hidden" value="IDENTITY_CARD" />
         </label>
        </div>
        <div class="mt10">
         <label><span class="sign">身份证：</span>
           <input id="identityNo" name="IDENTITY" type="text"  value="${pd.IDENTITY }"  readonly/>
         </label>
        </div>
        <div class="btnGroup"><input type="submit" id="acceptBtn" class="redBtn" style="color:red; "value="提交"><em></em></div>
      </form>
    </div>
    <!--表单结束--> 
  </div>
</div>
<!--业务信息主要内容结束--> 
<!--底部-->
  

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
