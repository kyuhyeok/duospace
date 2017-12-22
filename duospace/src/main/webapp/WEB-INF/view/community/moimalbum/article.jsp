<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
.bbs-article .table {
    margin-top: 15px;
}
.bbs-article .table thead tr, .bbs-article .table tbody tr {
    height: 30px;
}
.bbs-article .table thead tr th, .bbs-article .table tbody tr td {
    font-weight: normal;
    border-top: none;
    border-bottom: none;
}
.bbs-article .table thead tr {
    border-top: #d5d5d5 solid 1px;
    border-bottom: #dfdfdf solid 1px;
} 
.bbs-article .table tbody tr {
    border-bottom: #dfdfdf solid 1px;
}
.bbs-article .table i {
    background: #424951;
    display: inline-block;
    margin: 0 7px 0 7px;
    position: relative;
    top: 2px;
    width: 1px;
    height: 13px;    
}

.bbs-reply {
    font-family: NanumGothic, 나눔고딕, "Malgun Gothic", "맑은 고딕", 돋움, sans-serif;
}

.bbs-reply-write {
    border: #d5d5d5 solid 1px;
    padding: 10px;
    min-height: 50px;
}
</style>

<script type="text/javascript">
function deleteMoimalbum(){
	<c:if test="${sessionScope.user.memberNum==dto.memberNum || sessionScope.user.userId=='admin'}">
	var alnum = "${dto.alnum}";
	var page = "${page}";
	var query = "alnum="+alnum+"&page="+page;
	var url = "<%=cp%>/moimalbum/delete?" + query;
	
	if(confirm("위 자료를 삭제 하시겠습니까?"))
		location.href=url;
	</c:if>
	<c:if test="${sessionScope.user.memberNum!=dto.memberNum && sessionScope.user.userId!='admin'}">
		alert("게시물을 삭제할 수 없습니다.");
	</c:if>
}

function updateMoimalbum(){
	<c:if test="${sessionScope.member.memberNum==dto.memberNum}">
	  var alnum = "${dto.alnum}";
	  var page = "${page}";
	  var query = "alnum="+alnum+"&page="+page;
	  var url = "<%=cp%>/moimalbum/update?" + query;

	  location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.memberNum!=dto.memberNum}">
	 alert("게시물을 수정할 수  없습니다.");
	</c:if>

	
}

</script>




    <div class="body-title">
          <h3><span class="glyphicon glyphicon-picture"></span> 포토갤러리 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 추억의 포토 갤러리를 회원과 공유할 수 있는 공간입니다.
    </div>
    
 
        <div class="bbs-article">
            <table class="table">
                 <thead>
                     <tr>
                         <th colspan="2" style="text-align: center;">
                                ${dto.subject}
                         </th>
                     </tr>
                <thead>
                 <tbody>
                     <tr>
                         <td style="text-align: left;">
                             이름 : ${dto.name}
                         </td>
                         <td style="text-align: right;">
                          ${dto.created}
                         </td>
                     </tr>
                     
                     <tr style="border-bottom:none;">
                         <td colspan="2">
                             <img src="<%=cp%>/uploads/moimalbum/${dto.imageFile}" style="max-width:100%; height:auto; resize:both;">
                         </td>
                     </tr>
                     
                     <tr style="border-bottom: none;">
                         <td colspan="2" style="min-height: 30px;">
                             
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="height: 40px; padding-bottom: 15px; text-align: center;">
                              <button type="button" class="btn btn-default btn-sm wbtn" style="background: white;" onclick="sendLikeMoimalbum('${dto.alnum}')"><span class="glyphicon glyphicon-hand-up"></span> <span id="countLikeMoimalbum">${countLikeMoimalbum}</span></button>
                         </td>
                     </tr>
                     
                     <tr>
                         <td colspan="2">
                              <span style="display: inline-block; min-width: 45px;">이전글</span> :
                               <c:if test="${not empty preReadDto }">
                                  <a href="<%=cp%>/moimalbum/article?${query}&alnum=${preReadDto.alnum}">${preReadDto.subject}</a>
                              </c:if>	
                         </td>
                     </tr>
                     <tr>
                         <td colspan="2" style="border-bottom: #d5d5d5 solid 1px;">
                              <span style="display: inline-block; min-width: 45px;">다음글</span> :
                                <c:if test="${not empty nextReadDto }">
                                  <a href="<%=cp%>/moimalbum/article?${query}&alnum=${nextReadDto.alnum}">${nextReadDto.subject}</a>
                              </c:if>	
                         </td>
                     </tr>                                          
                </tbody>
                <tfoot>
                	<tr>
                		<td>
<c:if test="${sessionScope.user.memberNum==dto.memberNum}">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="updateMoimalbum();">수정</button>
</c:if>
<c:if test="${sessionScope.user.memberNum==dto.memberNum || sessionScope.user.userId=='admin'}">	                		    
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="deleteMoimalbum();">삭제</button>
</c:if>                		    
                		</td>
                		<td align="right">
                		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/moimalbum/list';"> 목록으로 </button>
                		</td>
                	</tr>
                </tfoot>
            </table>
       </div>
