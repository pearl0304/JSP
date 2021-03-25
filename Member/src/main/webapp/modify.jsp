<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송인코딩
request.setCharacterEncoding("UTF-8");

//전송수신
String uid=request.getParameter("uid");
String name=request.getParameter("name");
String hp=request.getParameter("hp");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>직원수정</title>
	</head>
	<body>
		<h3>직원수정</h3>
		<form action="./proc/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
				
					<input type="text" name="uid" readonly value="<%= uid %>"/>
				
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= name %>"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="tel" name="hp" value="<%= hp %>"/></td>
			</tr>
			<tr>
				<td>계급</td>
				<td>
					<select name="pos">
						<option>사원</option>	
						<option>대리</option>
						<option>과장</option>
						<option>차장</option>
						<option>부장</option>				
					</select>
				</td>
			</tr>	
			<tr>
				<td>부서번호</td>
				<td>
					<select name="del">
						<option value="101">영업1부</option>	
						<option value="102">영업2부</option>
						<option value="103">영업3부</option>
						<option value="104">영업4부</option>
						<option value="105">영업5부</option>
						<option value="106">영업지원부</option>
						<option value="107">인사부</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="직원수정">
				</td>
			</tr>								
		</table>
		</form>	
	</body>
</html>