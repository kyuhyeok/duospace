<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<c:if test="${boardrpNum != 0 }">
	<table style="width: 100%; margin: 10px auto 30px; border-spacing: 0">
		<tr height="35">
			<td colspan="2">
			<span style="color: #3ea9cd; font-weight: 700;">
				댓글${replyCount}개
			</span> 
			<span>
				[댓글 목록, ${pageNo}/${total_page} 페이지]
			</span></td>
		</tr>
		
		<!-- 리플 리스트 -->
		<c:forEach var="vo" items="${listReply}">
			<tr height="35" style="background: #eeeeee;">
	       		<td width="50%" style="padding: 5px 5px; border: 1px solid #cccccc; border-right:none;">
	       		      <span><b>${vo.name}</b></span>
	       		</td>
	       		<td width="50%" align="right" style="padding: 5px 5px; border: 1px solid #cccccc; border-left:none;">
       		      	<span>${vo.created}</span> |
						<c:if test="${sessionScope.user.memberNum==vo.memberNum }">
							<a onclick="deleteReply('${vo.boardrpNum}', '${pageNo}')">삭제</a>
						</c:if>
   					<span>신고</span>
	       		</td>
	       	</tr>
			<tr>
				<td colspan="2" valign="top" style="padding: 5px 5px;">
					${vo.content}
				</td>
			</tr>
	    </c:forEach>
	    
	    <!-- 페이징처리 -->
	    <tr height="40">
	    	<td colspan="2" align="center">
	    			${paging}
	    	</td>
	    </tr>
	</table>
</c:if>