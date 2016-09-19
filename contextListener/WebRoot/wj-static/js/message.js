$(function(){
	//加载10条记录
	getMessageList(1,10);
	//展开关闭消息
	$('.user-box-con-1.user-hint').on('click','.user-hint-show',function(){
		var _this = $(this);
		var con = _this.siblings('div.user-hint-con');
		if(con.css('display')=='none'){
			con.show();
			_this.parent('dd').siblings('dt').children('span').remove();
			_this.html('关闭&nbsp;&nbsp;<strong>∧</strong>');
			$.ajax({
				type : 'post',
				url : 'myAccount/modifyMsgStatus',
				data : { messageId : _this.siblings('div.user-hint-intro').children('a').attr('data-id') , status : 1},
				dataType : 'json',
				success : function(rs){
					//console.log(rs.msg);
				}
			});
		}else{
			con.hide();
			_this.html('展开&nbsp;&nbsp;<strong>∨</strong>');
		}		
	})
	//删除消息
	$('.user-box-con-1.user-hint').on('click','.user-hint-intro a',function(){
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
					url : 'myAccount/delUserMsg',
					data : { messageId : _this.attr('data-id')},
					dataType : 'json',
					success : function(rs){
						
					}
				});
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
					url : 'myAccount/delUserMsg',
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
	
	
	$('.yidutips').on('click',function(){
		$('.user-box-con-1 dt span').remove();
		$.ajax({
			type : 'post',
			url : 'myAccount/modifyMsgStatus',
			data : { status : 1},
			dataType : 'json',
			success : function(rs){
				
			}
		});
	});
	
	
	function getMessageList(currentPage,showCount){
		$.ajax({
			type : 'post',
			url : 'myAccount/messageAjax',
			data : {currentPage : currentPage,showCount : showCount,status : $('#tabs').attr('data-status')},
			dataType : 'json',
			success : function(rs){
				if(rs.msg=='success' && rs.msgList.length > 0){
					$('.user-box-con-1.user-hint').html('');
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
						$('.user-box-con-1.user-hint').append(example);
					});
				}
				if(rs.msg != 'success' || rs.msgList==null || rs.msgList.length == 0){
					$('.no-message').show();
				}
				kkpager.generPageHtml({
					pno : rs.page.currentPage || 1,
					//总页码
					total : rs.page.totalPage || 1,
					//总数据条数
					totalRecords : rs.page.totalResult || 0,
					mode : 'click',//默认值是link，可选link或者click
					click : function(n){
						// do something
						getMessageList(n,10);
						//手动选中按钮
						this.selectPage(n);
						return false;
					}
					
				});
				//console.log(rs.page);
			}
		});
	}
})