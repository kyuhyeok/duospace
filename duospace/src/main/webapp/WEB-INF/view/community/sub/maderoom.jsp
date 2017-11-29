<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<head>
<h3>밴드이름</h3>
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
</head>


<body>
<form method=post action="url" name="allForm">
       <input type=text name="test" value="" size=20 maxlength=20 placeholder="클럽 이름 입력">
       <input type=button value="동현" onclick="formCheck();">
</form>

</body>
