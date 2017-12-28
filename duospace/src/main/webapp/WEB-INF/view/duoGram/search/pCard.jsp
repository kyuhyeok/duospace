<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div style="display:none;" id="total_Ppage">${total_Ppage}</div>
<ul class="uiList _262m _4kg">
	<c:forEach var="vo" items="${list}">
		<li class="_698" id="friend${vo.friendNum}">
			<div class="clearfix _5qo4">
				<a class="_5q6s _8o _8t lfloat _ohe" href="<%=cp%>/duogram/${vo.friendNum}">
					<c:choose>
						<c:when test="${empty vo.proFileSaveFileName}">
							<img class="_s0 _4ooo _1ve7 _rv img" style="background-color:#e4e4e4;" src="<%=cp%>/resource/images/duogram/person-1701091912.png">
						</c:when>
						<c:otherwise>
							<img class="_s0 _4ooo _1ve7 _rv img" src="<%=cp%>/resource/images/duogram/${vo.friendNum}/${vo.proFileSaveFileName}">
						</c:otherwise>
					</c:choose>
				</a>
				<div class="clearfix _42ef">
					<div class="_6a rfloat _ohf">
						<div class="_6a _6b" style="height:100px"></div>
						<div class="_6a _6b">
							<div class="_5t4x">
								<div class="FriendButton" id="friendBtn${vo.friendNum}">
									<c:if test="${memberNum!=vo.friendNum}">
									<c:choose>
										<c:when test="${vo.friendShip==2}">
											<a class="_42ft _4jy0 _55pi _2agf _4o_4 FriendRequestFriends friendButton enableFriendListFlyout _4jy3 _517h _51sy" href="#" style="max-width:200px;" data-fnum="${vo.friendNum}" onclick="fcancle(${vo.friendNum})">
												<span class="_55pe">
													<span aria-hidden="true">친구</span>
												</span>
											</a>
										</c:when>
										<c:when test="${vo.friendShip==1}">
											<button class="_42ft _4jy0 FriendRequestOutgoing enableFriendListFlyout outgoingButton enableFriendListFlyout hidden_elem _4jy3 _517h _51sy" type="button" data-fnum="${vo.friendNum}" onclick="freqcancle(${vo.friendNum})">친구 요청 전송됨</button>
										</c:when>
										<c:when test="${vo.friendShip==0}">
											<button class="_42ft _4jy0 FriendRequestAdd addButton hidden_elem _4jy3 _4jy1 selected _51sy" type="button" onclick="ftof(${vo.friendNum})">친구 추가</button>
										</c:when>
									</c:choose>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="uiProfileBlockContent">
						<div class="_6a">
							<div class="_6a _6b" style="height:100px"></div>
							<div class="_6a _6b">
								<div class="fsl fwb fcb">
									<a href="<%=cp%>/duogram/${vo.friendNum}">${vo.name}</a>
								</div>
								<a class="_39g5" href="<%=cp%>/duogram/${vo.friendNum}">${vo.email}</a><br>
								<a class="_39g5" href="<%=cp%>/duogram/${vo.friendNum}/f">
								<c:choose>
									<c:when test="${vo.fofcnt gt 0}">
									친구 ${vo.fofcnt}명
									</c:when>
									<c:otherwise>
									&nbsp;
									</c:otherwise>
								</c:choose></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>