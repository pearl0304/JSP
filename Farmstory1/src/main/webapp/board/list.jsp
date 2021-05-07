<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.farmstory1.been.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory1.config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String path = "./_aside_"+group+".jsp";
	
	//데이터베이스 연동
	Connection conn = DBConfig.getIncetence().getConnection();
	PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
	psmt.setString(1, cate);
	ResultSet rs = psmt.executeQuery();
	
	List<ArticleBean> articles = new ArrayList<>();
	if(rs.next()){
		ArticleBean ab = new ArticleBean();
		ab.setSeq(rs.getInt(1));
		ab.setParent(rs.getInt(2));
		ab.setComment(rs.getInt(3));
		ab.setCate(rs.getString(4));
		ab.setTitle(rs.getString(5));
		ab.setContent(rs.getString(6));
		ab.setFile(rs.getInt(7));
		ab.setHit(rs.getInt(8));
		ab.setUid(rs.getString(9));
		ab.setRegip(rs.getString(10));
		ab.setRdate(rs.getString(11));
		ab.setNick(rs.getString(12));
		
		articles.add(ab);
	}
		rs.close();
		psmt.close();
		conn.close();		
	
%>
<jsp:include page="<%=path %>"></jsp:include>
	<section id="board" class="list">
       <h3>글목록</h3>
       <article>
           <table border="0">
               <tr>
                   <th>번호</th>
                   <th>제목</th>
                   <th>글쓴이</th>
                   <th>날짜</th>
                   <th>조회</th>
               </tr>
               <%for(ArticleBean article : articles){ %>
	               <tr>
	                   <td><%= article.getSeq() %></td>
	                   <td><a href="./view.html"><%=article.getTitle() %></a>&nbsp;[3]</td>
	                   <td><%= article.getNick() %></td>
	                   <td><%= article.getRdate().substring(2,10) %></td>
	                   <td><%= article.getHit() %></td>
	               </tr>
                <%} %>
           </table>
      	 </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
                <a href="#" class="prev">이전</a>
                <a href="#" class="num current">1</a>                
                <a href="#" class="num">2</a>                
                <a href="#" class="num">3</a>                
                <a href="#" class="next">다음</a>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Farmstory1/board/write.jsp?group=<%= group %>&cate=<%=cate %>" class="btnWrite">글쓰기</a>
</section>
<!-- 내용 끝 -->            
</article>
 </section>
 </div>              
<%@ include file="../_footer.jsp"%>