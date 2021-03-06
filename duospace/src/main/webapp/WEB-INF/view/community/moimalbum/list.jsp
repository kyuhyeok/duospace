<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.imgLayout{
	width: 200px;
	height: 230px;
	padding: 5px 5px 5px;
	margin: 5px;
	border: 1px solid #DAD9FF;
	float: left;
}

.subject {
     width:190px;
     height:25px;
     line-height:25px;
     margin:5px auto 0px;
     border-top: 1px solid #DAD9FF;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
     text-align: center;
}
</style>

<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.submit();
}

function article(num) {
	var url="${articleUrl}&alnum="+num;
	location.href=url;
}
</script>


<div style="width: 1050px;margin: 5px auto 0px;">
    <div class="body-title"style="margin: 100px auto 30px;">
          <h3><span class="glyphicon glyphicon-picture"></span> 포토갤러리 </h3>
    </div>
    
    <div class="alert alert-info"  style="background-color: black;">
        <i class="glyphicon glyphicon-info-sign"></i> 추억의 포토 갤러리를 회원과 공유할 수 있는 공간입니다.
    </div>

    <div style="max-width:660px; margin: 0px auto;">
<c:if test="${dataCount!=0 }">    
        <div style="clear: both; height: 30px; line-height: 30px;">
            <div style="float: left;">${dataCount}개(${page}/${total_page} 페이지)</div>
            <div style="float: right;">&nbsp;</div>
        </div>
        
        <div style="clear: both;">
    <c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <c:out value="<div style='clear: both; max-width:660px; margin: 0px auto;'>" escapeXml="false"/>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</div><div style='clear: both; max-width:660px; margin: 0px auto;'>" escapeXml="false"/>
                 </c:if>
			      <div class="imgLayout">
	                     <img src="<%=cp%>/uploads/moimalbum/${dto.imageFile}" style="width: 190px; height: 190px;" border="0">
			             <span class="subject" onclick="article(${dto.alnum});" >
			                   ${dto.subject}
			             </span>
			       </div>
    </c:forEach>

    <c:set var="n" value="${list.size()}"/>
    <c:if test="${n>0&&n%3!=0}">
		        <c:forEach var="i" begin="${n%3+1}" end="3" step="1">
			             <div class="imgLayout">&nbsp;</div>
		        </c:forEach>
    </c:if>
	
    <c:if test="${n!=0 }">
		       <c:out value="</div>" escapeXml="false"/>
    </c:if>
        </div>
</c:if>

        <div class="paging" style="text-align: center; min-height: 50px; line-height: 50px; clear: both;">
            <c:if test="${dataCount==0 }">
                  등록된 게시물이 없습니다.
            </c:if>
            <c:if test="${dataCount!=0 }">
                ${paging}
            </c:if>
        </div>        
        
        <div style="clear: both; margin-bottom: 100px; min-height: 600px;">
        		<div style="float: left; width: 20%; min-width: 85px;">
        		    <button type="button" class="btn btn-default btn-sm wbtn" onclick="javascript:location.href='<%=cp%>/moimalbum/list';">새로고침</button>
        		</div>
        		<div style="float: left; width: 60%; text-align: center;">
        		     <form name="searchForm" action="<%=cp%>/moimalbum/list" method="post" class="form-inline">
						  <select class="form-control input-sm" name="searchKey" >
						      <option value="subject">제목</option>
						      <option value="memberNum">작성자</option>
						      <option value="content">내용</option>
						      <option value="created">등록일</option>
						  </select>
						  <input type="text" class="form-control input-sm input-search" name="searchValue">
						  <button type="button" class="btn btn-info btn-sm btn-search" onclick="searchList();"><span class="glyphicon glyphicon-search"></span> 검색</button>
        		     </form>
        		</div>
        		<div style="float: left; width: 20%; min-width: 85px; text-align: right;">
        		    <button type="button" class="btn btn-primary btn-sm bbtn" onclick="javascript:location.href='<%=cp%>/moimalbum/created${cmoimCode}';"><span class="glyphicon glyphicon glyphicon-pencil"></span> 등록하기</button>
        		</div>
        </div>
        
    </div>
    
</div><br>