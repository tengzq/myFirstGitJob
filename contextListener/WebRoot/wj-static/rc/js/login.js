
$(function(){
	//alert("请选择一种登陆方式");
	$('#man').bind('click',function(){
		fun1();
		login();
	});
	$('#man2').bind('click',function(){
		fun2();
		login();
	});
	login();
	
	
	$(document).keyup(function(e){
		if(e.keyCode== '13'){
			$('#doLogin').click();
		}
	});
	
	$('.refreshImg').click(function(){
		changeCode();
	});
	
	changeCode();
	//$("#codeImg").bind("click", changeCode);
	
	
	
	$('.checkbox i').click(function(){
		if($(this).hasClass('hover')){
			$(this).removeClass('hover');
		}else{
			$(this).addClass('hover');
		}
	});
});

var basePath = $('#basePath2').val();
/**
 * 绑定登录点击事件
 */
function login(){
	$('#doLogin').one('click',function(){
		if (a == "2") {
			severCheck();
		} else if (a == "1") {
			severCheck2();
		}
	});
}


function severCheck(){
	$(".server-err").text("").css('display','none');
	if (check()) {
		var loginname = $("#loginname").val();
		var callback = $("#callback").val();
		var captcha = $('#ver').val();
		var saveInfo = $('.checkbox i.hover').length;
		var password = loginname + ",fh," + $("#password").val();
		var checkCode = $("#checkCode").val();
		$.post(basePath+"register/login_zfLogin",{KEYDATA : password,callback:callback,captcha : captcha,saveInfo : saveInfo, checkCode: checkCode},
			function(data) {
				try{console.log(data);}catch(e){};
				if (data.result == "success") {
					top.location.href = basePath;
				}else if (data.result == "usererror") {
					 $("#codeImg").click();
					 
					$(".server-err").html("用户名或密码错误，还有"+ (5 - data.temp)+"次机会。您可以<a href='"+basePath+"/login_selectZfPwd' target='_blank' style='color: red; text-decoration: underline;'>找回密码</a>").css('display','inline-block');
					login();
				}else if (data.result == "captcha") {
					
					$(".server-err").html("验证码输入有误").css('display','inline-block');
					$("#codeImg").click();
					login();
				}else if (data.result == "error") {
					$(".server-err").text("用户名已锁定请联系管理员").css('display','inline-block');
					 $("#codeImg").click();
					login();
				} else if (data.result == "diyici") {
						$(".server-err").text("去完善信息").css('display','inline-block');
						window.location.href = basePath+"register/dyc";
				} else if (data.result == "fail") {
					 $("#codeImg").click();
					$(".server-err").text("用户名或密码输入错误").css('display','inline-block');
					login();
				} else if (data.result == "check") {
					$(".server-err").text("验证码已发至手机").css('display','inline-block');
					time = 60;
					$("#checkCodeFrame").attr("style", "width:150px; float:left; margin-right:10px; display: block;");
					$("#checkCodeButton").attr("style", "width: 118px; display: block; margin-top: 8px;");
					login();

				} else if (data.result == "checkError") {
					$(".server-err").text("手机验证码错误").css('display','inline-block');
					login();
				} else {
					window.location.href = basePath+data.result;
				}
				
			}, "json");
	}
}

var time = 0;
function subTime() {
	if (time != 0) {
		time = time - 1;
		$("#checkCodeButton").html(time+"秒后重新发送");
	} else {
		$("#checkCodeButton").html("发送验证码");
	}
	setTimeout(subTime, 1000);
}
subTime();
function sendSMS(type) {
	if (time == 0) {
		if (type == "login") {
			var captcha = $("#ver").val();
			if (captcha.length < 4) {
				alert("请输入验证码");
				return;
			}
			$.ajax({
				   type: "POST",
				   url: basePath+"register/sendSMS",
				   data: "type=" + type + "&captcha=" + captcha,
				   success: function(msg) {
					   time = 60;
					   if (msg.result == "captcha") {
						   $("#codeImg").click();
						   alert("验证错误");
						   time = 0;
					   } else if (msg.result == "notExist") {
						   $("#codeImg").click();
						   alert("用户不存在");
						   time=0;
					   } else if (msg.result == "errorPhoneNumber") {
						   $("#codeImg").click();
						   alert("手机格式错误");
						   time=0;
					   } else if (msg.result == "error") {
						   $("#codeImg").click();
						   alert("手机验证码错误");
						   time=0;
					   } else if (msg.result == "tooQuick") {
						   $("#codeImg").click();
						   alert("请求次数过于频繁");
					   } else if (msg.result == "success") {
						   window.location.href = basePath+"register/"+"goFindPWD";
					   }
				   }
			});
		} else {
			var phoneNum = $("#phoneNum").val();
			var check = /^1[3|4|5|8][0-9]\d{4,8}$/;
			if (check.test(phoneNum) == false) {
				alert("请输入正确的手机格式");
				return false;
			}
			console.log(phoneNum);
			var captcha = $("#ver").val();
			if (captcha.length < 4) {
				alert("请输入验证码");
				return;
			}
			$.ajax({
				   type: "POST",
				   url: basePath+"register/sendSMS",
				   data: "type=" + type +"&phoneNum=" + phoneNum + "&captcha=" + captcha,
				   success: function(msg) {
					   
					   time = 60;
					   if (msg.result == "captcha") {
						   $("#codeImg").click();
						   alert("验证错误");
						   time = 0;
					   } else if (msg.result == "notExist") {
						   $("#codeImg").click();
						   alert("用户不存在");
						   time=0;
					   } else if (msg.result == "errorPhoneNumber") {
						   $("#codeImg").click();
						   alert("手机格式错误");
					   } else if (msg.result == "error") {
						   $("#codeImg").click();
						   alert("手机验证码错误");
					   } else if (msg.result == "tooQuick") {
						   $("#codeImg").click();
						   alert("请求次数过于频繁");
					   } else if (msg.result == "success") {
						   window.location.href = basePath+"register/"+"goFindPWD";
					   }
				   }
			});
		}
		
	}
}

function severCheck2(){
	console.log("severCheck2");
	$(".server-err").text("").css('display','none');
	if (check()) {
		var loginname = $("#loginname").val();
		var callback = $("#callback").val();
		var captcha = $('#ver').val();
		var saveInfo = $('.checkbox i.hover').length;
		var password = loginname + ",fh," + $("#password").val();
		$.post(basePath+"register/businessLogin",{KEYDATA : password,callback:callback,captcha : captcha,saveInfo : saveInfo},
				function(data) {
			try{console.log(data);}catch(e){};
			if (data.result == "success") {
				top.location.href = basePath;
			}else if (data.result == "usererror") {
				 $("#codeImg").click();
				$(".server-err").html("用户名或密码错误，还有"+ (5 - data.temp)+"次机会。您可以<a href='"+basePath+"/login_selectZfPwd' target='_blank' style='color: red; text-decoration: underline;'>找回密码</a>").css('display','inline-block');
				login();
			}else if (data.result == "captcha") {
				 $("#codeImg").click();
				$(".server-err").html("验证码输入有误").css('display','inline-block');
				login();
			}else if (data.result == "fail") {
				 $("#codeImg").click();
				$(".server-err").text("用户名或密码输入错误").css('display','inline-block');
				login();
			}else if(data.result == "type0"){
				 $("#codeImg").click();
				$(".server-err").text("审核中").css('display','inline-block');
				login();
			} else if(data.result == "type1"){
				 $("#codeImg").click();
			$(".server-err").text("冻结中").css('display','inline-block');
			login();
			} else if (data.result == "goYeePay") {
				window.location.href = basePath+"register/"+"goYeePay";
			}
			
		}, "json");
	}
}

function check() {
	$('.err-area').css({display : 'none'});
	if ($("#loginname").val() == "") {
		$('.err-area').eq(0).text('用户名不能为空').css({display : 'block'});
		login();
		return false;
	}
	if ($("#password").val() == "") {
		$('.err-area').eq(1).text('密码不能为空').css({display : 'block'});
		login();
		return false;
	}
	if($('#ver').val() == ""){
		$('.err-area').eq(2).text('验证码不能为空').css({display : 'block'});
		login();
		return false;
	}
	return true;
}
function fun1() {
	a="1";
	
}
function fun2() {
	a="2";
	
}