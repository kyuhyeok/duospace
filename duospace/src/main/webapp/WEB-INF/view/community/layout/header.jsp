<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="container" >
	<table style="width:100%;height: 40px; margin: 10px auto 5px;">
		<tr>
			<td>
				<a href="<%=cp%>/community">
					<img alt="" src="<%=cp%>/resource/images/community_img.png" style="width: 50px;height: 50px;">
				</a>
				<input value="검색">
			</td>
			<td align="right">
				<button class="btn">밴드찾기</button>
			</td>
			<td>
				<a>알림</a>/
				<a>메세지</a>/
				<a>나의정보</a>
			</td>
		</tr>	
	</table>
</div>
