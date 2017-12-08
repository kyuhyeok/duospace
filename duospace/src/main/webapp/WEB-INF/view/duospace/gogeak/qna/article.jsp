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
function deleteNotice() {
	if(confirm("삭제하시겠습니까?")){
		location.href='<%=cp%>/duospace/notice/delete?page=${page}&num=${dto.num}&rows=${rows}';
	}
}
</script>
<style type="text/css">

</style>

</head>
<body>
	<div class="col-sm-12 body-frame-2" role="main">



<div style="margin-top: 30px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 30px;">공지사항</div>



 <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center" style="background: #e4e4e4;">
				  ${dto.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 :관리자
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			      ${dto.created} | 조회 ${dto.hitCount}
			    </td>
			</tr>
			<c:if test="${not empty dto.saveFilename}">
			<tr height="35">
			    <td colspan="2" align="right" style="padding-left: 5px;">
			       첨부파일 :
		           <a href="<%=cp%>/duospace/download?num=${dto.num}">${dto.originalFilename}</a>
			    </td>
			</tr>
			</c:if>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			     ${dto.content}
			   </td>
			</tr>
			<tr height="60">
				<td align="left">
				<c:if test="${sessionScope.user.userId=='admin'}">
			     	<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/duospace/notice/update?num=${dto.num}&page=${page}';">수정</button>
				    <button type="button" class="btn" onclick="deleteNotice();">삭제</button>
				</c:if>
				</td>
			    <td align="right" >
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/duospace/notice/list?${query}';">리스트</button>
			    </td>
			</tr>
			
			
			</table>
			
			<table style="width: 100%; margin: 20px auto 20px; border-spacing: 0px;">
			
			<c:if test="${not empty preDto}">
			  <tr height="35" style="border-bottom: 1px dashed #cccccc;border-top: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 : <a href="<%=cp%>/duospace/notice/article?${query}&num=${preDto.num}">${preDto.subject}</a>
			         
			    </td>
			</tr>
			</c:if>
			<c:if test="${not empty nextDto}">
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :<a href="<%=cp%>/duospace/notice/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
			         
			    </td>
			</tr>
			</c:if>
			</table>
    </div>
    






	</div>

