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

<!-- textarea에 글을 길게 쓰면 자동으로 길이가 늘어난다. -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$("textarea.autosize").on('keydown keyup', function () {
  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
});
</script>

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="margin: 0px; height: 100%; width: 100%;">

<!-- header -->
<form>
<div style="background: white; position: fixed; top:0px; margin: 0px; width: 100%; height:80px; border-bottom: 1px solid rgba(0,0,0,.0975);" align="center">
	<table style="height: 80px; width: 935px; margin: 0px;">
		<tr>
			<td align="left" width="311px">
      			<input type="text" style="border: 1px solid #ccc; border-radius: 3px; 
      			height: 25px; width: 160px; background: #fafafa;"placeholder="                 검색">
			</td>
			
			<td align="center"> 
				<a href="#"><img src="<%=cp%>/resource/images/DuoSpace.PNG" style="width: 150px; height: 35px;"></a>			
			</td>
			
			
			<td align="right" width="311px">
				<a href="#"><img src="<%=cp%>/resource/images/record.JPG" style="width: 20px; height: 20px;"></a>  　 
				<a href="#"><img src="<%=cp%>/resource/images/world.JPG" style="width: 20px; height: 20px;"></a>  　
				<a href="#"><img src="<%=cp%>/resource/images/mypage.JPG" style="width: 20px; height: 20px;"></a>
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
	<div style="width: 614px;">
	<div style="margin-bottom: 60px; width: 614px; padding-left: 15px; padding-right: 15px; border: 1px solid rgba(0,0,0,.0975); float:left; background-color: white; border-radius: 3px;">
		<div style="min-height: 265px;">
			<div>
				<!-- 게시글 등록 및 동영상 추가 -->
				<div style="height: 55px; padding: none; border-bottom: 1px solid #ccc">
					<div align="left" style="font-size: 16px;">글쓰기
					</div>
					
					<div align="right">
						<button type="button" style="width: 80px; height: 28px; font-size: 12px;">게시글 등록</button>  
						<button type="button" style="width: 80px; height: 28px; font-size: 12px;">동영상 추가</button>
					</div>
				</div>
				<!-- 내용 입력 -->
				<div>
					<div>
						<textarea class="autosize" style="overflow:hidden; resize: none; width: 584px; min-height: 150px; border-radius: 4px; border: 1px solid ;"></textarea>
					</div>
				</div>
				<!-- 첨부파일 -->
				<div style="border-top: 1px solid rgba(0,0,0,.0975); margin-bottom: 14px"></div>
				<div style="height: 40px">
					<div>
						<input type="text" style="border-radius: 4px; border: 1px solid #ccc; width: 584px; height: 28px;">
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 왼쪽 게시글들 -->
	<div style="width: 614px; min-height: 210px; padding-left: 20px; padding-right: 20px; border: 1px solid rgba(0,0,0,.0975); float:left; background-color: white; border-radius: 3px;">
		<table>
			<!-- 프로필 및 아이디 -->
			<tr style="height: 60px;">
				<td style="width: 614px; border-bottom: 1px solid rgba(0,0,0,.0975);">프로필사진과 아이디</td>
			</tr>
			<!-- 사진 -->
			<tr>
			</tr>
			<!-- 좋아요 및 댓글보기 -->
			<tr style="min-height: 40px;">
			</tr>
			<!-- 좋아요 갯수표시 -->
			<tr style="height: 18px;">
			</tr>
			<!-- 게시한 글 -->
			<tr>
			</tr>
			<!-- 올린날짜 -->
			<tr style="height: 20px">
			</tr>
			<!-- 그냥 선 -->
			<tr style="height: 10px;"> 
			</tr>
			<!-- 댓글다는곳 -->
			<tr style="min-height: 60px; border-top: 1px solid rgba(0,0,0,.0975); padding-left: 20px; padding-right: 20px">
			</tr>
		</table>	
	</div>
	</div>
	<!-- /왼쪽 게시글들 -->
	
	
	<!-- 오른쪽 커뮤니티? -->
    <div style="width: 293px; height: 950px; border: 1px solid rgba(0,0,0,.0975); float:right; border-radius: 3px;">	


    </div>
    <!-- /오른쪽 커뮤니티? -->
</div>	
</form>
<!-- /mid -->

<!-- footer -->
<form>
	<div style="width: 100%; height: 40px;background: black; margin: 0px; position: fixed; bottom:0px;">
	</div>
</form>
<!-- /footer -->
</body>
</html>