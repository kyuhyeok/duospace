<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div style="z-index:11; width: 100%; height: 25px; background: #D9383A; position: fixed; left: 0px; top: 50px;" align="center">
	<table>
		<tr>
			<td style="padding: 0px 20px;">
				<a style="color: #ffffff;" id="moimfreeboardlist" href="<%=cp%>/community/moim${cmoimCode}">
					전체글<!-- freeboardNum -->
				</a>
			</td>
			<td style="padding: 0px 20px;">
				<a style="color: #ffffff;" id="moimalbum" href="<%=cp%>/moimalbum/list${cmoimCode}">
					사진첩
				</a>
			</td>
			<td style="padding: 0px 20px;">
				<a style="color: #ffffff;" id="moimcalendar" onclick="moimcalendar();">
					일정
				</a>
			</td>
			<td style="padding: 0px 20px;">
				<a style="color: #ffffff;" id="moimmember" onclick="moimmember();">
					멤버
				</a>
			</td>
		</tr>
	</table>
</div>

