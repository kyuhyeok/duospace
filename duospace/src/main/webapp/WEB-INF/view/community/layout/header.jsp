<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.logo{
	font-family: Airways;
}
</style>
<div style="background: #172A40; width:100%; position: fixed; left: 0px; top:0px; margin: 0px; border-bottom: 20px solid #D9383A;" >
	<div class="container" style="vertical-align: middle; width: 1140px;height: 60px;">	
		<div style="float: left;vertical-align: middle;">
			<a href="<%=cp%>/community/${sessionScope.user.memberNum}" class="logo" style="color: white; font-size: 33px;">
				Duo moim
			</a>
			<input type="text" class="_gnbInputSearch" placeholder="모임, 게시글을 검색해 보세요" style="border-radius: 20px; width: 200px;">
		</div>
	
		<div style="float: right;vertical-align: middle;">
		
			<a style="margin-right: 20px; color: #ffffff; font-size: large;" href="<%=cp%>/community">
				커뮤니티
			</a>
			<a style="margin-right: 20px; color: #ffffff; font-size: large;" href="<%=cp%>/moimlist">
				인기모임
			</a>
			<a style="margin-right: 20px; color: #ffffff; font-size: large;" href="<%=cp%>/mymoim/${sessionScope.user.memberNum}">
				나의모임
			</a>
			
			<a href="<%=cp%>/space_main" style="color: #ffffff;">
			<span class="glyphicon glyphicon-log-in"></span>
				duospace
			</a>
			<a href="<%=cp%>/duogram/${sessionScope.user.memberNum}" style="color: #ffffff;">
			<span class="glyphicon glyphicon-log-in"></span>
				duoGram
			</a>
			<a href="<%=cp%>/" style="color: #ffffff;">
			<span class="glyphicon glyphicon-log-in"></span>
				홈
			</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a style="color: #ffffff;">
				<img src="<%=cp%>/resource/images/communiti/bell.png" style="width: 35px; height: 35px; margin-right: 15px;">
			</a>
			<a style="color: #ffffff;">
				<img src="<%=cp%>/resource/images/communiti/talk.png" style="width: 40px; height: 40px;">
			</a>
			<a style="color: #ffffff;">
				<img src="<%=cp%>/resource/images/communiti/member.png" style="width: 60px; height: 60px;">
			</a>
		</div>
	</div>
</div>
