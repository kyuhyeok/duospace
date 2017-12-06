<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<div style="margin: 150px auto;min-height:500px; width:200px; padding-top: 300px;">
<form action="<%=cp%>/duogram/snsRegister" method="post">
<table>
	<tr align=center>
		<td style="height: 100px; border: 1px solid #ccc">
			<input type="hidden" name="snsRegister" value="1">
			<button type="submit">수락</button>
			<button type="button" onclick="javascript:location.href='<%=cp%>';">거절</button>
		</td>
	</tr>
</table>
</form>
</div>
