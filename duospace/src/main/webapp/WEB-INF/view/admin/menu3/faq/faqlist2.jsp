<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

	<div class="right_col" role="main">

		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>
						FAQ 관리 <small>FAQ Manage</small>
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
										<label class="col-sm-2 col-xs-12 control-label" for="ctgr1">지점명</label>
										<div class="col-sm-2 col-xs-12">
											<select class="form-control" id="ctgr1" name="ctgr1">
												<option value="">지역</option>
												<option value="">서울</option>
												<option value="3">경기</option>
												<option value="14">인천</option>
											</select>
										</div>
										<div class="col-sm-2 col-xs-12">
											<select class="form-control" id="ctgr2" name="ctgr2">
												<option value="">지점</option>

											</select>
										</div>
									</div>
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
										<select class="form-control" name="sc_column">
											<option value="">선택</option>
											<option value="subject">제목</option>
											<option value="content">내용</option>
											<option value="name">작성자</option>
											<option value="created">등록일</option>
										</select>
									</div>
									<div class="col-sm-2 col-xs-12">
										<input class="form-control" id="sc_columnvalue"
											name="sc_columnvalue" placeholder="검색어" type="text" value="" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-xs-12">
										<button type="button" class="btn btn-info btn-lg btn-block"
											onclick="dataSearch()">검색</button>
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
									<li><a>Total 26 EA</a></li>
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
									<table class="table table-hover" id="table1">
										<thead>
											<tr>
												<th><input class="flat" id="ck_main" type="checkbox" />
												</th>
												<th>지점코드</th>
												<th>지점명</th>
												<th>우편번호</th>
												<th>주소1</th>
												<th>주소2</th>
												<th>매니저</th>
												<th>전화번호</th>
											</tr>
										</thead>
										<tbody>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>

											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>서울</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>


											<tr>
												<td><input class="flat" name="ck_sub" type="checkbox"
													value="39" /></td>
												<td>123123</td>
												<td>듀오 스페이스 -당산지점</td>
												<td>01530</td>
												<td>경기도</td>
												<td>영등포구 당산동</td>
												<td>박가람</td>
												<td>010-0000-0000</td>
											</tr>

										</tbody>
									</table>
								</div>

								<div class="form-group">
									<div class="col-md-6 col-sm-6 col-xs-12">
										<button type="button" class="btn btn-success btn-sm"
											onclick="dataListUp( 'PR_USE', 'Y' )">
											<i class="fa fa-check-square-o"></i> 승인
										</button>
										<button type="button" class="btn btn-warning btn-sm"
											onclick="dataListUp( 'PR_USE', 'N' )">
											<i class="fa fa-check-square-o"></i> 미승인
										</button>
										<button type="button" class="btn btn-danger btn-sm"
											onclick="dataListDel()">
											<i class="fa fa-check-square-o"></i> 삭제
										</button>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<div class="pull-right">

											<script type="text/javascript">
												function pager(r_page) {
													$('input[name="r_page"]')
															.val(r_page);
													handling.submit('', '');
												}
											</script>

											<span class="pageNum"> <!-- * 처음이전처리 -->



												<button type="button" class="btn btn-info btn-sm">처음</button>
												<button type="button" class="btn btn-default btn-sm">이전</button>


												<!-- 처음이전처리 -->


												<button class="btn btn-default btn-sm active" type="button">1</button>



												<!-- * 다음 끝처리 --> <!-- 다음 끝처리 --> <!-- * 처음이전처리 --> <!-- 처음이전처리 -->



												<button class="btn btn-default btn-sm" type="button"
													onclick="pager( 2 )">2</button> <!-- * 다음 끝처리 --> <!-- 다음 끝처리 -->



												<!-- * 처음이전처리 --> <!-- 처음이전처리 -->



												<button class="btn btn-default btn-sm" type="button"
													onclick="pager( 3 )">3</button> <!-- * 다음 끝처리 -->


												<button type="button" class="btn btn-default btn-sm"
													onclick="pager( 2 )">다음</button>
												
												<button type="button" class="btn btn-info btn-sm"
													onclick="pager( 3 )">끝</button>
											



											</span>


										</div>
									</div>
								</div>

								<div class="ln_solid"></div>

								<div class="form-group">
									<div class="col-xs-12">
										<button type="button" class="btn btn-success btn-sm"
											onclick="dataAdd()">
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

