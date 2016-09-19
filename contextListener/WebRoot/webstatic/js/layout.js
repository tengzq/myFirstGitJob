// JavaScript Document

$(document).ready(function(e) {
	$('footer .botnav li.cen').click(function(){
		$('.laynav').slideToggle();
		})
	$('.mainnav ul li').click(function(){
		$(this).addClass('hover').siblings().removeClass('hover')
		var index=$('.mainnav ul li').index(this);
		$('.toplay .window .wrap').eq(index).show().siblings().hide();
		$('.toplay').fadeIn();

		})

	$('.toplay .btn').click(function(){
		$(this).parent().fadeOut();
		})
	$('.toplay .left a').click(function(){
		$(this).addClass('fa-caret-right').siblings().removeClass('fa-caret-right');
		var index=$('.toplay .left a').index(this);
		$('.toplay .con>div').eq(index).show().siblings().hide();
		
		})
	$('.toplay .con a').click(function(){
		$(this).toggleClass('hover').siblings().removeClass('hover')
		})
	var win=$(window).width();
	var winheight=win/2.5
	$('.banner .bbox .top').css('left',(win-161)/2)
	$('.banner .bbox .leftbtn,.banner .bbox .rightbtn').css('top',(winheight-80)/2)
	
	$('.laynav').css('left',(win-300)/2)
	$(window).resize(function(){
		$('.banner .bbox .top').css('left',(win-161)/2)
		$('.laynav').css('left',(win-300)/2)
		})
	var indexa=0;
	$('.banner .bnav ul li').click(function(){
		indexa=$('.banner .bnav ul li').index(this);
		ban(indexa)
		})
	$('.banner .bbox .leftbtn').click(function(){
		if(indexa>0){
			indexa--
			}else{
				indexa=4
				}
			ban(indexa)	
		})
	$('.banner .bbox .rightbtn').click(function(){
		if(indexa<4){
			indexa++
			}else{
				indexa=0
				}
			ban(indexa)	
		})
	
	function ban(index){
		$('.banner .bbox ul li').eq(index).show().siblings().hide();
		$('.banner .bnav ul li').eq(index).addClass('hover').siblings().removeClass('hover');
		}
	$('.zhoubian .tit').click(function(){
		$(this).find('i').toggleClass('hover')
		$(this).parent().find('.con').toggle();
		})
	
	
});