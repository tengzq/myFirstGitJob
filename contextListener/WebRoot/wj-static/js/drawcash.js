$(function(){
	//初始化隐藏表面弹出层	
	$('.modal-backdrop').hide();
	$('.modal').hide();
	
	
	changeCode();
	$("#imgCode").bind("click", changeCode);
	
	function changeCode() {
		$("#imgCode").attr("src", "code.do?t=" + genTimestamp());
	}
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
	
	
	threeLater();
	
	//监听用户输入
	$('#Amount').keyup(function(){
		if(checkAmount()){
			refreshAmount($('#Amount').val());
		}else{
			refreshAmount(0);
		}
		
	});
	
	refreshUserInfo();
})
$("#submitApply").click(function(){
	if($('.cd-item-select').length==0){
		//console.log('没绑卡');
		$('#alert-area2').text('请先绑定银行卡');
		setTimeout(function(){
			$('#alert-area2').text('');
		},3500);
		return;
	}
	if(!checkAmount()){
		return;
	}
	$('.modal-backdrop').show();
	$('.modal').show();
})
$(".close").click(function(){
	$('.modal-backdrop').hide();
	$('.modal').hide();
})
//提交
$('#cashSubmit').one('click',function(){
	submitDrawApply();
});
//取消申请
$('.cancelCashWithDrawal').one('click',function(){
	//console.log($(this).attr('data-encode'));
	cancelApply($(this).attr('data-encode'));
});
//发送验证码
$('#btnSmsNum').one('click',function(){
	sendDrawsms();
});
//检查用户输入
function checkAmount(){
	var $amount = $('#Amount');
	
	if($amount.val()==''){
		//console.log('提现金额为空');
		$('#alert-area2').text('提现金额需大于100元');
		setTimeout(function(){
			$('#alert-area2').text('');
		},2000);
		return false;
	}
	if(!/^-?[1-9]\d*$/.test($amount.val())){
		//console.log('金额格式不对');
		$amount.val('');
		return false;
	}
	if(parseInt($amount.val()) > 499999){
		$amount.val('499999');
	}
	if(parseFloat($amount.val()) < 100){
		//console.log('提现金额小于100');
		$('#alert-area2').text('提现金额需大于100元');
		setTimeout(function(){
			$('#alert-area2').text('');
		},2000);
		return false;
	}
	return true;
}
//刷新amount
function refreshAmount(amount){
	var intAmount = parseInt(amount);
	if(intAmount < 2){
		$('#finallyDrawAmount').text('0.00');
	}else{
		$('#finallyDrawAmount').text(intAmount-2);
	}
	$('#cashAmount').text(amount+'元');
}
//replace用户手机号和卡号
function refreshUserInfo(){
	//replace 手机号
	var mobile = $('#sessionTel').val();
	mobile = mobile.replace(/(\d{3})\d{4}(\d{4})/,'$1****$2');
	$('#cashMoiblePhone').text(mobile);
}
//计算时间
function threeLater(){
	var date = new Date();
	date.setTime(date.getTime()+24*60*60*1000*4);
	var s = date.getFullYear()+"-" + (date.getMonth()+1) + "-" + date.getDate();
	//console.log(s);
	$('#cashTime').text(s);
	$('#cashVerifyTime').text(s+'  24点之前');
}
//提交申请
function submitDrawApply(){
	if($('#VerifyCode').val() == ''){
		//console.log('验证码空');
		$('#cashSubmit').one('click',function(){
			submitDrawApply();
		});
		$('#cashPanel').show();
		$('.errorCashPanelMsg').text('请输入验证码');
		setTimeout(function(){
			$('#cashPanel').hide();
		},'3000');
		return;
	}
	
	$.ajax({
		url : 'drawcash/submitDrawCash',
		type : 'post',
		data : {amount : $("#Amount").val(),captcha : $('#VerifyCode').val()},
		async : false,
		dataType : 'json',
		success : function(data) {
			if (data.msg == "tologin") {
				window.location.href = getRootPath()+"/login_toZfLogin";
			}
			if (data.msg == "faild") {
				swal({
					title : "提现失败",
					text : "是否继续提现？",
					type : "error",
					showCancelButton : true,
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "是,继续提现",
					cancelButtonText : "不,返回账户",
					closeOnConfirm : false,
					closeOnCancel : false
				},
				function(isConfirm) {
					if (isConfirm) {
						window.location.href = getRootPath()+"/myAccount/draw_cash";
					} else {
						window.location.href = getRootPath()+"/myAccount/list";
					}
				});
			}
			if (data.msg == "success") {
				window.location.href = getRootPath() + '/myAccount/drawcashSuccess';
			}
			if(data.msg == 'captcha'){
				$('#cashSubmit').one('click',function(){
					submitDrawApply();
				});
				swal({
					title : '',
					text : '验证码输入有误，请重新输入',
					type : 'error'
				});
			}
			if(data.msg == 'captchaDead'){
				$('#cashSubmit').one('click',function(){
					submitDrawApply();
				});
				swal({
					title : '',
					text : '验证码已过期，请重新输入',
					type : 'error'
				});
			}
		}
	});
}
//取消提现
function cancelApply(encode){
	$.ajax({
		type : 'post',
		data : {
			ID : encode
		},
		dataType : 'json',
		url : 'myAccount/cancelDrawcash',
		success : function(rs){
			if(rs.msg=='success'){
				swal({
					title : '成功',
					text : '取消提现申请成功，请查看账户余额',
					type : 'success' ,
					confirmButtonText : '知道了'
					},function(isConfirm){
						if(isConfirm){
							location.reload();
						}
					}
				);
			
			}else{
				$('.cancelCashWithDrawal').one('click',function(){
					//console.log($(this).attr('data-encode'));
					cancelApply($(this).attr('data-encode'));
				});
				swal('失败','取消申请失败','error');
			}
		},
		error : function(){
			$('.cancelCashWithDrawal').one('click',function(){
				//console.log($(this).attr('data-encode'));
				cancelApply($(this).attr('data-encode'));
			});
			swal('失败','取消申请失败','error');
		}
	});
}
//发送验证码
function sendDrawsms(){
	var c = $('#ImgVerifyCode').val();
	if(null == c || c == ''){
		$('.errorCashPanelMsg').text('请输入图片验证码');
		$('#cashPanel').show();
		setTimeout(function(){
			$('#cashPanel').hide();
		},3000);
		$('#btnSmsNum').one('click',function(){
			sendDrawsms();
		});
		return;
	}
	$('#btnSmsNum').removeClass('sms-active');
	$('#btnSmsNum').css('cursor','not-allowed');
	$.ajax({
		type : 'post',
		data : {
			sec : $('#ImgVerifyCode').val()
		},
		url : 'drawcash/drawSms',
		dataType : 'json',
		success : function(rs){
			if(rs.msg == 'img'){
				$('#btnSmsNum').addClass('sms-active');
				$('#btnSmsNum').css('cursor','pointer');
				$('#btnSmsNum').one('click',function(){
					sendDrawsms();
				});
				swal({
					title : '',
					text : '图片验证码输入有误',
					type : 'error'
				});
			}else if(rs.msg != 'success'){
				$('#btnSmsNum').addClass('sms-active');
				$('#btnSmsNum').css('cursor','pointer');
				//重新绑定one事件
				//console.log('发送失败');
				$('#btnSmsNum').one('click',function(){
					sendDrawsms();
				});
				swal({
					title : '',
					text : '发送短信失败，请稍后再试',
					type : 'error'
				});
			}else if(rs.msg=='success'){
				interval = setInterval(countdown,1000);
			}
		}
	});
}

var interval;
var count = 60;
function countdown(){
	if(count ==0){
		count = 60;
		clearInterval(interval);
		$('#btnSmsNum').val('获取短信验证码');
		$('#btnSmsNum').addClass('sms-active');
		$('#btnSmsNum').css('cursor','pointer');
		//重新绑定one事件
		$('#btnSmsNum').one('click',function(){
			sendDrawsms();
		});
	}else{
		//继续倒计时
		count--;
		$('#btnSmsNum').val('获取短信验证码('+count+')');
	}
}
