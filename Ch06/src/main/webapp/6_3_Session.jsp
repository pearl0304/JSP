<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6_3_Session</title>
</head>
<body>
	<!-- 일자 : 2021.03.24
		 이름 : 이진주-
		 내용 : JSP Session 실습하기
		 
		 Session
		 - 일정 기간동안 일어나는 전체기간
		 - 클라이언트에서 서버로 요청할 때 서버에 기록되는 클라이언트 명단 (Session Table)
		 - 서버에서는 각 클라이언트에게 고유한 번호를 부여 (Session Id)-->
		 
		 <%
		 //서버 섹션 테이블에 클라이언트 정보 저장
		  session.setAttribute("name", "홍길동");
		 session.setAttribute("uid", "hong");
		 
		 //session table에 보관될 시간 설정
		 session.setMaxInactiveInterval(60*3);
		%>
		<h4>세션 기록 완료</h4>
		<a href="./6_4_SessionConfirm.jsp">기록된 session 데이터 확인 </a>
		
</body>
</html>