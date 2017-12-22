<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/cssjs/postcode/1506320738556/170925.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
*{
	list-style: none;
}
.body-container{
	background: #ffffff;
}

</style>
<script type="text/javascript">
    function check() {
    	
        var f = document.boardForm;
		
    	
    	var str = f.bookName.value;
        if(!str) {
            alert("도서 이름을 입력하세요. ");
            f.bookName.focus();
            return;
        }
    	
    	str = f.writer.value;
    	if(!str){
    		alert("저자를 입력하세요.");
    		f.writer.focus();
    		return;
    	}
    	
    	 str = f.publisher.value;
    	if(!str){
    		alert("출판사를 입력하세요.");
    		f.publisher.focus();
    		return;
    		
    	}
   		f.action="<%=cp%>/admin/book/${mode}";
		f.submit();
    }
    
    
</script>
<style type="text/css">
</style>
s
<div class="body-container">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> ${mode=='update'? '도서 수정':'도서 등록'}</h3>
    </div>
    <div>
			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40">
			  	<td width="100" bgcolor="#eeeeee" style="text-align: center;"></td>
			  	<td style="padding-left:10px;">
			  	<c:if test="${mode=='created'}">
			  	</c:if>
			  	<c:if test="${mode=='update'}">
			  		${dto.spotName} 
			  	</c:if>
			  		<span id="message" style="color: red;"></span>
			  	</td>
			  </tr>
			  <tr align="left" height="40"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">카테고리</td>
			      <td style="padding-left:10px;"> 
			       <select name="cateNum">
			       	<c:forEach var="vo" items="${listBcategory}">
			       		<option value="${vo.cateNum}" ${dto.cateNum==vo.cateNum?"selected='selected'":""}>${vo.categoryName}</option>
			       	</c:forEach>
			       </select>
			      </td>
			  </tr>
			  <tr align="left" height="40"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">도서 이름</td>
			      <td style="padding-left:10px;"> 
			       <input type="text" name="bookName" class="boxTF" style="width: 30%;" value="${dto.bookName}" placeholder="도서 이름">
			      </td>
			  </tr>
			  <tr align="left" height="40"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;">저자</td>
			      <td style="padding-left:10px;">
			        <input type="text" name="writer" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.writer}" placeholder="저자 ">
			      </td>
			  </tr>
			  <tr align="left" height="40"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;">출판사</td>
			      <td style="padding-left:10px;">
			        <input type="text" name="publisher" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.publisher}"  placeholder="출판사">
			      </td>
			  </tr>
			  <tr align="left" height="40"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;">출판일</td>
			      <td style="padding-left:10px;">
			        <input type="text" name="pubDate" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.pubDate}"  placeholder="년-월-일">
			      </td>
			  </tr>
			   <tr align="left" height="40">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">도서이미지</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53" style="height: 25px;">
			       </td>
			  </tr>
			  <tr align="left" height="40"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.user.userName}
			      </td>
			  </tr>
			 
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn btn-success btn-sm" onclick="check();">${mode=='update'? '수정완료': '등록하기' }</button>
			        <button type="reset" class="btn btn-warning btn-sm">다시입력</button>
			        <button type="button" class="btn btn-danger btn-sm" onclick="javascript:location.href='<%=cp%>/admin/booklist?page=${page}'">${mode=='update'?'수정취소':'등록취소'}</button>
			      </td>
			    </tr>
			  </table>
			  <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="spotCode" value="${dto.spotCode}">
			        	 <input type="hidden" name="page" value="${page}">
			         	 <input type="hidden" name="saveFileName" value="${dto.saveFileName}">
			         	 <input type="hidden" name="roomCode" value="${dto.roomCode}">
			  </c:if>
			  
			</form>
			

    </div>
</div>
<script type="text/javascript">
</script>
