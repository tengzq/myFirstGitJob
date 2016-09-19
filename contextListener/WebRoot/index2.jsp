<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%-- <jsp:forward page="/main" /> --%>
<%
String header=request.getHeader("user-agent");
   if(header.indexOf("iPhone")!=-1 || header.indexOf("Android")!=-1 || header.indexOf("Nokia")!=-1 || header.indexOf("BB10")!=-1 || header.indexOf("Phone")!=-1 || header.indexOf("Mobile")!=-1 || !!header.matches("/AppleWebKit.*Mobile.*/")){
		out.println("haeder:"+header);
		
		//request.getRequestDispatcher("mobile/main").forward(request, response);
		response.sendRedirect("http://m.wanjinxiansheng.com/mobile/main");
   }else{
        request.getRequestDispatcher("main").forward(request, response);
   }
 %>

