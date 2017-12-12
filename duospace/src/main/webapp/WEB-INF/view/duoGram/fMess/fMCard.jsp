<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<c:forEach var="vo" items="${list}">
	<li class="objectListItem messegeContainer" onclick="opchat('${vo.friendNum}','${vo.name}','${vo.proFileSaveFileName}')">
		<div class="clearfix" style="zoom: 1;">
			<div class="objectListItem_profile" style="float: left;margin-right: 8px;">
				<img style="width:50px; height: 50px; margin: -1px;" src="<%=cp%>/resource/images/duogram/person-1701091912.png">
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