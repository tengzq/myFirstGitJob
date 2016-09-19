$(document).ready(function(){
	
	
	var result,
		$orderId = $('#orderId'),
		$title = $('.callback-title'),
		$responseBody = $('.response-body'),
		$responseImg = $('.response-body img'),
		$responseText = $('.response-body p');
	
	checkOrder($orderId.val());
	var interval=setInterval(countdown,1000);
	
	function countdown(){
		
		if(result=='success'){
			$title.hide();
			$responseImg.attr('src','wj-static/images/success_icon.png');
			$responseText.text('充值成功');
			$responseBody.show();
			clearInterval(interval);
		}
		
		var $countdown = $('.countdown');
		var number = parseInt($countdown.text());
		if(number==0){
			//console.log('倒计时结束');
			clearInterval(interval);
			$title.hide();
			$responseImg.attr('src','wj-static/images/fail_icon.png');
			$responseText.text('充值失败，请稍后查询充值记录或重新充值');
			$responseBody.show();
			return;
		}
		if(number%2==0){
			checkOrder($orderId.val());
		}
		$countdown.text(number-1);
	}
	
	function checkOrder(orderId){
		$.ajax({
			type : 'post',
			url : 'recharge/checkRechargeOrder',
			data : {orderId:orderId},
			dataType : 'json',
			success : function(rs){
				if(rs.msg=='success'){
					result = 'success';
				}else{
					result = 'notyet'
				}
			}
		});
	}
});