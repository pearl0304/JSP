<%@page import="kr.co.Jboard.been.UserBean"%>
<%@page import="kr.co.Jboard.Dao.UserDao"%>
<%@page import="kr.co.Jboard.been.TermsBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% TermsBean tb = UserDao.getInstnace().selectTerms();%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css"/> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Jboard/js/terms.js"></script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getTerm() %></textarea>
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
            <div class="term_btn">
                <a class="cancel" href="/Jboard/user/login.jsp">취소</a>
                <a class="next" href="/Jboard/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>