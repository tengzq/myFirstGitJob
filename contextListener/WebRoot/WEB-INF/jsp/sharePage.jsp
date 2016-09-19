<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
String header=request.getHeader("user-agent");
String parameter=request.getParameter("INVITE_ME");
   if(header.indexOf("iPhone")!=-1 || header.indexOf("Android")!=-1 || header.indexOf("Nokia")!=-1 || header.indexOf("BB10")!=-1 || header.indexOf("Phone")!=-1 || header.indexOf("Mobile")!=-1 || !!header.matches("/AppleWebKit.*Mobile.*/")){
		out.println("haeder:"+header);
		out.println("sharePage tn : " + request.getParameter("tn"));
		request.getRequestDispatcher("/mobile/share").forward(request, response);
   }else{
   		if(null==parameter||"".equals(parameter)){
   			request.getRequestDispatcher("/register/goAdd").forward(request, response);
   		}else{
   			request.getRequestDispatcher("/ad/publishInvite").forward(request, response);
   		}
        
   }
 %>

