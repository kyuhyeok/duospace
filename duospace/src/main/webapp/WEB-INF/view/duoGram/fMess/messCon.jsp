<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div id="lastmData" style="display: none;">${lastData}</div>
<c:forEach var="vo" items="${list}">
	<!-- <time id="time${vo.num}">
		<span>${vo.sendDate}</span>
	</time> -->
	<c:choose>
		<c:when test="${sessionScope.user.memberNum eq vo.friendNum}">
			<div class="contentBox _ua1" id="mess${vo.num}" data-fmNum="${vo.num}">
				<div class="friendProfile" id="dgchatPS">
					<c:choose>
						<c:when test="${empty vo.proFileSaveFileName}">
							<a class="friendLink" href="<%=cp%>/duogram/${vo.friendNum}">
								<img style="background-color: #eeeeee" src="<%=cp%>/resource/images/duogram/person-1701091912.png">
							</a>
						</c:when>
						<c:otherwise>
							<a class='friendLink' href="<%=cp%>/duogram/${vo.friendNum}">
								<img style='background-color: #eeeeee' src='<%=cp%>/resource/images/duogram/${vo.friendNum}/${vo.proFileSaveFileName}'>
							</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="content">
					<div class="etcbox _ua1" style="width:100%">${vo.sendDate}</div><br>
					<div class="friendCon">
						<div class="textbox" style="padding: 5px 8px 5px;">
							<span>${vo.content}</span>
						</div>
					</div>
					<div style="margin-left:8px;">
						<div class="etcbox _ua1" style="cursor: pointer;width: 10px;" onclick="dMess('${vo.num}')">X</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="contentBox _ua0" id="mess${vo.num}" data-fmNum="${vo.num}">
				<div class="content _my">
					<div class="etcbox _ua0" style="width:100%;text-align: right;">${vo.sendDate}</div>
					<div class="myCon">
						<div class="textbox _mycolor" style="padding: 5px 8px 5px;">
							<span>${vo.content}</span>
						</div>
					</div>
					<div>
						<div class="etcbox _ua0" style="text-align:right; cursor: pointer;width: 10px;" onclick="dMess('${vo.num}')">X</div>
						<c:if test="${empty vo.readDate}">
							<div class='etcbox _ua0 unreadfm' style='text-align:right;'>안읽음</div>
						</c:if>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</c:forEach>