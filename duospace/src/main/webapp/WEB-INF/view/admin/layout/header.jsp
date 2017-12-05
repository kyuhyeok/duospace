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
					<div class="img-circle profile_img" style="font-family:Airways; ">Duo Space</div>
				</div>
				<div class="profile_info">
					<span>안녕하세요</span>
					<h2>관리자</h2>
				</div>
			</div>
			<!-- /menu prile quick info -->
			<br />
			<!-- sidebar menu -->
		
			<!-- /sidebar menu -->
		</div>
	</div>

z
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

		</div>
	</div>

	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

	
	


</body>

</html>