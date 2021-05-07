<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.been.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@page import="kr.co.farmstory1.config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory1.been.UserBean"%>

<%
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String path = "./_aside_"+group+".jsp";
	
	//전송데이터 인코딩 
	request.setCharacterEncoding("UTF-8");
	//전송데이터 수신
	String seq = request.getParameter("seq");
	//세션 정보 객체 
	UserBean user = (UserBean)session.getAttribute("suser");
	String uid = user.getUid();
	
	//데이터베이스 처리 - 조회수 업데이트
	ArticleDao dao = ArticleDao.getInstence();
	dao.updateArticleHit(seq);
	
	//데이터베이스 처리 - 게시물 가져오기 
	ArticleBean ab = dao.selectArticle(seq);
	
	//데이터베이스 처리 - 댓글 가져오기 
	List<ArticleBean> comments = dao.selectComments(seq);
%>
<%@ include file="../_header.jsp" %>
<jsp:include page ="<%=path %>"></jsp:include>
   <section id="board" class="view">
       <h3>글보기</h3>
       <table>
           <tr>
               <td>제목</td>
               <td><input type="text" name="title" value="<%=ab.getTitle()%>" readonly/></td>
           </tr>
           <tr>
               <td>첨부파일</td>
               <td>
                   <a href="#"><%=ab.getFb().getOldName() %></a>
                   <span><%=ab.getFb().getDownload()%>회 다운로드</span>
               </td>
           </tr>
           <tr>
               <td>내용</td>
               <td>
                   <textarea name="content" readonly><%=ab.getContent() %></textarea>
               </td>
           </tr>
       </table>
       <div>
           <a href="/Farmstory1/board/delete.jsp" class="btnDelete">삭제</a>
           <a href="/Farmstory1/board/modify.jsp" class="btnModify">수정</a>
           <a href="/Farmstory1/board/list.jsp" class="btnList">목록</a>
       </div>  
       
       <!-- 댓글리스트 -->
       <section class="commentList">
           <h3>댓글목록</h3>
           <%if(ab.getComment()>0){ %>
	           	<%for(ArticleBean comment : comments ){ %>
		           <article class="comment">
		               <span>
		                   <span><%=comment.getNick() %></span>
		                   <span><%=comment.getRdate().substring(2,10) %></span>
		               </span>
		               <textarea name="comment" readonly><%=comment.getContent() %></textarea>
		               <div>
		               	<%if(uid.equals(comment.getUid())){ %>
		                   	<a href="/Farmstory/proc/deleteComment.jsp?seq=<%=comment.getSeq()%>%parent=<%=comment.getParent()%>">삭제</a>
		                <%} %>
		               </div>
		           </article>
		           <%} %>
	           <%}else{ %><p class="empty">
	               등록된 댓글이 없습니다.
	           </p>
	           <%} %>
       </section>

       <!-- 댓글입력폼 -->
       <section class="commentForm">
           <h3>댓글쓰기</h3>
           <form action="#">
               <textarea name="comment"></textarea>
               <div>
                   <a href="#" class="btnCancel">취소</a>
                   <input type="submit" class="btnWrite" value="작성완료"/>
               </div>
           </form>
       </section>

   </section>
<%@ include file="../_footer.jsp"%>