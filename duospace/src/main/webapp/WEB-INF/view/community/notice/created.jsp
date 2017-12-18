<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<script type="text/javascript">
function sendOk() {
   F var f = document.createdForm;

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

	f.action="<%=cp%>/community/notice/${mode}";
    f.submit();
}
</script>
<style type="text/css">
.createdTable tr td{
	padding: 5px 10px;
}
</style>

</head>
<body>
	<div class="container" role="main">



<div style="margin-top: 50px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 50px;">공지사항</div>


<form name="createdForm" method="post" enctype="multipart/form-data">
<table class="createdTable" style="width: 700px; margin: 50px auto 0px; border-spacing: 0px; border-collapse: collapse;">
  <tr style="border-bottom: 1px solid #e4e4e4;border-top: 1px solid #e4e4e4;" height="40px;">
    <td align="center" width="100px;" bgcolor="#eeeeee">
        제 목
    </td>
    <td>
       <input type="text" name="subject" class="boxTF" style="width: 500px;" value="${dto.subject}">
    </td>
  </tr>
  <tr style="border-bottom: 1px solid #e4e4e4" height="40px;">
    <td align="center" bgcolor="#eeeeee">
      작성자
    </td>
    <td>
      ${sessionScope.user.userName}
    </td>
  </tr>
  <tr style="border-bottom: 1px solid #e4e4e4; max-height: 350px;">
    <td align="center" bgcolor="#eeeeee">
     내용
    </td>
    <td>
      <textarea rows="10" cols="80" name="content" class="boxTF">${dto.content}</textarea>
    </td>
  </tr>
 <tr style="border-bottom: 1px solid #e4e4e4" height="40px;">
    <td align="center" bgcolor="#eeeeee">
      첨부파일
    </td>
    <td>
       <input type="file" name="upload" class="boxTF">
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <c:if test="${mode=='update'}">
         <input type="hidden" name="noticenum" value="${dto.noticenum}">
         <input type="hidden" name="page" value="${page}">
      </c:if>
      <button type="button" onclick="sendOk();">등록완료</button>
      <button type="reset">다시입력</button>
      <button type="button">등록취소</button>
    </td>
  </tr>
</table>
</form>


	</div>

	