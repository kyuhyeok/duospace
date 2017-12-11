<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<!-- 검색 -->
	<div style="width: 550px; height:30px; margin-bottom: 12px; background: #ffffff; vertical-align: middle; border-radius: 10px;">
		<input type="text" placeholder="글 내용,#태그,@작성자 검색" style="width: 500px;margin-left: 20px; border: none;">
	</div>
	
	<!-- 글쓰기 -->
	<div style="width: 550px; margin-bottom: 12px; background: #ffffff; border-radius: 10px; padding: 35px;">					
		<a  href="javascript:dialogNewWord();" style="display: block; width: 100%;height: 100%;">
				멤버들에게 전할소식을 남겨주세요
		</a>
	</div>

	<!-- 글 리스트... --> 
<c:if test="${dataCount != 0}">
	<c:forEach var="vo" items="${list}">
		<div style="margin-bottom: 11px;background-color: #ffffff; border-radius: 10px;">
			<div style="border-radius: 10px;">
				<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px;">
					<a class="profileInner">
						<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width: 40px;height: 40px;">
					</a>
					<span style="margin-right: 72px;padding-top: 2px; white-space: nowrap; clear: #999">
						이름 : ${vo.name}
					</span>
					올린시간 : ${vo.created}
				</div>
				<!-- 글 리스트.. -->
				<div style="margin: 15px;">
					<textarea rows="3" cols="70" style="border: none;" name="content">${vo.content}</textarea>
									
				</div>
				<!-- 댓글 및 표정이모티콘 -->
				<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;" class="dropdown">
					<div style="margin: 15px; float: left; padding-left: 50px;">
						<button type="button">
							표정짓기
						</button>
					</div>
					<div style="margin: 15px; float: right; padding-right: 50px;">
						<button type="button" class="btn btnReplyAnswerLayout">
							댓글쓰기
						</button>
					</div>
				</div>
			</div>
		</div>	
	</c:forEach>
</c:if>