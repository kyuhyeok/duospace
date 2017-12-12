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
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
body{
	overflow: hidden;
}
#view div{
	display: flex;
    justify-content: center;
	float: left;
	width: 33.33vw;
	height: 100%;
	overflow: hidden;
}
img{
	flex-shrink: 0;
	height: 100vh;
}
</style>
</head>
<body>
<div id="view">
	<div>
		<a href="<%=cp%>/space_main">
			<img src="<%=cp%>/resource/images/duogram/duospace.jpg">
		</a>
	</div>
	<div>
		<a href="<%=cp%>/community">
			<img src="<%=cp%>/resource/images/duogram/community.jpg">
		</a>
	</div>
	<div>
		<a href="<%=cp%>/duogram">
			<img src="<%=cp%>/resource/images/duogram/duogram 1.jpg">
		</a>
	</div>
</div>
</body>
</html>