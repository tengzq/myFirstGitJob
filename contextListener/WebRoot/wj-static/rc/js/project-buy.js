$(function(){
	refreshIncome();
	/*$('#buy-now').on('click',function(){
		$(this).attr('disabled','disabled');
	});*/
	$buy_form.on('submit',function(e){
		$('#buy-now').attr('disabled','disabled').text('正在提交').css({'background':'#909090'});
	});
	
	hideHeader();
	/*$('.top-area').hover(function(){
		showHeader();
	},function(){
		hideHeader();
	});*/
	$(document).mousemove(function(e){
		var mx = e.pageX;
		var my = e.pageY;
		var distance = calculateDistance($('.top-area'), mx, my);
		if(distance < 70){
			showHeader();
			$('.top-area').css({position : 'static',width:'100%'});
		}else{
			hideHeader();
			$('.top-area').css({position : 'fixed',width:'100%'});
		}
	});
});

var $at = $('#amount'), //用户输入的投资金额
	na = parseInt($('#now-amount').val(), 10), //实际支付金额
	$income = $('#income'),//预计收益
	surplus = parseInt($('#prj-surplus').val(), 10) / 100, //项目剩余金额
	$invest_amt = $('.invest_amt'),//实际支付金额
	$ticket_amount = $('#ticket-amount'),
	$buy_form = $('#buy_form'),//确认购买 form
	$recharge_form = $('#recharge_form'),//充值form
	rp = $('#realpay'),//用户账户
	rps = $('#realpay-show'),//缺少金额
	$btn_buy_now = $('.btn_buy_now'),//立即购买按钮
	$btn_recharge = $('.btn_recharge'),//立即充值按钮
	$btn_exchange_rate = $('.btn_exchange_rate'),//换手气按钮
	$invation_code_rate = $('.invation_code_rate'),//获取邀请码按钮
	sTime   = new Date($('#stime').val().replace(/\-/g, '/')).getTime(),//项目开始时间
	eTime   = new Date($('#etime').val().replace(/\-/g, '/')).getTime(),//项目结束时间
	rate    = parseFloat($('#rate').val()),//总利率
	deadline = parseInt($('#deadline').val()),//项目周期
	repayType = $('#repay-type').val(),//方式
	submitLock = false,
	BALANCE = $('#userBalance').val();



/**
 * 刷新预计收益
 */
function refreshIncome(){
	var a=$("#ticketLv").val();
	rate    = parseFloat($('#rate').val())+parseFloat(a);
	var ic = parseFloat($at.val()) * parseFloat(rate/100) / 365 *  deadline;
	$income.text(ic.toFixed(2)+"元");
	$("#fanlijine").attr("value",ic.toFixed(2));
	$("#zonglilv").attr("value",rate);
}
/**
 * 隐藏顶部
 */
function selectOn(){
	var b=$('#rate').val();
	var b1=$("select option:selected").attr("value");
	var a=parseFloat(b)+parseFloat(b1);
	$('#rate').attr("value",a);
	refreshIncome();
}
function hideHeader(){
	//停止现有动画
	$('.top-area').stop();
	$('.top-area').animate({
		top:'-124px'
	},333);
}
/**
 * 显示顶部
 */
function showHeader(){
	//停止现有动画
	$('.top-area').stop();
	$('.top-area').animate({
		top:'0'
	},333);
	
}
/**
 * 计算鼠标指针距离elem元素的距离
 * @param elem 对比的元素
 * @param mouseX 鼠标当前X坐标
 * @param mouseY 鼠标当前Y坐标
 * @returns
 */

function calculateDistance(elem, mouseX, mouseY) {
    return Math.floor(Math.sqrt(0 + Math.pow(mouseY - (elem.offset().top+(elem.height()/2)), 2)));
}