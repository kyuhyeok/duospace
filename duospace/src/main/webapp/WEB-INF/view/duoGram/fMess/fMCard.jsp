<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="fmCard" items="listFM">
	<li class="objectListItem messegeContainer" id="fmCard${fmCard.friendNum}" data-fmnum="${fmCard.friendNum}">
		<div class="clearfix" style="zoom: 1;">
			<div class="objectListItem_profile" style="float: left;margin-right: 8px;">
				<img style="width:50px; height: 50px; margin: -1px;" src="<%=cp%>${fmCard.imagePath}">
			</div>
			<div style="margin: -1px 0;">
				<div class="clearfix" style="overflow: hidden;zoom: 1;">
					<div class="author">
						<strong data-fmname="${fmCard.name}">${fmCard.name}</strong>											
					</div>
					<div class="messegeContent1">
						<div class="messegeContent2">
							<span>${fmCard.content}</span>
						</div>
					</div>
					<div class="mTime">${fmCard.date}</div>
				</div>
			</div>
		</div>
	</li>
</c:forEach>