<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">    
function floorChange() {
	var placeCode=$("#floorNum").val();
	var url="<%=cp%>/admin/seat/readPlacement";
	
	if(placeCode.length==0)
		return;
	
	//AJAX:Text
	$.ajax({
		type:"post"
		,url:url
		,data:{placeCode:placeCode}
		,success:function(re){
			$(".seatTb").empty();
			
			$(".seatTb").html(re);
		}
	});  
	
}
</script>



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
				<select name="floorNum" id="floorNum" onchange="floorChange();">
						<option value="">::층 선택::</option>
					<c:forEach items="${floorList}" var="fdto">
						<option value="${fdto.placeCode}">${fdto.floorName}</option>
					</c:forEach>
					
				</select>
			</td>
		</tr>
		</table>
	
	
		<div class="seatTb" style="margin: 0px auto 30px;"></div>
	
	 
		<button type="button" id="sub">삭제</button>
		<button type="button" id="sub">수정</button>
		<button type="button" id="sub" onclick="javascript:location.href='<%=cp%>/admin/seat/list?page=${page}${query}'">리스트</button>
	</form>

	</div>

