<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<base href="<%=basePath%>">
<title>万金先 - 修改用户密码</title>
<meta charset="utf-8">
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">



<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/passport.css" rel="stylesheet" type="text/css">

<script src="wj-static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<!-- <script src="wj-static/js/passport.js" type="text/javascript"></script> -->

</head>
<body>
<%@include file="../public/header.jsp" %>
<div class="maibody main" id="">
	<div class="wj-logo">
    	<h1 class="fl"><a href="${basePath}"><img src="wj-static/images/logo2.png" width="425px"></a></h1>
        <div class="fl">修改密码</div>
    </div>
    <div class="register">
    	<div class="reg-form fl">
        	<form id="regForm" method="post" action="" onsubmit="return false;">
            	<ul>
                	<li class="reg-form-list clearfix">
                		<span class="title">当前密码</span>
                		<input type="password" id="oldpassword" maxlength="16" placeholder="请输入当前密码">
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                		
                	</li>
                	<li class="reg-form-list clearfix">
                		<span class="title">新密码</span>
                		<input type="password" id="password" placeholder="请输入8位或以上的密码"/>
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                	</li>
                	<li class="reg-form-list clearfix">
                		<span class="title">确认新密码</span>
                		<input type="password" id="passwordRepeat" placeholder="请输入8位或以上的密码">
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                	</li>
                	<li>
                    <button id="subbtn" class="btn-reg">保存</button></li>
                </ul>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
$(function(){
	var elements = {
		oldPassword : $('#oldpassword'),
		password : $('#password'),
		password2 : $('#passwordRepeat'),
		saveBtn : $('#subbtn')
	}
		
	
	
	elements.oldPassword.on('blur', function(){
		if($.trim(elements.oldPassword.val()).length < 8){
			console.log(elements.oldPassword.val().length);
			tips(elements.oldPassword,'当前密码输入错误');
		}else{
			console.log();
			$.post("register/oldPassWord",{PASSWORD:elements.oldPassword.val()},function(data){
				if(data.msg=="nolog"){
					var base = $('base')[0].getAttribute("href");
					top.location.href = getRootPath() + '/login_toZfMain';
					
				}else if(data.msg=="fail"){
					tips(elements.oldPassword,'密码输入有误');
				}
			},"json");
		}
	});
	
	elements.password.on('blur', function(){
		if($.trim(elements.password.val()).length < 8){
			//pswValidEm.text('请输入大于8位字符密码');
			tips(elements.password,'请输入大于8位字符密码');
		}
	});
	elements.password2.on('blur', function(){
		if(elements.password.val() === elements.password2.val()){
			return true;
		} else {
			//psw2ValidEm.text('两次密码输入不一致');
			tips(elements.password2,'两次密码输入不一致');
		}
	});
	
	
	elements.saveBtn.on('click', function(e){
		console.log('click');
		if(elements.oldPassword.val()==''||elements.password.val()==""||elements.password2.val()==''){
			//oldPswValidEm.text('不能为空，请确认输入');
			tips(elements.oldPassword,'不能为空，请确认输入');
			return false;
		}
		console.log(elements.password.val(),elements.password2.val());
		if(elements.password.val() == elements.password2.val()){
			console.log('两次密码一致');
			$.post("register/updatePassWord",{OLD_PASSWORD:$.trim(elements.oldPassword.val()),PASSWORD:$.trim(elements.password.val())},function(data){
				console.log('postback');
				if(data.msg=="nolog"){
					window.location.href=getRootPath()+"/login_toZfLogin";
				}
				if(data.msg=="success"){
					alert("改密成功，重新登入");
					window.location.href=getRootPath()+"/login_toZfLogin";
				}
			},"json");
			
		}else{
			tips(elements.password2,'两次密码不一致');
			return false;
		}
	});
	
	function tips(element,message){
		$(element).tips({
			side : 2,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
});
</script>
<%@ include file="../public/foot.jsp"%>
</body>
</html>