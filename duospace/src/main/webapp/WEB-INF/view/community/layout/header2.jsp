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
				<input type="text" class="_gnbInputSearch" placeholder="모임, 게시글을 검색해 보세요">
			</td>
			<td align="right">
				<fieldset class="topInputSearch _searchBox">
					<button class="btn">밴드찾기</button>
				</fieldset>
			</td>
			<td>
				<a href="<%=cp%>/">홈</a>/
				<a>알림</a>/
				<a>메세지</a>/
				<a>나의정보</a>
			</td>
		</tr>		
	</table>
</div>

