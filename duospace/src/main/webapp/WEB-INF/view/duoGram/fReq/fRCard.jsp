<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div style="display:none;" id="total_Freqpage">${total_page}</div>
<c:forEach var="fRC" items="${listFR}">
	<li id="frc${fRC.friendNum}" class="objectListItem" style="padding: 6px 12px;border-top: none;border-width: 0;border-bottom: solid 1px #dddfe2;">
		<div style="zoom: 1;">
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
			<div style="overflow: hidden;margin: -1px 0;">
				<div style="zoom: 1;">
					<div style="float: right;display: inline-block;">
						<div style="height: 50px;display: inline-block;vertical-align: middle;"></div>
						<div style="vertical-align: middle; display: inline-block;text-align: right;">
							<form style="display: block;" method="post">
								<input type="hidden" name="" value="">
								<div>
									<!-- 로딩이미지 -->
									<img alt="" src="">
									<button type="button" class="RequestOKBtn" onclick="fReqOk('${fRC.friendNum}');">확인</button>
									<button type="button" class="requestDeleteBtn" onclick="delFResp('${fRC.friendNum}');">요청 삭제</button>
								</div>
							</form>
						</div>
					</div>
					<div style="display: block;overflow: hidden;word-break: break-word;">
						<div style="height: 50px;display: inline-block;vertical-align: middle;"></div>
						<div class="friendRequestName" style="vertical-align: middle;display: inline-block;">${fRC.name}</div>
					</div>
				</div>
			</div>
		</div>
	</li>
</c:forEach>