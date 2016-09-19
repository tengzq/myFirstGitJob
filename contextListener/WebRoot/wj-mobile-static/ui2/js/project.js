$(function(){
	var objs = {
			elements : {
				body : $('body'),
				droplist : $('.td'),
				
			}
	}
	//var cPage = 1;
	var currentPage = 1;
	getProjectList(currentPage,6);
	//上下滑动
	
	$(window.document).scroll(function(){
		var h = $(document).height();
		var wh = $(window).height();
		var sh = $(window.document).scrollTop();
		var lh = $('.tb').eq(0).height();
		if(h-lh<=wh+sh){
			
			if(currentPage < pCount){
				$('#waiting').height(lh);
				currentPage = currentPage + 1;
				//加载数据
				getProjectList(currentPage,5);
				$('#waiting').height(0);
			}else{
				$('#waiting').css('display','none');
			}
			
		}
	});
	
	
	
});
var pCount=1;

function getProjectList(curPage,showCount){
	//console.log(curPage,pCount,'准备执行ajax');
	if(curPage<=pCount){
		$('#waiting').css('display','block');
		$.ajax({
			type : 'post',
			url : 'mobile/project/listAjax?currentPage='+curPage+'&showCount='+showCount,
			data : {
				currentPage : curPage,
				showCount : showCount
			},
			dataType : 'json',
			success : function(result){
				//console.log(result);
				if(result.msg=='success'){
					$('#INVITE_CODE').val(result.user);
					weShare();
					//console.log('页数为：',result.page.totalPage);
					pCount = result.page.totalPage;
					$.each(result.projectList,function(key,val){
						var html = '<div class="caption cpx">';
						html += '<a href=mobile/project/detail?ID='+val.ID+'><p id="xmxm">'+val.PROJECT_NAME+'</p></a>';
						html += '<div class="cpxm"><div class="bili xm0 clearfix">';
						html += '<span id="zi_1">'+val.BASE_INTEREST_RATE;
						if( 0 < val.BOSS_INTEREST_RATE){
							html += '<div class="xmllow"><span id="llow">'+parseFloat(val.BOSS_INTEREST_RATE).toFixed(2)+'%</span></div>';
						}
						html += '</span><span id="zi_2">%</span>';
						html += '</div><div class="xm1">';
						html += '<p>项目期限: '+val.DEADLINE+'天<p>';
						html += '<p>剩余金额: '+(val.SURPLUS_RAISE_AMOUNT/10000)+'万元<p>';
						html += '</div><div class="xm2">';
						if(val.SURPLUS_RAISE_AMOUNT > 0){
							html += '<p id="ppxm" class="clearfix"><a href=mobile/project/buy?ID='+val.ID+' class="btnx">马上投资</a></p>'
						}else{
							html += '<p id="ppxm" class="clearfix"><a href=mobile/project/detail?ID='+val.ID+' class="btnx" style="background:#909090;color:#fff;border:2px solid #909090;">已卖光</a></p>'
						};
						html += '</div><div class="clearfix"></div></div><div class="clearfix"></div></div>';
						$('.list-body').append(html);
					});
					$('#waiting').css('display','none');
				}
			}
		})
		.fail(function(){
			$('#waiting').css('display','none');
		});
	}	
}

function weShare(){
	var path=location.href.split('#')[0];
	$.ajax({
		url:'mobile/personal/weixinShare',
		type:'post',
		data:{PATH:path},
		async:false,
		dataType:'json',
		success:function(data){
			wx.config({
			debug : false,
			appId : data.appId,
			timestamp : data.timestamp,
			nonceStr : data.nonceStr,
			signature : data.signature,
			jsApiList : [ 'checkJsApi', 'onMenuShareTimeline',
					'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo',
					'hideMenuItems', 'showMenuItems', 'hideAllNonBaseMenuItem',
					'showAllNonBaseMenuItem', 'translateVoice', 'startRecord',
					'stopRecord', 'onRecordEnd', 'playVoice', 'pauseVoice',
					'stopVoice', 'uploadVoice', 'downloadVoice', 'chooseImage',
					'previewImage', 'uploadImage', 'downloadImage',
					'getNetworkType', 'openLocation', 'getLocation',
					'hideOptionMenu', 'showOptionMenu', 'closeWindow',
					'scanQRCode', 'chooseWXPay', 'openProductSpecificView',
					'addCard', 'chooseCard', 'openCard' ]
				
		});
		}
	});
	var url='';
	if($('#INVITE_CODE').val()==''||$('#INVITE_CODE').val()==null){
		url='http://m.wanjinxiansheng.com/mobile/share';
	}else{
		url='http://m.wanjinxiansheng.com/mobile/share?INVITE_ME='+$('#INVITE_CODE').val();
		}
	wx.ready(function () {
	    wx.onMenuShareTimeline({
	      title: '万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。',
	      link: url,
	      imgUrl: 'http://m.wanjinxiansheng.com/wj-mobile-static/images/logo_03.png',
	      trigger: function (res) {
	        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
	        //alert('用户点击分享到朋友圈');
	      },
	      success: function (res) {
	        
	      },
	      cancel: function (res) {
	        
	      },
	      fail: function (res) {
	        alert("分享失败!");
	      }
	    });
	    wx.onMenuShareAppMessage({
			title: '万金先生 - 会理财，好先生', // 分享标题
		    desc: '国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。', // 分享描述
		    link: url, // 分享链接
		    imgUrl: 'm://www.wanjinxiansheng.com/wj-mobile-static/images/logo_03.png', // 分享图标
		    success: function () { 
		        // 用户确认分享后执行的回调函数
		    },
		    cancel: function () { 
		        // 用户取消分享后执行的回调函数
		    }
	    });
	});
}


