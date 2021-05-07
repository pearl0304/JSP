<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sub">
    <div><img src="/Farmstory2/img/sub_top_tit5.png" alt="Community"></div>
    <section class="cate5">
        <aside>
            <img src="/Farmstory2/img/sub_aside_cate5_tit.png" alt="장보기"/>

            <ul class="lnb">
                <li class="${cate eq 'notice'? 'on':'off'}"><a href="/Farmstory2/board/list.do?group=community&cate=notice">공지사항</a></li>
         		<li class="${cate eq 'menu'? 'on':'off'}"><a href="/Farmstory2/board/list.do?group=community&cate=menu">오늘의 식단</a></li>
            	<li class="${cate eq 'chef'? 'on':'off'}"><a href="/Farmstory2/board/list.do?group=community&cate=chef">나도요리사</a></li>
            	<li class="${cate eq 'qna'? 'on':'off'}"><a href="/Farmstory2/board/list.do?group=community&cate=qna">1:1 고객문의</a></li>
            	<li class="${cate eq 'faq'? 'on':'off'}"><a href="/Farmstory2/board/list.do?group=community&cate=faq">자주묻는 질문</a></li>
            </ul>

        </aside>
        <article>
            <nav>
            	<c:if test="${cate eq 'notice'}"><img src="/Farmstory2/img/sub_nav_tit_cate5_tit1.png" alt="농작물 이야기"/></c:if>	
				<c:if test="${cate eq 'menu'}"><img src="/Farmstory2/img/sub_nav_tit_cate5_tit2.png" alt="텃밭가꾸기"/></c:if>	
				<c:if test="${cate eq 'chef'}"><img src="/Farmstory2/img/sub_nav_tit_cate5_tit3.png" alt="귀농학교"/></c:if>
				<c:if test="${cate eq 'qna'}"><img src="/Farmstory2/img/sub_nav_tit_cate5_tit4.png" alt="귀농학교"/></c:if> 
				<c:if test="${cate eq 'faq'}"><img src="/Farmstory2/img/sub_nav_tit_cate5_tit5.png" alt="귀농학교"/></c:if>				               
                <p>
                    HOME > 농작물 이야기 > 
                    <c:if test="${cate eq 'notice'}"><em>공지사항</em></c:if>
                    <c:if test="${cate eq 'menu'}"><em>오늘의 식단</em></c:if>
                    <c:if test="${cate eq 'chef'}"><em>나도요리사</em></c:if>
                    <c:if test="${cate eq 'qna'}"><em>1:1 고객문의</em></c:if>
                    <c:if test="${cate eq 'faq'}"><em>자주묻는 질문</em></c:if>
                    
                </p>
            </nav>

            <!-- 내용 시작 -->


            <!-- 내용 끝 -->

        </article>
    </section>

</div>
