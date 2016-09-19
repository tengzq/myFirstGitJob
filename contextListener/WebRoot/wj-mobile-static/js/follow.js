function isWechat() {  
  var ua = navigator.userAgent.toLowerCase();
  return /micromessenger/i.test(ua) || /windows phone/i.test(ua);
}
$(function(){
	var $concernedMask = $('.concerned-mask'),
		$concernedBtn = $('.concerned-btn'),
		$concernedClose = $('.concerned-close');
	isWechat()?$('.msg',$concernedMask).html('长按二维码点击“识别图中的二维码”即可关注'):$('.msg',$concernedMask).html('保存二维码，使用微信扫一扫识别图片中二维码即可关注');
	$concernedBtn.on('click',function(){
		$(this).hide();
		$concernedMask.show();
	});
	$concernedClose.on('click',function(){
		$concernedMask.hide();
		$concernedBtn.show();
	});
});