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
function changeRows(f){
	f.action="<%=cp%>/duospace/notice/list";
	f.submit();
}
$(function(){
	$("input[name=checkAll]").click(function(){
		if(this.checked==true){
			$("input[name=nums]").each(function(){
				this.checked = true;
			})
		}else{
			$("input[name=nums]").each(function(){
				this.checked=false;
			});
		}
	});
	
	$("#deletelistBtn").click(function(){
		var cnt = $("input[name=nums]:checkbox:checked").length;
		
		if(cnt==0){
			alert("선택된 항목이 없습니다!");
			return;
		}
		
		if(confirm("선택한 항목을 삭제하시겠습니까?")){
		var f=document.deleteList;
		f.action="<%=cp%>/duospace/notice/deleteList";
		f.submit();
		}
		
	})
	
	
});

</script>
<style type="text/css">
.noticeList tr{
	border-bottom: 1px solid #cccccc;
	
}
.noticeList tr th{
	text-align: center;
	
}
.noticeList tr td{
	text-align: center;
	
}
</style>

</head>
<body>
	<div class="col-sm-12 body-frame-2">



<div style="margin-top: 30px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 30px;">공지사항</div>


	<div>
	  <table style="border-spacing: 0px; border-collapse: collapse; width: 100%;">
	    <tr>
	      <td align="left">${dataCount}개 (${page}/${total_page} 페이지) 
	       <c:if test="${sessionScope.user.userId=='admin'}">
	     	 <button type="button" id="deletelistBtn">삭제</button>
	       </c:if>
	       </td>
	      <td align="right">
			<form name="listRows" method="post">
			   <select name="rows" id="rows" onchange="changeRows(this.form);">
			     <option value="5"  ${rows==5?"selected='selected'":""}>5개씩출력</option>
			     <option value="10" ${rows==10?"selected='selected'":""}>10개씩출력</option>
			     <option value="15" ${rows==15?"selected='selected'":""}>15개씩출력</option>
			   </select>
			</form>
		  </td>
	    </tr>
	  </table>
	  
    <form name="deleteList" method="post">
 	  <table class="noticeList" style="margin:10px auto 0px;border-spacing: 0px; border-collapse: collapse; width: 100%">
 	    <tr style="background: #eeeeee; border-top: 1px solid black; border-bottom: 1px solid black;" height="35px;">
    	 <c:if test="${sessionScope.user.userId=='admin'}">
    	  <th>
	         <input type="checkbox" name="checkAll">
	      </th>
	      </c:if>
    	  <th>번호</th>
    	  <th width="40%">제목</th>
    	  <th>작성일</th>
    	  <th>조회수</th>
    	  <th>첨부</th>
    	</tr>
    
     <c:forEach var="dto" items="${listTop}">
    	
    	<tr height="38px;">
    	 <c:if test="${sessionScope.user.userId=='admin'}">
    	  <td>
	         <input type="checkbox" name="nums" value="${dto.num}">
	      </td>
	      </c:if>
    	  <td style="width: 10%"><span>공지</span></td>
    	  <td style="text-align: left; width: 60%">
    	  <a href="${articleUrl}&num=${dto.num}" style="font-weight: bold;"> ${dto.subject}</a></td>
    	  <td>${dto.created}</td>
    	  <td>${dto.hitCount}</td>
    	  <td>
    	     <c:if test="${not empty dto.saveFilename}">
    	      <a href="<%=cp%>/duospace/download?num=${dto.num}"><img src="<%=cp%>/resource/images/duospace/icon/disk.gif"></a>
    	    </c:if>
    	  </td>
    	</tr>
    </c:forEach>
    
    
    <c:forEach var="dto" items="${list}">
    	
    	<tr height="38px;">
    	<c:if test="${sessionScope.user.userId=='admin'}">
    	  <td>
	         <input type="checkbox" name="nums" value="${dto.num}">
	      </td>
	     </c:if>
    	  <td>${dto.listNum}</td>
    	  <td style="text-align: left">
    	  <a href="${articleUrl}&num=${dto.num}"> ${dto.subject}</a></td>
    	  <td>${dto.created}</td>
    	  <td>${dto.hitCount}</td>
    	  <td>
    	    <c:if test="${not empty dto.saveFilename}">
    	      <a href="<%=cp%>/duospace/download?num=${dto.num}"><img src="<%=cp%>/resource/images/duospace/icon/disk.gif"></a>
    	    </c:if>
    	  </td>
    	</tr>
    </c:forEach>
 	  </table>
 	   <input type="hidden" name="rows" value="${rows}">
       <input type="hidden" name="page" value="${page}">
 	 </form>
	</div>

<form name="searchForm" method="post">
  <table style="width: 100%">
  <tr height="50px;">
    <td colspan="2" align="center">
    ${paging}
    </td>
  </tr>
  <tr> 
    <td>
      <select name="searchKey">
        <option value="subject">제목</option>
        <option value="content">내용</option>
        <option value="created">등록일</option>
      </select>
      <input type="text" name="searchValue">
      <button type="button" onclick="changeRows(this.form)">검색</button>
      <input type="hidden" name="rows" value="${rows}">
      <input type="hidden" name="page" value="${page}">
    </td>

    <td align="right">
   
   <c:if test="${sessionScope.user.userId=='admin'}">
      <button type="button" onclick="javascript:location.href='<%=cp%>/duospace/notice/created';">글올리기</button>
  </c:if>
    </td>
  </tr>

  </table>

</form>
					


	</div>

