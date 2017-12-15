<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<c:if test="${replyCount !=0}">
	<table style="width: 100%; margin: 10px auto 30px; border-spacing: 0">
		<tr height="35">
			<td colspan="2">
				<span style="color: #3ea9cd; font-weight: 700;">댓글 ${replyCount}개</span>
				<span>[댓글 목록, ${pageNo}/${total_page} 페이지]</span>
			</td>
		</tr>
		<c:forEach var="vo" items="${listReply}">
			<tr height="35" style="background: #eeeeee;">
				<td width="50%" style="padding: 5px 5px; border: 1px solid #cccccc; border-right:none;">
					<span><b>${vo.userName}</b></span>
				</td>
				<td width="50%" align="right" style="padding: 5px 5px; border: 1px solid #cccccc; border-left:none;">
					<span>${vo.created}</span>
					<c:if test="${sessionScope.user.name==vo.userId || sessionScope.member.userId=='admin'}">
					<a onclick="deleteReply('${vo.replyNum}','${pageNo}')">삭제</a>
					</c:if>
					<c:if test="${sessionScope.member.userId!=vo.userId && sessionScope.member.userId!='admin'}">
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
		
		<tr height="40">
			<td colspan="2" align="center">
				${paging}
			</td>
		</tr>
	</table>
	
</c:if>