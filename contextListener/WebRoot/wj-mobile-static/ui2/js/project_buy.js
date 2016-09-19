$(function(){
	var _realPay = 0;
	
	$(".ull li:odd").addClass("alt");
	$("#tt6").click(function(){
		$("#ulli").slideToggle();
		/*$('body').on('click',function(e){
			console.log(e.target);
			var a = $(e.target).parent(),b=$('#ulli');
			if(a.is(b)){
				var et = $(e.target),currentTicket = $('#sid2');
				currentTicket.text(et.text());
				currentTicket.attr('data-price',et.attr('data-price'));
				currentTicket.attr('data-enable',et.attr('data-enable'));
				currentTicket.attr('data-surplus',et.attr('data-surplus'));
				$('#coupon_id').val(et.attr('data-tid'));
				if(method.m_checkTicket()){
					//验证通过
					method.m_refreshAmount();
				}
			}else{
				objs.elements.realPay.text(objs.elements.amount.val() || 0);
				$('#coupon_id').val('');
			}
			$('#ulli').css('display','none');
		});*/
		return false;
	});
	$(".ull > li").hover(function(){
		$(this).animate({
			paddingLeft: 20				
		},100);									  
	},function(){
		$(this).animate({
			paddingLeft: 5				
		},50);	
	});
	
	$('#ulli li').on('click',function(){
		var et = $(this),currentTicket = $('#sid2');
		console.log(et);
		currentTicket.text(et.text());
		$('#sid2').attr('data-price',et.attr('data-price'));
		$('#sid2').attr('data-enable',et.attr('data-enable'));
		$('#sid2').attr('data-surplus',et.attr('data-surplus'));
		$('#coupon_id').val(et.attr('data-tid'));
		method.m_refreshAmount();
	});
	
	objs = {
			elements : {
				amount : $('#amount'),//购买金额
				realPay : $('#tt7 span'),//实际支付
				inviteCode : $('#invation_code'),//邀请码
				inviteRate : $('#inviteRate'),//邀请码利率类型
				invitationRate : $('#invitationRate'),//邀请码利率
				btn_checkInviteCode : $('#sid1'),//获取邀请码利率btn
				incomeTxt : $('#pid4'),//预计收益
				preIncome : $('#preIncome'), //预计收益表单项
				totalRate : $('#totalRate'),//基础利率+老板贴息
				deadLine : $('#deadline'),//项目期限
				lowest : $('#lowest'),//最低起投金额
				canInvitation : $('#canInvitation'),//是否可用邀请码加息
				invitationDiv : $('#tt5'),//邀请码加息div
				ticketDiv : $('#tt6'),//投资券div
				userTicket : $('#sid2'),
				canTicket : $('#canTicket'),//是否可用投资券
				//canExchange : $('#canExchange'),
				//proExchangeRate : $('#EXCHANGE_MAX_RATE'),//原始换手气利率
				//btn_getExchange : $('#getExchange'),//换手气加息btn
				//exchangeRate : $('#exchange_rate'),//获得的换手气利率
				//btn_submit : $('.invest5'),//购买
				btn_submit : $('#invest-project'),
				userId : $('#user_id'),
				form : $('form').eq(0),
				userBalance : $('#userBalance')
			},
			message : {
				amonutOverflow : '购买金额不得大于999999',
				underLowest : '最小购买金额需大于',
				notHundred : '购买金额需为100的整数倍',
				inviteCodeInvalid : '您输入的邀请码错误,请重新输入',
				inviteCodeNone : '您输入的邀请码无效,请重新输入(不能输入自己的邀请码)',
				commonCodeUsed : '您已经使用过万能邀请码进行投资，不能重复使用',
				netWorkProblem : '网络出现状况，请稍后再试！',
			}
	}	
	if(objs.elements.canInvitation.val()=='false'){
		objs.elements.invitationDiv.hide();
	}
	if(objs.elements.canTicket.val()=='false'){
		objs.elements.ticketDiv.hide();
	}
	
	objs.elements.amount.keyup(function(){
		//console.log($(this));
		objs.elements.realPay.text($(this).val());
		method.m_refreshAmount();
		
	});
	
	//邀请码加息
	objs.elements.btn_checkInviteCode.on('click',function(){
		var code = objs.elements.inviteCode.val();
		if(!/(\d{6})|(V\d+)/ig.test(code) && code != '88888' && code !=''){
			try{console.log('邀请码输入不合法');}catch(e){}
			objs.elements.inviteRate.val('none');
			objs.elements.invitationRate.val('0.00');
			method.m_refreshAmount();
			method.m_tips(1,objs.elements.inviteCode,objs.message.inviteCodeInvalid);
			$('#tip-tip em').text('');
			$('#tip-tip').hide();
		}else{
			try{console.log('ajax验证邀请码');}catch(e){}
			$.ajax({
				type : 'post',
				url : 'mobile/project/checkCode',
				data : {
					USER_ID : objs.elements.userId.val(),
					CODE : objs.elements.inviteCode.val()
				},
				dataType : 'json',
				success : function(rs){
					console.log(rs);
					if(rs.msg=='none'){
						if(code!=''){
							method.m_tips(1,objs.elements.inviteCode,objs.message.inviteCodeNone);
						}
						objs.elements.inviteRate.val('none');
						objs.elements.invitationRate.val('0.00');
						method.m_refreshAmount();
						$('#tip-tip em').text('');
						$('#tip-tip').hide();
					}else if(rs.msg=='commoncant'){
						method.m_tips(1,objs.elements.inviteCode,objs.message.commonCodeUsed);
						objs.elements.inviteRate.val('none');
						objs.elements.invitationRate.val('0.00');
						method.m_refreshAmount();
						
					}else if(rs.msg=='common'){
						try{console.log('万能码加息，refreshAmount');}catch(e){}
						objs.elements.inviteRate.val(rs.msg);
						objs.elements.invitationRate.val(rs.rate);
						method.m_refreshAmount();
						$('#tip-tip em').text(rs.rate+'%');
						$('#tip-tip').show();
					}else if(rs.msg=='simple'){
						try{console.log('普通码加息，refreshAmount');}catch(e){}
						objs.elements.inviteRate.val(rs.msg);
						objs.elements.invitationRate.val(rs.rate);
						method.m_refreshAmount();
						$('#tip-tip em').text(rs.rate+'%');
						$('#tip-tip').show();
					}else if(rs.msg=='other'){
						try{console.log('别人的VIP码加息，refreshAmount');}catch(e){}
						objs.elements.inviteRate.val(rs.msg);
						objs.elements.invitationRate.val(rs.rate);
						method.m_refreshAmount();
						$('#tip-tip em').text(rs.rate+'%');
						$('#tip-tip').show();
					}else if(rs.msg=='self'){
						try{console.log('自己的VIP码加息，refreshAmount');}catch(e){}
						objs.elements.inviteRate.val(rs.msg);
						objs.elements.invitationRate.val(rs.rate);
						method.m_refreshAmount();
						$('#tip-tip em').text(rs.rate+'%');
						$('#tip-tip').show();
					}else{
						objs.elements.inviteRate.val('none');
						objs.elements.invitationRate.val('0.00');
						method.m_tips(1,objs.elements.inviteCode,objs.message.netWorkProblem);
						$('#tip-tip em').text('');
						$('#tip-tip').hide();
					}
				},
				error : function(){
					objs.elements.inviteRate.val('none');
					objs.elements.invitationRate.val('0.00');
					method.m_tips(1,objs.elements.inviteCode,objs.message.netWorkProblem);
					$('#tip-tip em').text('');
					$('#tip-tip').hide();
				}
			});
		}
	});
	
	
	//投资券
	objs.elements.userTicket.change(function(){
		console.log('ticket change');
		//选的不是默认的option时验证
		if($(this).val() != ''){
			if(method.m_checkTicket()){
				//验证通过
				method.m_refreshAmount();
			}
		}else{
			objs.elements.realPay.text(objs.elements.amount.val() || 0);
		}
	});
	
	
	objs.elements.btn_submit.one('click',function(){
		doBuy();
	});
	
	function doBuy(){
		if(!method.m_checkAmount(objs.elements.amount)){
			console.log('输入不合法');
			objs.elements.btn_submit.one('click',function(){
				doBuy();
			});
			return;
		}
		if(parseFloat(_realPay) > parseFloat($('#userBalance').val())){
			objs.elements.btn_submit.one('click',function(){
				doBuy();
			});
			swal({
					title : '余额不足',
					text : '账户余额不足，请先充值',
					type : 'warning',
					confirmButtonColor: "#ff6264",
					confirmButtonText : '去充值'
				},function(isConfirm){
					if(isConfirm){
						window.location.href='mobile/personal/recharge';
					}
				}
			);
			return;
		}
		try{console.log('合法，提交');}catch(e){}
		objs.elements.form.submit();
	}
	
	var method = {
			methodName : function(name){
				this['m_'+name]();
			},
			
			m_tips : function(position,element,message){
				$(element).tips({
					side : position,
					msg : message,
					bg : '#299BD2',
					time :2,
					color : '#FFF'
				});
			},
			m_checkAmount : function(amount){
				
				if(amount.val().length>6){
					try{console.log('大于6');}catch(e){}
					//$(this).val($(this).val().substr(0,6));
					method.m_tips(1,amount,objs.message.amonutOverflow);
					return false;
				}
				
				if(isNaN(parseFloat(amount.val())) || parseFloat(amount.val()) < objs.elements.lowest.val()){
					
					try{console.log('小于起投金额',amount.val(),objs.elements.lowest.val());}catch(e){}
					method.m_tips(1,amount,objs.message.underLowest+objs.elements.lowest.val());
					return false;
				}
				
				if(amount.val() % 100 != 0){
					try{console.log('不是100正数');}catch(e){}
					method.m_tips(1,amount,objs.message.notHundred);
					return false;
				}
				return true;
			},
			
			m_checkTicket : function(){
				try{console.log('验证投资券');}catch(e){}
				var $userTicket = $('#sid2');
				var $selectedOption = $('#sid2');
				var surplus = $selectedOption.attr('data-surplus');
				var enableAmount = $selectedOption.attr('data-enable');
				var price = $selectedOption.attr('data-price');
				//var $defaultOption = $('#user-ticket option:first-child');
				//console.log('投资券价值：'+price,'最小使用金额'+enableAmount,'剩余天数'+surplus,'selected option'+$selectedOption);
				if(surplus<0){
					this.m_tips(1,$userTicket,'投资券已过期');
					$selectedOption.text('选择投资券').data('surplus','').data('enable','').data('price','');
					$('#coupon_id').val('');
					return false;
				}
				//console.log(enableAmount,objs.elements.amount.val());
				if(parseFloat(enableAmount) > parseFloat(objs.elements.amount.val() || 0)){
					this.m_tips(1,$userTicket,'使用投资券金额为'+enableAmount);
					$selectedOption.text('选择投资券').attr('data-surplus','').attr('data-enable','').attr('data-price','');
					$('#coupon_id').val('');
					method.m_refreshAmount();
					return false;
				}
				return true;
				
			},
			
			
			m_refreshAmount : function(){
				//利率先乘100再除以10000
				
				var ticketAmount = parseFloat($('#sid2').attr('data-price'));
				if(isNaN(ticketAmount)){
					ticketAmount = parseFloat(0);
				}
				var days = objs.elements.deadLine.val();
				//var exchange = parseFloat(objs.elements.exchangeRate.val().substr(0,objs.elements.exchangeRate.val().length-1));
				var inviteRate = parseFloat(objs.elements.invitationRate.val());
				var rateHundred = (parseFloat(objs.elements.totalRate.val())+inviteRate) * 100;
				var income = (objs.elements.amount.val() * rateHundred / 365 * days / 10000).toFixed(2);
				var realPay = parseFloat(objs.elements.amount.val())-ticketAmount;
				try{console.log(realPay)}catch(e){}
				if(isNaN(realPay) || realPay < 0){
					realPay=0;
				}
				objs.elements.incomeTxt.text(income);
				objs.elements.realPay.text(realPay);
				_realPay = realPay;
				$('#TICKET_AMOUNT').val(ticketAmount);
				if(isNaN($('#TICKET_AMOUNT').val())){
					$('#TICKET_AMOUNT').val(0);
				}
				//填入表单项
				objs.elements.preIncome.val(income);
				
			}
	}
	//默认一加载本页就执行以下计算优惠券
	objs.elements.btn_checkInviteCode.trigger("click");
	
});