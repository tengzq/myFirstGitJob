$(function(){
	getMessageList(1,10);
	
	
	$('.p63').on('click','.open-close',function(){
		var _this = $(this);
		console.log(_this);
		var con = _this.parents('dt').siblings('dd');
		if(con.css('display')=='none'){
			con.show();
			_this.siblings('b').remove();
			_this.html('关闭&nbsp;&nbsp;<strong>∧</strong>');
			$.ajax({
				type : 'post',
				url : 'mobile/personal/modifyMsgStatus',
				data : { messageId : _this.parent('h3').siblings('h6').children('a').attr('data-id') , status : 1},
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
	$('.p63').on('click','a.rem',function(){
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
				_this.parent('h6').parent('dt').parent('dl').remove();
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
							example = example.replace(/\$title\$/,v.title+'<b data-id="'+'v.message_id'+'">未读</b>');
						}else{
							example = example.replace(/\$title\$/,v.title);
						}
						example = example.replace(/\$time\$/,v.create_date);
						example = example.replace(/\$desc\$/,v.description+'<a href="javascript:void(0)" data-id="'+v.message_id+'" class="rem"><i class="fa fa-trash-o"></i></a>');
						example = example.replace(/\$content\$/,v.content);
						$('.p63').append(example);
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
		$('.p63 b').remove();
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
		var lh = $('.p63 dl').eq(0).height();
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