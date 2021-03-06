<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
function sendOk() {
    var f = document.boardForm;

	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
	f.action="<%=cp%>/community/${mode}";

    f.submit();
}

</script>
<div style="width: 100%; min-height: 800px; background:#eef0f3; margin-top: 100px;">
	<div style="width: 800px; margin: 10px auto 0px;">
		<div>
			<form name="boardForm" method="post">
				<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
					<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
						<td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td style="padding-left:10px;"> 
							<input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
						</td>
					</tr>
					<tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
						<td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
						<td style="padding-left:10px;"> 
							${sessionScope.user.userName}
						</td>
					</tr>
					
					<tr align="left" style="border-bottom: 1px solid #cccccc;"> 
						<td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
						<td valign="top" style="padding:5px 0px 5px 10px;">
							<textarea name="content" id="content" style="width: 95%; height: 470px;">${dto.content}</textarea>
						</td>
					</tr>
				</table>
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					<tr height="45"> 
						<td align="center" >
							<input type="hidden" name="cateNum" value="${cateNum}">
							<input type="hidden" name="page" value="${page}"><!-- 수정할때 page,boardNum c:if사용. -->
							<c:if test="${mode=='update'}">
								<input type="hidden" name="boardNum" value="${boardNum}">
							</c:if>
							<button type="button" class="btn" style="background: #ffffff; border: 1px solid #cccccc;" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
							<button type="reset" class="btn" style="background: #ffffff; border: 1px solid #cccccc;">다시입력</button>
							<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/community/list?cateNum=${cateNum}';" style="background: #ffffff; border: 1px solid #cccccc;">${mode=='update'?'수정취소':'등록취소'}</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>