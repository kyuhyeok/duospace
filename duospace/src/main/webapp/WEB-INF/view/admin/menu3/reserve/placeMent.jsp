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
	var rlength=$(".checkIn").length;
	
	var sp=new Array();
	sp[0]=new Array();
	sp[1]=new Array();
	
	
	$(".checkIn").each(function(index){
		sp[index]=$(this).val().split("-");
		console.log(sp[index][0]);
		console.log(sp[index][1]);
	});

		for(var i=0;i<rlength;i++){
			//$(".make-Seat-Tb tr").eq(sp[i][0]).children().eq(sp[i][1]).removeClass("selected");
			//$(".make-Seat-Tb tr").eq(sp[i][0]).children().eq(sp[i][1]).addClass("can");	
			//$(".make-Seat-Tb tr").eq(sp[i][0]).children().eq(sp[i][1]).attr("data-tooltip-text","회원정보 이름:");
			$(".make-Seat-Tb tr").eq(sp[i][0]).children().eq(sp[i][1]).addClass("check-in");
		}
	
	
	$(".make-Seat-Tb tr").eq(0).remove();

	$(".make-Seat-Tb tr").each(function(index){
		$(this).children().eq(0).remove();
	});
	
	$(".selected,.can").css("border","1px solid black");
	
	/* 좌석 선택시 이벤트*/
	$(".make-Seat-Tb tr td").on("click",function(){
		
		var url="<%=cp%>/admin/reserve/seatReserveList";
		var placeCode="${dto.placeCode}";
		var seatName = $(this).text();
		var data = "placeCode="+placeCode+"&seatName="+seatName;
	
		$.ajax({
			type:"post",
			url:url,
			data:data,
			success:function(result){
				$("#seatList").empty();
				$("#seatList").html(result);
			}
				
		});
		
		
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
.check-in{
	
	background-image: url('<%=cp%>/resource/images/duospace/icon/gray.PNG');
	background-size: 100% 100%;
}
.selected.choice{
	background-image: url('<%=cp%>/resource/images/duospace/icon/black.jpg');
	color: white;
}



[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

  margin-bottom: 10px;
	top: 130%;
	left: 0;    
	padding: 7px 12px;
	position: absolute;  
	width: auto;
	min-width: 50px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;
}
</style>


	
	
	<div>
	
		<c:forEach var="vo" items="${list}">
			<input type="hidden" name="checkIn" class="checkIn" value="${vo.seatName}">
		</c:forEach>
		
		
		<c:if test="${not empty dto}">
			<h2> ${dto.floorName} 배치도</h2>
			${dto.placement}
		</c:if>
		
		<c:if test="${empty dto}">	
			<p>해당하는 배치도가 존재하지 않습니다.~~~</p>
		</c:if>
		

	</div>
	
	<div id="seatList" style="margin: 15px auto 50px;"></div>