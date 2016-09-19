<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<%@include file="../public/header_v2.jsp" %>
	<%@include file="../public/left_nav222.jsp" %>
	</div>
        <link href="<%=basePath %>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/info.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/login.css"/>
		<script src="<%=basePath %>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
	.zy2 .box{width: auto;}
	.zhuye{padding-left:0;}
	#choseUser,#amount{width:400px;height:40px;border:1px solid #ccc;}
.login1{ overflow:hidden}
.login1 .img { width:560px; height:320px;}
.login1 .img img{width:560px; height:320px;}
.login1 .con { padding:10px; padding-right:50px; }
.login1 .con h3{ line-height:2; font-size:16px; color:#666;}
.login1 .con h3 .fr{ color:#c8963a;}
.login1 .con h3 .fr a { color:#c8963a}
.login1 .con ol li{ padding:5px 0;}
.login1 .con ol li span{color: #676666;font-size:20px;line-height: 64px;}
.login1 .con ol li p { border:1px solid #ddd; height:42px; border-radius:10px; overflow:hidden; position:relative; padding-left:40px;}
.login1 .con ol li p em { display:inline-block; height:26px; width:26px; background:url(../images/b1.jpg); position:absolute; top:8px; left:10px;}
.login1 .con ol li p input { width:100%; height:100%; border:0;}
.login1 .con ol li p em.a1{ background-image:url(../images/b1.jpg)}
.login1 .con ol li p em.a2{ background-image:url(../images/b2.jpg)}
.login1 .con ol li p em.a3{ background-image:url(../images/b3.jpg)}
.login1 .con ol li>b { cursor:pointer;background:url(../images/login_16.jpg); width:24px; height:22px; float:right; margin-top:10px;}
.login1 .con ol li>em.err-area{
	font-size: 12px;
	padding-left:5px;
	color:red;
	display: none;
}
.login1 .con ol li>em.server-err{
	font-size: 13px;
	padding-left:5px;
	margin-bottom:3px;
	color:red;
	display: none;
}
.yellowbutton{
    margin: 0 auto;
    width: 210px;
    height: 38px;
    border-radius: 0;
        margin-top: 50px;
}
	</style>
		
        <div class="main">
            <div class="zhuye">
            
              
                        <div class="zy2">
                        	<div class="box">
                            			
							<div class="login1">
							<div class="form">
								<div class="fr con" style="padding-right: 0px;">
									<div class="fr">
										<!--   <input name="Fruit" type="radio" value="1" /><a href="javascript:void()" id="22">企业登陆</a><input name="Fruit" type="radio" value="2" /><a href="javascript:void()" id="22">用户登陆</a> -->
			
										<!--  <a href="#">注册</a> -->
									</div>
									<form action="<%=basePath%>pluginsyPay/toCpTransaction" method="post" onsubmit="return toSubmit()">
										<ol>
											<li>
												<span>选择用户 ：</span>
												<select name="id" id="choseUser">
													<option  value="0">请选择</option>
				                               		<c:forEach items="${ct}" var="var" varStatus="vs">
				                                		<option  value="${var.id }">${var.username }</option>
				                        			</c:forEach>
												</select>
											</li>
											<li>
												<span>转出金额 ：</span>
												<input type="text" name="amount" id="amount" placeholder="金额">
												<!-- <p style="width:150px; float:left; margin-right:10px;">
													<em class="a3"></em>
												</p> -->
											</li>
											<li style="text-align: center;"><button class="yellowbutton" type="submit">确定转账</button></li>
										</ol>
									</form>
								</div>
						</div>
					</div>
                    		<c:if test="${pd.memberClassType==1}">
                         <div class="box">
                            	<%--  <h3>还有<b>${pd.AMOUNTALL==null || pd.AMOUNTALL==''?'0.00':pd.AMOUNTALL}</b>元投资券</h3> --%>
                                <div class="wrap">
                                <h4>回款保理公司记录</h4>
                                    <ol>
                                    <li><b class="fr">${pd.FRIENDS_COUNT}个</b>保理公司
                                    </li>
                                    </ol>
                                    <div class="btn">
                                    </div>
                        		</div>
                    		</div> 	
                    		</c:if>
                		</div>
                	</div>
		</div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
		<script type="text/javascript">
			$(document).ready(function(){
				// 填充需要记录的数据
				var val_array = new Array();
				var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
				val_array.push("TYPE=1");
				val_array.push("VIEW_ID=8");
				val_array.push("WEB_OR_MOBILE=1");
				val_array.push("RANDOM_CODE="+randomCode);
				$.ajax({
				   type: "post",
				   url: "<%=basePath%>register/viewlog",
				   data: val_array.join('&'),
				   success: function(data){}
				 });
				$("#cashTransfer").attr("href", $("#cashTransfer").attr("href")+"?id="+$("#choseUser").val());
			});
			
			function unbandCard() {
				$.ajax({
				   type: "get",
				   url: "<%=basePath%>pluginsyPay/toUnbindBankCard",
				   success: function(data){
						if (data.result == "success") {
							alert("解除银行卡绑定成功！！！需等待两日才可再绑定");
							$("#jiebang").attr("style", "display: none;");
							$(".infojsp123").append('<a href="../rc/pluginsyPay/toBindBankCard" id="bangka">绑卡</a>');
						} else if (data.result == "fail") {
							alert("解除银行卡绑定失败！！！");
						}
				   }
				 });
			}
			function changeUser() {
				var url = "<%=basePath%>pluginsyPay/toCpTransaction";
				url = url + "?id="+$("#choseUser").val();
				url = url + "&amount="+$("#amount").val();
				//$("#cashTransfer").attr("href", url+"?id="+$("#choseUser").val());
				//$("#cashTransfer").attr("href", $("#cashTransfer").attr("href")+"&amount="+$("#amount").val());
				window.location.href=url; 
			}
			
			
			function toSubmit() {
			
			console.log($("#leftMoney").html());
				if ($("#choseUser").val() == 0) {
					alert("请选择用户");
					return false;
				} else if (parseFloat($("#amount").val()) > parseFloat($.trim($("#leftMoney").html()))) {
					alert("余额不足");
					return false;
				} else if ($("#amount").val() == "" || $("#amount").val() <= 0) {
					alert("请输入转账金额");
					return false;
				}  else {
					return true;
				}
			}
		</script>

