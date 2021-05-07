<%@page import="kr.co.farmstory1.been.UserBean"%>
<%@page import="kr.co.farmstory1.config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String group = request.getParameter("group");
String cate = request.getParameter("cate");
String title = request.getParameter("title");
String content = request.getParameter("content");
String regip = request.getRemoteAddr();

//세션 정보 가져오기
UserBean ub = (UserBean) session.getAttribute("suser");
String uid = ub.getUid();

//데이터베이스 처리 
Connection conn = DBConfig.getIncetence().getConnection();
PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
psmt.setString(1, cate);
psmt.setString(2, title);
psmt.setString(3, content);
psmt.setString(4, uid);
psmt.setString(5, regip);

psmt.executeUpdate();

psmt.close();
conn.close();

//리다이렉트 
response.sendRedirect("Farmstory1/board/jsp?group="+group+"&cate="+cate);

%>