$(function(){
	//刷新进度条
	progress();
	//刷新预计收益
	refreshIncome();
	//投资金额变动刷新收益
	$('#amount').on('change',function(){
		refreshIncome();
	});
	//提交前验证
	$('#buy-form').on('submit',function(e){
		if(!refreshIncome()){
			e.preventDefault();
		}
	});
	$('.lrb_b nav ul li').click(function(){
		var $this = $(this);
		$this.addClass('on').siblings('li').removeClass('on');
		$('.lrb_b .con').eq($this.index()).show().siblings('.con').hide();
	});
});

var prjSurplus = parseInt($('#prj-surplus').val()),//项目剩余金额
	$amount = $('#amount'),//输入的投资金额
	$income = $('#income'),//预计收入
	investStep = parseInt($('#invest-step').val()),
	days    = parseInt($('#days').val(), 10),//项目期限--天
	rate    = parseFloat($('#rate').val()),//平台基准利率
	bossRate = parseFloat($('#boss-rate').val()||0),//老板补贴
	totalRate = rate,//总利率
	repayType = $('#repay-type').val(),//还款方式
	sTime   = new Date($('#stime').val().replace(/\-/g, '/')).getTime(),//项目开始时间
	eTime   = new Date($('#etime').val().replace(/\-/g, '/')).getTime(),//项目结束时间
	$profitAmount = $('em.profit');
	

/**
 * 计算收益
 * @returns Boolean
 */
function refreshIncome(){
	$('.tips-area').text("").css('display','none');
	if($amount.val()=='' || isNaN(parseInt($amount.val())) || $amount.val()%investStep != 0){
		$('.tips-area').text("投资金额输入有误，请输入"+investStep+"的整数倍").css('display','block');
		return false;
	}
	if(parseInt($amount.val()) > prjSurplus){
		$('.tips-area').text("投资金额需小于等于项目剩余金额").css('display','block');
		return false;
	}
	var profitAmount = parseFloat($amount.val()) *  totalRate / 100 / 365 * days;
	$profitAmount.text(profitAmount.toFixed(2) + '元')
	return true;
}

/**
 * 计算项目进度条宽度
 */

function progress(){
	//计算项目进度条的宽度
	var progress = $('.lrb_r .wrap .bar b').text();
	progress = progress.substring(0,progress.length-1);
	var progressWidth = parseInt(progress) / 100 * 280;
	$('.lrb_r .wrap .bar .box p').width(progressWidth);
}