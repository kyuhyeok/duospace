<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( document ).tooltip();
  } );
  </script>

<!-- header -->
<form>
	<div style="background: #172A40; border-bottom: 1px solid white; position: fixed; top:0px; margin: 0px; width: 100%; height:80px;" align="center">
		<table style="height: 80px; width: 935px; margin: auto;">
			<tr>
				<td align="left" width="311px" style="padding-left: 10px">
    	  			<a href="<%=cp%>/space_main" style="font-family:'나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;">DuoSpace  |</a>
					<a title=홈 href="<%=cp%>/main" style="font-family: '나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;">
						<img src="<%=cp%>/resource/images/duogram/home.png" style="width: 60px; height: 60px;">
					</a>
					<a href="<%=cp%>/community" style="font-family:'나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;">|  Community</a>
				</td>
				
				<td align="center"> 
					<a href="<%=cp%>/duogram" class="logo" style="font-size: 46px; text-decoration:none; color: white;">Duo Gram</a>			
				</td>
			
				<td align="right" width="311px" style="padding-right: 10px;">
					<a title=친구 href="#" style="font-family:'나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
    	  				<img src="<%=cp%>/resource/images/duogram/friend.png" style="width: 40px; height: 40px;">
    	  			</a>
    	  			<a title=메신저 href="#" style="font-family:'나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
    	  				<img src="<%=cp%>/resource/images/duogram/talk.png" style="width: 40px; height: 40px;">
    	  			</a>	
					<a title=기록 href="#" style="font-family: '나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
						<img src="<%=cp%>/resource/images/duogram/record.png" style="width: 35px; height: 35px;">
					</a>
					<a title=마이페이지 href="#" style="font-family: '나눔고딕'; font-size: 17px; color: #172A40; font-weight: bold; text-decoration:none;">
						<img src="<%=cp%>/resource/images/duogram/mypage.png" style="width: 43px; height: 40px;">
					</a>
					</td>
			</tr>
		</table>
	</div>
	<div style="position: fixed; width: 100%; background: white; border-bottom: 1px solid #ccc; margin-top: 80px; height: 37px; border-bottom: 10px" align="center">
		<table style="width: 935px; margin: 0px;">
			<tr>
				<td style="padding: 5px;" align="center">
					<input type="text" style="border: 1px solid #ccc; border-radius: 10px; 
      					margin-left: 150px;height: 25px; width: 160px; background: #eee; color: black;" placeholder="                 검색">
				</td>
				<td align="right">
					<a href="<%=cp%>/member/logout" style="padding-right: 15px;"> 로그아웃</a>
				</td>
			</tr>
		</table>
	</div>
</form>
<!-- /header -->