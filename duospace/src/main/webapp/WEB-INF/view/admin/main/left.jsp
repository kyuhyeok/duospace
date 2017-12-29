<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<div class="col-md-12 left_col">
		<div class="left_col scroll-view">

			<div class="navbar nav_title" style="border: 0;">
				<a href="<%=cp%>/admin" class="site_title">
					<span><i class="fa fa-home"></i>Duo Space</span>
				</a>
			</div>
			<div class="clearfix"></div>
			
			<!-- menu prile quick info -->
			<div class="profile">
				<div class="profile_pic">
					<div class="img-circle profile_img" style="height: 60px; width: 90px; text-align: center;" >
						<p style="font-size: 20px; font-family: Airways; color: #1d1d1b; line-height: 1.1em; font-weight: 500">Duo Space</p>
					</div>
				</div>
				<div class="profile_info" style="text-align: center;">
					<span>안녕하세요</span>
					<h2>관리자</h2>
				</div>
			</div>
			<!-- /menu prile quick info -->
			<br />
			<div class="clearfix"></div>
			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div class="menu_section">
					<ul class="nav side-menu">
						<li class="adminmenu">
						<h3>회원님</h3> 
							<a><i class="fa fa-user"></i>회원관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="<%=cp%>/admin/member/list">일반회원 리스트</a></li>
								<li><a href="#">일반회원 등록</a></li>
								<li><a href="#">회원등급 관리</a></li>
								<li><a href="#">적립금 적립/사용 내역</a></li>
								<li><a href="#">회원별 적립금 지급/차감</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-book"></i>도서관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="<%=cp%>/admin/booklist">도서 리스트</a></li>
								<li><a href="<%=cp%>/admin/book/created">도서 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-home"></i>지점관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="<%=cp%>/admin/spotlist">지점 리스트</a></li>
								<li><a href="<%=cp%>/admin/spot/created">지점 등록</a></li>
								<li><a href="<%=cp%>/admin/seat/list">좌석 배치도 리스트</a></li>
								<li><a href="<%=cp%>/admin/seat/created">좌석 배치도 등록</a></li>
								<li><a href="<%=cp%>/admin/roomlist">룸 정보 리스트</a></li>
								<li><a href="<%=cp%>/admin/room/created">룸 정보 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-coffee"></i>예약관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="<%=cp%>/admin/reserve/list">예약 리스트</a></li>
								<li><a href="#">예약 등록</a></li>
								<li><a href="<%=cp%>/admin/reserve/complete/list">완료된 예약리스트</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-coffee"></i>Core/Cafe관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">메뉴 리스트</a></li>
								<li><a href="#">메뉴 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-ticket"></i>이용권 관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">이용권 리스트</a></li>
								<li><a href="#">이용권 등록</a></li>
								<li><a href="#">기간별 이용권 조회</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-pencil-square-o"></i>게시판 관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">공지사항 리스트</a></li>
								<li><a href="<%=cp%>/admin/faq/list">FAQ 리스트</a></li>
								<li><a href="#">1:1문의 리스트</a></li>
								<li><a href="#">게시판 등록</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-won"></i>매출관리<span class="fa fa-chevron-down"></span></a>
							<ul class="nav child_menu" style="display: none">
								<li><a href="#">Core/Cafe 매출</a></li>
								<li><a href="<%=cp%>/admin/meachul/list">Duo Space 매출</a></li>
							</ul>
						</li>
						<li class="adminmenu">
							<a><i class="fa fa-bar-chart-o"></i>통계관리<span class="fa fa-chevron-down"></span></a>
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
		</div>
	</div>
	


