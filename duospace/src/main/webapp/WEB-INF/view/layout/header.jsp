<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="container">
    <div id="page-header">
        <div class="headder-brand"><a href="<%=cp%>/"><span class="logo"><img src="<%=cp%>/resource/images/DuoSpace.PNG"></span></a></div>
         <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="#">공지사항</a></li>
                        <li class="dropdown">
                            <a id="space" data-target="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Duo Space<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="space">
                                <li><a href="#">1 floor Core Cafe</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">2 floor Open Station</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Other</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                        	<a data-target="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">대여 및 구매<span class="caret"></span></a>
                        	<ul class="dropdown-menu">
                                <li><a href="#">사무용품</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">카페주문</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">악세사리</a></li>
                            </ul>
                        </li>
                        <li><a href="#">예약하기</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
        <div class="header-login">
        	<c:if test="${sessionScope.member.userId=='admin'}">
                <a href="#">관리자</a> <i></i>
            </c:if>
            <c:if test="${empty sessionScope.member}">
                <a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a> <i></i>
                <a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
            	<a href="#"><span class="glyphicon glyphicon-home">POS</span></a>
                <span style="color:blue;">${sessionScope.member.userName}</span>님 <i></i>
                <a href="#"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
	            <a href="#"><span class="glyphicon glyphicon-book">마이 페이지</span></a>
            </c:if>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div>
	
</div>
