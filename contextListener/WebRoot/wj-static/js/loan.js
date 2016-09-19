$(function(){
	var setting = {
			elements : {
					loanForm : $('#loanForm'),
					name : $('#name'),
					tel : $('#tel'),
					sex : $('#sex-li input[name=sex]:checked'),
					age : $('#age'),
					customtype : $('#client_sort'),
					worktime : $('#worktime'),
					city : $('#city'),
					livetime : $('#residence_time'),
					salary : $('#monthly_pay'),
					body : $('body'),
					atag : $('.main>ul>li>a'),
					anthor0 : $('#anchor1'),
					anthor1 : $('#anchor2'),
					anthor2 : $('#anchor3'),
					anthor3 : $('#anchor4'),
					banner : $('.jiekuan-banner'),
					loanTab : $('.loan-tab'),
					loanTabA : $('.loan-tab a'),
					subbtn : $('#subbtn'),
					btnlayout : $('.btn-layout'),
					mainLayer : $('.jiekuan-banner .main .layer'),
					mainResp : $('.jiekuan-banner .main .resp'),
					countdown : $('.countdown'),
			},
			messages : {
					nameWrong : '请输入合法用户名',
					telFormat : '请输入正确格式的手机号',
					ageTooLong : '请输入合法年龄',
					ageWrong : '请输入数字年龄',
					chooseCustType : '请选择客户类型',
					chooseWorkTime : '请选择工作时间',
					entryCity : '请输入城市',
					chooseLiveTime : '请选择居住时间',
					chooseSalary : '请选择税后薪资'
			},
			custom : {
				check : ['name','tel','age','worktime','city','salary'],
				ajaxUrl : 'register/doApply',
			}
	}
	/* a标签点击事件 */
	setting.elements.atag.on('click',function(e,index){
		$(this).parent().siblings().find('a').removeClass('hover');
		$(this).addClass('hover');
		var scrollBottom = $(window).scrollTop()-setting.elements.banner.height();
		var index=setting.elements.atag.index($(this))+1;
		////console.log($('#anchor'+index).offset().top);
		var posi;
		if(index==1){
			posi=setting.elements.banner.height()+109;
		}else if(setting.elements.loanTab.css('position')=='fixed'){
			posi = $('#anchor'+index).offset().top-110;
		}else{
			posi = $('#anchor'+index).offset().top-220;
		}
		setting.elements.body.animate({scrollTop:posi},200);
		//setting.elements.body.animate({scrollTop:setting.elements.banner.height()+109},200);
	});
	
	/*窗口滚动式固定main标签*/
	$(window).scroll(function(){
		////console.log('滚动事件');
		var scrollBottom = $(window).scrollTop()-setting.elements.banner.height();
		var top = $(window).scrollTop();
		////console.log(scrollBottom);
		////console.log(scrollBottom);
		if(scrollBottom>110){
			setting.elements.loanTab.css({'position':'fixed','top':'0','width':'100%','z-index':'99999'});
		}else{
			setting.elements.loanTab.css('position','static');
		}
		////console.log('开始替换hover');
		if(top >= 1560){
			setting.elements.loanTabA.removeClass('hover').eq(3).addClass('hover');
		}else if(top >= 1175){
			setting.elements.loanTabA.removeClass('hover').eq(2).addClass('hover');
		}else if(top >= 568){
			setting.elements.loanTabA.removeClass('hover').eq(1).addClass('hover');
		}else{
			setting.elements.loanTabA.removeClass('hover').eq(0).addClass('hover');
		}
	});
	
	/*  */
	$.each(setting.custom.check, function(index, ele) {
		setting.elements[ele].on('blur',function(e) {
			//console.log(ele);
			ck.methodName(ele);
		});
	});
	
	setting.elements.subbtn.on('click',function(e){
		//console.log('submit');
		if($(this).hasClass('loading')){
			tips(setting.elements.btnlayout,'正在提交，请稍候');
			return false;
		}
		
		if(!ck.ck_name()||!ck.ck_tel()||!ck.ck_age()||$('#city').val == undefined || $('#city')=='' ||!ck.ck_worktime()||!ck.ck_salary()){
			
			tips(setting.elements.btnlayout,'请将信息填写完整！');
			return false;
		}
		$(this).addClass('loading');
		$.ajax({
			type : 'post',
			data : {
				NAME:setting.elements.name.val(),
				TEL:setting.elements.tel.val(),
				SEX:setting.elements.sex.parent().text(),
				AGE:setting.elements.age.val(),
				ADRESS:setting.elements.city.val(),
				RESIDENCE_TIME:setting.elements.livetime.val(),
				MONTHLY_PAY:setting.elements.salary.val(),
				CTIME:setting.elements.worktime.val(),
				CLIENT_SORT:setting.elements.customtype.val()
				},
			url : setting.custom.ajaxUrl,
			dataType : 'json'
		})
		.done(function(d){
			if(d.msg=='success'){
				setting.elements.mainLayer.hide();
				setting.elements.mainResp.show();
				setInterval(setTimeCountDown,1000);
			}else{
				tips(setting.elements.btnlayout,'网络出现异常,请稍候再试');
			}
		})
		.fail(function(){
			tips(setting.elements.btnlayout,'网络出现异常,请稍候再试');
		});
		
	});
	var count=3;
	function setTimeCountDown(){
		if(setting.elements.countdown.text()==0){
			window.location='main';
		}else{
			count--;
			setting.elements.countdown.text(count);
		}
	}
	var ck ={
			methodName:function(method){
				this['ck_'+method]();
			},
			ck_name:function(){
				
				var $name = setting.elements.name;
				var name = $.trim($name.val());
				var patrn = /^\s*[\u4e00-\u9fa5]{1,}[\u4e00-\u9fa5.·]{0,15}[\u4e00-\u9fa5]{1,}\s*$/;
				if(patrn.test(name)){
					return true;
				} else if(/^[a-zA-Z]/.test(name)) {
					return true;
				} else {
					handleResult(false,$name,setting.messages.nameWrong);
					//console.log(setting.messages.nameLength);
					return false;
				}
				return true;
			},
			
			ck_tel: function() {
				var boolen;
				var $tel = setting.elements.tel;
				var tel = $.trim($tel.val());
				if(!/^1[1234567890]\d{9}$/.test(tel)){
					handleResult(false,$tel,setting.messages.telFormat);
					return false;
				}
				return true;
			},
			
			ck_age:function(){
				var $age = setting.elements.age;
				var age = $.trim($age.val());
				if(!/^(?:[1-9][0-9]?|1[01][0-9]|120)$/.test(age)){
					handleResult(false,$age,setting.messages.ageWrong);
		            return false;
		        }
				if(age.length>2){
					handleResult(false,$age,setting.messages.ageTooLong);
					return false;
				}
				return true;
			},
			
			ck_customtype:function(){
				var $custType = setting.elements.customtype;
				var custType = $.trim($custType.val());
				if(custType==undefined || custType ==''){
					handleResult(false,$custType,setting.messages.chooseCustType);
					return false;
				}
				return true;
			},
			
			ck_worktime:function(){
				var $worktime = setting.elements.worktime;
				var worktime = $.trim($worktime.val());
				if(worktime==undefined || worktime ==''){
					handleResult(false,$worktime,setting.messages.chooseWorkTime);
					return false;
				}
				return true;
			},
			
			ck_city:function(){
				var flag = false;
				setTimeout(function(){
					var $city = setting.elements.city;
					var city = $.trim($city.val());
					
					if(city==undefined || city == ''){
						handleResult(false,$city,setting.messages.entryCity);
						flag =  false;
					}
					flag = true;
				},'500');
				return flag;
			},
			
			ck_livetime:function(){
				var $livetime = setting.elements.livetime;
				var livetime = $.trim($livetime.val());
				if(livetime==undefined || livetime == ''){
					handleResult(false,$worktime,setting.messages.chooseLiveTime);
					return false;
				}
				return true;
			},
			
			ck_salary:function(){
				var $salary = setting.elements.salary;
				var salary = $.trim($salary.val());
				if(salary==undefined || salary == ''){
					handleResult(false,$salary,setting.messages.chooseSalary);
					return false;
				}
				return true;
			}
	};


	function handleResult(result,element,message){
		if (result) {
			//$(element).next(setting.styles.errorTips).find("em").hide();
		}else{
			//$(element).show();
			tips(element,message);
			/*$(element).next(setting.styles.errorTips).find("em").text(message);*/
		}
	}
		
	
	/* 提示标签 */
	function tips(element,message){
		//console.log(element,message)
		$(element).tips({
			side : 1,
			msg : message,
			bg : '#007bce',
			time : 2
		});
		
	}
});


