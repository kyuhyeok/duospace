<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="vo" items="${listReply}">
	<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px;">
		<a class="profileInner">
			<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width: 40px;height: 40px;">
		</a>
		<span style="margin-right: 72px;padding-top: 2px; white-space: nowrap; clear: #999">
			이름 : ${vo.name}
		</span>
			올린시간 : ${vo.created}
	</div>
	<div style='clear:both; padding: 5px 5px 5px 5%; border-bottom: 1px solid #ccc;'>
		${vo.content}
	</div>
</c:forEach>