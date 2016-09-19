<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<style type="text/css">
		input::-webkit-input-placeholder {
		    color:    #000000;
		}
		input:-moz-placeholder {
		    color:    #000000;
		}
		</style>
<script type="text/javascript">
	
	
	//保存
	function save(){

	}
	
</script>
	</head>
<body>
	<form action="checkuser/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}"/>
		<input type="hidden" name="OLD_PASSWORD" id="OLD_PASSWORD" value="${pd.PASSWORD}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>用户名</th>
				<td><input onchange="checkUsername();" type="text" name="USERNAME" id="USERNAME" maxlength="32" placeholder="登录用户名" title="用户登录名"/></td>
			</tr>
			<tr>
				<th>登录密码</th>
				<td><input  type="password" name="PASSWORD" id="PASSWORD"  maxlength="32" placeholder="密码" title="密码"/></td>
			</tr>
			<tr>
				<th>重复密码</th>
				<td><input  type="password" id="CHECK_PASSWORD" onchange="checkPassword();" maxlength="32" placeholder="密码" title="密码"/></td>
			</tr>
		<%-- 	<tr>
				<th>邀请码</th>
				<td><input type="text" name="INVITE_CODE" id="INVITE_CODE" value="${pd.INVITE_CODE}" maxlength="32" placeholder="邀请码" title="邀请码"/></td>
			</tr> --%>
			<tr>
				<th>上级邀请码</th>
				<td><input type="text" name="INVITE_ME" id="INVITE_ME" maxlength="32" placeholder="上级邀请码" title="上级邀请码"/></td>
			</tr>
			<tr>
				<th>真实姓名</th>
				<td><input type="text" name="REAL_NAME"
				 id="REAL_NAME" maxlength="32" placeholder="真实姓名" title="真实姓名"/></td>
			</tr>
			<tr>
				<th>身份证号</th>
				<td><input type="text" 
				onchange="checkID();checkRealNameAndID();" name="IDENTITY" id="IDENTITY" value="${pd.IDENTITY}" maxlength="32" placeholder="身份证号" title=""身份证号""/></td>
			</tr>
			<tr>
				<th>性别</th>
				
				<td>
				<select name="SEX">
				   <option value="1">男</option>
				   <option value="2">女</option>
				</select> 
			</tr>
			<tr>
				<th>电话</th>
				<td><input type="text" onchange="checkTel();"  name="TEL" id="TEL" value="${pd.TEL}" maxlength="32" placeholder="电话" title="电话"/></td>
			</tr>
			<%--<tr>
				<th>EMAIL</th>
				<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="32" placeholder="邮箱" title="邮箱"/></td>
			</tr>
			 <tr>
				<th>地址</th>
				<td><input type="text" name="ADRESS" id="ADRESS" value="${pd.ADRESS}" maxlength="32" placeholder="地址" title="地址"/></td>
			</tr>
			<tr>
				<th>银行卡号</th>
				<td><input type="text" name="BANK_CARD" id="BANK_CARD" value="${pd.BANK_CARD}" maxlength="32" placeholder="银行卡号" title="银行卡号"/></td>
			</tr>
			<tr>
				<th>账户余额</th>
				<td><input type="text" name="BALANCE" id="BALANCE" value="${pd.BALANCE}" maxlength="32" placeholder="这里输入账户余额" title="账户余额"/></td>
			</tr>
			<tr>
				<th>账户冻结金额</th>
				<td><input type="text" name="FROZEN_AMOUNT" id="FROZEN_AMOUNT" value="${pd.FROZEN_AMOUNT}" maxlength="32" placeholder="账户冻结金额" title="账户冻结金额"/></td>
			</tr>
			<tr>
				<th>注册时间</th>
				<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="32" placeholder="这里输入注册时间" title="注册时间"/></td>
			</tr>
			<tr>
				<th>最后登录时间</th>
				<td><input type="text" name="LAST_LOGIN" id="LAST_LOGIN" value="${pd.LAST_LOGIN}" maxlength="32" placeholder="这里输入最后登录时间" title="最后登录时间"/></td>
			</tr>
			--%>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="onsubmitCheck();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr> 
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		function checkPassword() {
			var password = $("#PASSWORD").val();
			var checkPassword = $("#CHECK_PASSWORD").val();
			if (password.length < 6) {
				alert("密码至少6位");
				return false;
			} else if (password.length > 15) {
				alert("密码至少15位以内");
				return false;
			} else if (password != checkPassword) {
				alert("两次输入密码不一致");
				return false;
			} else {
				return true;
			}
		}
		
		function checkUsername () {
						var username = $("#USERNAME").val();
						console.log(username);
						if (username.length < 6) {
							alert("用户名名至少六位");
							res3 = false;
							return false;
						}
						if (username.length > 15) {
							alert("用户名最多15位");
							res3 = false;
							return false;
						}
						//var check1 = /^[a-zA-z]{6,15}/;  || check1.test(username)
						
						var check = /^[a-zA-Z]\w{3,15}$/ig;
						if (check.test(username)) {
							$.ajax({
							   type: "POST",
							   url: "register/textTel",
							   data: "USERNAME=" + username,
							   success: function(msg) {
								   if (msg.result == "error") {
								   		alert("该用户名已被使用");
								   		res2 = false;
									  	return false;
								   }  else if (msg.result == "success") {
								   		res2 = true;
								   		return true;
								   }
							   }
							});
						} else {
							alert("至少包含一个字母且不能有特殊符号");
							res3 = false;
							return false;
						}
					
				}
				
				function checkTel () {
						var username = $("#TEL").val();
						console.log(username);
						//var check1 = /^[a-zA-z]{6,15}/;  || check1.test(username)
						
						var check = /^[1][358][0-9]{9}$/;
						if (check.test(username)) {
							$.ajax({
							   type: "POST",
							   url: "register/textTel",
							   data: "TEL=" + username,
							   success: function(msg) {
								   if (msg.result == "error") {
									  res = false;
									  	return false;
								   } else {
									   res =  true;
									   return true;
								   }
								   
							   }
							});
						} else {
							alert("请输入正确格式的手机");
							res = false;
							return false;
						}
					
				}
				
				
				function checkRealNameAndID () {
					var real_name = $("#REAL_NAME").val();
					var reg = /^([\u4E00-\u9FA5]+,?)+$/;
					   if (reg.test(real_name) == false) {
						   alert("真实姓名必须为中文");
						   res1 = 2;
						   return false;
					   }
					var identity = $("#IDENTITY").val();
					//var check1 = /^[a-zA-z]{6,15}/;  || check1.test(username)
					
						$.ajax({
						   type: "POST",
						   url: "register/checkThisGuy",
						   async :false,
						   data: "REAL_NAME=" + real_name +"&IDENTITY="+identity,
						   success: function(msg) {
							 if (msg.result == "success") {
								   res1 = 1;
							  		return true;
							   } else {
								   res1 = 2;
							   }
						   }
						});
				
			}
				
				function checkID() {
					var id = $("#IDENTITY").val();
					var check1 = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
					var check2 = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
					if (check1.test(id) == false && check2.test(id) == false) {
						alert("请输入正确格式的身份证");
						return false;
					} else {
						return true;
					}
				}
				var res = false;
				var res1 = 0;
				var res2 = false;
				
				function onsubmitCheck() {
				
				if ($("#INVITE_ME").val() == "") {
					$("#INVITE_ME").tips({
						side : 3,
						msg : '请输入上级邀请码',
						bg : '#AE81FF',
						time : 2
					});
					$("#INVITE_ME").focus();
					return false;
				}
				
					if (checkID() == false || checkPassword() == false) {
						return false;
					}
					checkTel();
					checkRealNameAndID();
					checkUsername();
					if (res == false) {
						alert("手机号重复或为空");
						return false;
					}
					if (res1 == 0) {
						alert("正在检查姓名和身份证是否重复");
						return false;
						
					}
					if (res1 == 2) {
						alert("姓名和身份证重复");
						
						return false;
					}
					if (res2 == false) {
						return false;
						
					}
					console.log(res +"."+ res1+"."+res2 );
					if (res == true && res1 == true && res2 == true) {
						$("#Form").submit();	
					}
					res1 = 0;
				}
		</script>
</body>
</html>