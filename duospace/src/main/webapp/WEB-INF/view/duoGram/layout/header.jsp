<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  // 툴팁
  $( function() {
    $( document ).tooltip();
  } );
  </script>

<!-- header -->
<form>
	<div style="z-index: 2; background: #172A40; border-bottom: 1px solid black; position: fixed; top:0px; margin: 0px; width: 100%; height:80px;" align="center">
		<table style="height: 80px; width: 935px; margin: auto;">
			<tr>
				<td align="left" width="311px" style="padding-left: 10px">
    	  			<a href="<%=cp%>/space_main" style="font-family:'나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;">DuoSpace  |</a>
					<a title=홈 href="<%=cp%>/main" style="font-family: '나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;">
						<img src="<%=cp%>/resource/images/duogram/home.png" style="width: 60px; height: 60px;">
					</a>
					<a href="<%=cp%>/community/{memberNum}" style="font-family:'나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;">|  Community</a>
				</td>
				
				<td align="center"> 
					<a href="<%=cp%>/duogram" class="logo" style="font-size: 46px; text-decoration:none; color: white;">Duo Gram</a>			
				</td>
			
				<td align="right" width="311px" style="padding-right: 10px;">
					<!-- 친구 -->
					<div style="float: right">
					<a title=친구 href="#" style="font-family:'나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
    	  				<img src="<%=cp%>/resource/images/duogram/friend.png" style="width: 40px; height: 40px;" id="dgFReq">
    	  			</a>
    	  			</div>
    	  			
    	  			<!-- 메신저 -->
    	  			<div style="float: right">
    	  			<a title=메신저 href="#" style="font-family:'나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
    	  				<img src="<%=cp%>/resource/images/duogram/talk.png" style="width: 40px; height: 40px;" id="dgMess">
    	  			</a>
    	  			</div>
    	  			
    	  			<!-- 드롭다운 기록 -->
    	  			<div class="dropdown" style="float: right">
					<a title=기록 aria-expanded="true" data-toggle="dropdown" id="dropdownMenu1" class="dropdown-toggle" href="#" style="font-family: '나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
						<span style="background: red;"class="badge"><img src="<%=cp%>/resource/images/duogram/record.png" style="width: 35px; height: 35px;">3</span>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">김종기님께서 게시물에 좋아요를 하셨습니다.</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">윤숭열님께서 김종기님 타임라인에 글을 게시하였습니다.</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">오늘은 김재원님의 생일입니다.</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="#">박가람님께서 김종기님 댓글에 댓글을 게시하였습니다.</a></li>
						</ul>
					</div>
					
					<!-- 마이페이지 -->
					<div style="float: right">
					<a title=마이페이지 href="#" style="font-family: '나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
						<img src="<%=cp%>/resource/images/duogram/mypage.png" style="width: 43px; height: 40px;">
					</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
</form>
	<div style="z-index: 1; position: fixed; width: 100%; background: white; border-bottom: 1px solid #ccc; margin-top: 80px; height: 37px;" align="center">
		<table style="width: 935px; margin: 0px;">
			<tr>
				<td align="left">
					<c:if test="${sessionScope.user.userId=='admin'}">
						<a href="<%=cp%>/admin" style="text-decoration: none">관리자페이지　　  </a>
					</c:if>
					<c:if test="${sessionScope.user.userId!='admin'}">
						<td style="width: 150px"></td>
					</c:if>
				</td>
				<td style="padding: 5px;" align="center">
					<input type="text" style="border: 1px solid #ccc; border-radius: 10px; 
      					margin-left: 150px;height: 25px; width: 160px; background: #eee; color: black;" placeholder="                 검색">
				</td>
				<td align="right">
					<c:if test="${not empty sessionScope.user}">
						<span style="color: red;">${sessionScope.user.userName}</span>님 환영합니다.<i></i>
					</c:if>|
					<a href="<%=cp%>/member/logout" style="text-decoration: none; padding-right: 15px;">  로그아웃</a>
				</td>
			</tr>
		</table>
	</div>
<!-- /header -->