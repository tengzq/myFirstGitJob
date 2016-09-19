// JavaScript Document
$(document).ready(function(e) {
    $('.mainbanner').width($(window).width())
	$('.login .window h5 .fl em,.login .window h4 label em').click(function(){
		$(this).toggleClass('hover')
		})
	$('.login .window h4 label em').click(function(){
		$(this).addClass('hover');
		$(this).parent().siblings().find('em').removeClass('hover')
		})
});