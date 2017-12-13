<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"><style type="text/css">
<!--
메뉴스타일-->#container {
	margin: 0 auto;
}

.region-bar ul {
	padding: 0;
	margin: 0;
	list-style: none;
	position: relative;
	border: 1px solid #D8D8D8;
	border-style: outset;
	border-left: 0px;
	border-right: 0px;
}

.region-bar ul li {
	display: inline-block;

}

.region-bar a {
	color: #000000;
	display: block;
	padding: 0 10px;
	font-size: 14px;
	line-height: 60px;
	text-decoration: none;
}

.region-bar a:hover { 
	color: #ffffff;
	text-decoration:none;
	background-color: #333333;
}

/* Hide Dropdowns by Default */
.region-bar ul ul {
	display: none;
	position: absolute;
	top: 60px; /* the height of the main nav */
}

/* Display Dropdowns on Hover */
.region-bar ul li:hover>ul {
	display: inherit;
}
.region-bar ul li:hover>ul li {
	display: inherit;
	float: left;
}
/* Fisrt Tier Dropdown */
.region-bar ul ul li {
	width: 90px;
	float: none;
	display: list-item;
	position: relative;
}

/* Second, Third and more Tiers	*/
.region-bar ul ul ul li {
	position: relative;
	top: -60px;
}
.container-fluid{
	padding: 0px;
}
.panel {
    border: 1px solid #172A40; 
    border-radius:0;
    transition: box-shadow 0.5s;
}

.panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
}

.panel-footer .btn:hover {
    border: 1px solid #8C8C8C;
    background-color: #D9383A!important; 
    color: white;
}

.panel-heading {
    color: #09504F !important; 
    padding: 25px;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
}

.panel-footer {
    background-color: white !important;
}

.panel-footer h3 {
	color:#09504F;
    font-size: 32px;
}

.panel-footer h4 {
    color: #aaa;
    font-size: 14px;
}

.panel-footer .btn {
    margin: 15px 0;
    background-color: #09504F;
    color: #ffffff;
}
.panel-body-img img{
	max-width: 350px;
	max-height: 150px;
}
.panel-body-img{
	padding: 15px;
}
</style>
<script type="text/javascript">
function autoDate() {
	var strDate1= "2017-12-13";
	var strDate2= "2017-12-13";
	
	var arr1 = strDate1.split('-');
	var arr2 = strDate2.split('-');
	
	var date1 = new Date(arr1[0], arr1[1], arr1[2]);
	var date2 = new Date(arr1[0], arr1[1], arr1[2]);
	
	$("#rs_date").val(strDate1);
    $("#rs_date2").val(date2.getFullYear()+"-"+ (date2.getMonth()+1) + "-" + date2.getDate());
    var diff = date2 - date1;
    var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
    var currMonth = currDay * 30;// 월 만듬
    var currYear = currMonth * 12; // 년 만듬

    
};

function mDate(obj) {
	
	var strDate1= "2017-12-13";
	var strDate2= "2017-12-13";
	
	var arr1 = strDate1.split('-');
	var arr2 = strDate2.split('-');
	
	var date1 = new Date(arr1[0], arr1[1], arr1[2]);
	var date2 = new Date(arr1[0], arr1[1], arr1[2]);
	if(obj.value==1){
		$("#rs_date").val(strDate1);
	    $("#rs_date2").val(date2.getFullYear()+"-"+ (date2.getMonth()+1) + "-" + date2.getDate());
	}
	if(obj.value==2){
		$("#rs_date").val(strDate1);
		$("#rs_date2").val(date2.getFullYear()+"-"+ (date2.getMonth()+6) + "-" + date2.getDate());
	}
	if(obj.value==3){
		$("#rs_date").val(strDate1);
		$("#rs_date2").val(date2.getFullYear()+"-"+ (date2.getMonth()+12) + "-" + date2.getDate());
	}
}

$(function() {
	
	$("#rs_date").datepicker({minDate: 0,
		altFormat: "yyyy-mm-dd"
	});

	

});


</script>
</head>
<body>
<div>
	<nav class="region-bar">
			<ul>
	<c:forEach var="dto" items="${region}">
				<li><a href="#">${dto.region}</a>
					<ul>
						<c:forEach var="vo" items="${slist}">
						<c:if test="${dto.region==vo.region}">
							<li style="text-align: center;"><a href="<%=cp%>/room?spotCode=${vo.spotCode}">${vo.spotName}</a></li>
						</c:if>
						</c:forEach>
					</ul></li>
	</c:forEach>
			</ul>
				</nav>
			</div>

<div class="container" style="margin: 11% 0px; border-top: 1px solid #D8D8D8;">
  <div class="text-center">
    <h2 style="margin: 5% 0px;">룸 예약(Room Reservation)</h2>
    <h4 style="margin-bottom: 5%;"> 독립된 공간으로 마음껏 대화를 나눠 보세요!</h4>
  </div>
  <div class="row">
  <c:forEach var="dto" items="${slist}">
   <c:forEach var="vo" items="${list}">
  <c:if test="${vo.spotCode==dto.spotCode}">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>${vo.roomName}</h1> 
        </div>
        <div class="panel-body-img" style="width: 100%">
          <img src="<%=cp%>/resource/images/duospace/Room/${vo.saveFileName}">
        </div>
        <div class="panel-footer">
          <h3>\<fmt:formatNumber value="${vo.price}" pattern="#,###"/>/1월</h3>
          <h4>${vo.rcontent}</h4>
          <button  type="button" class="btn btn-lg" data-toggle="modal" data-target="#myModal" onclick="autoDate();">예약하기</button>
        </div>
      </div>      
    </div>   
  </c:if>
    </c:forEach>  
    </c:forEach>
  </div>
</div>
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">예약 등록</h4>
        </div>
        
         <div class="modal-body">
					<div id="newmodal" style="padding: 5px 20px;">
						<form class="form-horizontal calender" id="modal-frm" name="modal-frm" role="form">
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">룸 이름</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" type="text" readonly="readonly" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">시작일</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_date" name="rs_date" type="text"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">이용기간</label>
								<div class="col-sm-9 col-xs-12">
									<select class="form-control" id="rs_daterange" name="rs_daterange" onchange="javascript:mDate(this);">
										<option value="1">1개월</option>
										<option value="2">6개월</option>
										<option value="3">1년</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">종료일</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_date2" name="rs_date" type="text" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">인원</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_people" name="rs_people" type="text" value=""/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">예약자명*</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_name" name="rs_name" type="text" value=""/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">연락처*</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_phone" name="rs_phone" type="text" value=""/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 col-xs-12 control-label">이메일</label>
								<div class="col-sm-9 col-xs-12">
									<input class="form-control" id="rs_email" name="rs_email" type="text" value=""/>
								</div>
							</div>
						</form>
					</div>
				</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary antosubmit" data-dismiss="modal">예약</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>		
  	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

  
</body>
</html>
