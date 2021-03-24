<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_4_Class</title>
</head>
<body>
	<!-- 
	날짜 : 2021/03/23
	이름 : 이진주
	내용 : JSP CLASS 실습하기 -->
	
	<h3>4. JSP CLASS</h3>
	
	<%
	Account kb = new Account("국민은행","121-12-1111","김유신",10000);
	kb.deposit(40000);
	kb.withdraw(7000);
	kb.show(out);
	
	Account wr = new Account("우리은행","121-02-1111","김춘추",10000);
	wr.deposit(30000);
	wr.withdraw(9000);
	wr.show(out);	
	
	
	%>
	
	


</body>
</html>