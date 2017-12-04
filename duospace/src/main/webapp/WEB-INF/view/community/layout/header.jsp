<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div style="background: #172A40; width:100%; position: fixed; left: 0px; top:0px; margin: 0px; border-bottom: 20px solid #D9383A;" >
	<div class="container" style="vertical-align: middle;">	
		<div style="float: left;vertical-align: middle;">
			<a href="<%=cp%>/community">
				<img alt="" src="<%=cp%>/resource/images/communiti/community_img.png" style="width: 50px;height: 50px;">
			</a>
			<input type="text" class="_gnbInputSearch" placeholder="모임, 게시글을 검색해 보세요" style="border-radius: 20px; width: 250px;">
		</div>
	
		<div style="float: right;vertical-align: middle;">
			<button class="btn" style="margin-right: 100px; color: #ffffff;">밴드찾기</button>
			<a href="<%=cp%>/space_main" style="color: #ffffff;">
				duospace/
			</a>
			<a href="<%=cp%>/duogram" style="color: #ffffff;">
				duoGram/
			</a>
			<a href="<%=cp%>/" style="color: #ffffff;">홈/</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a style="color: #ffffff;">알림/</a>
			<a style="color: #ffffff;">메세지/</a>
			<a style="color: #ffffff;">나의정보</a>
		</div>
	</div>
</div>
