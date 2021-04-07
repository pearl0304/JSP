<%@page import="kr.co.Jboard.been.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
UserBean user =(UserBean)session.getAttribute("suser");

if(user!=null){
	//로그인 상태이면
	pageContext.forward("./list.jsp");
}else{
	pageContext.forward("./user/login.jsp");
}

%>