function bhaCheckTradePassword(pwd) {
	var pswTemplate = /^[A-Za-z0-9]{6,18}$/;
	return pswTemplate.test(pwd);
}


function bhaAttachSmsVerify(btn, platformNo, platformUserNo) {
	
	var disabled = false;
	
	$(btn).click(function() {
		
		if (disabled) {
			return;
		}
		
		disabled = true;
		
		var c = 60;
		setTimeout(function(){
			if (c <= 0) {
				$(btn).val('点击获取');
				$(btn).removeAttr("disabled");
				disabled = false;
				return;
			}
			$(btn).attr('disabled', 'disabled');
			$(btn).val('' + c + '秒后可以重新发送');
			c = c - 1;
			setTimeout(arguments.callee, 1000);
		}, 1000);
		
		$.ajax({
			type : "POST",
			url : "sendSmsVerify",
			dataType : "json",
			data : {
				'platformNo' : platformNo,
				'platformUserNo' : platformUserNo
			},
			success : function(returnedData) {
				if(returnedData == "error") {
					alert("抱歉，验证码发送失败，请重试。");
					$(btn).val('点击获取');
					$(btn).removeAttr("disabled");
					c = 0;
					disabled = false;
					return;
				}
				else {
					alert(returnedData);
					disabled = false;
					return;
				}
			},
			error : function(returnedData) {
				alert("抱歉，验证码发送失败，请重试。");
				$(btn).val('点击获取');
				$(btn).removeAttr("disabled");
				c = 0;
				disabled = false;
				return;
			}
		});
	});
}

function bhaQueryPaymentFillStatus(type) {
	$("#status").html("");
	if (type == 'PAYMENT') {
		$("#status").append($("<option value=''>全部</option>"))
		.append($("<option value='FREEZING'>冻结中</option>"))
		.append($("<option value='FREEZED'>已冻结</option>"))
		.append($("<option value='CANCELING'>撤销中</option>"))
		.append($("<option value='CANCEL'>已撤销</option>"))
		.append($("<option value='LOANING'>放款中</option>"))
		.append($("<option value='LOANED'>已放款</option>"))
		.append($("<option value='COMPLETED'>已完成</option>"))
	} else if (type == 'REPAYMENT') {
		$("#status").append($("<option value=''>全部</option>"))
		.append($("<option value='INIT'>失败</option>"))
		.append($("<option value='SUCCESS'>成功</option>"))
	} else if (type == 'RECHARGE') {
		$("#status").append($("<option value=''>全部</option>"))
		.append($("<option value='INIT'>失败</option>"))
		.append($("<option value='SUCCESS'>成功</option>"))
	} else if (type == 'WITHDRAW') {
		$("#status").append($("<option value=''>全部</option>"))
		.append($("<option value='INIT'>失败</option>"))
		.append($("<option value='SUCCESS'>成功</option>"))
	}
}


function showMaskMessage(msg) {
	$("<div><p>" + msg + "</p></div>").dialog({
		modal : true,
		draggable : false,
		resizable : false,
		closeOnEscape : false,
		minHeight : 50
	});
	$(".ui-dialog-titlebar").hide()
}