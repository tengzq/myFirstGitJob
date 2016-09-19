

$(document).ready(function(){
	
	
	var result,
		$orderId = $('#orderId'),
		$title = $('.callback-title'),
		$responseBody = $('.resultbody'),
		$responseImg = $('.resultbody img'),
		$responseText = $('.resultbody p').eq(0);
	
	checkOrder($orderId.val());
	var interval=setInterval(countdown,1000);
	
	function countdown(){
		
		if(result=='success'){
			$title.hide();
			$responseImg.attr('src','wj-mobile-static/images/project_buy_success.png');
			$responseText.text('充值成功');
			$responseBody.show();
			clearInterval(interval);
		}
		
		var $countdown = $('.countdown');
		var number = parseInt($countdown.text());
		if(number==0){
			console.log('倒计时结束');
			clearInterval(interval);
			$title.hide();
			$responseImg.attr('src','wj-mobile-static/images/project_buy_fail.png');
			$responseText.html('充值失败<br>请稍后查询充值记录或重新充值');
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
			url : 'mobile/recharge/checkRechargeOrder',
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