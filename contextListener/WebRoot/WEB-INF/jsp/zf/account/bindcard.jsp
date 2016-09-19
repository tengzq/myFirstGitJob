<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<html>

<head>
<meta charset="utf-8">
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<base href="<%=basePath%>">
<title>万金先生 - 提现银行卡</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/bank.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="wj-static/css/recharge.css">
<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>

</head>
<body  style=" background:url(wj-static/images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
<%@ include file="../public/acc_left.jsp"%>
	
    <div class="content">
    	<div class="gerenxinxi tixianyinhangka">
        	<h3>
            	<span>提现银行卡</span>
            </h3>
            
            <div class="con">
            	
            	<c:choose>
            		<c:when test="${pd.REQUEST_SATET=='0'}">
            			<div class="wycz3">
                			<h3>拒绝原因：</h3>
                    		<p>${pd.WHY_REFUSE}</p>
                		</div>
            			<div class="txyhk">
               				<div>
                   				<div class="box">
                       				<a class="bank-card-blank" href="myAccount/addBind">
									重新绑定银行卡</a>
                       			</div>
                   			</div>
               			</div>
            		</c:when>
           			<c:when test="${pd.BANK_CARD==''||pd.BANK_CARD==null}">
						<div class="txyhk">
            					<div>
                					<div class="box">
                    					<a class="bind bank-card-blank" href="javascript:void(0);">
									<span class="highlight">立即绑定</span>银行卡</a>
                    				</div>
                				</div>
            				</div>
				
					</c:when>
					<c:otherwise>
						<div class="txyhk">
              					<div>
                  					<div class="box">
                      					<h3><i title="解绑这张银行卡" class="fa fr fa-times"></i>开户银行：${pd.BANK_CARD_NAME }
                      					<c:if test="${not empty pd.BANK_ADRESS  }">
                      					所属支行：(${pd.BANK_ADRESS })
                      					</c:if>
                      					</h3>
                          				<p>开户姓名：${pd.REAL_NAME }</p>
                          				<p>开户身份证号：${pd.IDENTITY }</p>
                          				<p>绑卡时间：${pd.CARET_DATE }</p>
                          				<p class="p"></p>
                      				</div>
                  				</div>
              				</div>

            		</c:otherwise>
					
				</c:choose>
                
                <div class="txyhk1">
                	如您的银行卡，已在万金先生移动端使用过宝付支付进行充值，更换解绑请联系客服。
                </div>
                <!-- <div class="wycz3">
                	<h3>提现说明：</h3>
                    <p>1.每日仅限提现一笔，该笔提现操作免除手续费。</p>
                    <p>2.如当日有过充值行为，则当日不可进行提现。</p>
                    <p>3.充值未投资的金额，每日最多提现（提现上限）10000元；投资回本金额的提现不受影响。</p>
                    <p>4.提现操作，大行T+1日完成，小行大于T+1日完成，均受节假日影响。</p>
                    <p>5.最小提现金额为50元。</p>
                    <p>6.提现银行卡姓名应与实名认证身份一致，才可提现。</p>
                </div> -->
           	 </div>
            
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
(function(){
	var bankNum='${pd.BANK_CARD}'.replace(/(\d{4})\d{11}(\d{4})/, '$1****$2');
	$(".txyhk .box .p").text("银行卡号："+bankNum);
	$('.fa-times').on('click', function(e){
		swal({
			title : "确定解绑银行卡？",
			text : "银行卡解绑之后将进行无法提现操作。",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "是,解绑",
			cancelButtonText : "不,返回账户",
			closeOnConfirm : false,
			closeOnCancel : false
		},
		function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					type:'post',
					url:'myAccount/deleteBankCard',
					data : {},
					async : false,
					dataType : 'json',
					success : function(data) {
						if (data.msg == "success") {
							window.location.href = getRootPath()+"/myAccount/bindcard";
							return;
						}
						if(data.msg=='nologin'){
							window.location.href = getRootPath()+"/login_toZfLogin";
							return;
						}
					}
				});
				 
			}else {
				window.location.href = getRootPath()+"/myAccount/list";
			} 
		});
	});
	$('.bind').on("click",function(){
		$.ajax({
			type:'post',
			url:'myAccount/addBindAjax',
			data : {},
			async : false,
			dataType : 'json',
			success : function(data) {
				if (data.msg == "nobind") {
					swal("已申请", "申请已提交请耐心等待", "error");
				}
				if (data.msg == "success") {
					window.location.href = getRootPath()+"/myAccount/addBind";
					return;
				}
				if(data.msg=='nologin'){
					window.location.href = getRootPath()+"/login_toZfLogin";
					return;
				}
			}
		});
	});
	
})();
</script>

<%@ include file="../public/foot.jsp"%>


</body>
</html>
