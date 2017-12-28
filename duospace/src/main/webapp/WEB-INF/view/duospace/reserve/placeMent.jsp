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
			
			$(".msg").empty();
			
			$(".selected").each(function(index) {
				
				if($(this).hasClass("choice")){
					$(this).removeClass("choice");
				}
			});
			
			$(this).addClass("choice");
			
			var a= $(this).children().eq(0).val();
			$(".resultTb>div>div:eq(3)").text(a);
			$(".resultTb>div>div:eq(3)").append("<input type ='hidden' name='seatName' value='"+a+"'>");
			
		}else if($(this).hasClass("can")){
			//alert("해당좌석은 선택이 불가합니다.");
			
			$(".msg").text("해당 좌석은 선택이 불가합니다.");
			$(".msg").css("color","red");
			
			$(".resultTb>div>div:eq(3)").empty();
			
			$(".selected").each(function(index) {
				
				if($(this).hasClass("choice")){
					$(this).removeClass("choice");
				}
			});
			
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
	
	background-image: url('<%=cp%>/resource/images/duospace/icon/black.jpg');
	background-size: 100% 100%;
}
.selected.choice{
	background-image: url('<%=cp%>/resource/images/duospace/icon/red.jpg');
	color: white;
}

</style>


	
	
	<div>
		<c:forEach var="vo" items="${reserveList}">
			<input type="hidden" name="reserveDone" class="reserveDone" value="${vo.seatName}">
		</c:forEach>
		
		<div align="right" style="margin-bottom: 30px; font-size: 18px; font-weight: bold;text-align: center;" class="msg"></div>
		
		<c:if test="${not empty dto}">
			<div align="center">
			 <h1><span style="font-weight: bold;">${dto.spotName}</span></h1> <h2 style="margin: 50px auto 30px auto;"> - ${dto.floorName} 배치도 -</h2>
			
			
			<div align="center" style="margin-bottom:30px;">
				<img src="<%=cp%>/resource/images/duospace/icon/black.jpg" style="height:25px;width: 32px;">
				<label>선택 불가</label> &nbsp;&nbsp;&nbsp;&nbsp;
				<img src="<%=cp%>/resource/images/duospace/icon/red.jpg" style="height:25px;width: 32px;">
				<label>선택한 좌석</label>
			</div>
			${dto.placement}
			</div>
		</c:if>
		<c:if test="${empty dto}">	
			<p>해당하는 배치도가 존재하지 않습니다.</p>
		</c:if>
		

	</div>