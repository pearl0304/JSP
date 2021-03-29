<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="sub1.MemberBean" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
//데이터베이스 처리 1~6단계
	String host = "jdbc:mysql://192.168.10.114:3306/ljj";
	String user = "ljj";
	String pass = "1234";

//드라이브로드 
Class.forName("com.mysql.jdbc.Driver");
//데이터베이스 접속
Connection conn = DriverManager.getConnection(host, user, pass);
//SQL 실행객체 생성 
Statement stmt = conn.createStatement();
//SQL  실행 
String sql ="SELECT * FROM `MEMBER`;";
ResultSet rs = stmt.executeQuery(sql); //executeQuery 는 selelct 에서만 // executeUpdate 는 insert, update, delete 에서만 

//SQL 결과 처리 (select 일 경우)
List<MemberBean> mblist = new ArrayList<>();

while(rs.next()){
	MemberBean mb = new MemberBean();
	String uid = rs.getString(1);
	String name = rs.getString(2);
	String hp = rs.getString(3);
	String pos = rs.getString(4);
	int dep = rs.getInt(5);
	String rdate = rs.getString(6);
	
	mb.setUid(rs.getString(1));
	mb.setName(rs.getString(2));
	mb.setHp(rs.getString(3));
	mb.setPos(rs.getString(4));
	mb.setDep(rs.getInt(5));
	mb.setRdate(rs.getString(6));
	
	mblist.add(mb);
	
}

//데이터 베이스 닫기 
rs.close();
stmt.close();
conn.close();

// XML 데이터 생성 (JDON 라이브러리 사용 )
Document doc = new Document();
Element members = new Element("members");

for (MemberBean mb : mblist){
	Element member = new Element("member");  //<member></member>
	Element uid = new Element("uid");	
	Element name = new Element("name");	//<uid></uid>
	Element hp = new Element("hp");
	Element pos = new Element("pos");
	Element dep = new Element("dep");
	Element rdate = new Element("rdate");
	
	//개별 태그에 내용 입력하기 
	uid.setText(mb.getUid());  //<uid>!@#$%</uid>
	name.setText(mb.getName());
	hp.setText(mb.getHp());
	pos.setText(mb.getPos());
	dep.setText(""+mb.getDep());
	rdate.setText(mb.getRdate());
	
	//멤버태그에 각 태그 추가하기
	member.addContent(uid);
	member.addContent(name);
	member.addContent(hp);
	member.addContent(pos);
	member.addContent(dep);
	member.addContent(rdate);
	
	members.addContent(member);
}
	doc.setRootElement(members);	


	
	
//xml 데이터 출력 
XMLOutputter outPutter = new XMLOutputter(Format.getPrettyFormat());
String xml= outPutter.outputString(doc);
out.print(xml);
%>