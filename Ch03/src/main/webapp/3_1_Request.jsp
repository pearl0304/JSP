<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-1_Request</title>
</head>
<body>

<!--날짜 : 2021/03/23
	이름 : 이진주
	내용 : JSP request 내장 객체 실습하기
	
	request 내장객체
	-Client의 요청 정볼르 갖는 객체
	-client의 전송데이터(parameter)를 수신하는 기능을 갖음 
	
	데이터 전송방식
	GET
	-기본 데이터 전송방식
	-서버에 페이지나 데이터를 요청하는 전송방식
	-데이터(파라미터) 주소에 노출	
	
	Post
	- 서버에 데이터를 전달하면서 처리를 요청하는 전송방식
	- 데이터(파라미터) 요청 메세지에 삽입되어 전송 (주소 노출x) -->

	<h3>1. JSP request 객체</h3>
	<h4>로그인</h4>
	<form action="./proc/loginProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2" align="right"></td>
				<td><input type="submit" name="로그인"></td>
			</tr>
		</table>
	</form>
	
	
	<h3>회원가입</h3>
	<form action="./proc/registerProc.jsp" method="get">
		<table border=1>
		 <tr>
		 	<td>이름</td>
		 	<td><input type="text" name="name"/></td>	
		 </tr>
		 <tr>
		 	<td>성별</td>
		 	<td>
		 	<label><input type="radio" name="gender" value="1"/>남</label>
		 	<label><input type="radio" name="gender" value="2"/>여</label> 	
		 	</td>	
		 </tr>
		 <tr>
		 	<td>취미</td>
		 	<td>
		 		<input type="checkbox" name="hobby" value="등산"/>등산	
			 	<input type="checkbox" name="hobby" value="독서"/>독서	
			 	<input type="checkbox" name="hobby" value="여행"/>여행	
			 	<input type="checkbox" name="hobby" value="운동"/>운동	
			 	<input type="checkbox" name="hobby" value="영화"/>영화
		 	</td>	
		 </tr>
		 <tr>
		 	<td>주소</td>
		 	<td>
			 	<select name="addr">
			 		<option value="서울">서울</option>
			 		<option value="대전">대전</option>
			 		<option value="대구">대구</option>
			 		<option value="부산">부산</option>
			 		<option value="광주">광주광역시</option> 	
			 	</select>
		 	</td>	
		 </tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" name="회원가입"></td>
		</tr>		 
		
		</table>	
	</form>
	<h3>Client 정보출력</h3>
	<p>
		해더정보 : <%= request.getParameter("User-Agent") %><br />
		통신규약 : <%= request.getProtocol() %><br />
		서버이름 : <%= request.getServerName() %><br />
		요청주소 : <%= request.getRequestURL() %><br />
		요청경로 : <%= request.getRequestURI() %><br />
		사용자IP : <%= request.getRemoteAddr() %><br />
	</p>
</body>
</html>