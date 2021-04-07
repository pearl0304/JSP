<%@page import="kr.co.Jboard.been.UserBean"%>
<%@page import="kr.co.Jboard.Dao.UserDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송데이터 인코딩 
	request.setCharacterEncoding("UTF-8");
//전송 수신데이터 
	String uid = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp"); 
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1"); 
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	UserBean user = new UserBean();
	user.setUid(uid);
	user.setPass(pass1);
	user.setName(name);
	user.setNick(nick);
	user.setEmail(email);
	user.setHp(hp);
	user.setZip(zip);
	user.setAddr1(addr1);
	user.setAddr2(addr2);
	user.setRegip(regip);

	//데이터베이스처리 
	UserDao.getInstnace().insertUser(user);
	
	//로그인 페이지로 리다이렉트 
	response.sendRedirect("/Jboard/user/login.jsp");
%>
