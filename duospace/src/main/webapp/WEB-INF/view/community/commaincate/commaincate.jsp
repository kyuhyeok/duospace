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



	str = f.boardName.value;
    if(!str) {
        alert("게시판 이름을 적으세요. ");
        f.boardName.focus();
        return;
    }

	f.action="<%=cp%>/commaincate/submit";

    f.submit();
}

</script>
<div style="background: #eef0f3; "> 
	<div class="container"style="padding-bottom: 30px; margin-top: 80px; width: 1230px; min-height: 800px;">
  		<div style="width: 100%; margin: 1px; padding: 1px;">
	  		<h1>관리자</h1>
  		</div>
  		<div>
  		<form name="boardForm" method="post">
	  		<table>
	  			<tr style="margin: 1px;">
	  				<td>
	  					<input type="text" name="boardName" >
	  				</td>
	  				<td style="margin: 1px">
	  					<button type="button" class="btn" style="background: #fff; border: 1px solid #cccccc;" onclick="sendOk();">분류 생성</button>
	  				</td>
	  			</tr>
	  		</table>
  		</form>
  		</div>
  </div>
</div>