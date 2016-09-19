<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="">

<base href="<%=basePath%>">
<title>万金先生 - 个人中心</title>
<meta charset="utf-8">
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">

<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">

<script src="wj-static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/userinfo.js" type="text/javascript"></script>

<style type="text/css">
	.mailbtn{
		background-color: #327dc3;
		color: #fff;
		border: 0;
		font-family: "微软雅黑","Microsoft YaHei";
		height: 28px;
	}
</style>
</head>

<body style=" background:url(<%=basePath%>/wj-static/images/logo_03.png)">
<%@include file="../public/top.jsp" %>

<div class="mainbody main">
	<%@include file="../public/acc_left.jsp" %>
    <div class="content">
    	<div class="gerenxinxi">
        	<h3><span>个人信息</span></h3>
            <!-- <div class="nav">
            	<ul>
                	<li class="hover"><a href="javascript:void(0)">个人资料</a></li>
                	<li><a href="javascript:void(0)">IT福利社</a></li>
                    <div class="clear"></div>
                </ul>
            </div> -->
            <div class="con">
            	<h3><img src="wj-static/images/angang_03.png">个人资料</h3>
                <ol>
                	<li><span>用户名：</span>${pd.USERNAME }</li>
                	<li><span>姓名：</span>${pd.REAL_NAME }</li>
                	<li><span >身份证号：</span><span id="identity" style="color:#000"></span></li>
                	<li><span>手机号：</span><span id="tel" style="color:#000"></span></li>
                	<li id="mail">
                		<span>邮箱：</span>
                		<input type="hidden" id="oldMail" value="${pd.EMAIL}"/>
                		<input type="hidden" id="currentUsername" value="${sessionScope.sessionZfUser.USERNAME}"/>
                		<input type="hidden" id="currentUserid" value="${sessionScope.sessionZfUser.USER_ID}"/>
                		<c:if test="${pd.EMAIL==null||pd.EMAIL==''}">
                		<input id="EMAIL" type="text" value="${pd.EMAIL }" style="height:22px">
                		<button type="button" class="mailbtn" id="valimail">验证邮箱</button>
                		</c:if>
                		<c:if test="${pd.EMAIL!=null&&pd.EMAIL!=''}">
                		${pd.EMAIL }
                		<button type="button" class="mailbtn" onclick="genggai();">更改</button>
                		</c:if>
	                		<!-- <a href="javascript:void(0)">验证邮箱</a> -->
                		<span id="emlabel" style="color:red"></span>
                	</li>
                	<li>
                		<span>邮寄地址：</span>
                		<input type="text" id="ADDRESS" value="${pd.ADRESS}" style="height:22px" maxlength="100">
                		
                	</li>
                </ol>
                <a href="javascript:void(0)" class="saveBtn">保存</a>
            	<h3><img src="wj-static/images/angang_06.png">安全设置</h3>
                <ol>
                	<li><span>登录密码：</span>****** <a href="register/updatepsw" class="button">修改登录密码</a></li>
                	<!-- <li><span>支付密码：</span>****** <a href="register/upPayPwd" class="button">修改支付密码</a></li> -->
                </ol>
            </div>
            
        </div>
    </div>
    <div class="clear"></div>
    <div id="sweetAlertMsg" style="display: none;">
			
	</div>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@include file="../public/foot.jsp" %>

<script type="text/javascript">
    

	$(function(){
		var ide='${pd.IDENTITY}';
		if(ide.length==18){
			var iden=ide.replace(/(\d{4})\d{10}(\d{3})([a-z]{1})/,'$1****$2$3');
			$("#identity").text(iden);
		}
		if(ide.length==15){
			var iden='${pd.IDENTITY}'.replace(/(\d{4})(\d{7})(\d{3})([a-z]{1})/,'$1****$2$3');
			$("#identity").text(iden);
		}
		var tel='${pd.TEL}'.replace(/(\d{3})\d{4}(\d{4})/,'$1****$2');
		$("#tel").text(tel);
		
		$("#EMAIL").on('focus',function(){
			$("#emlabel").text("");
		});
		/* 
		$('#EMAIL').on('blur',function(){
		console.log('blur触发');
			var reg=/^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
			if(!reg.test($("#EMAIL").val())){
				$("#emlabel").text("格式错误");
				return false;
			}else return true;
		});
		 */
		
		$(".saveBtn").on('click',function(){
			if($("#ADDRESS").val() == ''){
				return false;
			}else{
				$.post("register/saveEmailAndAdress",{ADRESS:$("#ADDRESS").val()},function(data){
					if(data.msg=="nolog"){
						window.location.href=getRootPath()+"/login_toZfLogin";
					}
					if(data.msg=="success"){
						alert("保存成功");
					}
				},"json");
			}
		});
		
	});
	
	
	function dobur(){ 
		var reg=/\w+((-w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+/;
		if(!reg.test($("#EMAIL").val())){
			$("#emlabel").text("格式错误");
			return false;
		}else {
			$("#emlabel").text("");
			return true;
		};
	};
</script>
</body>
</html>