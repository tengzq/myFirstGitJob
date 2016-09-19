
//#region 验证银行
function checkBank() {
	//console.log('验证银行');
    var select = $("[to='bank']");
    if (!select.find("input").attr("hidevalue")) {
        select.parent().children('.errorMsg').show().text("请选择银行");
    } else {
        select.parent().children('.errorMsg').hide();
    }
}//#endregion

//#region 验证开户城市
function checkCity() {
	//console.log('验证开户城市');
    var select = $("[to='openAccount-city']");
    if (!select.find("input").attr("hidevalue")) {
        select.parent().children('.errorMsg').show().text("请选择开户城市");
    } else {
        select.parent().children('.errorMsg').hide();
    }
}//#endregion

//#region 验证开户省份
function checkProvince() {
    var select = $("[to='openAccount-province']");
    if (!select.find("input").attr("hidevalue")) {
        select.parent().children('.errorMsg').show().text("请选择开户省份");
    } else {
        select.parent().children('.errorMsg').hide();
    }
}//#endregion

//#region 验证支行信息
function checkSubbranchName() {
	//console.log('验证支行');
    var bankBranchName = $("#subbranch-name"), chinese = /^[\u4E00-\u9FA5]*$/;
    if (!bankBranchName.val()) {
        bankBranchName.parent().children('.errorMsg').show().text("请输入支行名称");
    } else if (!chinese.test(bankBranchName.val())) {
        bankBranchName.parent().children('.errorMsg').show().text("请输入中文支行名称");
    } else if (bankBranchName.val().length > 45) {
        bankBranchName.parent().children('.errorMsg').show().text("支行名称不能大于45个字");
    } else {
        bankBranchName.parent().children('.errorMsg').hide();
    }
}
//#endregion

//#region 验证银行卡号
function checkBankCard() {
    var _this = $("#bank-card-id");
    _this.parent().children('.bank-id-tips').remove();
    var regNum = /^[0-9]{16,19}$/;
    if (!regNum.test(_this.val())) {
        _this.parent().children('.errorMsg').show().text("请输入正确的借记卡卡号");
    } else {
        //#region 服务器校验
        $.post("myAccount/checkBank", {
            bankCard: _this.val()
        }, function (response) {
            if (response.msg == 'ok') {
                _this.parent().children('.errorMsg').hide();
                //selBankType.decoratSelect_selectOption("[hidevalue='" + response.ResponseMessage.Content + "']");
                selBankType.decoratSelect_removeDisabled();
            } else {
                _this.parent().children('.errorMsg').show().text('银行卡已被绑定');
                //selBankType.decoratSelect_addDisabled();
            }
        });
        //#endregion
    }
}//#endregion

$(function () {
    //#region 银行卡号验证及提示
    (function () {
        $(document).on("blur", "#bank-card-id", checkBankCard);//银行卡号：鼠标离开校验

        //#region 银行卡号：输入过程中校验及提示
        $(document).on("keyup", '#bank-card-id', function () {
            var This = $(this);
            if ($(this).val().length > 0) {
                if (!$('.bank-id-tips').length) {
                    $(this).parent().append('<div class="bank-id-tips"></div>');
                    $('.bank-id-tips').html(This.val());
                } else {
                    var num = This.val();
                    var re = /(\d{4})/g;
                    if (num.length >= 4) {
                        num = num.replace(re, function ($0) {
                            return $0 + ' ';
                        })
                    }
                    $(this).parent().children('.bank-id-tips').html(num);
                }
            } else {
                if ($('.bank-id-tips').length) {
                    $(this).parent().children('.bank-id-tips').remove();
                }
            }
        });//#endregion

        ////#region 持卡人姓名验证
        //$(document).on("blur", "#name", function () {
        //    if (!this.value) {
        //        $(this).parent().children('.errorMsg').show().text("请输入持卡人姓名");
        //    }
        //});//#endregion

       // $(document).on("blur", "#subbranch-name", checkSubbranchName);//支行名称：验证
    })();//#endregion 

    //#region 银行卡号：按键屏蔽
    $("#bank-card-id").keydown(function (e) {
        //console.log(e.keyCode)
        if (!((!e.shiftKey) &&
            ((e.keyCode >= 48 && e.keyCode <= 57) ||
            (e.keyCode >= 96 && e.keyCode <= 105) ||
            e.keyCode == 8 ||
            e.keyCode == 46 ||
            e.keyCode == 37 ||
            e.keyCode == 39 ||
            e.keyCode == 9))) {
            return false;
        }
    });//#endregion

    //#region 设置支行信息
    function refreshBanBranches() {
        if (!isNaN(bankTypeId) && !isNaN(cityId) && !isNaN(provinceId)) {
            $("#bankBranchName").show();
        } else {
            $("#bankBranchName").hide();
        }
    }//#endregion

    //隐藏支行
    //$("#bankBranchName").hide();

    //select控件ID
    var bankTypeId, bankBranchId, bankBranch, provinceId, cityId;

    //银行select渲染
    selBankType = $("#selBankType").decoratSelect({
        display: "inline-block",
        onselect: function (value) {
            bankTypeId = value;//缓存选中的银行
            checkBank();//校验银行
            //refreshBanBranches();//刷新支行信息
        }
    }),
    //开户城市select渲染
    selCity = $("#selCity").decoratSelect({
        display: "inline-block",
        onselect: function (value) {
            cityId = value;//缓存选中的开户城市
            checkCity();//验证开户城市
            //refreshBanBranches();//刷新支行信息
        }
    }),
    //开户省份select渲染
    selProvince = $("#selProvince").decoratSelect({
        display: "inline-block",
        onselect: function (value) {
            provinceId = value;//缓存选中的开户省份
            checkProvince();//验证开户省份
            ////#region ajax获取开户城市
            $.post("area/getAreaByPid", {
                pid: value == "选择省份" ? 0 : value
            }, function (data) {
                var cities = data.areaList;
                var cityArray = Array();
                cityArray.push({ value: "", text: "选择城市" });
                for (var i = 0; i < cities.length; i++) {
                    cityArray.push({ value: cities[i].id, text: cities[i].area });
                }
                selCity.decoratSelect_removeOption();
                selCity.decoratSelect_addOption(cityArray);
            });//#endregion
        }
    }).siblings(".decoratSelect").css("float", "left");
    selBankType.siblings(".decoratSelect").css("float", "left");
    selCity.siblings(".decoratSelect").css("float", "left");
    //selBankBranch.siblings(".decoratSelect").css("float", "left");

    //#region 添加银行卡
    $("#submitBtn").one('click',function (e) {
       doAddBank();
    });//#endregion
    
    function doAddBank(){
    	 var cardNum = $("#bank-card-id").val();
         checkBankCard();
         //checkSubbranchName();
         checkProvince();
         checkBank();
         checkCity();
         if (!$(".errorMsg:visible").length) {
             $("#errMsg").parent().hide();
             $("#submitBtn").val("正在添加").css({
            	 'background': '#c0c0c0',
            	 'cursor' : 'not-allowed'
             });//.prop("disabled", true);
             swal({
     			title:"<div>请确认信息：<div>", 
     			text:"<div style='border: 3px solid #eee;padding: 20px;line-height: 1.5;font-size: 14px;margin-top: 20px;'> " +
     					"<p style='padding: 5px 0;'>1、请确保您输入银行帐号信息准确无误。</p>" +
     					"<p style='padding: 5px 0;'>2、如果您填写的提现信息不正确可能会导致提现失败，由此产生的提现费用将不予返还。</p>" +
     					"<p style='padding: 5px 0;'> 3、双休日、法定节假日和工作日18点后，用户可以申请提现，但由于银行原因，将会在下一个工作日进行处理。由此造成的不便，请多多谅解！</p>" +
     					"<p style='padding: 5px 0;'>4、平台禁止洗钱、信用卡套现、虚假交易等行为，一经发现并确认，将终止该账户的使用。</p></div>",
     			type: "warning",
     			html:true,
     			showCancelButton: true,   
     			confirmButtonColor: "#DD6B55",   
     			confirmButtonText: "确定",   
     			cancelButtonText: "返回",   
     			closeOnConfirm: true
     			},function(isConfirm){
     				if(isConfirm){
     					swal.close();
     					$.post("myAccount/bindBankCardInfo", {
 	    	                BANK_CARD : $('#bank-card-id').val(),
 	    	            	IDENTITY: $('#idno').val(),
 	    	                REAL_NAME : $('#realName').val(),
 	    	                BANK_CODE: $('#selBankType').find('option:selected').val(),
 	    	                BANK_CARD_NAME : $('#selBankType').find('option:selected').text(),
 	    	                PROVINCE_ID : $('#selProvince').find('option:selected').val(),
 	    	                SUER_ADRESS : $('#selProvince').find('option:selected').text(),
 	    	                CITY_ID : $('#selCity').find('option:selected').val(),
 	    	                CITY_NAME : $('#selCity').find('option:selected').text(),
 	    	                BANK_ADRESS : $('#subbranch-name').val()
 	    	            }, function (data) {
 	    	                //$("#submitBtn").prop("disabled", false);
 	    	                if (data.msg== 'success') {
 	    	                    location.href = getRootPath() + "/myAccount/draw_cash";
 	    	                } else {
 	    	                   $("#errMsg").html('添加银行卡失败').parent().show();
 	    	                   $("#submitBtn").val("添加");
 	    	                   $('#submitBtn').css({'background-color':'#39a1ea','cursor':'pointer'});
 	    	                   $("#submitBtn").one('click',function (e) {
 	    	             		 doAddBank();
 	    	         	    });
 	    	                }
 	    	            });
     				}else{
     					$("#submitBtn").one('click',function () {
         					//console.log('swal拒绝后再绑');
         	        		doAddBank();
         	    	    });
     					//console.log('swal拒绝');
         				$("#submitBtn").val("添加");
         				$('#submitBtn').css({'background-color':'#39a1ea','cursor':'pointer'});
         			}
     			}
 			);
             
         }else{
        	$("#submitBtn").one('click',function (e) {
        		 doAddBank();
    	    });
         }
    }
});
