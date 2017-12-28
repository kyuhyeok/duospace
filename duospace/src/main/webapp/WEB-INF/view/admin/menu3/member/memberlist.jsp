<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">


function search2(f) {
	f.action="<%=cp%>/admin/member/list";
	if($("#searchform option:selected").val().length==0){
		var tex="검색목록을 선택해 주세요";
		$("#message").text(tex);
		return;
	}
	f.submit();
}
function search3(f) {
	f.action="<%=cp%>/admin/member/list";
	f.submit();
}

function deleteSpot() {
	  
	
}

</script>
</head>
<body>

	<div class="right_col" role="main">

		<div class="container" style="background: #ffffff;">
			<div class="page-title" style="margin: 0px 10px;">
				<div class="title_left">
					<h3>
						지점 관리 <small>Shop Manage</small>
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
											<option value="name">이름</option>
											<option value="email">이메일</option>
											<option value="phone">휴대전화</option>
											<option value="joinDate">가입일</option>
											
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
									회원 리스트<small>Member List</small>
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
												
												<th style="text-align: center;">아이디(이메일)</th>
												<th style="text-align: center;">이름</th>
												<th style="text-align: center;">등급</th>
												<th style="text-align: center;">휴대폰</th>
												<th style="text-align: center;">승인여부</th>
												<th style="text-align: center;">가입일</th>
												<th style="text-align: center;">관리</th>
												
											</tr>
										</thead>
										<tbody>

										<c:forEach var="dto" items="${list}">
											<tr style="text-align: center">
												
												<td>${dto.email}</td>
												<td>${dto.name}</td>
												<td>일반회원</td>
												<td>${dto.phone}</td>
												<td>Y</td>
												<td>${dto.joinDate}</td>
												<td>
									
												<button type="button" class="btn btn-danger btn-sm"
													onclick="deleteSpot();">
													<i class="fa fa-check-square-o"></i> 회원강퇴
												</button>
												</td>
											</tr>
										</c:forEach>

										</tbody>
									</table>
								</div>

								<div class="form-group" >
									<div class="col-md-6 col-sm-6 col-xs-12">
										
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12" >
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

								

							</div>
						</div>
					</div>

				</div>

			</form>

		</div>
	</div>
