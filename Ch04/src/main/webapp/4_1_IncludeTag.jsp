<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4_1_IncludeTag</title>
</head>
<body>
<!-- 
		일자 : 2021.03.24
		이름 : 이진주
		내용 : JSP Include action tag 실습하기

	 	include 지시자
		- 공통의 전역파일을 삽입하는 지시자 
		- 일반적으로 UI 모듈, 곧통 전역 파일 변수르 삽입할 때 사용 
		- 정적타임에 삽입, 참고) include tag는 동적 타임에 삽입 (태그가 삽입되어 있는 상태)
		
		include action tag
		- 공통의 전역파일을 삽입하는 태그 
		- 일반적으로 UI 모듈을 삽압할 때 사용하는 include
		- 동적타임에 삽입, 참고)include 지시자는 정적 타임에 삽입 (페이지를 실행할 때 태그가 삽입)
 -->
	<h3>1. JSP Include 액션태그</h3>
	<h4>Include 지시자 예</h4>
	<%@ include file="./inc/_headerjsp.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>
	
	<h4>Include 액션태그 예</h4>
	<jsp:include page="./inc/_headerjsp.jsp"></jsp:include>
	<jsp:include page="./inc/_footer.jsp"></jsp:include>
</body>
</html>