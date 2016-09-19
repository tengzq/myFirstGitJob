$(function(){
	$('.progress').each(function(){
		var $_this = $(this);
		var width = parseInt($_this.next('em').text()) / 100 * 128;
		$_this.find('span').width(width)
	});
	
	$(window).scroll(function(){
		if($(window).scrollTop() > 100){
			$('.go-back-top').fadeIn(666);
		}else{
			$('.go-back-top').fadeOut(666);
		}		
	});
	$('.go-back-top').click(function(){
		$('body').animate({scrollTop : 0},500);
		return false;
	});
	$.ajax({
		type:'POST',
		data: {},
		url:'zfarticle/noticelist',
		dataType : 'json',
		async : false,
		success : function(data) {
			var html=''
			for(var i=0;i<data.noticePlist.length;i++){
				html+='<a href="javascript:void(0)"><span class="spid4">'+data.noticePlist[i].TITLE+'</span></a>'
			}
			$('.notice-span').append(html);
			gonggao();
		},
	});
});


function gonggao(){
	var $newsContent = $('.notice-span');
	var $newsItem = $newsContent.find('a');
	var newsCount = $newsItem.length;
	var oneNewsH = $newsItem.height();
	var newsListH = parseInt(newsCount) * parseInt(oneNewsH);
	var $newsList = $newsContent.html();
	$newsContent.append($newsList);
	var index = 1;
	setInterval(function(){
		if (parseInt($newsContent.css('margin-top'))<=-parseInt(newsListH)) {
			$newsContent.css('margin-top',0);
			index=1;
		}
		$newsContent.animate({
			'margin-top':'-' + (40 * parseInt(index)) + 'px'
		},2000);
		index++;
	},4000);
}
