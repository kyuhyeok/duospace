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

<!-- body -->
<div style="background: #fafafa;padding: 0; margin: 0;border: 0px;">
	<div style="width: 935px; max-width: 935px; margin: 60px auto 0;">
		<!-- 왼쪽 글쓰는곳 -->
		<div style="float: left; margin-right: 28px; max-width: 614px; width: 100%;">
			<!-- 왼쪽 게시글 1개 블럭 -->
			<div style="margin:0 -1px 10px; padding:0; border: 1px solid rgba(0,0,0,.0975); background-color: #ffffff; border-radius: 3px;">
				<!-- 게시글 및 프로필사진 및 작성자 및 작성시간 -->
				<div style="padding: 12px 12px 0; border-bottom: 1px solid rgba(0,0,0,.0975);">
					<!-- 프로필사진 및 작성자 및 작성시간 -->
					<div style="margin-bottom: 6px">
						<!-- 프로필사진 -->
						<div style="width:40px;height:40px; float: left;margin-right: 8px;">[사진]
						</div>
						<div style="overflow: hidden;display: inline-block;">
							<!-- 작성자-->
							<div style="width:100%;margin-bottom: 2px;font-size: 14px; line-height: 1.38;">
							쿠루쿠루
							</div>
							<!-- 작성시간 및 공개여부 -->
							<div style="width:100%;font-size: 12px;">1시간 - 공개
							</div>
						</div>
					</div>
					<!-- /프로필 및 작성자 및 작성시간 -->
					<!-- 게시글 -->
					<div style="font-size: 14px;font-weight: normal;line-height: 1.38;">
					<p>살이빠지고</p>
					<p>살이빠지고</p>
					<p>살이빠져용</p>
					</div>
					<!-- 사진 -->
					<div style="margin-top: 10px;max-width:100%;height: 100%;overflow: hidden;">
						<img style="max-width:100%;border: 0;"
							    src="https://scontent-icn1-1.xx.fbcdn.net/v/t15.0-10/24133944_966022340205707_6194669685078753280_n.jpg?oh=cf7e75a1afcae89eabb2928519009a28&oe=5A9CE0E2">
					</div>
				</div>
				<!-- /게시글 및 프로필 및 작성자 및 작성시간 -->
				<!-- 좋아요 및 댓글 -->				
				<!-- /좋아요 및 댓글 -->
				</div>	
			</div>
			<!-- /왼쪽 게시글들 -->
			<!-- 오른쪽 게시글들이 들어갈 블럭 -->
			<div style="float: right;max-width: 293px; width: 293px;padding: 0;">
				<!-- 게시글 블럭1 -->
				<div style="max-width: 291px; width: 293px;padding: 0;margin-bottom:12px; 
						border: 1px solid rgba(0,0,0,.0975); border-radius: 3px;">
				1111
				</div>
				<!-- 게시글 블럭2 -->
				<div style="width: 291px;padding: 0; 
						border: 1px solid rgba(0,0,0,.0975); border-radius: 3px;">
				2222
				</div>
			</div>
   			<!-- /오른쪽 게시글들이 들어갈 블럭 -->
	</div>
   </div>
<!-- /body -->

<!-- footer -->
<form>
	<div style="width: 100%; height: 40px;background: black; margin: 0px; position: fixed; bottom:0px;">
	</div>
</form>
<!-- /footer -->
</body>
</html>