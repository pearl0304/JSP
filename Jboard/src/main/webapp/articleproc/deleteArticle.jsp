<%@page import="kr.co.Jboard.Dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송데이터 인코딩 
request.setCharacterEncoding("UTF-8");
//전송 데이터 수신 
String seq = request.getParameter("seq");
String parent = request.getParameter("parent");

//데이터베이스 처리 - 글 삭제
ArticleDao dao = ArticleDao.getInstence();
dao.deleteArticle(seq);

//데이터베이스처리 - 원글의 댓글 카운트 -1
dao.updateArticleDec(parent);
//리다이렉트 
response.sendRedirect("/Jboard/view.jsp?seq="+parent);
%>