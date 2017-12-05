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
</head>
<body>

<!-- 프로필 및 아이디 -->
				<div style="height: 30px; padding-left: 15px; padding-right: 15px; margin-top:20px; font-weight: bold; font-size: 16px;">
					<div style="margin-top: 5px;">
						<div style="float: left;margin-right: 8px;">
							<a href="#" style="text-decoration:none; color: black;">
								<img src="#" style="font-family: '나눔고딕';">사딘!!
							</a>
						</div>
						<div style="float:left;"><a href="#" style="text-decoration:none; color: black; font-family: '나눔고딕';">아이디</a></div>
						<div style="float:right;"><a href="#" style="text-decoration:none; color: #ccc; font-family: '나눔고딕';"><img src="<%=cp%>/resource/images/duogram/dot.PNG" style="width: 12px; height: 3px;"></a></div>
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
						<div style="float:left; font-size: 14px; font-weight: bold font-family: '나눔고딕';">좋아요 x개　</div>
						<div style="float:left; font-size: 14px;">
							<a href="#" style="text-decoration:none; color: #999; font-family: '나눔고딕';">댓글x개</a>
						</div>
					</div>
				</div>
				
				<!-- 게시한 글 -->
				<div style="font-family: '나눔고딕'; padding-top: 10px; padding-left: 15px; padding-right: 15px; padding-bottom: 10px; width: 584px; font-weight: normal; font-size: 14px; line-height: 1;">
					<p>오예</p>
					<p>나는 오늘</p>
					<p>집에가면 잔다</p>
					<p>아싸뵤</p>
					<p>뵤뵤뵤</p>
					<p>뵤뵹</p>
				</div>

				<!-- 작성 시간 -->
				<div style="color: #ccc; padding-bottom: 7px; padding-left: 15px; padding-right: 15px; font-family: '나눔고딕'; font-size: 12px">
					2017/11/30
				</div>
		
				<!-- 댓글다는곳 -->
				<div style="height: 50px; margin-left: 15px; margin-right: 15px; border-top: 1px solid rgba(0,0,0,.0975);">
					<input type="text" style="border-radius: 4px; margin-top: 10px; margin-bottom: 7.5px; border: none; width: 584px; height: 25px; font-family: '나눔고딕';" placeholder="　댓글 달기">
				</div>

</body>
</html>