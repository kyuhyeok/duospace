<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="솔닷(SoleDot)은 웹사이트(홈페이지, 쇼핑몰, mro, wms, e-commerce 등등) 개발 및 유지보수 업체입니다.">
    <meta name="author" content="raon">
    <meta name="keywords" content="web,responsiveweb,develope,programing,java,jsp,mro,wms,cms,e-commerce,homepage,반응형홈페이지,반응형쇼핑몰,홈페이지,쇼핑몰,고객관리,웹어플리케이션,유지보수" />
	
	<meta name="robots" content="noindex, nofollow" />

	<title>SoleDot : Administrator</title> 
	<!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="/include/soledot/images/bo/favicon.ico"/>
	
	<!-- Bootstrap core CSS -->
	<link href="/include/gentelella/css/bootstrap.min.css" rel="stylesheet" />
	<link href="/include/gentelella/css/animate.min.css" rel="stylesheet" />
	
	<!-- Custom styling plus plugins -->
	<link href="/include/gentelella/css/custom.css" rel="stylesheet" />
	
	<!-- Font Awesome -->
	<link href="/include/gentelella/fonts/css/font-awesome.min.css" rel="stylesheet" />
	
	<!-- NProgress -->
	<link href="/include/gentelella/css/nprogress.css" rel="stylesheet" />
	
	<!-- SoleDot -->
	<link href="/include/soledot/css/bo/soledot.css" rel="stylesheet" />
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>	<!-- jquery cdn -->
	
	<!-- soledot -->
	<script src="/include/soledot/js/soledot.js"></script>
	
	<!--[if lt IE 9]>
	<script src="../assets/js/ie8-responsive-file-warning.js"></script>
    <![endif]-->

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

<body class="nav-md footer_fixed">

	<div class="container body">
		<div class="main_container">

			

	<div class="col-md-3 left_col">
		<div class="left_col scroll-view">

			<div class="navbar nav_title" style="border: 0;">
				<a href="/home/bo/index" class="site_title">
					<i class="fa fa-paw"></i><span>SoleDot Admin!</span>
				</a>
			</div>
			<div class="clearfix"></div>

			<!-- menu prile quick info -->
			<div class="profile">
				<div class="profile_pic">
					<img src="/data/up/siteinfo/soledot.jpg" alt="..." class="img-circle profile_img" />
				</div>
				<div class="profile_info">
					<span>안녕하세요,</span>
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
							<a><i class="fa fa-home"></i>기본정보관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/home/bo/siteinfoedit">사이트정보 관리</a></li>
								<li><a href="/home/bo/paymentinfoedit">결제정보 관리</a></li>
								<li><a href="/home/bo/paymentgatewayedit">PG정보 관리</a></li>
								<li><a href="/home/bo/agreementedit">이용약관 관리</a></li>
								<li><a href="/home/bo/privacyedit">개인정보취급방침 관리</a></li>
								<li><a href="/parcelcompany/bo/parcelcompanylist">배송업체 관리</a></li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-desktop"></i>시스템관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/accesslog/bo/accessloglist">접속로그</a></li>
								<li><a href="/memberlog/bo/memberloglist">로그인로그</a></li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-photo"></i>디자인관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/designmainslide/bo/designmainslidelist">메인 슬라이드 관리</a></li>
								<li><a href="/designpromotion/bo/designpromotionlist">메인 프로모션 관리</a></li>
								<li><a href="/designservice/bo/designservicelist">메인 서비스 관리</a></li>
								<li><a href="/designheader/bo/designheaderedit">Header 디자인 관리</a></li>
								<li><a href="/designheaderbg/bo/designheaderbglist">Header 배경이미지 관리</a></li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-user"></i>회원관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/member/bo/adminmemberlist">관리자 리스트</a></li>
								<li><a href="/member/bo/adminmemberadd">관리자 등록</a></li>
								<li><a href="/member/bo/memberlist">일반회원 리스트</a></li>
								<li><a href="/member/bo/memberadd">일반회원 등록</a></li>
								<li><a href="/membergrade/bo/membergradelist">회원등급 관리</a></li>

								<li><a href="/savemoney/bo/savemoneylist">적립금 적립/사용 내역</a></li>
								<li><a href="/savemoney/bo/savemoneymemberlist">회원별 적립금 지급/차감</a></li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-gift"></i>상품관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/productcategory/bo/productcategoryview">카테고리 관리</a></li>
								<li><a href="/product/bo/productlist">상품 리스트</a></li>
								<li><a href="/product/bo/productadd">상품 등록</a></li>
								<li><a href="/product/bo/productstocklist">상품재고 관리</a></li>
								<li><a href="/productdisplay/bo/productdisplaylist">상품진열 관리</a></li>
								<li><a href="/productbasket/bo/productbasketlist">장바구니 관리</a></li>
								<li><a href="/productwish/bo/productwishlist">관심상품 관리</a></li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-shopping-cart"></i>주문관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/ordermain/bo/ordermainlist">전체주문리스트</a></li>
								<li><a href="/ordermain/bo/ordermainlist?r_omstatus=B1">입금대기</a></li>
								<li><a href="/ordermain/bo/ordermainlist?r_omstatus=C1">결제완료</a></li>
								<li><a href="/ordermain/bo/ordermaindeliverylist?r_omstatus=D1">배송준비</a></li>
								<li><a href="/ordermain/bo/ordermainlist?r_omstatus=E1">배송중</a></li>
								<li><a href="/ordermain/bo/ordermainlist?r_omstatus=F1">배송완료</a></li>
								<li><a href="/ordermain/bo/ordermainlist?r_omstatus=G1">구매확정</a></li>
								<li><a>취소 | 교환 | 반품 | 환불<span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li class="sub_menu"><a href="/ordermain/bo/ordermainlist?r_omstatus=H1">취소신청</a></li>
										<li><a href="/ordermain/bo/ordermainlist?r_omstatus=H2">취소완료</a></li>
										<li><a href="/ordermain/bo/ordermainlist?r_omstatus=I1">반품신청</a></li>
										<li><a href="/ordermain/bo/ordermainlist?r_omstatus=I2">반품완료</a></li>
										<li><a href="/ordermain/bo/ordermainlist?r_omstatus=J1">교환신청</a></li>
										<li><a href="/ordermain/bo/ordermainlist?r_omstatus=J2">교환완료</a></li>
										<li><a href="/ordermain/bo/ordermainlist?r_omstatus=K1">환불신청</a></li>
										<li><a href="/ordermain/bo/ordermainlist?r_omstatus=K2">환불완료</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-won"></i>매출관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/sales/bo/saleslist">매출리스트</a></li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-pencil-square-o"></i>게시판관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/boardarticle/bo/boardarticlelist">게시글 리스트</a></li>
								<li><a href="/boardarticle/bo/boardarticleadd">게시글 등록</a></li>
								<li><a href="/projectrequest/bo/projectrequestlist">Contact 리스트</a></li>
							</ul>
						</li>
						<li>
							<a><i class="fa fa-bar-chart-o"></i>통계관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="/statistics/bo/statisticsmember">회원 통계</a></li>
								<li><a href="/statistics/bo/statisticssales">매출 통계</a></li>
							</ul>
						</li>
					</ul>
				</div>

			</div>
			<!-- /sidebar menu -->

			<!-- /menu footer buttons -->
			<div class="sidebar-footer hidden-small">
				<a data-toggle="tooltip" data-placement="top" title="Settings">
					<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
				</a>
				<a data-toggle="tooltip" data-placement="top" title="FullScreen">
					<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
				</a>
				<a data-toggle="tooltip" data-placement="top" title="Lock">
					<span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
				</a>
				<a data-toggle="tooltip" data-placement="top" title="Logout">
					<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
				</a>
			</div>
			<!-- /menu footer buttons -->
		</div>
	</div>


			<!-- top navigation -->
			
	<div class="top_nav">

		<div class="nav_menu">
			<nav class="" role="navigation">
				<div class="nav toggle">
					<a id="menu_toggle"><i class="fa fa-bars"></i></a>
				</div>

			<ul class="nav navbar-nav navbar-right">
				<li class="">
					<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						관리자 <span class=" fa fa-angle-down" ></span>
					</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
<!-- 						<li> -->
<!-- 							<a href="javascript:;">Profile</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a href="javascript:;"><span class="badge bg-red pull-right">50%</span> <span>Settings</span></a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a href="javascript:;">Help</a> -->
<!-- 						</li> -->
						<li>
							<a href="/memberlogin/bo/memberlogout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
						</li>
					</ul>
				</li>

<!-- 				<li role="presentation" class="dropdown"> -->
<!-- 					<a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">  -->
<!-- 						<i class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span> -->
<!-- 					</a> -->
<!-- 					<ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu"> -->
<!-- 						<li> -->
<!-- 							<a> -->

<!-- 								<span><span>John Smith</span><span class="time">3 mins ago</span></span>  -->
<!-- 								<span class="message"> Film festivals used to be do-or-die moments for movie makers. They were where... </span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a> -->

<!-- 								<span><span>John Smith</span> <span class="time">3 mins ago</span></span> -->
<!-- 								<span class="message"> Film festivals used to be do-or-die moments for movie makers. They were where... </span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a> -->

<!-- 								<span><span>John Smith</span> <span class="time">3 mins ago</span></span> -->
<!-- 								<span class="message"> Film festivals used to be do-or-die moments for movie makers. They were where... </span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<a> -->

<!-- 								<span> <span>John Smith</span> <span class="time">3 mins ago</span></span> -->
<!-- 								<span class="message"> Film festivals used to be do-or-die moments for movie makers. They were where... </span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<div class="text-center"> -->
<!-- 								<a href="inbox.html"> <strong>See All Alerts</strong> <i class="fa fa-angle-right"></i></a> -->
<!-- 							</div> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</li> -->
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
									<p>*솔닷(SoleDot) Web Application 사용 주의사항</p>
									<ul>
										<li>초기 <b>관리자 비밀번호를 꼭 변경</b>해주십시오.</li>
										<li>회원관리에서 <b>관리자를 미승인처리하면 로그인이 되지 않습니다.</b></li>
										<li>솔닷은 <b>무료 솔루션</b>에 대한 <b>업무지원은 하지 않습니다.</b></li>
										<li>솔루션 이용하는 사이트에 대한 정보(IP,URL 등)를 수집하며, 솔닷 홈페이지에 사이트가 노출 될 수 있습니다.</li>
										<li>사이트 <b>고유번호(siteid)를 유출하거나 변경하지마십시오.</b> 변경 또는 유출로 인한 책임은 사용자와 사용하는 회사에 있습니다.</li>
										<li>솔루션 <b>직접 업데이트로 인한 문제는 사용자와 사용하는 회사</b>에 있습니다.</li>
										<li>소스와 DB의 수정, 삭제, 추가는 자유입니다. 그러나 수정, 삭제, 추가로 인한 책임은 사용자와 사용하는 회사에 있습니다.</li>
										<li>솔닷의 모든 Web Application은 <b>재배포를 허락하지 않습니다.</b></li>
										<li>추가 개발에 대한 문의는 홈페이지 <b><a href="http://soledot.com" target="_blank">http://soledot.com</a></b> 또는 이메일 <b><a href="mailto:master@soledot.com">master@soledot.com</a></b>으로 문의주십시오.</li>
									</ul>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			
			<footer>
				<div class="pull-right">
					Developed by <b><a href="http://www.soledot.com" style="color:white;" target="_blank" >SoleDot</a></b> | Template by <a href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
<!--<iframe style="visibility:hidden;display:none" src="http://soledot.com/home/index"></iframe>-->
			<!-- /footer content -->

		</div>
	</div>

	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

	
	
	<script src="/include/gentelella/js/bootstrap.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="/include/gentelella/js/progressbar/bootstrap-progressbar.min.js"></script>
    <!-- icheck -->
    <script src="/include/gentelella/js/icheck/icheck.min.js"></script>
    
	<!-- pace -->
	<script src="/include/gentelella/js/pace/pace.min.js"></script>
	
	<script src="/include/gentelella/js/custom.js"></script>

</body>

</html>