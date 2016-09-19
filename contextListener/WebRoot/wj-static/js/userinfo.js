$(function(){
	//验证邮箱点击事件
	$('#valimail').one('click',function(){
		yanzheng();
	});
});


function yanzheng(){
    	//验证邮箱是否合法
	var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(!reg.test($("#EMAIL").val())){
		$("#emlabel").text("格式错误");
		$('#valimail').one('click',function(){
			yanzheng();
		});
		return false;
	}
	//修改邮箱时，是否与原邮箱相同
	
	if($("#EMAIL").val()==$('#oldMail').val()){
		$("#emlabel").text("和原邮箱相同");
		$('#valimail').one('click',function(){
			yanzheng();
		});
		return false;
	}
	
	var userId=$('#currentUserid').val();
	$.post("register/checkerMail",{EAILL:$("#EMAIL").val(),USER_ID:userId,username : $('#currentUsername').val()},function(data){
		swal({   
			title: "<small>完成邮箱认证</small>!",   
			//text: $('#sweetAlertMsg').html(),  
			text : '<style>'+
				'.sweetAlertMsg{text-align: left;font-family: "微软雅黑",verdana,sans-serif;}'+
				'.sweetAlertMsg > p span{font-weight: bolder;color: #E34548;}'+
				'.sweetAlertMsg .btn a{display: block;height: 40px;width: 200px;margin: 10px auto;background-color:#E34548;color:#FFF;text-align: center;line-height: 40px;}'+
				'.sweetAlertMsg ul li{text-align: center;line-height: 25px;}'+
				'.sweetAlertMsg li a{}'+
			'</style>'+
			'<section class="sweetAlertMsg">'+
				'<p>我们已经发送了一封邮件至<span>'+$('#EMAIL').val()+'</span>，请查阅邮箱，并点击链接激活账号。</p>'+
				'<div class="btn"><a href="javascript:swal.close();">我已验证</a></div>'+
				'<ul>'+
					'<li>1.未收到验证邮件？<em id="60sec">60秒后</em><a href="javascript:void(0);" id="sendAgn">重新发送</a></li>'+
					'<li>2.请检查是否邮件被移至垃圾箱中。</li>'+
				'</ul>'+
			'</section>',
			type: "success",
			showConfirmButton: false,
			html: true 
		});
		interval = setInterval(function(){
			mailCountdown();
		},1000);
	});
}
function genggai(){
	var listHtml='';
	listHtml+='<span>邮箱：</span>';
	listHtml+='<input id="EMAIL" type="text" value="" style="height:22px">';
	listHtml+='<button type="button"  class="mailbtn" onclick="yanzheng();">确认更改</button>';
	listHtml+='<span id="emlabel" style="color:red"></span>';
	$('#mail').html('').html(listHtml);
}
var interval;
var count = 60;
function mailCountdown(){
	if(count == 0){
		clearInterval(interval);
		$('#60sec').text('');
		$('#sendAgn').one('click',function(){
			yanzheng();
		});
		$('#valimail').one('click',function(){
			yanzheng();
		});
		count = 60;
	}else{
		$('#60sec').text(count+'秒后');
		count--;
	}
}