<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">


$(function() {
	$("#startDate").datepicker({
		altFormat: "yyyy-mm-dd",
		onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#endDate").datepicker( "option", "minDate", selectedDate );
        }                
	});
	$("#endDate").datepicker({
		altFormat: "yyyy-mm-dd",
		onClose: function( selectedDate ) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#startDate").datepicker( "option", "maxDate", selectedDate );
        }                
	});
});
$(function(){
	$('#ck_main').click(function(){
		if($(this).prop('checked')){
			$('input[name=spotCodes]').prop('checked',true);
		}else{
			$('input[name=spotCodes]').prop('checked', false);
		}
	});
		$("#deletelistBtn").click(function(){
			
			var cnt = $("input[name=spotCodes]:checkbox:checked").length;
			
			if(cnt==0){
				alert("선택된 항목이 없습니다!");
				return;
			}
			
			if(confirm("선택한 항목을 삭제하시겠습니까?")){
				var f=document.deleteList;
				f.action="<%=cp%>";
				f.submit();
			}
			
		});
		
	
		

});
function deleteReserve() {
	if(confirm("예약을 취소하시겠습니까?")){
		
	}
}


</script>

<style type="text/css">

</style>

	<div class="right_col" role="main">

		<div class="container" style="background: #ffffff;">
				
			<h2>예약자 명단</h2>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							
							<div class="x_content">

								<div class="table-responsive">
									<table class="table table-hover" id="table1" style="text-align: center; border-collapse: collapse;">
										<thead>
											<tr>
												<th style="text-align: center;"><input class="flat" id="ck_main" type="checkbox" />
												</th>
												<th style="text-align: center;">글번호</th>
												<th style="text-align: center;">지점명</th>
												<th style="text-align: center;">층</th>
												<th style="text-align: center;">자원명(룸/좌석)</th>
												<th style="text-align: center;">예약자</th>
												<th style="text-align: center;">예약시작일</th>
												<th style="text-align: center;">예약종료일</th>
												<th style="text-align: center;">결제상태</th>
												<th style="text-align: center;">관리</th>
											</tr>
										</thead>
										<tbody>

										<c:forEach items="${list}" var="dto">
											<tr style="text-align: center">
												<td><input class="flat" type="checkbox" /></td>
												<td>1</td>
												<td>강남</td>
												<td>${dto.floorName}</td>
												<td>${dto.seatName}</td>
												<td>${dto.name}</td>
												<td>${dto.startDate}</td>
												<td>${dto.endDate}</td>
												<td>결제완료</td>
		
												<td>
											
												<button type="button" class="btn btn-danger btn-sm"
													onclick="deleteReserve(${dto.reservNum});">
													<i class="fa fa-check-square-o"></i> 예약취소
												</button>
												</td>
											</tr>
										</c:forEach>

										</tbody>
									</table>
								</div>
									
								
		
								<div class="ln_solid"></div>
								<div class="form-group" style="text-align:  center;">
									
												<c:if test="${dataCount==0 }">
			              						 예약내역이 없습니다.
			        							 </c:if>
			        							<c:if test="${dataCount!=0 }">
			              						 ${paging}
			        							 </c:if>
			        							
									
								</div>
								

							</div>
						</div>
					</div>

				</div>


		</div>
	</div>

