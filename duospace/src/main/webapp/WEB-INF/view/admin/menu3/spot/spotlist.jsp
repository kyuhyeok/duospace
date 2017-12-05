<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="right_col" role="main">
			
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>상품 관리 <small>Product Manage</small></h3>
						</div>	
						<div class="title_right">
						</div>
					</div>
					<div class="clearfix"></div>
					
					<form action="productlist" class="form-horizontal" id="frm" name="frm" method="post" >
					
						<input name="r_page" type="hidden" value="1" />
						<input name="r_pagelimit" type="hidden" value="10" />
						<input name="r_rowlimit" type="hidden" value="10" />
				
						<input id="r_prseq" name="r_prseq" type="hidden" value="" />
						<input name="r_prseqarr" type="hidden" />
						<input name="r_column" type="hidden" value=""/>
						<input name="r_columnvalue" type="hidden" value=""/>
						
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="x_panel">
									<div class="x_title">
										<h2>검색 <small>Search</small></h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
											<li><a class="close-link"><i class="fa fa-close"></i></a></li>
	                       				</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
											
										<div class="form-group">
											<label class="col-sm-2 col-xs-12 control-label" for="sc_type">검색분류</label>
											<div class="col-sm-2 col-xs-12">
												<select class="form-control" name="sc_column">
													<option value="" >선택</option>
													<option value="pr_name"  >상품명</option>
													<option value="pr_code"  >상품코드</option>
													<option value="pr_model"  >모델</option>
													<option value="pr_manufacture"  >제조사</option>
													<option value="pr_country"  >원산지</option>
												</select>
											</div>
											<div class="col-sm-2 col-xs-12">
												<input class="form-control" id="sc_columnvalue" name="sc_columnvalue" placeholder="검색어" type="text" value="" />
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-2 col-xs-12 control-label" for="ctgr1">상품분류</label>
											<div class="col-sm-2 col-xs-12">
												<select class="form-control" id="ctgr1" name="ctgr1">
													<option value="">대분류선택</option>
													
														<option value="2"  >패션</option>
													
														<option value="3"  >컴퓨터</option>
													
														<option value="14"  >웹사이트</option>
													
														<option value="33"  >이벤트</option>
													
														<option value="51"  >동영상</option>
													
												</select>
											</div>
											<div class="col-sm-2 col-xs-12">
												<select class="form-control" id="ctgr2" name="ctgr2">
													<option value="">중분류선택</option>
													
												</select>
											</div>
											<div class="col-sm-2 col-xs-12">
												<select class="form-control" id="ctgr3" name="ctgr3">
													<option value="">소분류선택</option>
													
												</select>
											</div>
											<div class="col-sm-2 col-xs-12">
												<select class="form-control" id="ctgr4" name="ctgr4" >
													<option value="">상세분류선택</option>
													
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-2 col-xs-12 control-label" for="sc_prindates">상품등록일</label>
											<div class="col-sm-2 col-xs-12">
												<input class="form-control" id="sc_prindates" name="sc_prindates" placeholder="시작일" type="text" value="" />
											</div>
											<div class="col-sm-2 col-xs-12">
												<input class="form-control" id="sc_prindatee" name="sc_prindatee" placeholder="종료일" type="text" value="" />
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-2 col-xs-12 control-label" for="sc_pruse">전시여부</label>
											<div class="col-sm-10 col-xs-12">
												<label class="radio-inline">
													<input name="sc_pruse" type="radio" value="Y"  />YES
												</label>
												<label class="radio-inline">
													<input name="sc_pruse" type="radio" value="N"  />NO
												</label>
												<label class="radio-inline">
													<input name="sc_pruse" type="radio" value=""  />선택안함
												</label>
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-sm-2 col-xs-12" for="managerphoto">게시글 수</label>
											<div class="col-sm-2 col-xs-12">
												<select class="form-control" onchange="rowLimit(this);">
													<option value="10" selected="selected" >10</option>
													<option value="20"  >20</option>
													<option value="30"  >30</option>
													<option value="50"  >50</option>
													<option value="100"  >100</option>
													<option value="500"  >500</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-xs-12">
												<button type="button" class="btn btn-info btn-lg btn-block" onclick="dataSearch()">검색</button>
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
										<h2>상품 리스트 <small>Product List</small></h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a>Total 26 Rows</a></li>
											<li><a href="javascript:location.reload();"><i class="fa fa-refresh"></i></a></li>
											<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
											<li><a class="close-link"><i class="fa fa-close"></i></a></li>
	                       				</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
	
										<div class="table-responsive">
											<table class="table table-hover" id="table1" >
												<thead>
													<tr>
														<th>
															<input class="flat" id="ck_main" type="checkbox" />
														</th>
														<th>상품카테고리</th>
														<th>상품코드</th>
														<th>상품명</th>
														<th>상품가격</th>
														<th>상품이미지</th>
														<th>재고</th>
														<th>사용여부</th>
														<th>등록일</th>
														<th>관리</th>
													</tr>
												</thead>
												<tbody>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="39"/>
															</td>
															<td>
																삼성
															</td>
															<td>123123</td>
															<td>123123</td>
															<td>12,312,312</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/Jellyfish.jpg" /></td>
															<td>123123</td>
															<td>Y</td>
															<td>2017-11-06</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('39')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('39')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="37"/>
															</td>
															<td>
																티셔츠
															</td>
															<td>123</td>
															<td>123</td>
															<td>123</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/image1.jpg" /></td>
															<td>123</td>
															<td>Y</td>
															<td>2017-08-21</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('37')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('37')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="36"/>
															</td>
															<td>
																E-COMMERCE
															</td>
															<td>movie</td>
															<td>동영상강좌(LMS)</td>
															<td>400,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/F117_503.jpg" /></td>
															<td>10000</td>
															<td>Y</td>
															<td>2017-05-17</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('36')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('36')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="27"/>
															</td>
															<td>
																플라워콘
															</td>
															<td>fl321</td>
															<td>들풀</td>
															<td>85,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/F-A005_150.jpg" /></td>
															<td>1000</td>
															<td>Y</td>
															<td>2017-05-16</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('27')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('27')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="26"/>
															</td>
															<td>
																플라워콘
															</td>
															<td>fl200</td>
															<td>시들지 않는 나무</td>
															<td>4,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/F-A002_150.jpg" /></td>
															<td>100</td>
															<td>Y</td>
															<td>2017-05-16</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('26')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('26')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="25"/>
															</td>
															<td>
																플라워콘
															</td>
															<td>fl100</td>
															<td>네일꽃</td>
															<td>80,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/BW015_150.jpg" /></td>
															<td>1000</td>
															<td>Y</td>
															<td>2017-05-16</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('25')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('25')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="24"/>
															</td>
															<td>
																플라워콘
															</td>
															<td>flower100</td>
															<td>시들지 않는 꽃</td>
															<td>9,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/BW014_150.jpg" /></td>
															<td>10</td>
															<td>Y</td>
															<td>2017-05-16</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('24')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('24')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="23"/>
															</td>
															<td>
																액자
															</td>
															<td>photo1</td>
															<td>러블리액자</td>
															<td>18,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/BOT001_50.jpg" /></td>
															<td>10</td>
															<td>Y</td>
															<td>2017-05-16</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('23')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('23')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="22"/>
															</td>
															<td>
																플라워콘
															</td>
															<td>flower222</td>
															<td>마술꽃</td>
															<td>1,000,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/BT037S_150.jpg" /></td>
															<td>10</td>
															<td>Y</td>
															<td>2017-05-16</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('22')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('22')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
														
														<tr>
															<td>
																<input class="flat" name="ck_sub" type="checkbox" value="21"/>
															</td>
															<td>
																카네이션
															</td>
															<td>flower99</td>
															<td>카네이션</td>
															<td>30,000</td>
															<td><img style="width:50px;height:50px;" src="/data/up/product/BT006_50.jpg" /></td>
															<td>10</td>
															<td>Y</td>
															<td>2017-05-16</td>
															<td>
																<button type="button" class="btn btn-warning btn-xs" onclick="dataEdit('21')"><i class="fa fa-edit"></i></button>
																<button type="button" class="btn btn-danger btn-xs" onclick="dataDel('21')"><i class="fa fa-trash"></i></button>
															</td>
														</tr>
													
												</tbody>
											</table>
										</div>
										
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12">
												<button type="button" class="btn btn-success btn-sm" onclick="dataListUp( 'PR_USE', 'Y' )"><i class="fa fa-check-square-o"></i> 승인</button>
												<button type="button" class="btn btn-warning btn-sm" onclick="dataListUp( 'PR_USE', 'N' )"><i class="fa fa-check-square-o"></i> 미승인</button>
												<button type="button" class="btn btn-danger btn-sm" onclick="dataListDel()"><i class="fa fa-check-square-o"></i> 삭제</button>
											</div>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="pull-right">
													
	<script type="text/javascript">
		function pager( r_page ){
			$('input[name="r_page"]').val( r_page );
			handling.submit( '', '' );
		}
	</script>
	
	<span class="pageNum">
	
		
		
			<!-- * 처음이전처리 -->
			
				
				
					<button type="button" class="btn btn-info btn-sm">처음</button>
					<button type="button" class="btn btn-default btn-sm">이전</button>
				
			
			<!-- 처음이전처리 -->
			
			
				<button class="btn btn-default btn-sm active" type="button" >1</button>
			
			
			
			<!-- * 다음 끝처리 -->
			
			<!-- 다음 끝처리 -->
			
		
		
			<!-- * 처음이전처리 -->
			
			<!-- 처음이전처리 -->
			
			
			
				<button class="btn btn-default btn-sm" type="button" onclick="pager( 2 )">2</button>
			
			
			<!-- * 다음 끝처리 -->
			
			<!-- 다음 끝처리 -->
			
		
		
			<!-- * 처음이전처리 -->
			
			<!-- 처음이전처리 -->
			
			
			
				<button class="btn btn-default btn-sm" type="button" onclick="pager( 3 )">3</button>
			
			
			<!-- * 다음 끝처리 -->
			
				
					<button type="button" class="btn btn-default btn-sm" onclick="pager( 2 )">다음</button></a>
					<button type="button" class="btn btn-info btn-sm" onclick="pager( 3 )">끝</button></a>
				
				
			
			<!-- 다음 끝처리 -->
			
		
		
	</span>
	

												</div>
											</div>
										</div>
								
										<div class="ln_solid"></div>
										
										<div class="form-group">
											<div class="col-xs-12">
												<button type="button" class="btn btn-success btn-sm" onclick="dataAdd()"><i class="fa fa-plus"></i> 등록</button>
									    	</div>
										</div>
	
									</div>
								</div>
								
								<div class="x_panel">
									<div class="x_content">
										<div class="form-group">
											<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
											<!-- http://soledottest.cafe24.com 반응형 -->
											<ins class="adsbygoogle"
											     style="display:block"
											     data-ad-client="ca-pub-3935451468089596"
											     data-ad-slot="8661157767"
											     data-ad-format="auto"></ins>
											<script>
											(adsbygoogle = window.adsbygoogle || []).push({});
											</script>
										</div>
									</div>
								</div>
																
							</div>
							
						</div>
					
					</form>
					
				</div>
			</div>

</body>
</html>
