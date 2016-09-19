
function back(page){
	$('#'+page).removeClass('showed');
	$('#'+page).find('footer').css({
		'z-index': '99',
		'bottom': '0',
	  	'left': '100%'
	});
	$('#body').scrollTop(0);
}

$(function(){
	
	
	
	var setting = {
			elements : {
				netDetail : $('#wangyin'),
				amount : $('#rechargeAmount'),
				//balance : $('.wycz1').find('b'),
				//afterP : $('#after-p'),
				bank : $('#rechargeBank'),
				saveBtn : $('#rechargeBtn'),//在线充值确认按钮
				sqdiv : $("#sqdiv"),
				IS_TYPE_CORP : Boolean(0),
				datePick : $('#MONEY_ORDER_DATE'),
			}
	}

	setting.elements.bank.val($('.selectedbank').eq(0).attr('data-bank'));
	
	
	
	
	/*$('.gerenxinxi .nav li').click(function(){
		$(this).addClass('hover').siblings().removeClass('hover')
	})*/
	
	
	//setting.elements.datePick.datepicker();
	
	/* 充值金额输入触发 */
	/*setting.elements.amount.keyup(function(){
		if(ckAmount()){
			
		}
		
	});*/
	/*.on('blur',ckAmount).focus();*/

	function ckAmount() {
		var amountVal = setting.elements.amount.val();
		
		if ($.trim(amountVal) == '') {
			tips(3,setting.elements.amount,'请输入充值金额');
			return false;
		}
		if (!/^[1-9]\d+$/.test(amountVal)) {
			tips(3,setting.elements.amount,'金额格式有误');
			return false;
		}
		amountInt = parseInt(amountVal);
		if(isNaN(amountInt) || amountInt < 100 ){
			tips(3,setting.elements.amount,'充值金额要大于100');
			return false;
		}
		
		
		
		var amount = parseFloat(amountVal) * 100;
		if (amount < 0|| (!setting.elements.IS_TYPE_CORP && amount > 100000000)) {
			tips(3,setting.elements.amount,'金额输入错误');
			return false;
		}
		return true;
	}

/* 立即充值btn点击事件 */
	setting.elements.saveBtn.on('click',function(e) {
		console.log('savebtn click even');
		if (setting.elements.amount.val() == "") {
			tips(3,setting.elements.amount,'请输入金额');
			return;
		}
		
		if (!ckAmount()) {
			e.preventDefault();
			return;
		}
		
		if($('#rechargeBank').val()=='' || setting.elements.bank.length < 1){
			tips(1,setting.elements.saveBtn,'绑定的银行卡赞不支持移动端充值');
			return;
		}
		
		var _limit = getBankLimit();
		var recgBank = $('#rechargeBank').val();
		var _amount = parseInt($('#rechargeAmount').val());
		if(_amount > _limit[recgBank]){
			tips(3,setting.elements.amount,'单笔限额为'+ _limit[recgBank]);
			return;
		}
		window.location.href='mobile/recharge/rechargeConfirm?amount='+setting.elements.amount.val()+"&bankCode="+setting.elements.bank.val();
		

	});
	
	function getBankLimit(){
		$.ajaxSettings.async = false;
		var limitJson;
		$.getJSON("wj-mobile-static/js/banklimit.json",function(limit){
			limitJson = limit;
		});
		$.ajaxSettings.async = true;
		return limitJson;
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

	$("#transBtn").one("click",function() {
		transSubmit()
	});
	
	function transSubmit(){
		$("#MONEY_ORDER_METHOD").val($("input[name=huikuan]:checked").val());
		if ($("#MONEY_ORDER_DATE").val() == ""|| $("#MONEY_ORDER_NUM").val() == ""|| $("#MONEY_ORDER_METHOD").val() == ""|| $("#MARK").val() == ""|| $("#MONEY_ORDER_BANK").val() == "") {
			tips(1,$("#transBtn"),'请确认信息填写完整');
			$("#transBtn").one("click",function() {
				transSubmit()
			});
			return false;
		}
		if (($("#bankCard").css("display") != "none" && $("#MONEY_ORDER_FROM").val() != "")|| ($("#xianjin").css("display") != "none" && $("#MONEY_ORDER_BATCH").val() != "")&& dokeyup()) {
			console.log('成功，提交表单');
			$("#shenqingfrom").submit();
		} else {
			$("#transBtn").one("click",function() {
				transSubmit()
			});
			return false;
			console.log('验证不过，不提交表单');
		};
	}
	
	function showCont() {
		switch ($("input[name=huikuan]:checked").val()) {
		case '1':
			$("#bankCard").show();
			$("#xianjin").hide();
			break;
		case '2':
			$("#bankCard").hide();
			$("#xianjin").show();
			break;
		}
	}
	
	
	function tips(position,element,message){
		$(element).tips({
			side : position,
			msg : message,
			bg : '#299BD2',
			time :2,
			color : '#FFF'
		});
		
	}
	
	
	$('#pageNav li').on('click',function(){
		$('#page'+$(this).data('page')).addClass('showed').siblings().removeClass('showed');
		$('#page'+$(this).data('page')).find('footer').css({
			'z-index': '999',
			'bottom': '0',
		  	'left': '0'
		});
		var _kqRechargeBank = $('#rechargeBank').val();
		$('section[data-code='+_kqRechargeBank+']').show();
		
	});
	$('#page2 .bank-list li').on('click',function(){
		$(this).addClass('selectedbank').siblings().removeClass('selectedbank');
		$('#rechargeBank').val($(this).attr('data-bank'));
	});

	$('.select-type li').on('click',function(){
		var typeId = $(this).find('input[type="radio"]').attr('id');
		$('.type[data-type="'+typeId+'"]').show().siblings('.type').hide();
	});
	
});
function dokeyup() {
	if (!/^\d+(\.\d{1,2})?$/.test($("#MONEY_ORDER_NUM").val())) {
		tips(1,$("#MONEY_ORDER_NUM"),'金额格式输入错误');
		console.log('金额格式错误');
		//$("#moneyNum").show().text("金额格式输入错误");
		return false;
	} else {
		//$("#moneyNum").hide().text("");
		console.log('dokeyup成功');
		return true;
	}
}