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
//모달 글쓰기창 띄우기.
function dialogNewWord() {
    $("#modalSubject").val("");
    $("#modalContent").val("");
	$("#modalNewWord").modal("show");
    $("#modalContent").focus();
}
</script>
</head>
<body>
<div id="modalNewWord" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h2 id="myModalLabel" class="modal-title text-center fc-orange"
					style="font-family: sans-serif, 나눔고딕, 맑은 고딕; font-weight: bold;">글쓰기</h2>
			</div>
			<div class="modal-body">
				<form name="modalNewWordForm" method="post">
					<input type="hidden" name="cmoimCode" value="">
					<div class="form-group">
						<textarea rows="10" cols="78" style="border: none;" id="modalContent" name="content" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="form-group">
						<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;">
							<div style="margin: 15px; float: left; padding-left: 50px;">
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
							</div>
							<div style="margin: 15px; float: right; padding-right: 50px;">
								<button type="button" class="btn" onclick="sendFreeboard();">
									글쓰기
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>