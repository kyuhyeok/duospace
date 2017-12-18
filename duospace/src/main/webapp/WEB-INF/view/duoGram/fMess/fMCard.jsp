<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<%--  --%>
<c:forEach var="vo" items="${list}">
	<li class="objectListItem messegeContainer" onclick="opchat('${vo.friendNum}','${vo.name}');" data-fnum='${vo.friendNum}' data-fname='${vo.name}'>
		<div class="clearfix" style="zoom: 1;">
			<div class="objectListItem_profile" style="float: left;margin-right: 8px;">
				<c:choose>
					<c:when test="${empty vo.proFileSaveFileName}">
						<img style="width:50px; height: 50px; margin: -1px;" src="<%=cp%>/resource/images/duogram/person-1701091912.png">
					</c:when>
					<c:otherwise>
						<img style="width:50px; height: 50px; margin: -1px;" src="<%=cp%>/resource/images/duogram/${vo.friendNum}/${vo.proFileSaveFileName}">
					</c:otherwise>
				</c:choose>
			</div>
			<div style="margin: -1px 0;">
				<div class="clearfix" style="overflow: hidden;zoom: 1;">
					<div class="author">
						<strong>${vo.name}&nbsp;<c:if test="${vo.unReadCnt!=0}">(${vo.unReadCnt})</c:if></strong>								
					</div>
					<div class="messegeContent1">
						<div class="messegeContent2">
							<span>${vo.content}</span>
						</div>
					</div>
					<div class="mTime">${vo.sendDate}</div>
				</div>
			</div>
		</div>
	</li>
</c:forEach>