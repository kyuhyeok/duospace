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
<style type="text/css">

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
function selectDate(obj) {
	rangeDate(obj.value);
}

function inputChange(obj) {
	if(! obj.value) return;
	
	rangeDate($("#rs_daterange").val());
}

function rangeDate(data) {
	
	var strDate1= $("#rs_date").val();
	if(! strDate1) return;
	
	var arr1 = strDate1.split('-');
	if(arr1.length<3) return;
	
	if(data==1){
		var date2 = new Date(parseInt(arr1[0]), parseInt(arr1[1]), parseInt(arr1[2]));
	    $("#rs_date2").val(strDate(date2));
	} else if(data==2){
		var date2 = new Date(parseInt(arr1[0]), parseInt(arr1[1])+5, parseInt(arr1[2]));
	    $("#rs_date2").val(strDate(date2));
	} else if(data==3){
		var date2 = new Date(parseInt(arr1[0]), parseInt(arr1[1])+11, parseInt(arr1[2]));
	    $("#rs_date2").val(strDate(date2));
	}
}



function Dialog(roomCode, roomName, floorName) {
	var url="<%=cp%>/createdForm?roomCode="+roomCode+"&roomName="+roomName+"&floorName="+floorName;
	$('#myRoomModal .modal-body').load(url, function () {
		
		
		$("#modalForm input[name=roomCode]").val(roomCode);
		$("#modalForm input[name=roomName]").val(roomName);
		$("#modalForm input[name=floorName]").val(floorName);
		var date = new Date();
		$("#modalForm input[name=startDate]").val(strDate(date));
		$("#modalForm input[name=endDate]").val(strDate(new Date(date.getFullYear(), date.getMonth()+1, date.getDate())));


		$('#myRoomModal').modal('show');
	});
	
}

function strDate(date) {
	var y=date.getFullYear();
	var m=date.getMonth()+1;
	if(m<10) m="0"+m;
	var d=date.getDate();
	if(d<10) d="0"+d;
	
	return y+"-"+m+"-"+d;
}
function Dialogcancel() {
	$('#myRoomModal').modal('hide');
}
function SendOk(reservNum) {
	var f=document.modalForm;
	f.action="<%=cp%>/rmres";
	f.submit();
	
}
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
							<li style="text-align: center;"><a href="<%=cp%>/room?spotCode=${vo.spotCode}&roomCode=${vo.roomCode}">${vo.spotName}</a></li>
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
  	<c:forEach var="vo" items="${rlist}">
  	<c:if test="${dto.spotCode==vo.spotCode}">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading" style="height: 100%; width: 100%;">
          <h1 style="height: 100%;">${vo.roomName}</h1>
        </div>
        <div class="panel-body-img" style="width: 100%">
          <img src="<%=cp%>/resource/images/duospace/Room/${vo.saveFileName}" style="width: 100%">
        </div>
        <div class="panel-footer">
          <h3>\<fmt:formatNumber value="${vo.price}" pattern="#,###"/>/1월</h3>
          <h2>${vo.floorName}</h2>
          <h4>${vo.rcontent}</h4>
         	 <a id="reserve" class="btn btn-lg" href="javascript:Dialog('${vo.roomCode}', '${vo.roomName}', '${vo.floorName}')">예약하기</a>
        </div>
      </div>      
    </div>   
    </c:if>
  </c:forEach>
    </c:forEach>
  </div>
</div>
	<div class="modal fade" id="myRoomModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">예약 등록</h4>
        </div>
         <div class="modal-body"></div>
      </div>
    </div>
  </div>		
  
  
</body>
</html>
