<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
.sidebar .s-head h3{
	margin-top: 20px;
    padding-bottom: 10px;
	color: #172A40;
    border-bottom: 1px solid #172A40;
}
ul{
	margin-top:20px;
	padding:0;
	list-style: none;
}
li{
	margin-top: 10px;
}
.sidebar .s-nav a{
	font-size:16px;
	text-decoration: none;
	color:#333333;
}
.sidebar .s-nav a:hover{
	color: #D9383A;
}

</style>

					<aside class="sidebar">
						<div class="s-head">
							<h3>고객센터</h3>
						</div>
						<ul class="s-nav">
							<li>
								<a href="<%=cp%>/duospace/notice/list">공지사항</a>
							</li>
							<li>
								<a href="<%=cp%>/duospace/faq">자주묻는질문</a>
							</li>
							<li>
								<a href="<%=cp%>/duospace/qna/list">1:1 문의</a>
							</li>
							<li>
								<a href="<%=cp%>/privacy">개인정보처리방침</a>
							</li>
							<li>
								<a href="<%=cp%>/agreement">이용약관</a>
							</li>
						</ul>
					</aside>