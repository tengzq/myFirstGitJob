$(function() {
	changeCode();
	$("#imgCode").bind("click", changeCode);
	
	function changeCode() {
		$("#imgCode").attr("src", "code.do?t=" + genTimestamp());
	}
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
	
	refreshUserInfo();
	
	$('#removeBankCard').on('click', function(e){
		swal({
			title : "确定解绑银行卡？",
			text : "银行卡解绑之后将进行无法提现操作。",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是,解绑",
			cancelButtonText : "不",
			closeOnConfirm : false,
			closeOnCancel : true
		},
		function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					type:'post',
					url:'myAccount/deleteBankCard',
					data : {},
					async : false,
					dataType : 'json',
					success : function(data) {
						if (data.msg == "success") {
							location.reload();
							return;
						}
						if(data.msg=='nologin'){
							window.location.href = "mobile/login";
							return;
						}
					}
				});
			}else{
				
			}
		});
	});
		
	
	$('#cancelSubmit').on('click',function(){
		$('.upper').hide();
	});
	
	var nowAmount = parseInt($('#now-amount').val()), 
		$amount = $('#amount'), 
		$amountValidEm = $('.valid-amount-em>em')
	/*下面两个值单位元*/
	var WITHDRAW_MIN = 50, WITHDRAW_MAX = $("#now-amount").val();
	/* WITHDRAW_MAX = Math.min(nowAmount, 1000000000) / 100; */
	function ckAmount() {
		var amountVal = $amount.val();
		if (!$.trim(amountVal)) {
			$amountValidEm.text('提现金额不能为空');
			return false;
		}
		if (!/^\d+(\.\d{1,2})?$/.test(amountVal)) {
			$amountValidEm.text('金额格式错误！');
			return false;
		}
		var amount = parseFloat(amountVal) * 100;
		if (amount < WITHDRAW_MIN * 100) {
			$amountValidEm.text('最小提现金额为'+ WITHDRAW_MIN+ '元');
			return false;
		} else if (amount > WITHDRAW_MAX * 100) {
			$amountValidEm.text('您最大可提现金额为'+ WITHDRAW_MAX+ '元');
			return false;
		} else {
			$amountValidEm.text('');
			return true;
		}
	}
	$amount.on('keyup', function() {
		ckAmount();
	});
	
	//底层提交按钮点击
	$('.btn-1').on('click',function(){
		if(ckAmount()){
			$('.upper').show();
		}
		
	});
	
	//弹出层提交按钮点击
	$('#finalSubmit').one('click',function(e) {
		try{console.log('提现点击触发');}catch(e){};
		doSubmit()
	});
	
	//弹出层错误消息
	function errorAreaText(txt){
		$('div.upper .errorArea').text(txt).show();
	}
	
	//检查短信验证码是否合法
	function ckSms(){
		var $smsCode = $('#VerifyCode').val();
		if( $smsCode == ''){
			errorAreaText('请输入短信验证码');
			return false;
		}
		return true;
	}
	
	//检查图片验证码是否合法
	function ckImgCode(){
		var $imgCode = $('#ImgVerifyCode').val();
		if( $imgCode == ''){
			errorAreaText('请输入图片验证码');
			return false;
		}
		return true;
	}
	
	//发短信按钮click
	$('#btnSmsNum').one('click',function(){
		sendSms();	
	});
	
	/**
	 * 发送短信
	 */
	function sendSms(){
		var $smsBtn = $('#btnSmsNum');
		if($smsBtn.hasClass('disabled')){
			return;
		}
		$smsBtn.addClass('disabled');
		if(ckImgCode()){
			//发短信ajax
			$.ajax({
				type : "post",
				url : "drawcash/drawSms",
				data : {sec : $('#ImgVerifyCode').val()},
				dataType : "json",
				success : function(rs){
					if(rs.msg == 'img'){
						$smsBtn.removeClass('disabled');
						$smsBtn.one('click',function(){
							sendSms();	
						});
						errorAreaText('图片验证码有误');
					}else if(rs.msg != 'success'){
						$smsBtn.removeClass('disabled');
						$smsBtn.one('click',function(){
							sendSms();	
						});
						errorAreaText('短信发送失败，请重新发送');
					}else if(rs.msg=='success'){
						interval = setInterval(countdown,1000);
					}
				},
				error : function(){
					$smsBtn.removeClass('disabled');
					$smsBtn.one('click',function(){
						sendSms();	
					});
					errorAreaText('短信发送失败，请重新发送');
				}
			});
		}else{
			$smsBtn.removeClass('disabled');
			$smsBtn.one('click',function(){
				sendSms();	
			});
		}
	}
	
	var count = 60;
	var interval;
	function countdown(){
		var $smsBtn = $('#btnSmsNum');
		if(count == 0){
			clearInterval(interval);
			count = 60;
			$smsBtn.val('获取验证码');
			$smsBtn.removeClass('disabled');
			$smsBtn.one('click',function(){
				sendSms();	
			});
		}else{
			$smsBtn.val(count + '秒后重发');
			count--;
		}
	}
	
	
	function doSubmit(){
		var $finalSubmit = $('#finalSubmit');
		$finalSubmit.addClass('disabled').text('提交中');
		if(!ckSms()){
			$finalSubmit.removeClass('disabled').text('提交');
			return;
		}
		if (ckAmount()) {
			$.ajax({
				url : 'drawcash/submitDrawCash',
				type : 'post',
				data : {amount : $("#amount").val(),captcha : $('#VerifyCode').val()},
				async : false,
				dataType : 'json',
				success : function(data) {
					if (data.msg == "tologin") {
						window.location.href = "mobile/login";
					}
					if (data.msg == "faild") {
						$finalSubmit.removeClass('disabled').text('提交');
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
								window.location.href = "mobile/personal/drawcash";
							} else {
								window.location.href = "mobile/personal/info";
							}
						});
					}
					if (data.msg == "success") {
						swal({
							title : "申请提现成功",
							text : "是否继续提现？",
							type : "success",
							showCancelButton : true,
							confirmButtonColor : "#DD6B55",
							confirmButtonText : "是,继续提现",
							cancelButtonText : "不,返回账户",
							closeOnConfirm : false,
							closeOnCancel : false
						},
						function(isConfirm) {
							if (isConfirm) {
								window.location.href = "mobile/personal/drawcash";
							} else {
								window.location.href = "mobile/personal/info";
							}
						});
					}
					if(data.msg == 'captcha'){
						$finalSubmit.removeClass('disabled').text('提交');
						$('#finalSubmit').one('click',function(e) {
							doSubmit()
						});
						errorAreaText('验证码输入有误');
					}
					if(data.msg == 'captchaDead'){
						$finalSubmit.removeClass('disabled').text('提交');
						$('#finalSubmit').one('click',function(e) {
							doSubmit()
						});
						errorAreaText('验证码已过期');
					}
				}
			});
		}
	}
	
	//replace用户手机号和卡号
	function refreshUserInfo(){
		//replace 手机号
		var mobile = $('#sessionTel').val();
		mobile = mobile.replace(/(\d{3})\d{4}(\d{4})/,'$1****$2');
		$('#cashMoiblePhone').text(mobile);
	}
});
