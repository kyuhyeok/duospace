<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div style="background: #f875c0">

<div class="container" style="vertical-align: middle;">	
	<div style="float: left;vertical-align: middle;">
		<a href="<%=cp%>/community">
			<img alt="" src="<%=cp%>/resource/images/community_img.png" style="width: 50px;height: 50px;">
		</a>
		<input type="text" class="_gnbInputSearch" placeholder="모임, 게시글을 검색해 보세요" style="border-radius: 20px; width: 250px;">
	</div>

	<div style="float: right;vertical-align: middle;">
		<button class="btn" style="margin-right: 100px;">밴드찾기</button>
		<a href="<%=cp%>/space_main">
			duospace/
		</a>
		<a href="<%=cp%>/duogram">
			duoGram/
		</a>
		<a href="<%=cp%>/">홈</a>/
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a>알림</a>/
		<a>메세지</a>/
		<a>나의정보</a>
	</div>
</div>
</div>
