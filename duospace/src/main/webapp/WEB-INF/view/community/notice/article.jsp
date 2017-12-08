<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DuoSpace</title>

<link rel="stylesheet"
	href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet"
	href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.min.css"
	type="text/css" />

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css"
	type="text/css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css"
	type="text/css" />


<script type="text/javascript"
	src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">

</style>

</head>
<body>
	<div class="container" role="main">



<div style="margin-top: 100px;"></div>
<div style="font-weight: bold; margin:10px auto; font-size: 25px; margin-bottom: 50px;">공지사항</div>



 <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center" style="background: #e4e4e4;">
				${dto.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			  
			    <td width="50%" align="right" style="padding-right: 5px;">
			       ${dto.created} | 조회 ${dto.hitCount}
			    </td>
			</tr>
			<tr height="35">
			    <td colspan="2" align="right" style="padding-left: 5px;">
			       첨&nbsp;&nbsp;부 :
		           
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			    ${dto.content}
			   </td>
			</tr>
			<tr height="60">
			    <td align="left" colspan="2" valign="top" style="padding-top: 5px;">
			   
			        <button type="button"  onclick="javascript:location.href='<%=cp%>/community/notice/list';">리스트</button>
			        <button type="button"  onclick="javascript:location.href='<%=cp%>/community/notice/update?noticenum=${dto.noticenum}&page=${page}';">수정</button>  
			         <button type="button"  onclick="javascript:location.href='<%=cp%>/community/notice/deletenotice?noticenum=${dto.noticenum}&page=${page}';">삭제</button>
			    </td>
			    
			</tr>
			
			
			</table>
			
			<table style="width: 100%; margin: 20px auto 20px; border-spacing: 0px;">
			
			  <tr height="35" style="border-bottom: 1px dashed #cccccc;border-top: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			       <c:if test="${not empty preReadDto}">
			       	
			       <a href="<%=cp%>/community/notice/article?${query}&noticenum=${preReadDto.noticenum}">${preReadDto.subject}</a>
			       </c:if>  
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			       <c:if test="${not empty nextReadDto}">
			       <a href="<%=cp%>/community/notice/article?${query}&noticenum=${nextReadDto.noticenum}">${nextReadDto.subject}</a>
			        </c:if> 
			    </td>
			</tr>
			</table>
    </div>
		</div>

	<script type="text/javascript"
		src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>

	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>