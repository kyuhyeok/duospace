<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%><div class="right_col" role="main">

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

			<form action="productlist" class="form-horizontal" id="frm"
				name="frm" method="post">

				<input name="r_page" type="hidden" value="1" /> <input
					name="r_pagelimit" type="hidden" value="10" /> <input
					name="r_rowlimit" type="hidden" value="10" /> <input id="r_prseq"
					name="r_prseq" type="hidden" value="" /> <input name="r_prseqarr"
					type="hidden" /> <input name="r_column" type="hidden" value="" />
				<input name="r_columnvalue" type="hidden" value="" />

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
									<div class="form-group">
										<label class="control-label col-sm-2 col-xs-12"
											for="managerphoto">게시글 수</label>
										<div class="col-sm-2 col-xs-12">
											<select class="form-control" onchange="rowLimit(this);">
												<option value="10" selected="selected">10</option>
												<option value="20">20</option>
												<option value="30">30</option>
												<option value="50">50</option>
											</select>
										</div>
									</div>
									<label class="col-sm-2 col-xs-12 control-label" for="sc_type">검색분류</label>
									<div class="col-sm-2 col-xs-12">
										<select class="form-control" name="searchKey">
											<option value="">선택</option>
											<option value="spotCode">지점코드</option>
											<option value="spotName">지점명</option>
											<option value="spotaddrnum">우편번호</option>
											<option value="spotAddr1">도로명주소</option>
											<option value="spotAddr2">지번주소</option>
											<option value="manager">매니저이름</option>
											<option value="tel">전화번호</option>
										</select>
									</div>
									<div class="col-sm-2 col-xs-12">
										<input class="form-control" id="sc_columnvalue"
											name="searchValue" placeholder="검색어" type="text"/>
									</div>
								</div>

								<div class="form-group">
									<div class="col-xs-12">
										<button type="button" class="btn btn-info btn-lg btn-block"
											onclick="searchList()">검색</button>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									지점 리스트<small>Shop List</small>
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
												<th style="text-align: center;">지점코드</th>
												<th style="text-align: center;">지점명</th>
												<th style="text-align: center;">우편번호</th>
												<th style="text-align: center;">도로명 주소</th>
												<th style="text-align: center;">지번 주소</th>
												<th style="text-align: center;">매니저</th>
												<th style="text-align: center;">전화번호</th>
												<th style="text-align: center;">관리</th>
											</tr>
										</thead>
										<tbody>

										<c:forEach var="dto" items="${list}">
											<tr style="text-align: center">
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="${dto.spotCode}" /></td>
												<td>${dto.spotCode}</td>
												<td>듀오 스페이스 -${dto.spotName}</td>
												<td>${dto.spotAddrNum}</td>
												<td>${dto.spotAddr1}</td>
												<td>${dto.spotAddr2}</td>
												<td>${dto.manager}</td>
												<td>${dto.tel}</td>
												<td>
												<button type="button" class="btn btn-warning btn-sm" onclick="javascript:location.href='<%=cp%>/admin/spot/update?spotCode=${dto.spotCode}&page=${page}';">
												수정
												</button>
												<button type="button" class="btn btn-danger btn-sm"
													onclick="deleteSpot(${dto.spotCode}, ${page});">
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
											onclick="dataListDel()">
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
		<input type="hidden" name="rows" value="${rows}">
       <input type="hidden" name="page" value="${page}">
								<div class="ln_solid"></div>

								<div class="form-group">
									<div class="col-xs-12">
										<button type="button" class="btn btn-success btn-sm" onclick="javascript:location.href='<%=cp%>/admin/spot/created';">
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