<%@page import="java.util.List"%>
<%@page import="kr.co.Jboard.Dao.ArticleDao"%>
<%@page import="kr.co.Jboard.been.ArticleBean"%>
<%@page import="kr.co.Jboard.been.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송데이터 인코딩 
request.setCharacterEncoding("UTF-8");

//세션 사용자 정보 가져오기 
UserBean user = (UserBean)session.getAttribute("suser");
if(user==null){
	//로그인을 하지 않고 게시판에 접근했을 경우 
	response.sendRedirect("/Jboard/user/login.jsp?result=2");
	return; //프로그램 종료
}
//전송데이터 수신 
String pg =request.getParameter("pg");

//페이지 관련 처리 
ArticleDao dao = ArticleDao.getInstence();
int total = dao.selectCountArticel();
int lastPageNum = dao.getLastPageNum(total);
int currentPage = dao.getcurrentPage(pg);
int start = dao.getLimitStart(currentPage);
int[] groups = dao.getPageGroup(currentPage, lastPageNum);
int pageStartNum = dao.getPageStratNum(total, start);

//데이터베이스 처리 
List<ArticleBean> articles = dao.selectAritlces(start);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Jboard/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    <%=user.getNick()%>님 반갑습니다.
                    <a href="/Jboard/user/proc/logout.jsp" class="logout">[로그아웃]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <%for(ArticleBean ab : articles){ %>
	                    <tr>
	                        <td><%=pageStartNum-- %></td>
	                        <td><a href="/Jboard/view.jsp?seq=<%=ab.getSeq()%>"><%=ab.getTitle() %></a>&nbsp;[<%=ab.getComment() %>]</td>
	                        <td><%=ab.getNick() %></td>
	                        <td><%=ab.getRdate().substring(2,10) %></td>
	                        <td><%=ab.getHit() %></td>        
	                    </tr>
                    <%} %>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
            	<%if(groups[0]>1){ %>
	                <a href="/Jboard/list.jsp?pg=<%=groups[0]-1 %>" class="prev">이전</a>
	            <%} %>
	            <%for(int i=groups[0]; i<=groups[1] ;i++){ %>
	                <a href="/Jboard/list.jsp?pg=<%=i %>" class="num <%= (currentPage ==i) ?"current":"off" %>"><%=i %></a>    
	            <%} %>  
	            <%if(groups[1]<lastPageNum){ %>                        
	                <a href="/Jboard/list.jsp?pg=<%=groups[1]+1 %>" class="next">다음</a>
	            <%} %>
	            
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Jboard/write.jsp" class="btnWrite">글쓰기</a>
            

        </section>
    </div>    
</body>
</html>