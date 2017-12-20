<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>


<script type="text/javascript">
function search(f) {
	f.action="<%=cp%>/admin/reserve/list";
	f.submit();
}

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
function deleteReserve(rmresNum) {
	if(confirm("예약을 취소하시겠습니까?")){
		location.href="<%=cp%>/admin/reserve/delete?page=${page}&rmresNum="+rmresNum;
	}
}


</script>
</head>
<body>

	<div class="right_col" role="main">

		<div class="container" style="background: #ffffff;">
			<div class="page-title" style="margin: 0px 10px;">
				<div class="title_left">
					<h3>
						예약 관리 <small>Shop Manage</small>
					</h3>
				</div>
				<div class="title_right"></div>
			</div>
			<div class="clearfix"></div>
	
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									검색 <small>Search</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="form-group">
								
							<form name="searchForm" class="form-horizontal" method="post">
									
									<div class="form-group">
										<label class="control-label col-sm-2 col-xs-12"
											for="managerphoto">예약구분</label>
										<div class="col-sm-2 col-xs-12">
											<select class="form-control" name="where" onchange="">
												<option value="0" selected="selected">룸예약</option>
												<option value="1">좌석예약</option>
											</select>
										</div>
									</div>
									<div class="form-group">
									<label class="col-sm-2 col-xs-12 control-label" for="sc_type">일자검색</label>
									<div class="col-sm-2 col-xs-12">
										<input class="form-control" id="startDate" name="startDate" type="text" placeholder="시작일">
			
									</div>
									
									<div class="col-sm-2 col-xs-12">
									
										<input class="form-control" id="endDate" name="endDate" type="text" placeholder="종료일">
									</div>
									<div class="col-sm-2 col-xs-12">
										<span id="message" style="color: red;"></span>
									</div>
									</div>
								
									<div class="form-group">
									<label class="col-sm-2 col-xs-12 control-label" for="sc_type">검색분류</label>
									<div class="col-sm-2 col-xs-12">
										<select class="form-control" name="searchKey" id="searchform">
											<option value="">선택</option>
											<option value="spotName">지점명</option>
											<option value="roomName">룸명</option>
											<option value="userName">예약자명</option>
										</select>
										
									</div>
									<div class="col-sm-2 col-xs-12">
										<input class="form-control" id="sc_columnvalue"
											name="searchValue" placeholder="검색어" type="text"/>
									</div>
									<div class="col-sm-2 col-xs-12">
										<span id="message" style="color: red;"></span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xs-12">
										<button type="button" class="btn btn-info btn-lg btn-block"
											onclick="search(this.form);">검색</button>
									</div>
								</div>
								
								</form>
									</div>
							</div>
								
						
						</div>
					</div>
				</div>
		<form name="deleteList" class="form-horizontal" method="post">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
							
								<h2>
									예약 리스트<small>Shop List</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a>Total ${dataCount}EA (${page}/${total_page}페이지)</a></li>
									<li><a href="javascript:location.reload();"><i
											class="fa fa-refresh"></i></a></li>
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a></li>
								</ul>
								<div class="clearfix"></div>
							</div>
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
												<td>${dto.listNum}</td>
												<td>${dto.spotName}</td>
												<td>${dto.floorName}</td>
												<td>${dto.roomName}</td>
												<td>${dto.userName}</td>
												<td>${dto.startDate }</td>
												<td>${dto.endDate}</td>
												<td>결제완료</td>
		
												<td>
												<button type="button" class="btn btn-warning btn-sm" onclick="javascript:location.href='<%=cp%>/admin/spot/update?spotCode=${dto.spotCode}&page=${page}';">
												수정
												</button>
												<button type="button" class="btn btn-danger btn-sm"
													onclick="deleteReserve(${dto.rmresNum});">
													<i class="fa fa-check-square-o"></i> 예약취소
												</button>
												</td>
											</tr>
										</c:forEach>


										</tbody>
									</table>
								</div>

								<div class="form-group">
									<div class="col-md-6 col-sm-6 col-xs-12">
										<button type="button" class="btn btn-danger btn-sm"
											id="deletelistBtn">
											<i class="fa fa-check-square-o"></i> 삭제
										</button>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12">
												<c:if test="${dataCount==0 }">
			              						  등록된 게시물이 없습니다.
			        							 </c:if>
			        							<c:if test="${dataCount!=0 }">
			              						 ${paging}
			        							 </c:if>
			  
									</div>
								</div>
		
								<div class="ln_solid"></div>

								

							</div>
						</div>
					</div>

				</div>

			</form>

		</div>
	</div>

