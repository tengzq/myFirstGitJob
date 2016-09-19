$(function(){
	getMessageList(1,10);
	
	
	$('.content-child').on('click','.user-hint-show',function(){
		var _this = $(this);
		var con = _this.siblings('div.user-hint-con');
		if(con.css('display')=='none'){
			con.show();
			_this.parent('dd').siblings('dt').children('span').remove();
			_this.html('关闭&nbsp;&nbsp;<strong>∧</strong>');
			$.ajax({
				type : 'post',
				url : 'mobile/personal/modifyMsgStatus',
				data : { messageId : _this.siblings('div.user-hint-intro').children('a').attr('data-id') , status : 1},
				dataType : 'json',
				success : function(rs){
					console.log(rs.msg);
				}
			});
		}else{
			con.hide();
			_this.html('展开&nbsp;&nbsp;<strong>∨</strong>');
		}	
	});
	
	
	//删除消息
	$('.content-child').on('click','.user-hint-intro a',function(){
		var _this = $(this);
		swal({
			title : '',
			text : '确认删除该条信息',
			type : 'error',
			showCancelButton : true,
			confirmButtonColor: '#DD6B55',
			confirmButtonText : '删除',
			cancelButtonText : '取消'
		},function(isConfirm){
			if(isConfirm){
				//先删除元素，再ajax删除数
				_this.parent('div').parent('dd').parent('dl').remove();
				$.ajax({
					type : 'post',
					url : 'mobile/personal/delUserMsg',
					data : { messageId : _this.attr('data-id')},
					dataType : 'json',
					success : function(rs){
						
					}
				});
			}
		});
	});
	
	var currentPage = 1;
	var totalPage = 1;
	
	function getMessageList(currentPage,showCount){
		$.ajax({
			type : 'post',
			url : 'mobile/personal/messageAjax',
			data : {currentPage : currentPage,showCount : showCount,status : $('#tabs').attr('data-status')},
			dataType : 'json',
			success : function(rs){
				if(rs.msg=='success' && rs.msgList.length > 0){
					
					$.each(rs.msgList,function(k,v){
						var example = $('#msgExample').html();
						
						if(v.status==0){
							example = example.replace(/\$title\$/,v.title+'<span>未读</span>');
						}else{
							example = example.replace(/\$title\$/,v.title);
						}
						example = example.replace(/\$time\$/,v.create_date);
						example = example.replace(/\$desc\$/,v.description+'<a href="javascript:void(0)" data-id="'+v.message_id+'"><i class="fa fa-trash-o"></i></a>');
						example = example.replace(/\$content\$/,v.content);
						$('.content-child').append(example);
					});
				}
				if(rs.msg != 'success' || rs.msgList.length == 0){
					$('.no-ticket-tag').show();
				}
				totalPage = rs.page.totalPage;
				currentPage = rs.page.currentPage;
			}
		});
	}
	
	$('.yidutips').on('click',function(){
		$('.content-child dt span').remove();
		$.ajax({
			type : 'post',
			url : 'mobile/personal/modifyMsgStatus',
			data : { status : 1},
			dataType : 'json',
			success : function(rs){
				
			}
		});
	});
	
	
	$('.del-all-read').on('click',function(){
		swal({
			title : '',
			text : '确认删除所有信息',
			type : 'error',
			showCancelButton : true,
			confirmButtonColor: '#DD6B55',
			confirmButtonText : '删除',
			cancelButtonText : '取消'
		},function(isConfirm){
			if(isConfirm){
				//先删除元素，再ajax删除数
				$.ajax({
					type : 'post',
					url : 'mobile/personal/delUserMsg',
					data : {},
					dataType : 'json',
					success : function(rs){
						if(rs.msg == 'success'){
							location.reload();
						}
					}
				});
			}
		});
	});
	
	
	$(window.document).scroll(function(){
		var h = $(document).height();
		var wh = $(window).height();
		var sh = $(window.document).scrollTop();
		var lh = $('.content-child dl').eq(0).height();
		if(h-lh<=wh+sh){
			//console.log(currentPage,pCount,currentPage < pCount);
			
			if(currentPage < totalPage){
				$('#waiting').height(lh);
				$('#watting').show();
				currentPage = currentPage + 1;
				//加载数据
				getMessageList(currentPage,10);
				$('#watting').hide();
			}else{
				$('#waiting img').hide();
			}
			
		}
	});
	
})