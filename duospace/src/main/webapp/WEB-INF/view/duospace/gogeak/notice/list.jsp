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
	      <td align="left">${dataCount}개 (${page}/${total_page} 페이지) <button type="button">삭제</button></td>
	     
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
    
     <c:forEach var="dto" items="${listTop}">
    	
    	<tr height="38px;">
    	  <td>
	         <input type="checkbox" name="checkAll">
	      </td>
    	  <td>공지</td>
    	  <td>
    	  <a href="${articleUrl}&num=${dto.num}" style="font-weight: bold;"> ${dto.subject}</a></td>
    	  <td>${dto.created}</td>
    	  <td>${dto.hitCount}</td>
    	  <td>
    	    <c:if test="${not empty dto.saveFilename}">
    	      <img src="<%=cp%>/resource/images/duospace/icon/disk.gif">
    	    </c:if>
    	  </td>
    	</tr>
    </c:forEach>
    
    
    <c:forEach var="dto" items="${list}">
    	
    	<tr height="38px;">
    	  <td>
	         <input type="checkbox" name="checkAll">
	      </td>
    	  <td>${dto.listNum}</td>
    	  <td>
    	  <a href="${articleUrl}&num=${dto.num}"> ${dto.subject}</a></td>
    	  <td>${dto.created}</td>
    	  <td>${dto.hitCount}</td>
    	  <td>
    	    <c:if test="${not empty dto.saveFilename}">
    	      <img src="<%=cp%>/resource/images/duospace/icon/disk.gif">
    	    </c:if>
    	  </td>
    	</tr>
    </c:forEach>
 	  </table>
	</div>

<div class="noticePage" align="center">
	${paging}
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
      <input type="hidden" name="rows" value="${rows}">
    </td>
    <td align="right">
   
      <button type="button" onclick="javascript:location.href='<%=cp%>/duospace/notice/created';">글올리기</button>
  
    </td>
  </tr>

  </table>

</form>
					


	</div>

