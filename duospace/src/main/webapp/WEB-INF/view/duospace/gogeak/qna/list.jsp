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
	f.action="<%=cp%>/duospace/qna/list";
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
		f.action="<%=cp%>/duospace/qna/deleteList";
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
input:focus{
	outline: none;
	border: none;
	border-bottom: 1px solid #cccccc;
}
input{
	border: none;
	border-bottom: 1px solid #cccccc;
}
.btns{
	background-color: transparent;
	outline: none;
	border: 1px solid #172a40;
	font-family: 'Noto Sans KR', sans-serif;
	padding: 5px 7px;
	color: #172a40;
}
.btns:hover{
	background-color: #172a40;
	color: #ffffff;
}
.searchbtn {
	background-color: transparent;
	outline: none;
	border: none;
}
.subjects:hover{
	font-weight: bold;
}
</style>

	<div class="col-sm-12 body-frame-2">



<div style="margin-top: 30px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 30px;">1:1문의게시판</div>


	<div>

    <form name="deleteList" method="post">
    <div>
    <div style="float: left; margin-bottom: 10px;">
    <c:if test="${sessionScope.user.userId=='admin'}">
    	<button type="button" class="btns" id="deletelistBtn">삭제</button>
    </c:if>
    </div>
    <div style="float: right;margin-bottom: 20px;">
    	<form name="searchForm" method="post">
		  <table>
		  	<tr> 
		    <td>
		      <select name="searchCode">
		        <option value="" selected="selected">전체</option>
		        <option value="1">예약/결제</option>
		        <option value="2">이용권</option>
		        <option value="3">카페</option>
		        <option value="4">도서예약</option>
		        <option value="5">회원가입/로그인</option>
		        <option value="6">기타문의</option>
		      </select>
		      <select name="searchKey">
		        <option value="subject">제목</option>
		        <option value="content">내용</option>
		        <option value="email">아이디</option>
		        <option value="name">이름</option>
		        <option value="created">등록일</option>
		      </select>
		      <input type="text" name="searchValue">
		      <button type="button" class="searchbtn" onclick="changeRows(this.form)"><span class="glyphicon glyphicon-search"></span></button>
		     
		    </td>
		  </tr>
				
		  </table>
			<input type="hidden" name="page" value="${page}">
		</form>
    </div>
    </div>
 	  <table class="noticeList" style="margin:10px auto 0px;border-spacing: 0px; border-collapse: collapse; width: 100%">
 	    <tr style="background: #172a40; border-top: 1px solid black; border-bottom: 1px solid black;color: #ffffff;" height="35px;">
    	 <c:if test="${sessionScope.user.userId=='admin'}">
    	  <th>
	         <input type="checkbox" name="checkAll"> 
	      </th>
	      </c:if>
    	  <th>번호</th>
    	  <th width="8%">구분</th>
    	  <th width="60%">제목</th> 
    	  <th>작성자</th>
    	  <th>작성일</th>
    	</tr>

    
    	<c:forEach items="${list}" var="dto">
    	<tr height="38px;">
    	<c:if test="${sessionScope.user.userId=='admin'}">
    	  <td>
	         <input type="checkbox" name="nums" value="${dto.num}">
	      </td>
	     </c:if>
    	  <td>${dto.listNum}</td>
    	  <td><span style="font-size: 12px; color: gray">[${dto.qnaName}]</span></td>
    	  <td style="text-align: left; padding-left: 20px;">
    	  <c:if test="${dto.answer!='0'}">
      		&nbsp;&nbsp;<img src="<%=cp%>/resource/images/duospace/icon/re.gif">&nbsp;
  		  </c:if> 
    	   <a class="subjects" href="${articleUrl}&num=${dto.num}" style="color: black;"> ${dto.subject}</a>
    	   <c:if test="${dto.gap<1}">
    	   	<img src="<%=cp%>/resource/images/duospace/icon/new.gif" style="max-height: 10px;">
    	   </c:if>
    	   </td>
    	  <td>${dto.name}</td>
    	  <td>${dto.created}</td>

    	</tr>
   		</c:forEach>
   		
 	  </table>
       <input type="hidden" name="page" value="${page}">
 	 </form>
	</div>


  <table style="width: 100%; margin-bottom: 100px;">
  <tr height="50px;">
    <td  align="center">
    ${paging}
    </td>
  </tr>
  <tr>
    <td align="right">
   
   <c:if test="${sessionScope.user.userId!='admin'}">
      <button type="button" onclick="javascript:location.href='<%=cp%>/duospace/qna/created';">글올리기</button>
  </c:if>
    </td>
  </tr>

  </table>


					


	</div>

