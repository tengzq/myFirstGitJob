$(function() {
	var $realname       = $('#userName'),
		$idcardno       = $('#identityNo'),
		realnameValidEm = $('.valid-realname-em>em'),
		idcardnoValidEm = $('.valid-idcardno-em>em'),
		$submitForm 	= $('#submitForm'),
		btnColor        = '#ffa626';
	
	$('.reg input').on('focus', function(e){
		$(this).parents('label').find('em').text();
	});
	
	getArea(0,1);
	
	$('#region').on('change',function(){
		getArea($(this).val(),2)
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
	
	
	
	$realname.on('blur', ckRealName);
	$idcardno.on('blur', ckIdcardno);
	
	$("#acceptBtn").one("click",function() {
		//console.log('提交btn点击');
		/*$('#acceptBtn').css('background','#909090');
		$('#acceptBtn').text('正在提交');*/
		var btn = document.getElementById('acceptBtn');
		btn.innerHTML = "正在提交";
		btn.style.background = "#909090";
		doBindCard();
	});
	
	function doBindCard(){
		$('#acceptBtn').css('background','#909090');
		$('#acceptBtn').text('正在提交');
		var region = $("#region").val();
		var bankBranch = $("#bankBranch").val();
		var cardNo = $("#cardNo").val();
		var bankCode = $("#bankCode").val();
		var flag = true;
		if (bankCode=='') {
			//console.log('银行没选');
			$('#acceptBtn').css('background',btnColor);
			$('#acceptBtn').text('提交');
			$("#bankCodeSpan").css('color', 'red');
			$("#bankCodeSpan").html('请选择银行信息');
			tips(1,$("#bankCode"),'请选择银行信息');
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return ;
		}
		if (cardNo=='') {
			//console.log('卡号空');
			$('#acceptBtn').css('background',btnColor);
			$('#acceptBtn').text('提交');
			$("#cardNoSpan").css('color', 'red');
			$("#cardNoSpan").html('请填写银行卡号');
			tips(1,$("#cardNo"),'请填写银行卡号');
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return ;
		}
		if(!checkBankCard(cardNo)){
			//console.log('卡号不对');
			$('#acceptBtn').css('background',btnColor);
			$('#acceptBtn').text('提交');
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return;
		}
		if ($('#region').val()=='') {
			//console.log('省市不对');
			$('#acceptBtn').css('background',btnColor);
			$('#acceptBtn').text('提交');
			$("#regionSpan").css('color', 'red');
			$("#regionSpan").html('请填写省市');
			tips(1,$("#region"),'请选择开户省份')
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return;
		}
		if($('#city').val()==''){
			$('#acceptBtn').css('background',btnColor);
			$('#acceptBtn').text('提交');
			tips(1,$("#city"),'请选择开户城市');
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return;
		}
		/*if($('#bankBranch').val()==''){
			tips(1,$("#bankBranch"),'请填写支行')
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return;
		}*/
		/*if(!/^[\u4e00-\u9fa5]+$/.test($('#bankBranch').val())){
			tips(1,$("#bankBranch"),'请填写正确的支行信息')
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return;
		}*/
		if(!ckRealName() || !ckIdcardno()){
			console.log('姓名身份证有误');
			$('#acceptBtn').css('background',btnColor);
			$('#acceptBtn').text('提交');
			tips(1,$('#acceptBtn'),'网络出现问题');
			$("#acceptBtn").one("click",function() {
				doBindCard()
			});
			return;
		}
		/*swal({
			title:"<div>请确认信息：<div>", 
			text:"<div style='border: 3px solid #eee;padding: 20px;line-height: 1.5;font-size: 14px;margin-top: 20px;overflow:auto;height: 90px;text-align: left;'> " +
					"<p style='padding: 5px 0;'>1、请确保您输入银行帐号信息准确无误。</p>" +
					"<p style='padding: 5px 0;'>2、如果您填写的提现信息不正确可能会导致提现失败，由此产生的提现费用将不予返还。</p>" +
					"<p style='padding: 5px 0;'>3、双休日、法定节假日和工作日18点后，用户可以申请提现，但由于银行原因，将会在下一个工作日进行处理。由此造成的不便，请多多谅解！</p>" +
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
				if (isConfirm) {*/ 
					$('#acceptBtn').css('background','#909090');
					$('#acceptBtn').text('正在提交');
					$.ajax({
						type:'post',
						url:'mobile/personal/bindBankCardInfo',
						data : {
							BANK_CARD_NAME : $('#bankCode').find('option:selected').text(),
							BANK_CODE : $('#bankCode').find('option:selected').val(),
							CITY_ID : $('#city').find('option:selected').val(),
							CITY_NAME : $('#city').find('option:selected').text(),
							BANK_CARD:cardNo,
							SUER_ADRESS:$('#region').find('option:selected').text(),
							PROVINCE_ID : $('#region').find('option:selected').val(),
							BANK_ADRESS:bankBranch,
							REAL_NAME:$realname.val(),
							IDENTITY:$idcardno.val()
						},
						async : false,
						dataType : 'json',
						success : function(data) {
							if(data.msg=='nologin'){
								window.location.href = "mobile/login";
								return;
							}
							if (data.msg == "faild") {
								$('#acceptBtn').css('background',btnColor);
								$('#acceptBtn').text('提交');
								swal("申请未成功", "网络出错请稍后再试", "error");
								$("#acceptBtn").one("click",function() {
									doBindCard()
								});
							}
							if (data.msg == "success") {
								swal({title:"成功", text:"提现银行卡绑定成功",type: "success"},function(){
									window.location.href = "mobile/personal/info";
								});
							}
						}
					}); //ajax结束
				/*}else{
					$("#acceptBtn").one("click",function() {
						doBindCard()
					});
				} */
			/*}*/
		/*);*/
	}
	
	function getArea(pid,type){
		$.post("area/getAreaByPid", {
            pid: pid
        }, function (data) {
        	if(type == 1){
        		var options = '<option value="">开户省份</option>';
        		for(var i  =0; i < data.areaList.length; i++){
        			options +='<option value="'+data.areaList[i].id+'">'+data.areaList[i].area+'</option>';
        		}
        		$('#region').html(options);
        	}else{
        		var options = '<option value="">开户城市</option>';
        		for(var i  =0; i < data.areaList.length; i++){
        			options +='<option value="'+data.areaList[i].id+'">'+data.areaList[i].area+'</option>';
        		}
        		$('#city').html(options);
        	}
        });
	}
	
	function ckRealName(){
		var name = $realname.val();
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
	
	function checkBankCard(cardNum){
		 var regNum = /^[0-9]{16,19}$/;
		 var isOk = false;
		 if (!regNum.test(cardNum)) {
			 tips(1,$("#cardNo"),'银行卡格式有误');
			 return isOk;
		 }else{
			 $.ajax({
				 type : 'post',
				 url : 'mobile/personal/checkBank',
				 data : {bankCard: cardNum},
				 async : false,
				 success : function(response){
					 if (response.msg == 'ok') {
			               isOk = true;
			            } else {
			            	tips(1,$("#cardNo"),'银行卡已被绑定');
			            }
				 },
				 error : function(){
					 tips(1,$("#cardNo"),'网络出现问题，请稍候再试');
				 }
			 });
			 return isOk;
		 }
	}
	
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


function tips(position,element,message){
	$(element).tips({
		side : position,
		msg : message,
		bg : '#FD9720',
		time : 3
	});
}

