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

<div style="padding:0; margin:400px auto;" align="center">
	<a href="<%=cp%>/space_main" style="text-decoration: none;">
		<button style="height: 100px; width: 100px;">듀오스페이스</button>
	</a>
	<a href="<%=cp%>/community" style="text-decoration: none;">
		<button style="height: 100px; width: 100px;">커뮤니티</button>
	</a>
	<a href="<%=cp%>/duogram" style="text-decoration: none;">
		<button style="height: 100px; width: 100px;">듀오그램</button>
	</a>
</div>
</body>
</html>