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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="솔닷(SoleDot)은 웹사이트(홈페이지, 쇼핑몰, mro, wms, e-commerce 등등) 개발 및 유지보수 업체입니다.">
<meta name="author" content="raon">
<meta name="keywords" content="web,responsiveweb,develope,programing,java,jsp,mro,wms,cms,e-commerce,homepage,반응형홈페이지,반응형쇼핑몰,홈페이지,쇼핑몰,고객관리,웹어플리케이션,유지보수" />
<meta name="robots" content="noindex, nofollow" />

<title>Duo Space: Administrator</title> 
<link href="<%=cp%>/resource/gentelella/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/css/animate.min.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/css/custom.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/fonts/css/font-awesome.min.css" rel="stylesheet" />
<link href="<%=cp%>/resource/gentelella/css/nprogress.css" rel="stylesheet" />
<link href="<%=cp%>/resource/css/soledot.css" rel="stylesheet" />

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