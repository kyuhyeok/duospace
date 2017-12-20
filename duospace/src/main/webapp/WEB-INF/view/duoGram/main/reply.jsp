<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<c:if test="${replyCount !=0}">
	<table style="width: 614px; border-spacing: 0">
		<tr height="35">
			<td colspan="2">
				<!-- <span style="color: #3ea9cd; font-weight: 700; margin-left: 15px;">댓글 ${replyCount}개</span> -->
			</td>
		</tr>
		<c:forEach var="vo" items="${listReply}">
			<tr height="30px">
				<td width="50%" style="padding-left: 10px;">
					<span><b><a href="#">${vo.name}</a></b></span>${vo.memberNum},${sessionScope.user.memberNum},${vo.blogNum}
				</td>
				<td width="50%" align="right" style="padding-right: 10px;">
					<span style="color: gray">${vo.created}</span>
					<c:if test="${sessionScope.user.memberNum==vo.memberNum || sessionScope.user.userId=='admin'}">
					<a onclick="deleteReply('${vo.replyNum}')">삭제</a>
					</c:if>
					<c:if test="${sessionScope.user.memberNum!=vo.memberNum && sessionScope.user.userId!='admin'}">
						<span>신고</span>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" valign="top" style="padding: 5px 5px;">
					${vo.content}
				</td>
			</tr>
			
		</c:forEach>
	</table>
	
</c:if>