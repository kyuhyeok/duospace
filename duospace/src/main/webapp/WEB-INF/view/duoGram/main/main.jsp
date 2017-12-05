<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css"/>

<style type="text/css">
.logo{
	font-family:Airways;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/js/duogram/kkh.js">
</script>

</head>
<body style="margin: 0px; height: 100%; width: 100%;">


	<div style="height:80px">
	</div>

<!-- left -->

<!-- mid -->
<form style="background: #fafafa; min-height: 2500px">
	<div style="width: 935px; margin: auto;">
	<div style="width: 627px;">
		<div style="height: 60px">
		</div>
		<!-- 왼쪽 글쓰는곳 -->
		<div class="wrap" style="width: 614px; float: left;">
			<div style="margin-bottom: 60px; width: 614px; border: 1px solid rgba(0,0,0,.0975); background-color: white; border-radius: 4px;">
				
				<!-- created 인클루드(JSP를 끌어다쓴다.) -->
				<jsp:include page="/WEB-INF/view/duoGram/created.jsp"/>
				
			</div>
	
			<!-- 왼쪽 게시글들 -->
			<div style="width: 614px; border: 1px solid rgba(0,0,0,.0975); float:left; background-color: white; border-radius: 3px;">
				
				<!-- article 인클루드 -->
				<jsp:include page="/WEB-INF/view/duoGram/article.jsp"/>	
			
			</div>
		</div>
	</div>
	<!-- /왼쪽 게시글들 -->
	
	<!-- 오른쪽 커뮤니티? -->
	<div style="width: 308px; float: right;">
	
	<div style="width: 293px; padding: 10px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">
		<a href="#" style="float: left;">
			<img src="">사진
		</a>
			<div style="display: table-cell; vertical-align: middle">
				<a href="#" style="text-decoration:none; color: black; font-size: 14px; font-family: '나눔고딕';">Hajimemasitda</a>
			</div>
			<div style="display: table-cell; vertical-align: middle; color: #999; font-size: 13px; font-family: '나눔고딕';">김종기</div>
	</div>
	
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			친구생일 
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 10px; height: 10px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			예약일정
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 10px; height: 10px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			나의 커뮤니티
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 10px; height: 10px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			인기 커뮤니티
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 10px; height: 10px;"></a>
		</div>
    </div>
    
    <!-- 기업..내용? -->
    <div style="width: 293px; padding: 5px; float: right; color: #ccc; font-family: '나눔고딕'; font-size: 11px; align: center">
			<span>대표이사: 곽규혁</span>
			<span>사업자등록번호 000-00-000000</span>
			<br>
			<span>주소: 서울특별시 강남구 테헤란로14길 6 남도일빌딩</span>
			<br>
    		
    </div>
    <div style="border-top: 1px solid rgba(0,0,0,.0975); width: 293px; padding-left: 5px; padding-right: 5px; padding-top: 2px; float: right; color: #ccc; font-size: 11px;">
    	<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 회사 소개 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 정책 및 약관 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 제휴제안 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 이용약관 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 개인정보취급방침 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 고객센터 </a></span>
    	ⓒ 2017 DUOGRAM
    </div>
    <!-- /오른쪽 커뮤니티? -->
</div>
</div>
</form>
<!-- /mid -->

<!-- footer -->
<form>

</form>
<!-- /footer -->
</body>
</html>