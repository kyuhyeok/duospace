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
</head>
<body>
<div style="margin-top: 50px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 50px;">지점리스트</div>
	<div>
	  <table style="border-spacing: 0px; border-collapse: collapse; width: 100%;">
	    <tr>
	      <td align="left"> 0개 (0/1 페이지)
	     
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
    	  <th>작성일</th>
    	  <th>조회수</th>
    	  <th>첨부</th>
    	</tr>
    	<tr height="38px;">
    	  <td>
	         <input type="checkbox" name="checkAll">
	      </td>
    	  <td>1</td>
    	  <td>
    	  <a href="#"> 제목</a></td>
    	  <td>2017-12-05</td>
    	  <td>1</td>
    	  <td>
    	  </td>
    	</tr>
 	  </table>
	</div>
<div class="noticePage" align="center">
	페이징
</div>

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
      
    </td>
    <td align="right">
      <button type="button" onclick="javascript:location.href='<%=cp%>/">글올리기</button>
    </td>
  </tr>

  </table>

</form>

</body>
</html>
