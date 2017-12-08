<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<input type="hidden" id="fReqCount" value="${fReqCount}">
<c:forEach var="fRC" items="${listFR}">
	<li id="frc${fRC.friendNum}" class="objectListItem" style="padding: 6px 12px;border-top: none;border-width: 0;border-bottom: solid 1px #dddfe2;">
		<div style="zoom: 1;">
			<!-- 사진 -->
			<div class="objectListItem_profile" style="float: left;margin-right: 8px;">
				<img style="width:50px; height: 50px; margin: -1px;" src="<%=cp%>/resource/images/duogram/person-1701091912.png">
			</div>
			<!-- 친구 및 요청 -->
			<div style="overflow: hidden;margin: -1px 0;">
				<div style="zoom: 1;">
					<!-- 확인 및 요청삭제 박스 -->
					<div style="float: right;display: inline-block;">
						<!-- 상단공간확보 -->
						<div style="height: 50px;display: inline-block;vertical-align: middle;"></div>
						<!-- 확인 및 요청삭제-->
						<div style="vertical-align: middle; display: inline-block;text-align: right;">
							<form style="display: block;" method="post">
								<input type="hidden" name="" value="">
								<div>
									<!-- 로딩이미지 -->
									<img alt="" src="">
									<!-- 확인 -->
									<button type="button" class="RequestOKBtn" onclick="fReqOk('${fRC.friendNum}');">확인</button>
									<!-- 거부 -->
									<button type="button" class="requestDeleteBtn" onclick="delFReq('${fRC.friendNum}');">요청 삭제</button>
								</div>
							</form>
						</div>
					</div>
					<!-- 친구이름 박스 -->
					<div style="display: block;overflow: hidden;word-break: break-word;">
						<!-- 상단공간확보 -->
						<div style="height: 50px;display: inline-block;vertical-align: middle;"></div>
						<!-- 친구이름 박스 -->
						<div class="friendRequestName" style="vertical-align: middle;display: inline-block;">${fRC.name}</div>
					</div>
				</div>
			</div>
		</div>
	</li>
</c:forEach>