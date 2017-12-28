<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">    
$(function() {
	
	
	
	//가로
	$(".colNum").on("click",function(){

		var num=$(this).text();
		//alert(num);  
		
		var color=$(".color").val();
		
		$(".make-Seat-Tb tr").eq(num).find("td").toggleClass("selected");
		$(".make-Seat-Tb tr").eq(num).find("td").css('background-color','');
		
		
	});

	
	//세로
	$(".rowNum").on("click",function(){   
		var num=$(this).text(); 
		//alert(num);
	
		var color=$(".color").val();
		
		$(".make-Seat-Tb tr").each(function(index){
			$(".make-Seat-Tb tr").eq(index).children().eq(num).toggleClass("selected");
			$(".make-Seat-Tb tr").eq(index).children().eq(num).css('background-color','');
			
		})
		
		$(".make-Seat-Tb tr").each(function(index){
			if($(this).children().eq(num).attr("class")=="selected"){
				$(this).children().eq(num).css('background-color',color);
			}
			
		})
		
		
		
		
	}); 
	
	$(".make-Seat-Tb tr td").on("click",function(){
		
		$(this).toggleClass("selected");
		$(this).css('background-color','');
		
		if($(this).attr("class")=="selected"){
			var color=$(".color").val();
			//$("[class='selected']").css('background-color',color);
			$(this).css('background-color',color);
		}

	});
	
	$("#sub").click(function(){
		
		var f=document.seatForm;
		
		$(".make-Seat-Tb tr").find("td").each(function(index){
			if($(this).attr("class")=="selected"){
				var v = $(this).text();			
				$(this).append('<input type="hidden" name="seatNums" value="'+v+'">');
				
			}	
			
		});
		
		var htm=$(".seatTb").html();
		$("#seatHtml").val(htm);
		
		
		 f.action="<%=cp%>/admin/seat/update";
		 f.submit();
			
		});
	
	//다시입력
	$("button[type='reset']").click(function(){
		$(".make-Seat-Tb tr").find("td").each(function(index){
			if($(this).attr("class")=="selected"){
				$(this).css("background-color",'');
				$(this).removeClass("selected");
			}	
			
		});
	});
	  
});  

</script>
<style type="text/css">

.make-Seat-Tb,.make-Seat-Tb tr,.make-Seat-Tb td{
	border: 1px solid;
}
.make-Seat-Tb tr{
	height: 20px;
}
.make-Seat-Tb td{
	width: 20px;
	text-align: center;
}

.changeSeat-Tb, .changeSeat-Tb tr, .changeSeat-Tb td{
	border: 1px solid;
}
.changeSeat-Tb td{
	padding: 3px 10px;
}

</style>


	<div class="right_col" role="main" style="background: #ffffff; padding: 50px 100px 200px;">

		
			<div class="page-title">
				<div class="title_left">
					<h3>
						좌석배치 수정 <small>Seat Manage</small>
					</h3>
				</div>
				<div class="title_right"></div>
			</div>
			<div class="clearfix"></div>

	<form name="seatForm" method="post">
		<input type="hidden" name="seatHtml" id="seatHtml">
		<table>
		
		<tr>
			<td width="50px;" align="right">지 점</td>
			<td style="padding-left: 20px; width: 150px;height: 50px;">
				${dto.spotName}
			</td>
		</tr>
		<tr>
			<td width="50px;" align="right">층</td>
			<td style="padding-left: 20px; width: 150px;height: 50px;">
				${dto.floorName}
			</td>
		</tr>
		</table>
		
		
		<input type="color" name="favcolor" class="color" value="#478ad1">
	
		<div class="seatTb" style="margin: 0px auto 30px;">${dto.placeMent}</div>
		<input type="hidden" name="placeCode" value="${dto.placeCode}">
	 	<input type="hidden" name="floorNum" value="${dto.floorNum}">
	 	
		<div align="center" style="margin-top: 50px; text-align: center;">
			<button type="reset">다시입력</button>
			<button type="button" id="sub">저장하기</button>
			<button type="button" onclick="javascript:location.href='<%=cp%>/admin/seat/list'">등록취소</button>
		</div>
		
	</form>

	</div>

