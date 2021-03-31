<%@page import="kr.co.jboadr1.bean.ArticleBean"%>
<%@page import="kr.co.jboadr1.dao.ArticleDao"%>
<%@page import="kr.co.jboadr1.bean.UserBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboadr1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//데이터 인코딩 
request.setCharacterEncoding("UTF-8");
//데이터 수신 
String title   = request.getParameter("title");
String content = request.getParameter("content");
String regip   = request.getRemoteAddr();
//세션 사용자 정보객체 가져오기
UserBean user = (UserBean) session.getAttribute("suser");

//데이터베이스 처리
ArticleBean article = new ArticleBean();
article.setTitle(title);
article.setContent(content);
article.setUid(user.getUid());
article.setRegip(regip);

ArticleDao.getInstance().insertArticle(article);
//게시판 목폭 리다이렉트 
response.sendRedirect("/Jboard1/list.jsp");
%>