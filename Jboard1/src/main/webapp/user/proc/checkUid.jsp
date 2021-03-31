<%@page import="kr.co.jboadr1.config.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//인코딩 
request.setCharacterEncoding("UTF-8");
//수신 
String uid = request.getParameter("uid");
//데이터베이스 처리
Connection conn=DBConfig.getInstance().getConnection();

//3단계
Statement stmt = conn.createStatement();

//4단계
String sql ="SELECT COUNT(`uid`) FROM `JBOARD_USER` WHERE `uid`='"+uid+"';"; //아이디 존재 여부는 count 함수 사용
ResultSet rs =stmt.executeQuery(sql);

//5단계
int count=0;
if (rs.next()){
	count = rs.getInt(1);	
}

rs.close();
stmt.close();
conn.close();

//결과값 리턴 
JsonObject json = new JsonObject();
json.addProperty("result", count);
out.print(json);
%>