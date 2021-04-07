<%@page import="java.util.List"%>
<%@page import="kr.co.Jboard.been.ArticleBean"%>
<%@page import="kr.co.Jboard.Dao.ArticleDao"%>
<%@page import="kr.co.Jboard.been.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송데이터 인코딩 
request.setCharacterEncoding("UTF-8");
//전송데이터 수신 
String seq = request.getParameter("seq");
//세션 정보 객체 
UserBean user = (UserBean) session.getAttribute("suser");
String uid = user.getUid(); 
//데이터베이스 처리 - 조회수 업데이트 
ArticleDao dao = ArticleDao.getInstence();
dao.updateArticleHit(seq);

//데이터베이스 처리 - 게시물 가져오기 
ArticleBean ab = dao.selectArticle(seq);

//데이터베이스 처리 - 댓글 가져오기 
List<ArticleBean> comments = dao.selectComments(seq);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Jboard/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%=ab.getTitle() %>" readonly/></td>
                </tr>
                <%if(ab.getFile()>0){ %>
	                <tr>
	                    <td>첨부파일</td>
	                    <td>
	                        <a href="#"><%=ab.getFb().getOldName() %></a>
	                        <span><%=ab.getFb().getDownload() %>회 다운로드</span>
	                    </td>
	                </tr>
	             <%} %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%=ab.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard/delete.jsp" class="btnDelete">삭제</a>
                <a href="/Jboard/modify.jsp" class="btnModify">수정</a>
                <a href="/Jboard/list.jsp" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                <%if(ab.getComment()>0){ %>
                	<%for(ArticleBean comment : comments ){ %>
		                <article class="comment">
		                    <span>
		                        <span><%=comment.getNick()%></span>
		                        <span><%=comment.getRdate().substring(2,10) %></span>
		                    </span>
		                    <textarea name="comment" readonly><%=comment.getContent() %></textarea>
		                    <div>
		                    	<% if(uid.equals(comment.getUid())){%>
			                        <a href="/Jboard/articleproc/deleteComment.jsp?seq=<%=comment.getSeq()%>&parent=<%=comment.getParent()%>">삭제</a>
			                    <%} %>    
		                    </div>
		                </article>
		        	 <%} %>
		         <%}else{ %>     
		                <p class="empty">
		                    등록된 댓글이 없습니다.
		                </p>
		         <%} %>                  
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard/articleproc/comment.jsp" method="post">
                	<input type="hidden" name="seq" value="<%=ab.getSeq()%>" />
                    <textarea name="comment" required></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>