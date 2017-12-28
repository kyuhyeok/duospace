<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height: 50px;">
</div>
<!-- 마이페이지 프로필 -->
<div style="width: 100%; background: black;">
<div style="margin:auto; width: 935px; height: 450px; background: black;">
<!-- 커버사진 -->
<div align="center" style="background: black; overflow: hidden; max-width: 100%; max-height: 450px;">
	<c:if test="${blogNum==5}">
				<img style="margin-top: -800px; bottom: 50px;width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/cover/5/5p.jpg">
				</c:if>
				<c:if test="${blogNum==4}">
				<img style="margin-top: -600px; bottom: 50px;width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/cover/4/4p.jpg">
				</c:if>
				<c:if test="${blogNum==6}">
				<img style="margin-top: -600px; bottom: 50px;width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/cover/6/6p.jpg">
				</c:if>
				<c:if test="${blogNum==7}">
				<img style="margin-top: -800px; bottom: 50px;width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/cover/7/7p.jpg">
				</c:if>
				<c:if test="${blogNum==8}">
				<img style="margin-top: -800px; bottom: 50px;width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/cover/8/8p.jpg">
				</c:if>
				<c:if test="${blogNum==11}">
				<img style="margin-top: -600px; bottom: 50px;width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/cover/11/11p.jpg">
				</c:if>
				<c:if test="${blogNum==13}">
				<img style="margin-top: -80px; bottom: 50px;width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/cover/13/13p.jpg">
				</c:if>
</div>
</div>

		<!-- 마이프로필 정보 -->
		<div style="margin: auto; width: 100%; height: 50px; background: white; border: 1px solid #ccc;">
			<div style="float: left; margin-left: 500px; margin-right: 50px; padding-right: 50px; line-height: 45px; font-size: 15px;">
				<a href="<%=cp%>/duogram/${sessionScope.user.memberNum}" style="text-decoration:none; font-size: 17px; font-weight: bold">내 타임라인</a>
			</div>
			<div class="duo_01" style="float: left; line-height: 45px; font-size: 15px;">
				<a href="<%=cp%>/duogram/mygram/${sessionScope.user.memberNum}" style="text-decoration:none; font-size: 17px; font-weight: bold">정보</a>
			</div>
			<div class="duo_01" style="margin-right: 50px; margin-left: 50px; padding-left: 50px; float: left; line-height: 45px; font-size: 15px;">
				<a href="<%=cp%>/duogram/${blogNum}/f" style="text-decoration:none; font-size: 17px; font-weight: bold">친구</a>
			</div>
		</div>
		
</div>
</body>
</html>