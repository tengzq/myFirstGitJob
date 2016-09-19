$(function(){
	var objs = {
			elements : {
				loginName : $('#login_name'),
				loginPwd : $('#login_pwd'),
				doLoginBtn : $('#loginBtn'),
			}
	}
	
	function test() {
		if(objs.elements.loginName.val()==''){
			//$(".login-tips").css("display","block");
			//$(".err").text("用户名不能为空");
			tips(2,objs.elements.loginName,'用户名不能为空')
			return;
		}
		$.post("register/checkUserNameByAJAX",{USERNAME:objs.elements.loginName.val()},function(data){
			if(data.msg==false){
				//$(".login-tips").css("display","block");
				//$(".err").text("用户名不存在");	
				tips(2,$('#loginname'),'用户名不存在')
			}
		},"json");

	}
	
	objs.elements.doLoginBtn.on('click',function(){
		if (check()) {
			var loginname = objs.elements.loginName.val();
			var callback = $("#callback").val();
			var password = loginname + ",fh," + objs.elements.loginPwd.val();
			$.post("mobile/doLogin",{KEYDATA : password,callback:callback},
				function(data) {
					console.log(data);
					if (data.result == "success") {
						top.location.href = "mobile/main";
					}else if (data.result == "usererror") {
						//$(".login-tips").css('display','block');
						//$(".err").text("用户名或密码错误，今天还可输入"+ (10 - data.temp)+"次");
						tips(1,objs.elements.doLoginBtn,'用户名或密码错误，还有'+ (5 - data.temp)+'次机会。');
					}else if (data.result == "error") {
						//$(".login-tips").css('display','block');
						//$(".err").text("用户名已鎖定请联系管理员");
						tips(1,objs.elements.doLoginBtn,'用户名已锁定请联系管理员');
					}else if (data.result == "fail"){
						tips(1,objs.elements.doLoginBtn,'用户名或密码错误');
					}else if(data.result=='bindcard'){
						console.log(data.result);
						window.location.href ='mobile/personal/addBind';
					}else if(data.result=='realname'){
						console.log(data.result);
						window.location.href ='mobile/personal/authRealname';
					}else{
						console.log(data.result);
						window.location.href =data.result;
					}
					
				}, "json");
		}	
	});
	
	function check() {
		if ($("#loginname").val() == "") {
			//$(".login-tips").css("display","block");
			//$(".err").text("用户名不能为空");
			tips(2,$('#loginname'),'用户名不能为空')
			return false;
		}

		if ($("#password").val() == "") {
			/* $(".login-tips").css("display","block");
			$(".err").text("密码不能为空"); */

			return false;
		}

		
		return true;
	}
	
	function tips(position,element,message){
		$(element).tips({
			side : position,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
});