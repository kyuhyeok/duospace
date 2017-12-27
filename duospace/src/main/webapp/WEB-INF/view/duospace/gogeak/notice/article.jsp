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
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
.boardline{
	border: 1px solid #172a40;
	padding: 35px 5% 35px;
}
.btn{
	background-color: transparent;
	outline: none;
	border: 1px solid #172a40;
	font-family: 'Noto Sans KR', sans-serif;
	padding: 5px 10px;
	color: #172a40;
}
.btn:hover{
	background-color: #172a40;
	color: #ffffff;
}
.under{
	color: black;
}
.under:hover{
	color: black;
	text-decoration: underline;
}
</style>

</head>
<body>
	<div class="col-sm-12 body-frame-2" role="main">



<div style="margin-top: 30px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 50px;" align="center">공지사항
		 <span class="glyphicon glyphicon-bullhorn"></span>
</div>



 <div>
 		<div >
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			
			<tr height="70px" style="border-top: 2px solid #172a40;border-bottom: 1px solid #E0E3DA">
			    <td align="left" style="margin-bottom: 3px; padding-left: 10px;">
				  <span style="font-size: 18px;font-weight: bold;">${dto.subject}</span>
			    </td>
			    <td width="20%" align="right" style="padding-right: 10px; vertical-align: bottom;padding-bottom: 10px;">
			      ${dto.created} | <span class="glyphicon glyphicon-eye-open" style="font-size: 7px;"></span>&nbsp;${dto.hitCount} <br> 
			    </td>
			</tr>
			
			<c:if test="${not empty dto.saveFilename}">
			<tr height="35">
			    <td colspan="2" align="right" style="padding-left: 5px;font-size: 12px;">
			        첨부파일<span class="glyphicon glyphicon-save" style="font-size: 10px;"></span>:
		           <a href="<%=cp%>/duospace/download?num=${dto.num}">${dto.originalFilename}</a>
			    </td>
			</tr>
			</c:if>
			
			<tr style="border-bottom: 2px solid #172a40;">
			  <td colspan="2" align="left" style="padding: 50px 15px;" valign="top">
			    <div style="min-height: 300px;"> ${dto.content}</div>
			   </td>
			</tr> 
			
			
			
			</table>
		
		</div>
			<table style="width: 100%; margin: 10px auto 0px; border-spacing: 0px; border-collapse: collapse;">
				<tr height="60">
				<td align="left">
				<c:if test="${sessionScope.user.userId=='admin'}">
			     	<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/duospace/notice/update?num=${dto.num}&page=${page}';">
			     	<span class="glyphicon glyphicon-edit" style="font-size: 10px;"></span>
			     	수정</button>
				    <button type="button" class="btn" onclick="deleteNotice();"> <span class="glyphicon glyphicon-trash" style="font-size: 10px;"></span>&nbsp;삭제</button>
				</c:if>
				</td>
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/duospace/notice/list?${query}';">목록</button>
			    </td>
				</tr>
			</table>
			
			<div style="text-align: right;margin: 40px auto;">
			<a style="color: #BFBFBF;" href="javascript:window.scrollTo(0,0)"><span class="glyphicon glyphicon-chevron-up"></span>top</a></div>
		
			<table style="width: 100%; margin: 20px auto 100px; border-spacing: 0px;">
			
			<c:if test="${not empty preDto}">
			  <tr height="35" style="border-bottom: 1px solid #cccccc;border-top: 1px solid #cccccc;">
			   	<td width="80px;"><span class="glyphicon glyphicon-chevron-up"></span>&nbsp;이전글</td>
			    <td align="left" style="padding-left: 10px;">
			       <a class="under" href="<%=cp%>/duospace/notice/article?${query}&num=${preDto.num}">${preDto.subject}</a> 
			         
			    </td>
			    <td align="right" style="padding-right: 20px;">
			    	${preDto.created}
			    </td>
			</tr>
			</c:if>
			<c:if test="${not empty nextDto}">
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
				<td><span class="glyphicon glyphicon-chevron-down"></span>&nbsp;다음글</td>
			    <td  align="left" style="padding-left: 10px;">
			       <a class="under" href="<%=cp%>/duospace/notice/article?${query}&num=${nextDto.num}">${nextDto.subject}</a>
			         
			    </td>
			    <td align="right" style="padding-right: 20px;">
			    	${nextDto.created}
			    </td>
			</tr>
			</c:if>
			</table>
    </div>
    






	</div>

