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


<title>Duo Space: Administrator</title> 
<link href="<%=cp%>/resource/gentelella/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/css/animate.min.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/css/custom.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/fonts/css/font-awesome.min.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/css/nprogress.css" rel="stylesheet" />
<link href="<%=cp%>/resource/css/soledot.css" rel="stylesheet" />
<link href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>	<!-- jquery cdn -->
<script src="<%=cp%>/resource/js/soledot.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<title>DuoSpace-관리자</title>
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
                <tiles:insertAttribute name="body"/>
        </div>
     </div>
</div>

<div>
    <tiles:insertAttribute name="footer"/>
</div>

<script src="<%=cp%>/resource/gentelella/js/bootstrap.min.js"></script>
<script src="<%=cp%>/resource/gentelella/js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="<%=cp%>/resource/gentelella/js/icheck/icheck.min.js"></script>
<script src="<%=cp%>/resource/gentelella/js/pace/pace.min.js"></script>
<script src="<%=cp%>/resource/gentelella/js/custom.js"></script></body>
</html>