<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../public/header_v2.jsp" %>
<%@include file="../public/left_nav222.jsp" %>
</div>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/personal.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>

		
        <div class="main">
            <div class="zhuye" style="height: 835px; margin-bottom: 0px;padding-left: 0px;">
            	
                <div class="right">
                	<div class="title2">
                    	<h2><b>企业信息</b></h2>
                    </div>
                    <div class="con">
                    	<div class="grxx qrtz">
                        	<div class="box" style="background:0">
                            	<div class="title">
                                	<img src="<%=basePath%>wj-static/rc/images/gerenzhongxin_03.jpg">企业资料
                                </div>
                                <ol style="padding-left: 300px;">
                                    <li><span>企业名称：</span><p>${pd.name}</p></li>
                                    <li><span>登陆账户：</span><p>${pd.username}</p></li>
                                    <li><span>开户银行核准号：</span><p>${pd.bankLicense}</p></li>
                                    <li><span>组织机构代码：</span><p>${pd.orgNo}</p></li>
                                    <li><span>营业执照编号：</span><p>${pd.businessLicenese}</p></li>
                                    <li><span>税务登记号：</span><p>${pd.taxNo}</p></li>
                                    <li><span>法人姓名：</span><p>${pd.legal}</p></li>
                                    <li><span>法人身份证：</span><p>${pd.legalIdNo}</p></li>
                                    <li><span>企业联系人：</span><p>${pd.contact}</p></li>
                                    <li><span>企业联系人手机号：</span><p>${pd.contactPhone}</p></li>
                                    <li><span>手机号：</span><p>${pd.phone}</p></li>
                                    <li><span>邮箱：</span><p>${pd.email}</p></li>
                                    <li><span>企业用户类型：</span><p>
                                    <c:if test="${pd.memberClassType==1}">核心企业</c:if>
                                    <c:if test="${pd.memberClassType==2}">供货企业</c:if>
									</p></li>
                                    <li><span>企业状态：</span><p>
                                     <c:if test="${pd.isdelete==0}">未审核</c:if>
                                     <c:if test="${pd.isdelete==1}">冻结</c:if>
                                     <c:if test="${pd.isdelete==2}">使用中</c:if>
                                     <c:if test="${pd.isdelete==3}">已删除</c:if>
                                    </p></li>
                                    <li><span>是否绑卡：</span><p>
                                     <c:if test="${pd.isBindBank==0}">未绑卡</c:if>
                                     <c:if test="${pd.isBindBank==1}">已绑卡</c:if>
                                    </p></li>
                                </ol>
                            	<%-- <div class="title">
                                	<img src="<%=basePath%>wj-static/rc/images/gerenzhongxin_07.jpg">安全设置
                                </div> --%>
                               <%--  <ol>
                                    <li>
                                    	<span>登录密码：</span><p>*******</p>
                                   		<a href="<%=basePath%>register/updatepsw"><button class="kong">修改密码</button></a>
                                   	</li>
                                </ol>
                            </div>
                            <div class="btn">
                            	<button class="shi">保存</button>
                            </div> --%>
                        </div>
                	</div>
            	</div>
            	<div class="clear"></div>
            </div>
		</div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>

