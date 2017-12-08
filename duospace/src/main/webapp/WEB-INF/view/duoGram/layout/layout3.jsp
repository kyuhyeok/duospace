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
<title>DuoGram</title>
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/band/band.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/band/bandComponent.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/band/bandLayout.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css"/>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<style type="text/css">

.logo{
	font-family:Airways;
}

.wrap {
width: 500px;
}

.wrap textarea {
width: 100%;
resize: none;
overflow-y: hidden; /* prevents scroll bar flash */
padding: 1.1em; /* prevents text jump on Enter keypress */
padding-bottom: 0.2em;
line-height: 1.6;
}

</style>
</head>
<body>

<div>
    <tiles:insertAttribute name="header"/>
</div>

<div>
    <tiles:insertAttribute name="body"/>
</div>


    <tiles:insertAttribute name="fReq"/>



    <tiles:insertAttribute name="fMess"/>



    <tiles:insertAttribute name="fch"/>


<script type="text/javascript" src="<%=cp%>/resource/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>

</body>
</html>