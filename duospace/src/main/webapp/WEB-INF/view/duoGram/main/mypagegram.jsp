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

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<body style="background: #e9ebee">

<form>
	<table class="form-horizontal" style="position: fixed; left: 650px; top: 180px; background: white; height: 700px; width: 600px; margin:auto; border: 1px solid #ccc; padding-left: 15px;">
		<tr>
			<td style="width: 120px; text-align: center;">커버사진</td>
		</tr>
		<tr>
			<td style="width: 120px; text-align: center;">프로필사진</td>
		</tr>
		<tr>
			<td style="width: 120px; text-align: center;">소개</td>
		</tr>
		<tr>
			<td>${intro}</td>
		</tr>
		<tr>	
			<td style="width: 120px; text-align: center;">직장</td>
		</tr>
		<tr>
			<td>${intro}</td>
		</tr>
		<tr>	
			<td style="width: 120px; text-align: center;">학교</td>
		</tr>
		<tr>
			<td>${intro}</td>
		</tr>
		<tr>
			<td style="width: 100%; text-align: center;">거주지</td>
		</tr>
		<tr>
			<td>${intro}</td>
		</tr>
		<tr>
			<td align="center">
				<a href="<%=cp%>/duoGram/main/mypagegramcreated.jsp">수정하기</a>
			</td>
		</tr> 
	</table>
</form>
</body>
</html>