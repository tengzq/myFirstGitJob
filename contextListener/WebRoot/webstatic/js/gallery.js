// JavaScript Document

$(function(){
	var gallery = $('.swiper-container').swiper({
		slidesPerView:'auto',
		watchActiveIndex: true,
		centeredSlides: true,
		pagination:'.pagination',
		paginationClickable: true,
		resizeReInit: true,
		keyboardControl: true,
		grabCursor: true,
		onImagesReady: function(){
			changeSize()
		}
	})
	function changeSize() {
		//Unset Width
		$('.swiper-slide').css('width','')
		//Get Size
		var imgWidth = $(window).width();
		$('.swiper-slide img').width(imgWidth)

		if (imgWidth>$(window).width()) imgWidth = $(window).width();
		//Set Width
		$('.swiper-slide').css('width', imgWidth);
		$('.swiper-wrapper').css('padding-left',0)
		$('.swiper-wrapper').css('padding-right',0)


        
	}
	$('.mainbanner').height($(window).width()/2.37)

	changeSize()
	gallery.resizeFix(true)	

	//Smart resize
	$(window).resize(function(){
		changeSize()
		gallery.resizeFix(true)	
	})
})
	$(document).ready(function(e) {
        $('.swiper-container').height($(window).width()/2.37)
		$('.mainbanner').height($(window).width()/2.37)

		$(window).resize(function(){
			$('.swiper-container').height($(window).width()/2.16)
			$('.mainbanner').height($(window).width()/2.37)
			})
    });
