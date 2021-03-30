<%@page import="kr.co.jboadr1.bean.TermsBean" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String host = "jdbc:mysql://192.168.10.114:3306/ljj";
String user = "ljj";
String pass = "1234";

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(host, user, pass);
Statement stmt = conn.createStatement();
String sql = "SELECT * FROM `JBOARD_TERMS`;";
ResultSet rs = stmt.executeQuery(sql);

TermsBean tb = new TermsBean();
if(rs.next()){
	tb.setTerms( rs.getString(1));
	tb.setPrivacy(rs.getString(2));
}


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css"/>   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	$(function(){
    		
    		var btnNext = $('#user > div > a:eq(1)');
    		btnNext.click(function(){
    			
    			var isOkchk1 = $('input[name=chk1]').is(':checked');
        		var isOkchk2 = $('input[name=chk2]').is(':checked');
    			
    			if(isOkchk1 && isOkchk2){
    				return true;	
    			}else{
    				alert('동의 체크하셔야 합니다.');
    				return false;
    			}
    		});
    	});
    </script>     
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getTerms() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/user/login.jsp">취소</a>
                <a href="/Jboard1/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>