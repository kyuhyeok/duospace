<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div style="position: fixed; padding-left: 850px; padding-top: 200px;">
<form action="<%=cp%>/duogram/snsRegister" method="post">
<table style="width:200px;">
	<tr align=center>
		<td style="width: 100%; height: 100px; border: 1px solid #ccc">
			<input type="hidden" name="register" value="1">
			<button type="submit">수락</button>
			<button type="button" onclick="javascript:location.href='<%=cp%>';">거절</button>
		</td>
	</tr>
</table>
</form>
</div>