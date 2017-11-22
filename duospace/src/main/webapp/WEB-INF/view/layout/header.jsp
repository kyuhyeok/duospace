<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="container">
    <div id="page-header">
        <div class="header-brand"><a href="<%=cp%>/"><span class="logo">DUO SPACE</span></a></div>
				
        <div class="login header-login">
        	<c:if test="${sessionScope.member.userId=='admin'}">
                <a href="#">관리자</a> <i></i>
            </c:if>
            
            <c:if test="${empty sessionScope.member}">
                <a href="#"><span class="glyphicon glyphicon-log-in"></span> 로그인</a> <i></i>
                <a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
            	<a href="#"><span class="glyphicon glyphicon-POS">POS</span></a>
                <span style="color:blue;">${sessionScope.member.userName}</span>님 <i></i>
                <a href="#"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
	            <a href="#"><span class="glyphicon glyphicon-my-page">마이 페이지</span></a>
            </c:if>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="container">
         <nav class="navbar navbar-default">
             <div class="container-fluid">
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="<%=cp%>/company/info">공지사항</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">duo space<span class="duo-space"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">1 floor Core Cafe</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">2 floor Open Station</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Other</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">대여 및 구매<span class="order"></span></a>
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
            </div>
        </nav>
</div>

