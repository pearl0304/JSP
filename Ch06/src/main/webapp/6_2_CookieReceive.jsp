<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6_2_CookieReceive</title>
</head>
<body>
<!-- 일자 : 2021.03.24
	 -->
	 
	 <h3>2.클라이언트 쿠키 확인</h3>
	 <%
	 
	 Cookie[] ckkoies=request.getCookies();
	 
	 for(Cookie cookie : ckkoies){
	
	%>
		<p>
		쿠키명 : <%= cookie.getName() %> <br />
		쿠키값 : <%= cookie.getValue() %><br />
		</p>
		<%
	 }
	 
	  %>
	 

</body>
</html>