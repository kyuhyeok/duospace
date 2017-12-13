<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>DuoSpace-관리자</title>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
<link href="<%=cp%>/resource/gentelella/css/custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>	<!-- jquery cdn -->
<script src="<%=cp%>/resource/js/soledot.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css"/>
</head>
<body>
<div>
    <tiles:insertAttribute name="header"/>
</div>

<div class="container" role="main">
    <div class="row row-offcanvas row-offcanvas-right">
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" style="max-width: 240px;" id="sidebar">
            <tiles:insertAttribute name="left"/>
        </div>
        <div class="col-xs-12 col-sm-9 body-frame-2">
        <div class="top_nav">

		<div class="nav_menu">
			<nav class="" role="navigation">
				<div class="nav toggle">
					<a id="menu_toggle"><i class="glyphicon glyphicon-menu-hamburger"></i></a>
				</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="">
					<a href="#" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						관리자  <span class=" fa fa-angle-down" ></span>
					</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
						<li>
							<a href="<%=cp%>/member/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
						</li>
					</ul>
				</li>
				</ul>
			</nav>
		</div>
	</div>
                <tiles:insertAttribute name="body"/>
        </div>
     </div>
</div>

<div>
    <tiles:insertAttribute name="footer"/>
</div>

<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=cp%>/resource/gentelella/js/icheck/icheck.min.js"></script>
<script src="<%=cp%>/resource/gentelella/js/pace/pace.min.js"></script>
<script src="<%=cp%>/resource/gentelella/js/custom.js"></script></body>
</html>