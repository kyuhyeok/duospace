<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">

$(function(){
	

	//td안의 값 없애기
	$(".make-Seat-Tb tr td").each(function(index){
		if($(this).attr("class")!="selected"){
			$(this).empty();
		}
	});
	
	//선택한 시간의 이미 예약된내용들
	var rlength=$(".reserveDone").length;
	
	var sp=new Array();
	sp[0]=new Array();
	sp[1]=new Array();
	
	
	$(".reserveDone").each(function(index){
		sp[index]=$(this).val().split("-");
		console.log(sp[index][0]);
		console.log(sp[index][1]);
	});

		for(var i=0;i<rlength;i++){

			$(".make-Seat-Tb tr").eq(sp[i][0]).children().eq(sp[i][1]).removeClass("selected");
			$(".make-Seat-Tb tr").eq(sp[i][0]).children().eq(sp[i][1]).addClass("can");	
		}
		
	
		
	
	$(".make-Seat-Tb tr").eq(0).remove();

	$(".make-Seat-Tb tr").each(function(index){
		$(this).children().eq(0).remove();
	});
	
	$(".selected,.can").css("border","1px solid black");
	
	/*고객이 좌석 선택시 이벤트*/
	$(".make-Seat-Tb tr td").on("click",function(){
		if($(this).hasClass("selected")){
			var a= $(this).children().eq(0).val();
			$(".resultTb>div>div:eq(2)").text(a);
			$(".resultTb>div>div:eq(2)").append("<input type ='hidden' name='seatName' value='"+a+"'>");
			
		}else if($(this).hasClass("can")){
			alert("해당좌석은 선택이 불가합니다.");
			$(".resultTb>div>div:eq(2)").empty();
		}
		
		
	});
	
	
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
.can{
	opacity : 0.7;
	background-image: url('<%=cp%>/resource/images/duospace/icon/slash.png');
	background-size: 100% 100%;
}


</style>


	
	
	<div>
		<c:forEach var="vo" items="${reserveList}">
			<input type="hidden" name="reserveDone" class="reserveDone" value="${vo.seatName}">
		</c:forEach>
		
		<c:if test="${not empty dto}">
			<h1><span style="font-weight: bold;">${dto.spotName}</span></h1> <h2> ${dto.floorName} 배치도</h2>
			${dto.placement}
		</c:if>
		
		<c:if test="${empty dto}">	
			<p>해당하는 배치도가 존재하지 않습니다.</p>
		</c:if>
		

	</div>