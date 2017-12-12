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
					<c:if test="${sessionScope.member.userId==vo.userId || sessionScope.member.userId=='admin'}">
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
			
			<tr>
				<td style="padding: 7px 5px;">
					<button type="button" class="btn btnReplyAnswerLayout" data-replyNum="${vo.replyNum}">답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
				</td>
				<td style="padding: 7px 5px;" align="right">
					<button type="button" class="btn">좋아요</button>
					<button type="button" class="btn">싫어요</button>
				</td>
			</tr>
			
			<tr class="replyAnswer" style="display: none;">
				<td colspan="2">
					<div id="listReplyAnswer${vo.replyNum}" style="border-top: 1px solid #cccccc;"></div>
					<div style="clear: both; padding: 10px 10px;">
						<div style="float: left; width: 5%;">└</div>
						<div style="float: left; width: 95%;">
							<textarea id="answerContent${vo.replyNum}" class="boxTA" style="width: 98%; height: 70px;"></textarea>
						</div>
					</div>
					<div>
						<div style="padding: 0px 13px 10px 10px; text-align: right;">
							<button type="button" class="btn" onclick="sendReplyAnswer(${vo.replyNum})">답글등록</button>
						</div>
					</div>
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