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

<!-- textarea에 글을 길게 쓰면 자동으로 길이가 늘어난다. -->
<script src="//code.jquery.com/jquery.min.js"></script>

<script>
$("textarea.autosize").on('keydown keyup', function () {
  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
});
</script>
<style type="text/css">
.logo{
	font-family:Airways;
}
</style>
</head>
<body style="margin: 0px; height: 100%; width: 100%;">

<!-- header -->
<form>
<div style="background: #32b0e5; position: fixed; top:0px; margin: 0px; width: 100%; height:80px; border-bottom: 1px solid rgba(0,0,0,.0975);" align="center">
	<table style="height: 80px; width: 935px; margin: 0px;">
		<tr>
			<td align="left" width="311px">
      			<input type="text" style="border: 1px solid #2c7492; border-radius: 10px; 
      			height: 25px; width: 160px; background: #2fa6d8; color: white;"placeholder="                 검색">
			</td>
			
			<td align="center"> 
				<a href="#" class="logo" style="font-size: 46px; text-decoration:none; color: white;">Duo Gram</a>			
			</td>
			
			<td align="right" width="311px">
				<a href="#" style="font-family: 굴림; font-size: 15px; color: white; font-weight: bold;">글로벌 페이지　|</a>
				<a href="#" style="font-family: 굴림; font-size: 15px; color: white; font-weight: bold;">　기록　|</a>
				<a href="#" style="font-family: 굴림; font-size: 15px; color: white; font-weight: bold;">　마이페이지</a>
			</td>
		</tr>
	</table>
</div>
</form>
<!-- /header -->
<div style="height:80px">
</div>

<!-- mid -->
<form style="background: #fafafa; min-height: 2500px">
<div style="width: 935px; margin: auto;">
	<div style="height: 60px">
	</div>
	<!-- 왼쪽 글쓰는곳 -->
	<div style="width: 614px; float: left;">
	<div style="margin-bottom: 60px; width: 614px; padding-left: 15px; padding-right: 15px; border: 1px solid rgba(0,0,0,.0975); background-color: white; border-radius: 4px;">
		<!-- 게시글 등록 및 동영상 추가 -->
		<div style="height: 40px; border-bottom: 1px solid #ccc; margin-top:20px;">
			<div align="left" style="font-size: 16px; font-weight: bold;">글쓰기
				<button class="btn btn-primary btn-sm button pull-right" style="width: 80px; height: 28px; font-size: 12px; margin-left: 8px;">게시글 등록</button>
				<button class="btn btn-success btn-sm button pull-right" style="width: 80px; height: 28px; font-size: 12px;">동영상 추가</button>
			</div>
		</div>
		<!-- 내용 입력 -->
		<div style="margin-top: 10px; margin-bottom: 10px;">
			<textarea class="autosize" style="overflow:hidden; resize: none; width: 584px; min-height: 150px; border-radius: 4px; border: 1px solid rgba(0,0,0,.0975);"></textarea>
		</div>
		
		<!-- 첨부파일 -->
		<div style="border-top: 1px solid #ccc; margin-bottom: 10px"></div>
		<div style="height: 40px">
				<input type="text" placeholder="첨부파일" style="border-radius: 4px; border: 1px solid rgba(0,0,0,.0975); width: 584px; height: 28px;">
		</div>
	</div>
	
	<!-- 왼쪽 게시글들 -->
	<div style="width: 614px; padding-left: 15px; padding-right: 15px; border: 1px solid rgba(0,0,0,.0975); float:left; background-color: white; border-radius: 3px;">
	
			<!-- 프로필 및 아이디 -->
			<div style="height: 40px; border-bottom: 1px solid rgba(0,0,0,.0975); margin-top:20px; font-weight: bold; font-size: 16px;">
				<div style="margin-top: 5px;">
				<div style="float:left;">프로필사진과 아이디</div>
				<div style="float:right;"><a href="#" style="text-decoration:none; color: #ccc;">▥</a></div>
				</div>
			</div>
			
			<!-- 사진 -->
			<div style="min-height: 10px;">
			</div>
			
			<!-- 게시한 글 -->
			<div style="width: 584px; margin-top: 10px;">
				오예
				나는 오늘
				집에가면 잔다
				아싸뵤
				뵤뵤뵤
				뵤뵹
			</div>
			
			<!-- 올린날짜 -->
			<div align="right" style="color: #ccc; margin-top: 10px;">
				2017/11/30
			</div>
			
			<!-- 좋아요 갯수표시 -->
			<div style="height: 15px;margin-top: 5px; margin-bottom: 5px; border-top: 1px solid #ccc; ">
				<div style="margin-top: 5px;">
				<div style="float:left; font-size: 14px;">좋아요　</div>
				<div style="float:left; font-size: 14px;">댓글x개</div>
				<div style="float:right; font-size: 14px;">조회수</div>
				</div>
			</div>
			
			<!-- 댓글다는곳 -->
			<div style="height: 50px;">
				<input type="text" style="border-radius: 4px; margin-top: 7.5px; margin-bottom: 7.5px; border: 1px solid rgba(0,0,0,.0975); width: 584px; height: 25px;">
			</div>
	</div>
</div>
	<!-- /왼쪽 게시글들 -->
	
	
	<!-- 오른쪽 커뮤니티? -->
    <div style="width: 293px; padding: 10px; min-height: 150px; background: white; border: 1px solid rgba(0,0,0,.0975); float:right; border-radius: 3px; margin-bottom: 20px">	
		<div style="height: 35px; font-size: 14px; border-bottom: 1px solid #ccc">
			친구생일 <a href="#"><img src="<%=cp%>/resource/images/topni.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 150px; background: white; border: 1px solid rgba(0,0,0,.0975); float:right; border-radius: 3px; margin-bottom: 20px">	
		<div style="height: 35px; font-size: 14px; border-bottom: 1px solid #ccc">
			다가오는 일정 <a href="#"><img src="<%=cp%>/resource/images/topni.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 250px; background: white; border: 1px solid rgba(0,0,0,.0975); float:right; border-radius: 3px; margin-bottom: 20px">	
		<div style="height: 35px; font-size: 14px; border-bottom: 1px solid #ccc">
			커뮤니티 순위 <a href="#"><img src="<%=cp%>/resource/images/topni.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <!-- 기업..내용? -->
    <div style="border-top: 1px solid rgba(0,0,0,.0975); width: 293px; padding-top: 2px; float: right; color: #ccc; font-size: 14px;">ⓒ 2017 DUOGRAM
    </div>
    <!-- /오른쪽 커뮤니티? -->
</div>	
</form>
<!-- /mid -->

<!-- footer -->
<form>

</form>
<!-- /footer -->
</body>
</html>