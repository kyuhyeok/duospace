<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<div style="width: 100%; min-height: 800px; background:#eef0f3; margin-top: 100px;">
	<form action="<%=cp%>/community/moimRegister" method="post">
		<table style="width:200px;">
			<tr align=center>
				<td style="text-align:center; width: 100%; height: 100px; border: 1px solid #ccc">
				<button type="submit" class="btn" onclick="myinfo">수락</button>
				<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>';">거절</button>
				</td>
			</tr>
		</table>
	</form>
</div>