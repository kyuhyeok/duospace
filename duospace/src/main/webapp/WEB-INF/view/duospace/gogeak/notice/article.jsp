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

<link rel="stylesheet" href="<%=cp%>/resource/css/style2.css"
	type="text/css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/layout2.css"
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



<div style="margin-top: 50px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 50px;">공지사항</div>



 <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center" style="background: #e4e4e4;">
				  제목
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 :작성자
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			       20070905 | 조회 10
			    </td>
			</tr>
			<tr height="35">
			    <td colspan="2" align="right" style="padding-left: 5px;">
			       첨&nbsp;&nbsp;부 :
		           
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			     내용
			   </td>
			</tr>
			<tr height="60">
			    <td align="left" colspan="2" valign="top" style="padding-top: 5px;">
			        <button type="button" class="btn" onclick="javascript:location.href='';">리스트</button>
			    </td>
			</tr>
			
			
			</table>
			
			<table style="width: 100%; margin: 20px auto 20px; border-spacing: 0px;">
			
			  <tr height="35" style="border-bottom: 1px dashed #cccccc;border-top: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         
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