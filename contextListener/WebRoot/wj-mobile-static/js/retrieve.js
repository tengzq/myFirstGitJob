$(function(){
	
	$('#pass').on('blur',function(){
		checkPsw();
	});
	$('#pass2').on('blur',function(){
		checkRepeat();
	});
	
	$('#subbtn').one('click',function(){
		modifyPsw();
	});
	
	
	function modifyPsw(){
		if(!checkPsw() || !checkRepeat()){
			$('#subbtn').one('click',function(){
				modifyPsw();
			});
			return;
		}
		$.post("mobile/resetPsw",{USER_ID:$('#subbtn').attr('data-random'),PASSWORD:$.trim($('#pass').val())},function(data){
			if(data.msg=='success'){
				swal({
					title : "改密成功",
					type : "success",
					showCancelButton : true,
					confirmButtonColor : "#2e9dd0",
					confirmButtonText : "登入",
					cancelButtonText : "首页",
					closeOnConfirm : false,
					closeOnCancel : false
				},
				function(isConfirm) {
					if (isConfirm) {
						window.location.href="mobile/login";
					} else {
						window.location.href="mobile/main";
					}
				})
					
			}else if(data.msg=='fail'){
				swal({title:"失败",text : "网络异常，请稍后再试", type :"error"},function(isConfirm){
					location.href="mobile/forget";
				});
			}else if(data,msg == false){
				swal({title :"失败", text:"抱歉无此用户", type:"error"},function(isConfirm){
					location.href="mobile/forget";
				});
			}
		},"json");
	}
	
	function checkPsw(){
		if($('#pass').val()==''){
			tips(1,$('#pass'),'密码不能为空');
			return false;
		}
		if($('#pass').val().length < 8){
			tips(1,$('#pass'),'密码长度需大于等于8位');
			return false;
		}
		return true;
	}
	
	function checkRepeat(){
		if($('#pass2').val()!=$('#pass').val()){
			tips(1,$('#pass2'),'两次密码输入不一致');
			return false;
		}
		return true;
	}
	
	
	function tips(posi,element,message){
		$(element).tips({
			side : posi,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
	
});