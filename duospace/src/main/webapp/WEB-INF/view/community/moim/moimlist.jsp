<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div style="background: #eef0f3; "> 
	<div class="container"style="padding-bottom: 30px; margin-top: 80px; width: 1230px; min-height: 800px;">
  		<div style="width: 100%;height: 40px;">
	  		<h1>최근 인기모임/0</h1>
  		</div>
 			<div style="float: left;">
			<div style="background-color: #ffffff; width: 180px;height: 200px;margin: 30px;">
		  		<a href="<%=cp%>/community/commoim/commoim" style="background-color: #ffffff; ">
		  			<span style=" padding-top: 55px; padding-left: 65px;">
		  				<img style="width: 50px;height: 50px; margin-top: 55px;"  src="<%=cp%>/resource/images/communiti/icon_plus.png">
		  			</span>
		  			<br>
		  			<span style="height: 85px;padding-top: 10px;padding-left: 53px;">
		  				<span style="padding: auto;">모임 만들기</span>
		  			</span>
		  		</a>
			</div>
		</div>
		<!-- 최근 인기모임 리스트 -->
		<div style="float: left;">
			<div style=" background-color: #ffffff; width: 180px;height: 200px; margin: 30px;">
		  		<a href="<%=cp%>/community/moim/moim?cmoimCode=${dto.cmoimCode}" style=" background-color: #ffffff;">
		  			<span style=" padding-top: 55px;text-align: center;">
		  				<img style="width: 180px;height: 100px;"  src="<%=cp%>/resource/images/communiti/7.JPG">
		  			</span>
		  			<br>
		  			<span style="display:table ;height: 85px; margin-left: 25px;">
		  				<span style="display:table; margin-top: 20px; ">제목:${dto.comname}</span>
		  				<span style="display:table; margin-top: 2px; ">인원수:${dto.moimcount}</span>
		  			</span>
		  		</a>
			</div>
		</div>
	</div>
</div>