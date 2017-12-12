<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	$('#ck_main').click(function(){
		if($(this).prop('checked')){
			$('input[name=roomCodes]').prop('checked',true);
		}else{
			$('input[name=roomCodes]').prop('checked', false);
		}
	});
		$("#deletelistBtn").click(function(){
			
			var cnt = $("input[name=roomCodes]:checkbox:checked").length;
			
			if(cnt==0){
				alert("선택된 항목이 없습니다!");
				return;
			}
			
			if(confirm("선택한 항목을 삭제하시겠습니까?")){
				var f=document.deleteList;
				f.action="<%=cp%>/admin/room/deleteList";
				f.submit();
			}
			
		});

});

function search2(f) {
	f.action="<%=cp%>/admin/roomlist";
	if($("#searchform option:selected").val().length==0){
		var tex="검색목록을 선택해 주세요";
		$("#message").text(tex);
		return;
	}
	f.submit();
}
function search3(f) {
	f.action="<%=cp%>/admin/roomlist";
	f.submit();
}

function deleteRoom(roomCode, page) {
	  
	var uid="${sessionScope.user.userId}";
	if(! uid){
		location.href="<%=cp%>/member/login";
		return;
	}
	if(confirm("게시물을 삭제하시겠습니까?"))
	var query = "?roomCode="+roomCode+"&page="+page;
	location.href = "<%=cp%>/admin/room/deleteRoom" + query;
		return;
}

</script>
</head>
<body>
	<div class="right_col" role="main">

		<div class="container" style="background: #ffffff;">
			<div class="page-title" style="margin: 0px 10px;">
				<div class="title_left">
					<h3>
						룸 관리 <small>Room Manage</small>
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
							<form name="selectListForm" class="form-horizontal" method="post">
									<div class="form-group">
										<label class="control-label col-sm-2 col-xs-12"
											for="managerphoto">게시글 수</label>
										<div class="col-sm-2 col-xs-12">
											<select class="form-control" onchange="search3(this.form);" name="rows" id="rows">
												<option value="10" selected="selected" ${rows==10?"selected='selected'":""}>10</option>
												<option value="20" ${rows==20?"selected='selected'":""}>20</option>
												<option value="30" ${rows==30?"selected='selected'":""}>30</option>
												<option value="50" ${rows==50?"selected='selected'":""}>50</option>
											</select>
											<input type="hidden" name="rows" value="${rows}">
											<input type="hidden" name="searchKey" value="${searchKey}">
											<input type="hidden" name="searchValue" value="${searchValue}">
										</div>
									</div>
								</form>
									<form name="searchList" class="form-horizontal" method="post">
									<div class="form-group">
									<label class="col-sm-2 col-xs-12 control-label" for="sc_type">검색분류</label>
									<div class="col-sm-2 col-xs-12">
										<select class="form-control" name="searchKey" id="searchform">
											<option value="">선택</option>
											<option value="spotName">지점 이름</option>
											<option value="roomCode">룸코드</option>
											<option value="roomName">룸 이름</option>
											<option value="floorName">층 번호</option>
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
											onclick="search2(this.form);">검색</button>
									</div>
								</div>
								
								</form>
									</div>
							</div>
							<input type="hidden" name="rows" value="${rows}">
						    <input type="hidden" name="page" value="${page}">	
						</div>
					</div>
				</div>
		<form name="deleteList" class="form-horizontal" method="post">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
							
								<h2>
									룸 리스트<small>Room List</small>
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
												<th style="text-align: center;">룸 코드</th>
												<th style="text-align: center;">이미지</th>
												<th style="text-align: center;">룸 이름</th>
												<th style="text-align: center;">층 번호</th>
												<th style="text-align: center;">룸 가격</th>
												<th style="text-align: center;">룸 내용</th>
												<th style="text-align: center;">지점 이름</th>
												<th style="text-align: center;">관리</th>
											</tr>
										</thead>
										<tbody>

										<c:forEach var="dto" items="${list}">
											<tr style="text-align: center">
												<td><input class="flat" name="roomCodes" type="checkbox"
													value="${dto.roomCode}" /></td>
												<td>${dto.roomCode}</td>
												<td><img src="<%=cp%>/resource/images/duospace/Room/${dto.saveFileName}" style="width: 80px; height: 80px;"></td>
												<td>${dto.roomName}</td>
												<td>${dto.floorName}</td>
												<td>${dto.price}</td>
												<td>${dto.rcontent}</td>
												<td>${dto.spotName}</td>
												<td>
												<button type="button" class="btn btn-warning btn-sm" onclick="javascript:location.href='<%=cp%>/admin/room/update?roomCode=${dto.roomCode}&page=${page}';">
												수정
												</button>
												<button type="button" class="btn btn-danger btn-sm"
													onclick="deleteSpot(${dto.roomCode}, ${page});">
													<i class="fa fa-check-square-o"></i> 삭제
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
			        							 <input type="hidden" name="rows" value="${rows}">
      											 <input type="hidden" name="page" value="${page}">
									</div>
								</div>
		
								<div class="ln_solid"></div>

								<div class="form-group">
									<div class="col-xs-12">
										<button type="button" class="btn btn-success btn-sm" onclick="javascript:location.href='<%=cp%>/admin/room/created';">
											<i class="fa fa-plus"></i> 등록
										</button>
									</div>
								</div>

							</div>
						</div>
					</div>

				</div>

			</form>

		</div>
	</div>
