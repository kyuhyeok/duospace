<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript"> 
$(function(){
	
	$(".make-Seat-Tb tr td").each(function(index){
		if($(this).attr("class")!="selected")
			$(this).empty();
	});
	
	
	
	$(".make-Seat-Tb tr").eq(0).remove();
	
	
	$(".make-Seat-Tb tr").each(function(index){
		$(this).children().eq(0).remove();
	});
	
	$(".selected").css("border","1px solid black");
	
});
</script>
<style type="text/css">
.make-Seat-Tb{
	border: 1px solid;
}
.make-Seat-Tb tr{
	height: 20px;
}
.make-Seat-Tb td{
	width: 20px;
	text-align: center;
	color: black;
}

</style>

<div>
<c:if test="${not empty dto}">
${dto.placeMent}
</c:if>

<c:if test="${empty dto}">
<p>해당하는 배치도가 존재하지 않습니다.</p>
</c:if>

</div>