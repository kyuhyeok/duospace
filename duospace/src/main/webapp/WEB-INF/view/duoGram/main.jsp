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
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
.logo{
	font-family:Airways;
}

.wrap {
width: 500px;
}

.wrap textarea {
width: 100%;
resize: none;
overflow-y: hidden; /* prevents scroll bar flash */
padding: 1.1em; /* prevents text jump on Enter keypress */
padding-bottom: 0.2em;
line-height: 1.6;
}


</style>
  
<script>
    $(document).ready(function() {
      $('.wrap').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
</script>
 
</head>
<body style="margin: 0px; height: 100%; width: 100%;">

<!-- header -->
<form>
	<div style="background: #32b0e5; position: fixed; top:0px; margin: 0px; width: 100%; height:80px; border-bottom: 5px solid #2c7492;" align="center">
		<table style="height: 80px; width: 935px; margin: 0px;">
			<tr>
				<td align="left" width="311px">
    	  			<input type="text" style="border: 2px solid #25576d; border-radius: 10px; 
      				height: 25px; width: 160px; background: #2fa6d8; color: white;" placeholder="                 검색">
				</td>
			
				<td align="center"> 
					<a href="<%=cp%>/duogram" class="logo" style="font-size: 46px; text-decoration:none; color: white;">Duo Gram</a>			
				</td>
			
				<td align="right" width="311px">
					<a href="#" style="font-family: 굴림; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> 친구 |</a>
					<a href="<%=cp%>/main" style="font-family: 굴림; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> HOME   |</a>
					<a href="#" style="font-family: 굴림; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> 기록 |</a>
					<a href="#" style="font-family: 굴림; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> 마이페이지</a>
				</td>
			</tr>
		</table>
</div>
</form>
	<!-- /header -->
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
				
				<!-- 게시글 등록 및 동영상 추가 -->
				<div style="height: 30px;background: #e9ebee; border-bottom: 1px solid #dddfe2;">
					<div align="left" style="margin-left: 15px; margin-right: 15px; padding-bottom: 10px; padding-top: 5px; font-size: 14px; font-weight: bold;">글쓰기
					</div>
				</div>
				
				<!-- 내용 입력 -->
				<div style="margin-top: 10px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
					<textarea style="border:none; resize: none; width: 584px; height: 60px;" placeholder="내용을 입력해주세요."></textarea>
				</div>
				
				<!-- 첨부파일 -->
				<div style="border-top: 1px solid #ccc; margin-bottom: 10px; margin-left: 15px; margin-right: 15px;"></div>
					<div style="height: 40px; padding-left: 15px; padding-right: 15px;">
						<a href="#"><input type="text" placeholder="첨부파일" style="border-radius: 4px; border: 1px solid rgba(0,0,0,.0975); width: 250px; height: 28px;"></a>
						<button class="button pull-right" style="border: 2px solid #ccc; background: #ccc; width: 80px; color: white; height: 28px; font-size: 12px; border-radius: 3px; margin-left: 8px;">게시글 등록</button>
						<button class="button pull-right" style="border: 2px solid #ccc; background: #ccc; width: 80px; color: white; height: 28px; font-size: 12px; border-radius: 3px; ">동영상 추가</button>
				</div>
			</div>
	
			<!-- 왼쪽 게시글들 -->
			<div style="width: 614px; border: 1px solid rgba(0,0,0,.0975); float:left; background-color: white; border-radius: 3px;">
				<!-- 프로필 및 아이디 -->
				<div style="height: 30px; padding-left: 15px; padding-right: 15px; margin-top:20px; font-weight: bold; font-size: 16px;">
					<div style="margin-top: 5px;">
						<div style="float: left;margin-right: 8px;">
							<a href="#" style="text-decoration:none; color: black;">
								<img src="#" style="font-family: 굴림">사딘!!
							</a>
						</div>
						<div style="float:left;"><a href="#" style="text-decoration:none; color: black;">아이디</a></div>
						<div style="float:right;"><a href="#" style="text-decoration:none; color: #ccc;"><img src="<%=cp%>/resource/images/dot.PNG" style="width: 12px; height: 3px;"></a></div>
					</div>
				</div>
		
				<!-- 사진 -->
				<div style="border-top: 1px solid #ccc; margin-bottom: 10px; margin-top: 10px;max-width:100%;height: 100%;overflow: hidden;">
					<a>
						<img style="max-width:100%;border: 0;"
						src="https://scontent-icn1-1.xx.fbcdn.net/v/t15.0-10/24133944_966022340205707_6194669685078753280_n.jpg?oh=cf7e75a1afcae89eabb2928519009a28&oe=5A9CE0E2">
					</a>
				</div>
		
				<!-- 좋아요 아이콘 -->
				<div style="padding-left: 15px; padding-right: 15px;">
					<a href="#" style="text-decoration:none; color: black; font-size: 35px;">♥</a>
				</div>
				
				<!-- 좋아요 갯수표시 -->
				<div style="height: 15px; margin-bottom: 10px; padding-left: 15px; padding-right: 15px;">
					<div style="margin-top: 5px;">
						<div style="float:left; font-size: 14px; font-weight: bold">좋아요 x개　</div>
						<div style="float:left; font-size: 14px;">
							<a href="#" style="text-decoration:none; color: #999;">댓글x개</a>
						</div>
					</div>
				</div>
				
				<!-- 게시한 글 -->
				<div style="padding-top: 10px; padding-left: 15px; padding-right: 15px; padding-bottom: 10px; width: 584px; font-weight: normal; font-size: 14px; line-height: 1;">
					<p>오예</p>
					<p>나는 오늘</p>
					<p>집에가면 잔다</p>
					<p>아싸뵤</p>
					<p>뵤뵤뵤</p>
					<p>뵤뵹</p>
				</div>

				<!-- 작성 시간 -->
				<div style="color: #ccc; padding-bottom: 7px; padding-left: 15px; padding-right: 15px; font-size: 12px">
					2017/11/30
				</div>
		
				<!-- 댓글다는곳 -->
				<div style="height: 50px; margin-left: 15px; margin-right: 15px; border-top: 1px solid rgba(0,0,0,.0975);">
					<input type="text" style="border-radius: 4px; margin-top: 10px; margin-bottom: 7.5px; border: none; width: 584px; height: 25px;" placeholder="　댓글 달기">
				</div>
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
				<a href="#" style="text-decoration:none; color: black; font-size: 14px;">Hajimemasitda</a>
			</div>
			<div style="display: table-cell; vertical-align: middle; color: #999; font-size: 14px;">김종기</div>
	</div>
	
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 14px; font-weight: bold; color: #999">
			친구생일 
			<a href="#"><img src="<%=cp%>/resource/images/gear.PNG" style="width: 10px; height: 10px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 14px; font-weight: bold; color: #999">
			다가오는 일정 
			<a href="#"><img src="<%=cp%>/resource/images/gear.PNG" style="width: 10px; height: 10px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 14px; font-weight: bold; color: #999">
			커뮤니티 순위 
			<a href="#"><img src="<%=cp%>/resource/images/gear.PNG" style="width: 10px; height: 10px;"></a>
		</div>
    </div>
    
    <!-- 기업..내용? -->
    <div style="border-top: 1px solid rgba(0,0,0,.0975); width: 293px; padding-left: 5px; padding-right: 5px; padding-top: 2px; float: right; color: #ccc; font-size: 12px;">ⓒ 2017 DUOGRAM
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