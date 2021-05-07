<%@page import="kr.co.Jboard.Dao.UserDao"%>
<%@page import="kr.co.Jboard.been.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송데이터 인코딩 
request.setCharacterEncoding("UTF-8");
//전송데이터 수신 
String uid = request.getParameter("uid");
String pass = request.getParameter("pass");

//데이터베이스 처리
UserBean user = UserDao.getInstnace().selectUser(uid, pass);

if(user!=null){
	//세션 사용자 정보객체 저장
	session.setAttribute("suser",user);
	//게시판 목록이동
	response.sendRedirect("/Jboard/list.jsp");
}else{
	response.sendRedirect("/Jboard/user/login.jsp?result=0");
}
%>