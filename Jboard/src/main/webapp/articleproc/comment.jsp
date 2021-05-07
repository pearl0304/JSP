<%@page import="kr.co.Jboard.Dao.ArticleDao"%>
<%@page import="kr.co.Jboard.been.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송데이터 인코딩 
request.setCharacterEncoding("UTF-8");

//전송데이터 수신 
String seq =request.getParameter("seq");
String comment =request.getParameter("comment");
String regip = request.getParameter("regip");

// 세션 사용자 객체 가져오기 
UserBean user = (UserBean)session.getAttribute("suser");
String uid = user.getUid();

//데이터베이스 처리 - 댓글 insert 
ArticleDao dao = ArticleDao.getInstence();
dao.insertComment(seq, comment, uid, regip);

//데이터베이스 처리 - 원글 댓글 update
dao.updateArticleCommetnInc(seq);

//리다이렉트 
response.sendRedirect("/Jboard/view.jsp?seq="+seq);

%>