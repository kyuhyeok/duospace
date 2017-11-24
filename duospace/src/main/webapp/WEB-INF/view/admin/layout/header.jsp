<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

	
	<body class="nav-md footer_fixed">
	<div class="container body">
		<div class="main_container">
	<div class="col-md-3 left_col">
		<div class="left_col scroll-view">

			<div class="navbar nav_title" style="border: 0;">
				<a href="<%=cp%>/" class="site_title">
					<span>Duo Space!</span>
				</a>
			</div>
			<div class="clearfix"></div>
			
			<!-- menu prile quick info -->
			<div class="profile">
				<div class="profile_pic">
					<img src="<%=cp%>/resource/images/DuoSpace.PNG" alt="..." class="img-circle profile_img" />
				</div>
				<div class="profile_info">
					<span>안녕하세요</span>
					<h2>관리자</h2>
				</div>
			</div>
			<!-- /menu prile quick info -->
			<br />
			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div class="menu_section">
					<h3>회원님</h3>
					<ul class="nav side-menu">
						<li>
							<a>기본정보관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">사이트정보 관리</a></li>
								<li><a href="#">결제정보 관리</a></li>
								<li><a href="#">PG정보 관리</a></li>
								<li><a href="#">이용약관 관리</a></li>
								<li><a href="#">개인정보취급방침 관리</a></li>
								<li><a href="#">배송업체 관리</a></li>
							</ul>
						</li>
						<li>
							<a>시스템관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">접속로그</a></li>
								<li><a href="#">로그인로그</a></li>
							</ul>
						</li>
						<li>
							<a>디자인관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">메인 슬라이드 관리</a></li>
								<li><a href="#">메인 프로모션 관리</a></li>
								<li><a href="#">메인 서비스 관리</a></li>
								<li><a href="#">Header 디자인 관리</a></li>
								<li><a href="#">Header 배경이미지 관리</a></li>
							</ul>
						</li>
						<li>
							<a>회원관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">관리자 리스트</a></li>
								<li><a href="#">관리자 등록</a></li>
								<li><a href="#">일반회원 리스트</a></li>
								<li><a href="#">일반회원 등록</a></li>
								<li><a href="#">회원등급 관리</a></li>

								<li><a href="#">적립금 적립/사용 내역</a></li>
								<li><a href="#">회원별 적립금 지급/차감</a></li>
							</ul>
						</li>
						<li>
							<a>상품관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">카테고리 관리</a></li>
								<li><a href="#">상품 리스트</a></li>
								<li><a href="#">상품 등록</a></li>
								<li><a href="#">상품재고 관리</a></li>
								<li><a href="#">상품진열 관리</a></li>
								<li><a href="#">장바구니 관리</a></li>
								<li><a href="#">관심상품 관리</a></li>
							</ul>
						</li>
						<li>
							<a>주문관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">전체주문리스트</a></li>
								<li><a href="#">입금대기</a></li>
								<li><a href="#">결제완료</a></li>
								<li><a href="#">배송준비</a></li>
								<li><a href="#">배송중</a></li>
								<li><a href="#">배송완료</a></li>
								<li><a href="#">구매확정</a></li>
								<li><a>취소 | 교환 | 반품 | 환불<span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li class="sub_menu"><a href="#">취소신청</a></li>
										<li><a href="#">취소완료</a></li>
										<li><a href="#">반품신청</a></li>
										<li><a href="#">반품완료</a></li>
										<li><a href="#">교환신청</a></li>
										<li><a href="#">교환완료</a></li>
										<li><a href="#">환불신청</a></li>
										<li><a href="#">환불완료</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li>
							<a>매출관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/sales/bo/saleslist">매출리스트</a></li>
							</ul>
						</li>
						<li>
							<a>게시판관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">게시글 리스트</a></li>
								<li><a href="#">게시글 등록</a></li>
								<li><a href="#">Contact 리스트</a></li>
							</ul>
						</li>
						<li>
							<a>통계관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">회원 통계</a></li>
								<li><a href="#">매출 통계</a></li>
							</ul>
						</li>
					</ul>
				</div>

			</div>
			<!-- /sidebar menu -->
		</div>
	</div>


			<!-- top navigation -->
			
	<div class="top_nav">
		<div class="nav_menu">
			<nav class="" role="navigation">
				<div class="nav toggle">
					<a id="menu_toggle">메뉴</a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li class="">
						<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							관리자
						</a>
						<ul class="dropdown-menu dropdown-usermenu pull-right">
							<li>
								<a href="/memberlogin/bo/memberlogout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">

				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Index Page</h3>
						</div>

						<div class="title_right">
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel" style="height: 600px;">
								<div class="x_title">
									<h2>Notice Page</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a></li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<p>*듀스(DuoSpace) Web Application 사용 주의사항</p>
									<ul>
										<li>초기 <b>관리자 비밀번호를 꼭 변경</b>해주십시오.</li>
										<li>회원관리에서 <b>관리자를 미승인처리하면 로그인이 되지 않습니다.</b></li>
										<li>듀스은 <b>무료 솔루션</b>에 대한 <b>업무지원은 하지 않습니다.</b></li>
										<li>솔루션 이용하는 사이트에 대한 정보(IP,URL 등)를 수집하며, 듀스 홈페이지에 사이트가 노출 될 수 있습니다.</li>
										<li>사이트 <b>고유번호(siteid)를 유출하거나 변경하지마십시오.</b> 변경 또는 유출로 인한 책임은 사용자와 사용하는 회사에 있습니다.</li>
										<li>솔루션 <b>직접 업데이트로 인한 문제는 사용자와 사용하는 회사</b>에 있습니다.</li>
										<li>소스와 DB의 수정, 삭제, 추가는 자유입니다. 그러나 수정, 삭제, 추가로 인한 책임은 사용자와 사용하는 회사에 있습니다.</li>
										<li>듀스의 모든 Web Application은 <b>재배포를 허락하지 않습니다.</b></li>
										<li>추가 개발에 대한 문의는 홈페이지 <b><a href="<%=cp%>/" target="_blank">http://DuoSpace.com</a></b> 또는 이메일 <b><a href="mailto:master@duospace.com">master@duospace.com</a></b>으로 문의주십시오.</li>
									</ul>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>

	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

	
	


</body>

</html>