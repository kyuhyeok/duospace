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
<div style="width: 100%;">
<div style="margin:auto; width: 935px; height: 500px; background: black;">
<!-- 커버사진 -->
<div align="center" style="background: black; overflow: hidden; max-width: 100%; max-height: 500px;">
	<img  style="vertical-align: middle" src="<%=cp%>/resource/images/duogram/profile2.jpg">
</div>
</div>

		<!-- 마이프로필 정보 -->
		<div style="margin: auto; width: 935px; height: 50px; background: white; border: 1px solid #ccc;">
			<div style="float: left; margin-left: 50px; margin-right: 50px; padding-right: 50px; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none; font-size: 17px; font-weight: bold">마이페이지</a>
			</div>
			<div class="duo_01" style="float: left; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none; font-size: 17px; font-weight: bold">정보</a>
			</div>
			<div class="duo_01" style="margin-right: 50px; margin-left: 50px; padding-left: 50px; float: right; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none; font-size: 17px; font-weight: bold">친구</a>
			</div>
			<div class="duo_01" style="margin-left: 50px; float: right; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none; font-size: 17px; font-weight: bold">타임라인</a>
			</div>

		</div>
		<!-- 프로필 사진 -->
		<div style="margin-bottom: -190px; position: relative; width: 220px; left: 830px; bottom: 180px">
		<div style="border-radius: 105px; max-width: 210px; height: 210px; border: 1px solid #dddfe2; background:white; border: 1px solid auto">
			<div style="overflow: hidden; border-radius: 102.5px; background: #ccc; margin-left: 2.4px; margin-top: 2.4px; max-width: 205px; max-height: 205px;">
				<img style="width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/dong.png">
			</div>
		</div>
		</div>
</div>
</body>
</html>