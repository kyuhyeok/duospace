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
<body style="height: 100%; margin:0px;">

<div style="margin:0px; padding:0px; height:100%; resize: none;" align="left">
	<div style="max-width: 33%; float:left">
	<a href="<%=cp%>/space_main" style="text-decoration: none;">
		<img style="height:940px; overflow: hidden;"src="<%=cp%>/resource/images/duospace.jpg">
	</a>
	</div>
	<div style="max-width: 33%; float:left;">
	<a href="<%=cp%>/community" style="text-decoration: none;">
		<img style="height:940px; overflow: hidden;"src="<%=cp%>/resource/images/community.jpg">
	</a>
	</div>
	<div style="max-width: 33%; float:left">
	<a href="<%=cp%>/duogram" style="text-decoration: none;">
		<img style="height:940px; overflow: hidden;"src="<%=cp%>/resource/images/duogram 1.jpg">
	</a>
	</div>
</div>
</body>
</html>