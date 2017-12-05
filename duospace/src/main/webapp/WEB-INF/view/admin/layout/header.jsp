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
				<a href="<%=cp%>/admin" class="site_title">
					<span>Duo Space</span>
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
						<li class="adminmenu">
							<a>회원관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">일반회원 리스트</a></li>
								<li><a href="#">일반회원 등록</a></li>
								<li><a href="#">회원등급 관리</a></li>
								<li><a href="#">적립금 적립/사용 내역</a></li>
								<li><a href="#">회원별 적립금 지급/차감</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a>도서관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">도서 리스트</a></li>
								<li><a href="#">도서 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a>지점관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="<%=cp%>/admin/spotlist">지점 리스트</a></li>
								<li><a href="#">지점 등록</a></li>
								<li><a href="#">좌석 배치도 리스트</a></li>
								<li><a href="#">좌석 배치도 등록</a></li>
								<li><a href="#">룸 정보 리스트</a></li>
								<li><a href="#">룸 정보 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a>Core/Cafe관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">메뉴 리스트</a></li>
								<li><a href="#">메뉴 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a>이용권 관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">이용권 리스트</a></li>
								<li><a href="#">이용권 등록</a></li>
								<li><a href="#">기간별 이용권 조회</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a>게시판 관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">공지사항 리스트</a></li>
								<li><a href="#">FAQ 리스트</a></li>
								<li><a href="#">1:1문의 리스트</a></li>
								<li><a href="#">게시판 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a>매출관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">Core/Cafe 매출</a></li>
								<li><a href="#">Duo Space 매출</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a>통계관리<span class="caret"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">매출 통계</a></li>
								<li><a href="#">회원 통계</a></li>
								<li><a href="#">연령대별 이용 통계</a></li>
								<li><a href="#">이용권 통계</a></li>
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
								<a href="<%=cp%>/main"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
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