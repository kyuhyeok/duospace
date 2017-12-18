<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<footer class="footer">
	<div style="width: 100%; height: 40px; border-top: 1px solid #eeeeee; padding:  10px auto 0px;"align="center" >
		<a href="<%=cp%>/community/notice/list">공지사항</a>
		<a href="#">파트너</a>
		<a href="#">광고</a>
		<a href="#">이용약관</a>
		<a href="#">개인정보처리방침</a>
		<a href="#">청소년 보호정책</a>
		<a href="#">운영정책</a>
		<a href="#">권리침해 신고안내</a>
		<a href="#">개발자</a>
		<a href="<%=cp%>/community/sub/qna">도움말</a>
	</div>
</footer>
  