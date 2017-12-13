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
<!-- 마이페이지 프로필 -->
<div style="width: 935px; height: 350px; background: black; margin: auto">
<!-- 커버사진 -->
<div align="center" style="background: black; overflow: hidden; max-width: 935px; max-height: 350px;">
	<img  style="vertical-align: middle" src="<%=cp%>/resource/images/duogram/profile2.jpg">
</div>
</div>

		<!-- 마이프로필 정보 -->
		<div style="width: 935px; height: 50px; background: white; border: 1px solid #ccc; margin: auto;">
			<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none;">마이페이지</a>
			</div>
			<div class="duo_01" style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none;">정보</a>
			</div>
			<div class="duo_01" style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none;">친구</a>
			</div>
			<div class="duo_01" style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
				<a href="#" style="text-decoration:none;">타임라인</a>
			</div>
		<!-- 프로필 사진 -->
		<div style="border-radius: 2px; position: relative; left: 30px; bottom: 130px;border: 1px solid #dddfe2; padding-top: 20px; width: 160px; height: 160px; background:white; border: 1px solid auto">
			<div style="border-radius: 2px; position: relative; bottom: 15px; background: #ccc; margin: auto; width: 150px; height: 150px; border: 1px solid #dddfe2;">
			
			</div>
		</div>
		</div>

</body>
</html>