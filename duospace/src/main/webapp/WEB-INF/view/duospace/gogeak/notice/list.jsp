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
.noticeList tr{
	border-bottom: 1px solid black;
	
}
</style>

</head>
<body>
	<div class="container" role="main">



<div style="margin-top: 50px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 50px;">공지사항</div>


	<div>
	  <table style="border-spacing: 0px; border-collapse: collapse; width: 100%;">
	    <tr>
	      <td align="left">8개 (1/1 페이지) <button type="button">삭제</button></td>
	     
	      <td align="right">
			<form name="listRows" method="post">
			   <select name="rows" id="rows">
			     <option value="5">5개씩출력</option>
			     <option value="10">10개씩출력</option>
			     <option value="15">15개씩출력</option>
			   </select>
			</form>
		  </td>
	    </tr>
	  </table>
	  
    
 	  <table class="noticeList" style="margin:10px auto 0px;border-spacing: 0px; border-collapse: collapse; width: 100%">
 	    <tr style="background: #eeeeee; border-top: 1px solid black" height="35px;">
    	  <th>
	         <input type="checkbox" name="checkAll">
	      </th>
    	  <th>번호</th>
    	  <th width="40%">제목</th>
    	  <th>작성자</th>
    	  <th>작성일</th>
    	  <th>조회수</th>
    	  <th>첨부</th>
    	</tr>
    	<tr height="38px;">
    	  <td>
	         <input type="checkbox" name="checkAll">
	      </td>
    	  <td>8</td>
    	  <td>제목입니당</td>
    	  <td>홍길동</td>
    	  <td>2019-08-06</td>
    	  <td>1</td>
    	  <td></td>
    	</tr>
 	  </table>
	</div>

<div class="noticePage">1</div>


<form name="searchForm" method="post">
  <table style="width: 100%">
  <tr> 
    <td>
      <select name="searchKey">
        <option value="subject">제목</option>
        <option value="content">내용</option>
        <option value="created">등록일</option>
      </select>
      <input type="text" name="searchValue">
      <button type="button" >검색</button>
      <input type="hidden" name="rows" value="${rows}">
    </td>
    <td align="right">
   
      <button type="button" onclick="javascript:location.href='<%=cp%>/duospace/notice/created';">글올리기</button>
  
    </td>
  </tr>

  </table>

</form>
					

		











	</div>

	<script type="text/javascript"
		src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>

	<script type="text/javascript"
		src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>