// JavaScript Document

$(document).ready(function() {
	$('.cf_drawer dl').click(function(){
		$(this).toggleClass('hover').siblings().removeClass('hover')
		})
	$('.cf_list .cf_tit ul li').click(function(){
		$(this).addClass('hover').siblings().removeClass('hover')
		$('.cf_list .cf_con .cf_box').eq($('.cf_list .cf_tit ul li').index(this)).show().siblings().hide();
		})
	$('.cf_layer .cf_close').click(function(){
		$(this).parents('.cf_layer ').hide();
		})
});

	
	
	
	
	
	
	
