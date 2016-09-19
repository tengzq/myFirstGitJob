$(function(){
	
	var setting = {
			elements : {
				netTab : $('#net'),
				bankTab : $('#bank'),
				kqTab : $('#99bill'),
				netDetail : $('#wangyin'),
				amount : $('#recharge-amount'),
				balance : $('.wycz1').find('b'),
				afterP : $('#arrive'),
				bank : $('input[name=bank]:checked'),
				saveBtn : $('#recharge-btn'),//在线充值确认按钮
				sqdiv : $("#sqdiv"),
				IS_TYPE_CORP : Boolean(0),
				datePick : $('#MONEY_ORDER_DATE'),
			}
	}
	
	/* 宝付标签点击 
	setting.elements.netTab.on('click',function(){
		setting.elements.sqdiv.hide();
		setting.elements.netDetail.show();
	});
	
	 银行转账标签点击 
	setting.elements.bankTab.on('click',function(){
		//console.log('bankTab click');
		setting.elements.netDetail.hide();
		setting.elements.sqdiv.show();
	});*/
	
	var _kqBankCode = $('#bankid-kq').val();
	$('section[data-code='+_kqBankCode+']').show();
	
	
	$('.gerenxinxi .nav li').click(function(){
		$(this).addClass('hover').siblings().removeClass('hover');
		$('.con').hide().eq($(this).index()).show();
	})
	
	$('#amount-kq').keyup(function(){
		var amountKq = parseInt($(this).val());
		if(isNaN(amountKq) || undefined == amountKq || ""==amountKq){
			$('#arrive-kq').text(0.00);
		}else{
			$('#arrive-kq').text(amountKq);
		}
	});
	
	//setting.elements.datePick.datepicker();
	
	/* 充值金额输入触发 */
	setting.elements.amount.keyup(function(){
		/*if(ckAmount()){
			
		}*/
		var amount = parseFloat(setting.elements.amount.val());
		if(!isNaN(amount)){
			setting.elements.afterP.text(amount);
		}
		
	}).on('blur',ckAmount).focus();
	
	function ckAmount() {
		var amountVal = setting.elements.amount.val();
		if ($.trim(amountVal) == '') {
			$('p.error').text('请输入充值金额');
			$('p.error').show();
			setTimeout(function(){
				$('p.error').hide();
			},3000);
			return false;
		}
		if (!/^[1-9]\d+$/.test(amountVal)) {
			//tips(3,setting.elements.amount,'金额格式输入错误');
			$('p.error').text('金额格式输入错误');
			$('p.error').show();
			setTimeout(function(){
				$('p.error').hide();
			},3000);
			return false;
		}
		amountInt = parseInt(amountVal);
		if(isNaN(amountInt) || amountInt < 100 ){
			$('p.error').text('充值金额需大于100');
			$('p.error').show();
			setTimeout(function(){
				$('p.error').hide();
			},3000);
			return false;
		}
		var amount = parseFloat(amountVal) * 100;
		if (amount < 0|| (!setting.elements.IS_TYPE_CORP && amount > 100000000)) {
			//tips(3,setting.elements.amount,'金额输入错误');
			$('p.error').text('金额输入错误');
			$('p.error').show();
			setTimeout(function(){
				$('p.error').hide();
			},3000);
			setting.elements.amount.val('');
			return false;
		}
		
		return true;
	}
	
	/* 立即充值btn点击事件 */
	setting.elements.saveBtn.one('click',function(e) {
		//console.log('savebtn click even');
		rechargeSubmit();
	});
	
	function rechargeSubmit(){
		if (setting.elements.amount.val() == "") {
			//tips(3,setting.elements.amount,'请输入金额');
			$('.errorMsg').text('请输入金额');
			$('.errorMsg').show();
			setTimeout(function(){
				$('.errorMsg').hide();
			},3000);
			setting.elements.saveBtn.one('click',function(e) {
				rechargeSubmit();
			});
			return;
		}
		
		if (!ckAmount()) {
			//console.log('充值金额有误');
			setting.elements.saveBtn.one('click',function(e) {
				rechargeSubmit();
			});
			return;
		}
		if($('#bankCode').val()=='' || $('#bankCode').val()==undefined || $('#bankCode').val().length < 1){
			//tips(1,setting.elements.saveBtn,'请选择银行');
			$('p.error').text('请选择银行');
			$('p.error').show();
			setTimeout(function(){
				$('p.error').hide();
			},3000);
			setting.elements.saveBtn.one('click',function(e) {
				rechargeSubmit();
			});
			return;
		}
		var entryAmount = parseInt($('#recharge-amount').val());
		var dayLimit = parseInt($('#alone').attr('alone'));
		if(isNaN(entryAmount) || isNaN(entryAmount)){
			//console.log(entryAmount,dayLimit);
			setting.elements.saveBtn.one('click',function(e) {
				rechargeSubmit();
			});
			return;
		}
		if(entryAmount > dayLimit){
			$('.errorMsg').text('充值金额大于限额');
			$('.errorMsg').show();
			setTimeout(function(){
				$('.errorMsg').hide().text('');
			},3000);
			setting.elements.saveBtn.one('click',function(e) {
				rechargeSubmit();
			});
			return;
		}
		$.ajax({
			url : 'recharge/submitRecharge',
			type : 'post',
			data : {amount : setting.elements.amount.val(),bank:$('#bankCode').val()},
			async : false,
			dataType : 'json',
			success : function(data) {
				if (data.msg == 'tologin') {
					window.location.href = "login_toZfLogin";
					return;
				}
				if (data.msg == "faild") {
					if(confirm('充值失败，是否继续充值？')){
						window.location.href = "myAccount/recharge"; 
						return;
					}else{
						window.location.href="myAccount/list"; 
						return;
					}
				}
				if(data.msg == "bindcard"){
					window.location.href = "myAccount/bindcard";
					return;
				}
				window.location.href = data.msg;
				
			}
		});
	}
	
	
	/* tips提示 */
	function tips(position,element,message){
		$(element).tips({
			side : position,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
	
	$("input[name=huikuan]").click(function() {
		showCont();
	});

	$("#tradeBtn").one("click",function() {
		submitTrade();
	});
	
	function submitTrade(){
		$("#MONEY_ORDER_METHOD").val($("input[name=huikuan]:checked").val());
		if ($("#MONEY_ORDER_DATE").val() == ""|| $("#MONEY_ORDER_NUM").val() == ""|| $("#MONEY_ORDER_METHOD").val() == ""|| $("#MARK").val() == ""|| $("#MONEY_ORDER_BANK").val() == "") {
			$("#error-area").show();
			setTimeout('$("#error-area").hide()', 3000 );
			$("#tradeBtn").one("click",function() {
				submitTrade();
			});
			return false;
		}
		if (($("#tradeAccount").css("display") == "list-item" && $("#MONEY_ORDER_FROM").val() != "")|| ($("#xianjin").css("display") == "list-item" && $("#MONEY_ORDER_BATCH").val() != "")&& dokeyup()) {
			$("#shenqingfrom").submit();
		} else {
			$("#tradeBtn").one("click",function() {
				submitTrade();
			});
			return false;
		};
	}
	
	function showCont() {
		switch ($("input[name=huikuan]:checked").val()) {
		case '1':
			$("#tradeAccount").show();
			$("#xianjin").hide();
			break;
		case '2':
			$("#tradeAccount").hide();
			$("#xianjin").show();
			break;
		}
	}
	
	$('#submitBtn-kq').one('click',function(){
		kqSubmit();
	});
	
	
	
	/* 快钱充值 */
	function kqSubmit(){
		var kqAmount = parseInt($('#amount-kq').val());
		if(isNaN(kqAmount)){
			$('p.kq-error').text('充值金额格式不正确').show();
			setTimeout(function(){
				$('p.kq-error').text('').hide();
			},3000);
			$('#submitBtn-kq').one('click',function(){
				kqSubmit();
			});
			return;
		}
		if(kqAmount < 1){
			$('p.kq-error').text('充值金额需大于100元').show();
			setTimeout(function(){
				$('p.kq-error').text('').hide();
			},3000);
			$('#submitBtn-kq').one('click',function(){
				kqSubmit();
			});
			return;
		}
		
		var _limit = getBankLimit();
		var kqBank = $('#bankid-kq').val();
		if(kqAmount > _limit[kqBank]){
			$('p.kq-error').text('单笔限额为'+_limit[kqBank]).show();
			setTimeout(function(){
				$('p.kq-error').text('').hide();
			},3000);
			$('#submitBtn-kq').one('click',function(){
				kqSubmit();
			});
			return;
		}
		$('#kq-form').submit();
	}
	
	
	function getBankLimit(){
		$.ajaxSettings.async = false;
		var limitJson;
		$.getJSON("wj-mobile-static/js/banklimit.json",function(limit){
			limitJson = limit;
		});
		$.ajaxSettings.async = true;
		return limitJson;
	}
	
	
});
function dokeyup() {
	if (!/^\d+(\.\d{1,2})?$/.test($("#MONEY_ORDER_NUM").val())) {
		$(".errorMsg").show().text("金额格式输入错误");
		return false;
	} else {
		$(".errorMsg").hide().text("");
		return true;
	}
}