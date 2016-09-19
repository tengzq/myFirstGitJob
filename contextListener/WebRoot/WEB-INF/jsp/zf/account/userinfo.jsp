<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../public/header_v2.jsp" %>
</div>
<%@include file="../public/left_nav.jsp" %>
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/personal.css"/>
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
        <div class="main">
            <div class="zhuye" style="padding-left: 0px;">
            	
                <div class="right">
                	<div class="title2">
                    	<h2><b>个人信息</b></h2>
                    </div>
                    <div class="con">
                    	<div class="grxx qrtz">
                        	<div class="box" style="background:0; margin-left: 280px;">
                            	<div class="title">
                                	<img src="<%=basePath%>wj-static/rc/images/gerenzhongxin_03.jpg">个人资料
                                </div>
                                <ol>
                                    <li><span>用户名：</span><p>${sessionScope.sessionZfUser.USERNAME}</p></li>
                                    <c:if test="${userInfo.IS_USERNAME==0 }">
                                    	<button onclick="changeUsername();">你还没有设置用户名，点击去设置</button></li>
                                    </c:if>
                                    <li><span>姓名：</span><p>${pd.REAL_NAME}</p></li>
                                    <li><span>身份证号：</span><p>${pd.IDENTITY_HIDE}</p></li>
                                    <li><span>手机号：</span><p>${pd.TEL_HIDE}</p></li>
                                    <c:if test="${userInfo.bindBankStatu!=0 }">
                                    	<li><span>银行卡号：</span><p>未绑定</p></li>
                                    </c:if>
                                    <c:if test="${userInfo.bindBankStatu==1 }">
                                    	<li><span>银行卡号：</span><p>${pd.BANK_CARD}</p></li>
                                    </c:if>
                                    <!-- 
                                    <li><span>邮箱：</span><input type="text" value="${pd.EMAIL}"><button class="kong">验证邮箱</button></li>
                                    <li><span>邮寄地址：</span><input type="text"></li>
                                	 -->
                                </ol>
                            	<div class="title">
                                	<img src="<%=basePath%>wj-static/rc/images/gerenzhongxin_07.jpg">安全设置
                                </div>
                                <ol>
                                    <li>
                                    	<span>登录密码：</span><p>*******</p><a href="goChangePWD"><button >点击更改</button></a>
                                   		<%-- <a href="<%=basePath%>register/updatepsw"><button class="kong">修改密码</button></a> --%>
                                   	</li>
                                </ol>
                            </div>
                            <!-- 
                            <div class="btn">
                            	<button class="shi">保存</button>
                            </div>
                             -->
                        </div>
                	</div>
            	</div>
            	<div class="clear"></div>
            </div>
		</div>
		<script>
			function changeUsername() {
				setTimeout('window.location=\'<%=basePath%>register/goChangeUsername\'',3000);
			}
		</script>
<%@include file="../public/foot_v2.jsp" %>

