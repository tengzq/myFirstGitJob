<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.fh.util.recharge.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<html>
  <head>
	<script type="text/javascript">
	window.onload = function() {
		var form = document.createElement("FORM");
		  	form.name="theForm";
			form.method = "POST";
			form.action="<%=request.getAttribute("tourl").toString()%>";
		
		document.body.appendChild(form) ;   
		form.submit();   
	    document.body.removeChild(form) ; 
	};
	
</script>
  </head>
<body>
	<div id="msg"></div>
	<div id="msgInfo">
	<div class="box">
	 <div class="main h270 mt140">
	   <ul>
	    <li class="main-top"></li>
	    <li class="main-center h180">
	        <div class="jump">
	          正在为您跳转至第三方支付页面，请稍等……
	        </div>
	    </li>
	    <li class="main-bottom"></li>
	   </ul>
	 </div>
	</div>
	</div>
</body>
</html>
