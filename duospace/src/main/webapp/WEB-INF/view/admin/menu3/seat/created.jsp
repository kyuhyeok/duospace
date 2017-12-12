<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function() {
		
		
		$(".colNum").on("click",function(){
	
			var num=$(this).text();
			//alert(num);  
			
			$(".make-Seat-Tb tr").eq(num).find("td").toggleClass("selected");
			
			/*
			$(".make-Seat-Tb tr").eq(num).addClass("selected"); 
			//$(".make-Seat-Tb tr").eq(num).siblings().removeClass("selected");
			
			 var cal=$(".make-Seat-Tb tr").eq(num).attr("class");
			
			if(cal.equal("selected")){
				$(".make-Seat-Tb tr").eq(num).removeClass("selected");
				return;   
			} 
			*/
		});
	
		
		$(".rowNum").on("click",function(){   
			var num=$(this).text(); 
			//alert(num);
		
			$(".make-Seat-Tb tr").each(function(index){
				$(".make-Seat-Tb tr").eq(index).children().eq(num).toggleClass("selected");
			})
			
		}); 
		
		$(".make-Seat-Tb tr td").on("click",function(){
			$(this).toggleClass("selected");
			//var n=$(this).attr("data-num");
			//alert(n);
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
			
			if($("select[name=spotCode]").val().length==0){
				alert("지점을 선택하세요"); 
				return;
			}
			
			if(f.floorNum.value.length==0){
				alert("층을 선택하세요");
				return;
			}
			
			var num = $("[class=selected]").length;
			if(num==0){
				alert("테이블 놓을곳을 선택해 주세요");
				return;
			}
			
			 f.action="<%=cp%>/admin/seat/created";
			 f.submit();
				
			});
		
		/*
			$("select[name=spotCode]").on("change",function(){
				//에이작스~~
			})
		*/
	});     
	
function floorList() {
	
	var spotCode=$("#spotCode").val();
	//alert(spotCode);
	var url="<%=cp%>/admin/seat/floorList";
	var params = "spotCode="+spotCode;
	
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(result){
			$("#floorNum option").each(function(){
				$("#floorNum option:eq(0)").remove();
			});
			
			$("#floorNum").append("<option value=''>층 선택</option>");
			
			for(var i=0; i<result.fList.length;i++){
				$("#floorNum").append("<option value='"+result.fList[i].floorNum+"'>"+result.fList[i].floorName+"</option>");
			}
		}
	});
	
}
	 

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
.selected{
	background: red;
}
</style>




	<div class="right_col" role="main" style="background: #ffffff; padding: 50px 100px 200px;">

		
			<div class="page-title">
				<div class="title_left">
					<h3>
						좌석배치 관리 <small>Seat Manage</small>
					</h3>
				</div>
				<div class="title_right"></div>
			</div>
			<div class="clearfix"></div>

	
		<div style="margin-top: 50px;"></div>

	<form name="seatForm" method="post">
		<input type="hidden" name="seatHtml" id="seatHtml">
		<table>
		
		<tr>
			<td width="50px;" align="right">지 점</td>
			<td style="padding-left: 20px; width: 150px;height: 50px;">
				<select id="spotCode" name="spotCode" onchange="floorList();">
					<option value="">::지점선택::</option>
			 		<c:forEach items="${spotList}" var="dto">
						<option value="${dto.spotCode}">${dto.spotName}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width="50px;" align="right">층</td>
			<td style="padding-left: 20px; width: 150px;height: 50px;">
				<select id="floorNum" name="floorNum">
				
				</select>
			</td>
		</tr>
		</table>
	
<div class="seatTb">
		<table class="make-Seat-Tb" style="width: 1000px; height: 700px;margin-top: 80px;cursor: pointer;">
			
		<tr>
			<td></td>
			<c:forEach var="j" begin="1" end="23" step="1">
					<td class="rowNum" style="background: #e4e4e4;">${j}</td>
			</c:forEach>
		</tr>
		
		<c:forEach var="i" begin="1" end="13" step="1">
			<tr>
				<td class="colNum" style="background: #e4e4e4;">${i}</td>
			 	<c:forEach var="j" begin="1" end="23" step="1">
					<td>${i}-${j}</td>
				</c:forEach>
			</tr>
		</c:forEach>

		</table>  
</div> 
		<button type="button" id="sub">저장하기</button>
	</form>

	</div>

