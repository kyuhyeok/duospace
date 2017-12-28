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

function gogo() {

	var url="<%=cp%>/admin/reserve/readPlacement";
	var floorNum= $("select[name=floorNum]").val();
	var data = "floorNum="+floorNum;
	
	$.ajax({
		type:"post",
		url: url,
		data: data,
		dataType:"text",
		success: function(place){
			$("#place").empty();
			$("#place").html(place);
		}
		
	});
}

function deleteReserve(rmresNum) {
	if(confirm("예약을 취소하시겠습니까?")){
		location.href="<%=cp%>/admin/reserve/delete?page=${page}&rmresNum="+rmresNum;
	}
}
function changeJsp() {
	var f = document.searchForm;
	
	var w = f.where.value;
	
	if(w=='0'){
		location.href="<%=cp%>/admin/reserve/list";
	}
}
function floorList(){
	
	var spotCode = $("#spotCode").val();
	var url="<%=cp%>/admin/reserve/floor/list";
	var data="spotCode="+spotCode;
	
	//alert("11122");
	
	
	$.ajax({
		type:"post",
		url:url,
		data:data,
		dataType:"json",
		success:function(result){
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
											<select class="form-control" name="where" onchange="changeJsp();">
												<option value="0" selected="selected">룸예약</option>
												<option value="1" ${where==1?"selected='selected'":""}>좌석예약</option>
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
									<label class="col-sm-2 col-xs-12 control-label" for="sc_type">지 점 명</label>
									<div class="col-sm-2 col-xs-12">
										<select class="form-control" name="spotCode" id="spotCode" onchange="floorList();">
											<option value="">선택</option>
											<c:forEach items="${spotList}" var="dto">
												<option value="${dto.spotCode}">${dto.spotName}</option>
											</c:forEach>
											
											
										</select>
										
									</div>
									<div class="col-sm-2 col-xs-12">
										
										<select class="form-control" name="floorNum" id="floorNum" onchange="gogo();">
										</select>
										
										
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
											onclick="gogo();">검색</button>
									</div>
								</div>
								
								</form>
									</div>
							</div>
								
						
						</div>
					</div>
				</div>
		
		
		
		<div id="place" style="padding: 30px 10px 30px 20px; margin: 5px auto;">배치도나올곳</div>
		
		
		</div>
	</div>

