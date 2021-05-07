<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory1.config.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory1.been.UserBean"%>
<%@page import="kr.co.farmstory1.dao.UserDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송데이터 인코딩
request.setCharacterEncoding("UTF-8");
String uid = request.getParameter("uid");
String pass= request.getParameter("pass");

//데이터베이스 연동 
Connection conn =  DBConfig.getIncetence().getConnection();
PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_USER);
psmt.setString(1,uid);
psmt.setString(2,pass);

ResultSet rs = psmt.executeQuery();
UserBean ub = new UserBean();
if(rs.next()){
	ub.setUid(rs.getString(1));
	ub.setUid(rs.getString(2));
	ub.setUid(rs.getString(3));
	ub.setUid(rs.getString(4));
	ub.setUid(rs.getString(5));
	ub.setUid(rs.getString(6));
	ub.setUid(rs.getString(7));
	ub.setUid(rs.getString(8));
	ub.setUid(rs.getString(9));
	ub.setUid(rs.getString(10));
	ub.setUid(rs.getString(11));
	ub.setUid(rs.getString(12));
}

rs.close();
psmt.close();
conn.close();

if(ub !=null){
	//회원이 맞을 경우 
	session.getAttribute("suser");
	response.sendRedirect("/Farmstory1");
}else{
	response.sendRedirect("/Farmstory1/user/login.jsp?reult=0");

}
%>