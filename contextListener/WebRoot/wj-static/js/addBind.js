$(function() {
	var $realname       = $('#userName'),
		$idcardno       = $('#identityNo'),
		realnameValidEm = $('.valid-realname-em>em'),
		idcardnoValidEm = $('.valid-idcardno-em>em'),
		$submitForm 	= $('#submitForm');
	
	$('.reg input').on('focus', function(e){
		$(this).parents('label').find('em').text();
	});

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

	function ckRealName(){
		var name = $('#userName').val();
		if (name.length<0 || name.length>30) {
			realnameValidEm.text('请输入与身份证一致的姓名');
			return false;
		}else if(/^[\u2E80-\u9FFF]+$/.test(name)){
			realnameValidEm.text('');
			return true;
		}else{
			realnameValidEm.text('请输入与身份证一致的姓名');
			return false;
		}
	}

	function ckIdcardno(){
		if( ckCnIdCard($idcardno.val()) ) {
			idcardnoValidEm.text('');
			return true;
		} else {
			idcardnoValidEm.text('二代身份证号码错误');
		}
	}

	$realname.on('blur', ckRealName);
	$idcardno.on('blur', ckIdcardno);
	
	$('#region').on('focus',function(){
		region();
	});
	
	$("#acceptBtn").on("click",function() {
		//console.log('点击触发');
		var region = $("#region").val();
		var bankBranch = $("#bankBranch").val();
		var cardNo = $("#cardNo").val();
		var bankCode = $("#bankCode").val();
		var flag = true;
		if (bankCode=='') {
			$("#bankCodeSpan").css('color', 'red');
			$("#bankCodeSpan").html('请选择银行信息');
			return ;
		}
		if (cardNo=='') {
			$("#cardNoSpan").css('color', 'red');
			$("#cardNoSpan").html('请填写银行信息');
			return ;
		}
		if(!validate(cardNo)){
			$("#cardNoSpan").css('color', 'red');
			$("#cardNoSpan").html('卡号信息必须为整数，并且不能小于6');
			return;
		}
		if (!region) {
			$("#regionSpan").css('color', 'red');
			$("#regionSpan").html('请填写省市');
			return;
		}
		if(!ckRealName() || !ckIdcardno()){
			return;
		}
		swal({
			title:"<div>请确认信息：<div>", 
			text:"<div style='border: 3px solid #eee;padding: 20px;line-height: 1.5;font-size: 14px;margin-top: 20px;'> " +
					"<p style='padding: 5px 0;'>1、请确保您输入银行帐号信息准确无误。</p>" +
					"<p style='padding: 5px 0;'>2、如果您填写的提现信息不正确可能会导致提现失败，由此产生的提现费用将不予返还。</p>" +
					"<p style='padding: 5px 0;'> 3、双休日、法定节假日和工作日18点后，用户可以申请提现，但由于银行原因，将会在下一个工作日进行处理。由此造成的不便，请多多谅解！</p>" +
					"<p style='padding: 5px 0;'>4、平台禁止洗钱、信用卡套现、虚假交易等行为，一经发现并确认，将终止该账户的使用。</p></div>",
			type: "warning",
			html:true,
			showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "确定",   
			cancelButtonText: "返回",   
			closeOnConfirm: false
			}, 
			function(isConfirm){   
				if (isConfirm) { 
					$.ajax({
						type:'post',
						url:'myAccount/bindBankCardInfo',
						data : {BANK_CARD_NAME : bankCode,BANK_CARD:cardNo,SUER_ADRESS:region,REAL_NAME:$realname.val(),IDENTITY:$idcardno.val()},
						async : false,
						dataType : 'json',
						success : function(data) {
							if(data.msg=='nologin'){
								window.location.href = getRootPath()+"/login_toZfLogin";
								return;
							}
							if (data.msg == "faild") {
								swal("申请未成功", "网络出错请稍后再试", "error");
							}
							if (data.msg == "success") {
								swal({title:"成功", text:"提现银行卡绑定成功",type: "success"},function(){
									window.location.href = getRootPath()+"/myAccount/list";
								});
							}
						}
					});
					 
				} 
			
		});
		
		
		});
		
});
	
function card(){
	$("#cardNoSpan").css('color', '');
	$("#cardNoSpan").html('');
}
function region(){
	$("#regionSpan").css('color', '');
	$("#regionSpan").html('');
}
function bank(){
	$("#bankCodeSpan").css('color', '');
	$("#bankCodeSpan").html('');
}

function validate(obj){
    var reg = new RegExp("^[0-9]{6,64}$");
 if(!reg.test(obj)){
     return false;
 }
 return true;
}
