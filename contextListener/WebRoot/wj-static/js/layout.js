// JavaScript Document
$(document).ready(function(e) {
	$('body').append('<a style="position:fixed;width:123px;height:135px;bottom:200px;right:20px;background:url(&#39;wj-static/images/maodian.png&#39;) center top /cover no-repeat;cursor:pointer;" href="myAccount/userinvite" target="_blank"></a>');
	
	
	//var width=$(".MB1 .window .pic a").width();
	//setpic(width,'.MB1 .window .pic a','.MB1 .window .pic','.MB1 .bottom ul li','.MB1 .leftBTN','.MB1 .rightBTN',3000,1000)	//home主轮播图	

	$('#tools-a').hover(function(){
		$(this).addClass('tools-hover').css('background','#EB9641').find('i').css('display','none').siblings('span').css('display','block');
		$('#tools-div').css('display','block');
	},function(){
		$(this).removeClass('tools-hover');
		
		setTimeout(function(){
			if($('.tools-hover').length > 0){
				return
			}
			$('#tools-div').css('display','none');
			$('#tools-a').css('background','#C3C3C3').find('i').css({'display':'inline-block','height':'100%'}).siblings('span').css('display','none');
		},600);
	});
	$('#tools-b').hover(function(){
		$(this).addClass('tools-hover').css({'background':'#EB9641'}).find('i').css('display','none').siblings('span').css('display','inline-block');
	},function(){
		$(this).removeClass('tools-hover').css({'background':'#C3C3C3'}).find('i').css('display','inline-block').siblings('span').css('display','none');
		setTimeout(function(){
			if($('.tools-hover').length > 0){
				return;
			}
			$('#tools-div').css('display','none');
			$('#tools-a').css('background','#C3C3C3').find('i').css({'display':'inline-block','height':'100%'}).siblings('span').css('display','none');
		},600);
	});
	$('#tools-c').hover(function(){
		$(this).addClass('tools-hover').css({'background':'#EB9641'}).find('i').css('display','none').siblings('span').css('display','block');
		
	},function(){
		$(this).removeClass('tools-hover').css({'background':'#C3C3C3'}).find('i').css('display','inline-block').siblings('span').css('display','none');
		setTimeout(function(){
			if($('.tools-hover').length > 0){
				return;
			}
			$('#tools-div').css('display','none');
			$('#tools-a').css('background','#C3C3C3').find('i').css({'display':'inline-block','height':'100%'}).siblings('span').css('display','none');
		},600);
	});
	$('#tools-d').hover(function(){
		$(this).addClass('tools-hover').css({'background':'#EB9641'}).find('i').css('display','none').siblings('span').css('display','block');
		
	},function(){
		$(this).removeClass('tools-hover').css({'background':'#C3C3C3'}).find('i').css('display','inline-block').siblings('span').css('display','none');
		setTimeout(function(){
			if($('.tools-hover').length > 0){
				return;
			}
			$('#tools-div').css('display','none');
			$('#tools-a').css('background','#C3C3C3').find('i').css({'display':'inline-block','height':'100%'}).siblings('span').css('display','none');
		},600);
	});
	/*.mouseleave(function(){
		setTimeout(function(){
			if($('#tools-b').is('hover') || $('#tools-c').is('hover') || $('#tools-a').is('hover')){
				return;
			}
			$('#tools-div').css('display','none');	
		},1000)
	})*/

	
});


//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPath=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    //console.log('绝对路径为：'+localhostPath+projectName);
    //如果部署路径为tomcat根路径，即localhost:8080即可访问项目，则直接返回localhostPath即可，
    //如部署路径为localhost:8080/MZ形式，则需要加上projectName
    return(localhostPath+projectName);
}

/*    */