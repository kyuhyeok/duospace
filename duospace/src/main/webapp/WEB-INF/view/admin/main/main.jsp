<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
	<div class="top_nav">

		<div class="nav_menu">
			<nav class="" role="navigation">
				<div class="nav toggle">
					<a id="menu_toggle"><i class="glyphicon glyphicon-menu-hamburger"></i></a>
				</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						관리자 ▽ <span class=" fa fa-angle-down" ></span>
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

<div class="adminBodyFrame">
    			<div class="right_col" role="main" >
				<div class="container" style="background: #ffffff; ">
					<div class="page-title" style="margin: 0px 10px;">
						<div class="title_left">
							<h3>Index Page</h3>
						</div>

						<div class="title_right">
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel" style="height: 700px;">
								<div class="x_title">
									<h2>Notice Page</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link">▼</a></li>
										<li><a class="close-link">X</a></li>
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
</div>

