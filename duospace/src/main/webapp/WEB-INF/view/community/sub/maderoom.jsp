<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
function formCheck() {
	var f=document.allForm;
    var title = f.title.value;
    if (title == null || title == "") {
        alert('클럽 이름을 입력하세요');
        f.title.focus();
        return;
    }
    
    
}

</script>


<h3>밴드이름</h3>
<form method=post action="url" name="allForm">
       <input type=text name="test" value="" size=20 maxlength=20 placeholder="클럽 이름 입력">
       <input type=button value="동현" onclick="formCheck();">
</form>

<table>
	<tr>
		<td>
			<a href="#">
				<img alt="" src="<%=cp%>/resource/images/2.JPG">
			</a>
			<a href="#">
				<img alt="" src="<%=cp%>/resource/images/3.JPG">
			</a>
			<a href="#">
				<img alt="" src="<%=cp%>/resource/images/4.JPG">
			</a>
			<a href="#">
				<img alt="" src="<%=cp%>/resource/images/5.JPG">
			</a>
			<a href="#">
				<img alt="" src="<%=cp%>/resource/images/6.JPG">
			</a>
		</td>
	</tr>	
</table>

