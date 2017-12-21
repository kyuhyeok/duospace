<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<c:if test="${replyCount !=0}">
	<table style="width: 614px; border-spacing: 0">
		<c:forEach var="vo" items="${listReply}">
			<tr height="30px">
				<td width="50%" style="padding-left: 10px;">
					<span><b><a href="#">${vo.name}</a></b></span>
				</td>
				<td width="50%" align="right" style="padding-right: 10px;">
					<c:if test="${sessionScope.user.memberNum==vo.writer || sessionScope.user.memberNum=='1'}">
					<a onclick="deleteReply('${vo.replyNum}')">삭제</a>
					</c:if>
					<span style="color: gray">${vo.created}</span>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" valign="top" style="padding-left: 10px; padding-right: 10px;">
					${vo.content}
				</td>
			</tr>
			
		</c:forEach>
	</table>
	
</c:if>