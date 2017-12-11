<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div style="width: 100%; min-height: 800px; background:#eef0f3; margin-top: 100px;">
	<div style="width: 800px; margin: 10px auto 0px;">
		<div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
				<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="center">
						제목
					</td>
				</tr>
				
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td width="50%" align="left" style="padding-left: 5px;">
						이름 : 홍길동
					</td>
					<td width="50%" align="right" style="padding-right: 5px;">
						2017-12-11 | 조회 1
					</td>
				</tr>
				
				<tr style="border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
						내용
					</td>
				</tr>
				
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="left" style="padding-left: 5px;">
						이전글 :
						<c:if test="${not empty preReadDto}">
							<a href="<%=cp%>/community/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
				
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="left" style="padding-left: 5px;">
						다음글 :
						<c:if test="${not empty nextReadDto}">
							<a href="<%=cp%>/community/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
				<tr height="45">
					<td width="300" align="left">
						<c:if test="${sessionScope.member.userId==dto.userId}">				    
							<button type="button" class="btn" onclick="updateBoard();" style="background: #ffffff; border: 1px solid #cccccc;">수정</button>
						</c:if>
						<c:if test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">				    
							<button type="button" class="btn" onclick="deleteBoard();" style="background: #ffffff; border: 1px solid #cccccc;">삭제</button>
						</c:if>
					</td>
					
					<td align="right">
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/community/list?${query}';" style="background: #ffffff; border: 1px solid #cccccc;">리스트</button>
					</td>
				</tr>
			</table>
		</div>
			 
		<div>
			<table style="width: 100%; margin: 15px auto 0px; border-spacing: 0">
				<tr height="30">
					<td>
						<span style="font-weight: bold;">댓글쓰기</span>
						<span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
					</td>
				</tr>
				
				<tr>
					<td style="padding: 5px 5px 0">
						<textarea id="replyContent" class="boxTA" style="width: 99%; height: 70px;"></textarea>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<button type="button" class="btn" 
						style="padding: 10px 20px;" onclick="sendReply();">댓글등록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>