<%@page import="kr.co.farmstory1.been.TermsBean"%>
<%@page import="kr.co.farmstory1.been.UserBean"%>
<%@page import="kr.co.farmstory1.dao.UserDao"%>
<%@page import="kr.co.farmstory1.been.TermsBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% TermsBean tb = UserDao.getInstnace().selectTerms();%>
<%@ include file="../_header.jsp" %>
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
                <a class="cancel" href="/Farmstory1/user/login.jsp">취소</a>
                <a class="next" href="/Farmstory1/user/register.jsp">다음</a>
            </div>
        </section>
<%@ include file="../_footer.jsp"%>