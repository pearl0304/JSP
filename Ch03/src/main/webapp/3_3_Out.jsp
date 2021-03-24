<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3_3_OUt</title>
</head>
<body>

	<!-- 
	일자 : 2021.03.24
	이름 : 이진주
	내용 : JSP OUT 내장객체 실습하기
	
	out 내장객체
	-JSP 출력객체
	-response 응답 전송을 위해 HTML 및 데이터 출력-->
	<h3>3. Jsp out 객체</h3>
	<%
		System.out.println("Hello");
		out.println("<ul>");
		out.println("<li>서울</li>");
		out.println("<li>대전</li>");
		out.println("<li>대구</li>");
		out.println("<li>부산</li>");
		out.println("<li>광주</li>");	
		out.println("</ul>");	
	%>

</body>
</html>