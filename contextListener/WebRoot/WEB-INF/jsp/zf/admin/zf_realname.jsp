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
<title>万金先生 - 实名认证</title>
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
<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">

<script src="wj-static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-static/js/sonic.js" type="text/javascript"></script>
<!-- <script src="wj-static/js/passport.js" type="text/javascript"></script> -->

<style type="text/css">
	.pleasewatting{
		text-align:center;
		position: fixed;
		width: 100% !important;
		height: 100%;
		z-index: 9;
		top:0;
		left:0;
		/* opacity:0.5; 
		-moz-opacity:0.5; 
		filter:alpha(opacity=50); */  
		background-color: rgba(144,144,144,0.5);
	}
	.pleasewatting canvas{
		width:150px;
		height:150px;
		margin-top:13%;
	}
	.pleasewatting p{
		font-size: 20px;
		color: #fff;
		background-color: #000;
		width: 180px;
		height: 35px;
		line-height: 35px;
		margin: auto;
		border-radius: 5px;
	}
</style>
</head>
<body>
	<div class="header">
	<div class="top">
        <div class="main">
            <div class="fl">
                <span>联系电话：400 807 8000</span>
                <b>(工作日8:00-22:00)</b>
                <a href="javascript:void(0)"><i class="fa fa-weibo"></i></a>
                <a href="javascript:void(0)"><i class="fa fa-weixin"></i></a>
            </div>
            <div class="fr">
                <c:choose>
					<c:when test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
						<a href="javascript:void(0);" rel="nofollow" onclick="dologin();">登录</a>
						<a href="register/goAdd" class="tongji" data-category="注册" data-label="header" rel="nofollow">注册</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0);" rel="nofollow">欢迎您，${sessionScope.sessionZfUser.USERNAME}</a>
						<a href="register/out" rel="nofollow">[退出]</a>
					</c:otherwise>
				</c:choose>
                <!-- <a href="javascript:void(0)">手机APP</a> -->
                <a href="zfarticle/safety?PROGRAM_ID=pg_bangzhu">帮助中心</a>
            </div>
        </div>
    </div>
</div>
<div class="maibody main" id="">
	<div class="wj-logo">
    	<h1 class="fl"><a href="${basePath}"><img src="wj-static/images/logo2.png" width="425px"></a></h1>
        <div class="fl">实名认证</div>
    </div>
    <div class="register">
    	<div class="reg-form fl" style="height: 275px;">
        	<form id="regForm" method="post" action="" onsubmit="return false;">
            	<ul>
                	<li class="reg-form-list clearfix">
                		<span class="title">姓名</span>
                		<input type="text" id="realname" maxlength="16" placeholder="请输入真实姓名">
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                		
                	</li>
                	<li class="reg-form-list clearfix">
                		<span class="title">身份证号</span>
                		<input type="text" id="idno" placeholder="请输入身份证号"/>
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                	</li>
                	<!-- <li class="reg-form-list clearfix">
                		<span class="title">确认新密码</span>
                		<input type="password" id="passwordRepeat" placeholder="请输入8位或以上的密码">
                		<span class="err-area"><em class="err-tips"></em></span>
                	</li> -->
                	<li>
                    	<button id="subbtn" class="btn-reg" style="margin-top: 20px;">提交</button>
                    	<button id="fakeBtn" class="btn-reg" style="margin-top: 20px;background-color: #909090;display: none;">提交中</button>
                    </li>
                </ul>
            </form>
        </div>
        <div class="pleasewatting" id="heyPlzWait" style="display: none;">
	    	
	    </div>
    </div>
    
</div>

<script type="text/javascript">
$(function(){
	var ckCnIdCard = (function(){
		var w = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2],
			m = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
		return function(s){
			if(!/^\d{17}[\d|x]$/i.test(s)){
				return;
			}
			var r = 0;
			for(var i = 0, l = 17; i < l; i++){
				r += parseInt(s[i], 10) * w[i];
			}
			if(s[17].toLowerCase() === m[r%11].toLowerCase()){
				return true;
			}
			return false;
		};
	})();
	
	
	var elements = {
		realname : $('#realname'),
		idno : $('#idno'),
		saveBtn : $('#subbtn'),
		fakeBtn : $('#fakeBtn')
	}
		
	function ckRealName(){
		var name = $.trim(elements.realname.val());
		if (name.length<0 || name.length>30) {
			tips(2,elements.realname,'姓名格式错误');
			return false;
		}else if(/^[\u2E80-\u9FFF]+$/.test(name)){
			return true;
		}else{
			tips(2,elements.realname,'请输入与身份证一致的姓名');
			return false;
		}
	}
	
	/* elements.realname.on('blur', function(){
		ckRealName();
	}); */
	var idresult = false;
	
	function ckIdcardno(){
		if( ckCnIdCard($.trim(elements.idno.val())) ) {
			$.ajax({
				type : 'post',
				url : 'myAccount/checkIdNo',
				data : {
					IDENTITY : elements.idno.val()
				},
				async : false,
				dataType : 'json',
				success : function(r){
					console.log(r.msg);
					if(r.msg=='exsit'){
						console.log('身份证已存在');
						idresult = false;	
						swal({   
							title: "身份证已被认证", 
							type : 'error',  
							text: '如有疑问，请致电400电话',   
							confirmButtonText : "知道了"
						},function(isConfirm){
							if(isConfirm){
								
							}
						});
					}else if(r.msg=='notexsit'){
						idresult = true;
					}else{
						swal({   
							title: "网络出现问题", 
							type : 'error',  
							text: '请稍候尝试',   
							confirmButtonText : "知道了"
						});
						idresult = false;
					}
				}
			});
			
		} else {
			//idcardnoValidEm.showValid(false, '二代身份证号码错误');
			tips(2,elements.idno,'二代身份证号错误');
			idresult = false;
		}
	}
	/* elements.idno.on('blur', function(){
		ckIdcardno();
	}); */
	var $watting = $('#heyPlzWait');
	
	elements.saveBtn.on('click', function(e){
		console.log('click');
		elements.saveBtn.hide();
		elements.fakeBtn.show();
		ckIdcardno();
		if(!ckRealName() || !idresult){
			elements.fakeBtn.hide();
			elements.saveBtn.show();
			return;
		}
		$watting.show();
		setTimeout(function(){
			$.ajax({
				type : 'post',
				url : 'myAccount/submitRealname',
				dataType : 'json',
				data : {
					REAL_NAME : elements.realname.val(),
					IDENTITY : elements.idno.val()
				},
			})
			.done(function(r){
				$watting.hide();
				console.log('提交成功');
				if(r.msg=='success'){
					console.log('success');
					
					swal({   
						title: "提交成功！",   
						text: "2 秒后自动返回个人中心",   
						timer: 2000,   
						showConfirmButton: false 
					},function(isConfirm){
						console.log('swal callback');
						top.location.href=getRootPath()+'/myAccount/list';
					});
				}else if(r.msg=='nolog'){
					top.location.href=getRootPath()+"/login_toZfLogin?callback=myAccount/list"
				}else if(r.msg=='fail'){
					swal({   
						title: '提交失败！',   
						text: '<span style="color:red">网络出现问题，请稍后再试！<span>',   
						html: true ,
						confirmButtonText : "知道了"
					});
					elements.fakeBtn.hide();
					elements.saveBtn.show();
				}
			})
			.fail(function(r){
				$watting.hide();
				console.log(r);
				console.log('提交失败');
				swal({   
						title: '提交失败！',   
						text: '<span style="color:red">网络出现问题，请稍后再试！<span>',   
						html: true ,
						confirmButtonText : "知道了"
					});
				elements.fakeBtn.hide();
				elements.saveBtn.show();
			});
		},3000);
		
	});
	
	function tips(position,element,message){
		$(element).tips({
			side : position,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
});

 var loader = {

		width: 100,
		height: 100,

		stepsPerFrame: 4,
		trailLength: 1,
		pointDistance: .01,
		fps: 25,

		fillColor: '#ea943f',

		setup: function() {
			this._.lineWidth = 10;
		},

		step: function(point, i, f) {

			var progress = point.progress,
				degAngle = 360 * progress,
				angle = Math.PI/180 * degAngle,
				angleB = Math.PI/180 * (degAngle - 180),
				size = i*5;

			this._.fillRect(
				Math.cos(angle) * 25 + (50-size/2),
				Math.sin(angle) * 15 + (50-size/2),
				size,
				size
			);

			this._.fillStyle = '#2e9dd0';

			this._.fillRect(
				Math.cos(angleB) * 15 + (50-size/2),
				Math.sin(angleB) * 25 + (50-size/2),
				size,
				size
			);

			if (point.progress == 1) {

				this._.globalAlpha = f < .5 ? 1-f : f;

				this._.fillStyle = '#2e9dd0';

				this._.beginPath();
				this._.arc(50, 50, 5, 0, 360, 0);
				this._.closePath();
				this._.fill();

			}


		},

		path: [
			['line', 40, 10, 60, 90]
		]
	}
	var a,b,d=document.getElementById('heyPlzWait');
	a = new Sonic(loader);
	b = document.createElement('p');
	b.innerHTML = '正在认证，请稍候';
	d.appendChild(a.canvas);
	d.appendChild(b);
	//a.canvas.style.marginTop = (200 - a.fullHeight) / 2 + 'px';
	//a.canvas.style.marginLeft = (300 - a.fullWidth) / 2 + 'px';
	//a.canvas.style.marginTop = '40%';
	a.play();
	
	
</script>

<%@ include file="../public/foot.jsp"%>
</body>
</html>