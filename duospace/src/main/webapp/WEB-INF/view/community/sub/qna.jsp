<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<html>
<script type="text/javascript">
$(function(){

	
	$("#accordion1").accordion({
		  activate: function(event, ui) {
			  var h=ui.newHeader;
			  var text=h.text();
			  var num=h.attr("data-num");
			  
		  }
	});

});
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<h2 style="margin-left: 450px;">도움말</h2>
		<table style="margin: 80px auto;" border="1" cellspacing="0" cellpadding="10" width="1200px;" align="center">
		<tr>
			<td colspan="3">검색어를 입력하세요</td>
		</tr>
		<tr>
			<th style="background-color: #FFF7DC">자주 묻는 질문</th>
			<th style="background-color: #FFF7DC">회원가입,로그인,회원정보</th>
			<th style="background-color: #FFF7DC">초대</th>
		</tr>
		<tr>
			<th style="background-color: #FFF7DC">알림, 새소식</th>
			<th style="background-color: #FFF7DC">밴드 설정</th>
			<th style="background-color: #FFF7DC">밴드 멤버</th>
		</tr>
		
		<tr>
			<th style="background-color: #FFF7DC">게시판, 사진첩, 일정</th>
			<th style="background-color: #FFF7DC">채팅</th>
			<th style="background-color: #FFF7DC">스티커샵</th>
		</tr>
		
		<tr>
			<th style="background-color: #FFF7DC">밴드 찾기</th>
			<th style="background-color: #FFF7DC">밴드북</th>
			<th style="background-color: #FFF7DC">밴드 보안 팁</th>
		</tr>
		<tr>
			<th style="background-color: #FFF7DC">기타</th>
			<th style="background-color: #FFF7DC"></th>
			<th style="background-color: #FFF7DC"></th>
		</tr>
	
	</table>
	
	<table>
	<h2 style="margin-left: 450px;">자주 묻는 질문</h2>
	<div id="accordion1">
  <h3 style="width: 1200px; margin-left: 450px;box-sizing: border-box;" data-num="1">기기와 번호가 모두 변경되어 이전 계정에 접속할 수 없어요</h3>
  <div style="width: 1200px; margin-left: 450px;box-sizing: border-box;">
    <p>
      1. 이전에 사용하던 모임 계정에 '페이스북, 네이버id, 이메일' 등 다른 수단을 연동해놓은 경우 
    </p>
  </div>
  <h3 style="width: 1200px; margin-left: 450px;box-sizing: border-box;" data-num="2">개별 모임 탈퇴/삭제는 어떻게 하나요?</h3>
  <div style="width: 1200px; margin-left: 450px;box-sizing: border-box;">
    <p>
    개별 모임에서 탈퇴하고 싶은 경우, 해당 모임오른쪽 하단 [모임 정보 (≡) > 모임 탈퇴하기] 버튼을 클릭해주세요. 

개별 모임를 삭제하고 싶은 경우, 해당 모임 오른쪽 하단 [모임 정보 (≡) > 모임 삭제하기] 버튼을 클릭해주세요. 

모임 삭제는 리더인 경우에만 가능하며, 리더 외의 멤버가 1명 이상 있을 경우 삭제되지 않습니다
    </p>
  </div>
  <h3 style="width: 1200px; margin-left: 450px;box-sizing: border-box;" data-num="3">리더(리더 권한)란 무엇인가요?</h3>
  <div style="width: 1200px; margin-left: 450px;box-sizing: border-box;">
    <p>
      리더는 밴드를 개설했거나 권한을 위임받은 사람으로써 기본적으로 아래와 같은 권한을 갖습니다.
 
1) 밴드 멤버의 글/사진/일정 삭제

2) 밴드 사진첩 앨범명 수정

3) 멤버들의 생일/연락처/멤버 가입글 노출 여부 관리

4) 밴드 멤버 탈퇴 관리

5) 밴드 삭제 (단, 멤버가 0명일 때)

6) 공동리더 설정과 관리

7) 멤버들의 권한 설정

8) 멤버 가입 신청 수락

9) 밴드 타입 설정 (공개, 밴드명 공개, 비공개)

10) 밴드 멤버수 설정

    </p>
  </div>
  <h3 style="width: 1200px; margin-left: 450px;box-sizing: border-box;" data-num="4">일반밴드에서 공동리더의 권한에는 어떤것이 있나요?</h3>
  <div style="width: 1200px; margin-left: 450px;box-sizing: border-box;">
    <p>
    해당 밴드 리더의 설정에 따라, 공동리더의 권한이 다르게 부여됩니다.

해당 밴드 리더는 공동리더에게 아래의 권한을 부여할 수 있습니다.

1. 밴드 이름 및 커버 설정
2. 공지글 등록
3. 게시글, 사진 등록
4. 일정 등록
5. 멤버 초대 권한
6. 멤버 가입 신청 수락 

7. 다른 멤버의 게시물, 댓글 삭제
8. 멤버 탈퇴 관리

위의 항목 중 1~5번은 모든 멤버에게 부여가 가능하나, 6~8번은 공동리더까지만 권한을 부여할 수 있습니다.

      </p>
  </div>
  
</div>
	
	
	</table>

</body>
</html>
