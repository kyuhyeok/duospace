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
<script type="text/javascript">
function sendInfo() {
	var uid="${sessionScope.user.memberNum}";
	if(!uid){
		location.href="<%=cp%>/member/login";
		return;
	} 
	// 공백이 있으면 다시 채팅창 깜빡이
	var intro=$.trim($("#intro").val());
	if(! intro) {
		$("#intro").focus();
		alert("자신을 소개해 주세요");
		return;
	}
	
	var company=$.trim($("#company").val());
	if(! company) {
		$("#company").focus();
		alert("학교를 입력해 주세요");
		return;
	}
	
	var school=$.trim($("#school").val());
	if(! school) {
		$("#school").focus();
		alert("학교를 입력해 주세요");
		return;
	}
	
	var home=$.trim($("#home").val());
	if(! home) {
		$("#home").focus();
		alert("거주지를 입력해 주세요");
		return;
	}
	
	
	var f=document.myinfoForm;
	f.answer.value=0;

	var q = new FormData(f);
	var url="<%=cp%>/duogram/mygram/insert";
	
	
	$.ajax({
		type:"post"
		,url:url
        ,processData: false  // file 전송시 필수
        ,contentType: false  // file 전송시 필수
		,data:q
		,dataType:"json"
		,success:function(data) {
			$("#content").val("");
			$("#company").val("");
			$("#school").val("");
			$("#home").val("");
			// 글쓰기 후 새로고침
			$("#listDuogramBody").empty();
			pageNo=1;
			listPage(1);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});

}
</script>
</head>

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<body style="background: #e9ebee">

<form>
	<table class="form-horizontal" style="margin-bottom: -200px; background: white; height: 700px; width: 600px; margin:auto; margin-top: 100px; border: 1px solid #ccc; padding-left: 15px;">
		<tr>
			<td style="width: 120px; text-align: center;">소개</td>
			<td>
			<input type="text" id="intro" style="margin: auto; width: 450px;" class="form-control" placeholder="소개">
			</td>
		</tr>
		<tr>
			<td style="width: 120px; text-align: center;">커버사진</td>
			<td>
			<input type="text" id="coversavefilename" style="margin: auto; width: 450px;" class="form-control" placeholder="커버사진">
			</td>
		</tr>
		<tr>
			<td style="width: 120px; text-align: center;">프로필사진</td>
			<td>
			<input type="text" id="profilesavefilename" style="margin: auto; width: 450px;" class="form-control" placeholder="프로필사진">
			</td>
		</tr>
		<tr>	
			<td style="width: 120px; text-align: center;">직장</td>
			<td>
			<input type="text" id="company" style="margin: auto; width: 450px;" class="form-control" placeholder="직장">
			</td>
		</tr>
		<tr>	
			<td style="width: 120px; text-align: center;">학교</td>
			<td>
			<input type="text" id="school" style="margin: auto; width: 450px;" class="form-control" placeholder="학교">
			</td>
		</tr>
		<tr>
			<td style="width: 120px; text-align: center;">거주지</td>
			<td>
			<input type="text" id="home" style="margin: auto; width: 450px;" class="form-control" placeholder="거주지">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sendInfo()">등록하기</button>
				<button type="reset">돌아가기</button>
			</td>
		</tr> 
	</table>
</form>
</body>
</html>