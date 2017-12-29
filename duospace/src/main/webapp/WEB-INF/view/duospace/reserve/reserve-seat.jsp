<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<!-- timepicker -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">


<script type="text/javascript">

$(function() {
		
		
		
		$(".reserve_mem_number").click(function() {
			$(this).css("background", "black");
			$(this).css("color", "white");

		});

//[name=passCode], .timepicker,  

		$("#timepicker").change(function(){
			//changeEnd();
			alert("ss");
	});
			
		$("[name=passCode], #date3").on("change",function(){
			changeEnd();
		});
		
		$("body").on("click",".reserve_change",function() {
					var usingTicket = $(":input:radio[name=passCode]:checked").attr("data-hour");     //체크한 이용권
					var tName = $(":input:radio[name=passCode]:checked").next().text();
				 	var tprice=$(":input:radio[name=passCode]:checked").attr("data-tprice");  //이용권가격
				 	var member = $(":input:radio[name=reserve_mem_number]:checked").val();  //멤버수
				 	var totalPrice=parseInt(tprice)*parseInt(member);  //이용권가격*멤버수
 	
				 	
				 	$(".resultTb>div").next().children().eq(1).text(tName);
				
				 	$(".resultTb>div:eq(4)>div:eq(1)").text(totalPrice);
				 
				 	
				});

		
		
		/*예약시간변경 or 층변경시 배치도 다시불러오기*/
		$("input[name=reserve_floor]").on("change",function(){
			//ajax
					
			var startTime=$(".resultTb>div").next().next().children().eq(1).text(); //시작시간
			var endTime=$(".resultTb>div").next().next().next().children().eq(1).text();	//종료시간
			var floorNum=$("input[name=reserve_floor]:checked").val();  //선택한 층번호
			
			//결제창의 층정보 보여주기
			var floorName=$("input[name=reserve_floor]:checked").next().text();
			$(".resultTb div:eq(0) div:eq(1)").text(floorName);
			//alert(floorName);
			
			
			if(startTime.length==0||endTime.length==0)
				return;
			
			var url="<%=cp%>/duospace/readPlacement";
			var data = "startTime="+startTime+"&endTime="+endTime+"&floorNum="+floorNum;
			
			//text방식
			$.ajax({
				type:"post"
				,url:url
				,data:data
				,success:function(result){
					console.log("성공");
					$(".seating_plan").empty();
					$(".seating_plan").html(result);
				}
			});
			
			
			
		});
		
		$("button[type=button]").click(function(){
				
			});
		
		
});

$(function() {
		$('.timepicker').timepicker();

		$("#date3").datepicker({
			minDate: 0,
			altFormat: "yyyy-mm-dd",
			showMonthAfterYear : true
		});

});

$(function(){
	
	$(".make-Seat-Tb tr td").each(function(index){
		if($(this).attr("class")!="selected")
			$(this).empty();
	});
	
	
	
	$(".make-Seat-Tb tr").eq(0).remove();
	
	
	$(".make-Seat-Tb tr").each(function(index){
		$(this).children().eq(0).remove();
	});
	
	$(".selected").css("border","1px solid black");
	
});


//숫자 2자릿수 맞추기 01:00  02:12 이렇게..
function pad(n) {
		n = n + '';
		return n.length >= 2 ? n : new Array(2 - n.length + 1).join('0') + n;
}


function changeEnd(){

	
		var usingTicket = $(":input:radio[name=passCode]:checked").attr("data-hour");
		//console.log(usingTicket);
		var startDate = $("#date3").val();
		
		//예약일 날짜/시간 쪼개기
		var time = $(".timepicker").val();
		
		if(! startDate || ! time || ! usingTicket){
			return;
		}
		
		var si = time.substring(0, 2);
		var bun = time.substring(3, 5);
		var ap = time.substring(6, 8);
		if (ap == 'PM') {
		si = parseInt(si) + 12;
		}
		
		var arr1 = startDate.split('-');
		
		//예약 끝 날짜에 값 넣기
		var date1 = new Date(parseInt(arr1[0]), parseInt(arr1[1])-1, parseInt(arr1[2]), si, bun); //시작일
		var date2 = new Date(parseInt(arr1[0]), parseInt(arr1[1])-1, parseInt(arr1[2]), si, bun); //종료일
		
	
		date2.setHours(date2.getHours() + parseInt(usingTicket));
		
		var mon = date2.getMonth()+1;

		
		date1 = arr1[0] + '/' + arr1[1] + '/' + arr1[2] + ' ' + si
			+ ":" + bun;
		date2 = date2.getFullYear() + '/' + pad(mon) + '/'
			+ pad(date2.getDate()) + ' '
			+ pad(date2.getHours()) + ":"
			+ pad(date2.getMinutes());
		
			
		
			
		$(".timepicker").next().val(date2);
		

		$(".resultTb>div").next().next().children().eq(1).text(date1);
		$(".resultTb>div").next().next().next().children().eq(1).text(date2);
		$("input[name=startDate]").val(date1);
}
function today(){
	   
    var date = new Date();

    var year  = date.getFullYear();
    var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
    var day   = date.getDate();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day;   }
   var re=year+"."+month+"."+day;
	return re;
}



function checkOk(tt) {
	

	var f=document.reserve_seat_form;
	
	var str=f.endTime;
	if(! str){
		alert("시간을 선택해주세요");
		return;
	}
	
	 str = f.passCode;
	
	var ch=false;
	for(var i=0; i<str.length;i++){
		if(str[i].checked==true)
			ch=true;
	}
	if(ch==false){
		alert("이용권을 선택해주세요");
		return;
	}
	
	str=f.reserve_floor;
	ch=false;
	for(var i=0;i<str.length;i++){
		if(str[i].checked==true)
			ch=true;
	}
	if(ch==false){
		alert("층을 선택해주세요");
		return;
	}
	
	
	str=$(".resultTb>div>div:eq(3)>input").val();
	if(! str){
		alert("자리를 선택해주세요");
		return;
	}
	
	
	var url="<%=cp%>/seat/updateForm?price="+price;
	var price=$(":input:radio[name=passCode]:checked").attr("data-tprice");
	var seatName=$(".resultTb>div>div:eq(3)>input").val();
	var d = today();
	
	$('#myModal .modal-body').load(url, function() {
	    $('#myModal .modal-title').html('예약 결제');
		
		$("#modalForm input[name=price]").val(price);
		$("#modalForm input[name=seatName]").val(seatName);
		$("#modalForm input[name=paydate]").val(d);
		
		$('#myModal').modal('show');

		
	});
}


function updateCancel() {
	$('#myModal').modal('hide');
}

function updateOk() {
	alert("ok");
}



function check() {
	
	var f=document.reserve_seat_form;
	
	if(! $("#modalForm input[name=cardNum]").val()){
		alert("카드번호를 입력하세요");
		return;
	}
		
/*
	var str=f.endTime;
	if(! str){
		alert("시간을 선택해주세요");
		return;
	}
	
	 str = f.passCode;
	
	var ch=false;
	for(var i=0; i<str.length;i++){
		if(str[i].checked==true)
			ch=true;
	}
	if(ch==false){
		alert("이용권을 선택해주세요");
		return;
	}
	
	str=f.reserve_floor;
	ch=false;
	for(var i=0;i<str.length;i++){
		if(str[i].checked==true)
			ch=true;
	}
	if(ch==false){
		alert("층을 선택해주세요");
		return;
	}
	
	
	str=$(".resultTb>div>div:eq(3)>input").val();
	if(! str){
		alert("자리를 선택해주세요");
		return;
	}
*/

	f.action="<%=cp%>/duospace/reserve_com";
	f.submit();
	
}
</script>

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








<!--
-->
.reserve_seat_form ul li {
	float: left;
	text-align: center;
	width: 60px;
	height: 50px;
	padding-top: 15px;
}
.reserve_seat_tb {
	border-spacing: 0px;
	border-collapse: collapse;
	width: 100%;
}

.reserve_seat_tb td {
	padding: 20px 0px 20px 60px;
}

.reserve_total tr {
	vertical-align: top;
}

.reserve_total td {
	padding: 10px 15px;
}
.make-Seat-Tb{
	border: 1px solid;
}
.make-Seat-Tb tr{
	height: 20px;
}
.make-Seat-Tb td{
	width: 20px;
	text-align: center;
	color: black;
}
.resultTb>div div{
	margin: 5px 6px;
	padding: 5px 5px;
}
.resultTb>div{
	padding-left: 10px;
}
.selected.choice{
	background-color: black;
	color: white;
}
.resultTb{
	font-size: 15px;
}
.btns{
	background-color: transparent;
	outline: none;
	border: 1px solid #172a40;
	font-family: 'Noto Sans KR', sans-serif;
	padding: 5px 7px;
	color: #172a40;
}
.btns:hover{
	background-color: #172a40;
	color: #ffffff;
}
input[type='text']{
	height: 30px;
}
</style>

</head>
<body>

	<div class="container" role="main">

		

	<div>
		<nav class="region-bar">
			<ul>
			<c:forEach var="dto" items="${regionList}">
				<li><a href="#">${dto.region}</a>
					<ul>
						<c:forEach var="vo" items="${spotList}">
						<c:if test="${dto.region==vo.region}">
							<li style="text-align: center;"><a href="<%=cp%>/duospace/reserve?spotCode=${vo.spotCode}">${vo.spotName}</a></li>
						</c:if>
						</c:forEach>
					</ul></li>
			</c:forEach>
			</ul>
		</nav>
	</div>
	     
	     
			
			
			<form name="reserve_seat_form" method="post">
				<table class="reserve_seat_tb" style="margin-top: 100px; ">
					<tr height="50px;">
						<td colspan="3" style="padding-left: 20px;">
						
						  <div style="border-top: 1px solid black;border-bottom: 1px solid black;height: 50px; width :570px; text-align: center;"><h4>좌석 예매</h4></div></td>
					</tr>
					<tr>     
						<td style="color: #878787;font-weight: bold;font-size: 16px;">예약시간</td>
						<td style="width: 400px;padding-left: 0px;">
							<input type="text" name="startTime" readonly="readonly" id="date3"
								style="margin-right: 3px; width: 100px; text-align: center;"
								placeholder="예약날짜"> 
							
							<input type="text" id="timepicker" name="startTime" class='timepicker' placeholder="시간" style="width: 100px; text-align: center;">
							~ 
							<input type="text" name="endTime" readonly="readonly" style="text-align: center;">
						</td>
						
						
						<td rowspan="4" style="vertical-align: top; padding-top: 0px; width: 300px;text-align: center;">
						  <div style="border: 1px solid #cccccc; width: 280px;">
							<div class="resultTb" style="height: 200px; padding-top: 20px;">
								<div>
									<div style="float: left; text-align: center; color: red; font-weight: bold;">${spotName}</div>
									<div style="float: left; text-align: center;color: #172A40;font-weight: bold;">&nbsp;&nbsp;</div>
									<div style="float: left; text-align: center; color: #878787;font-weight: bold; ">좌석명</div>
									<div style="float: left; text-align: center; color: #172A40;font-weight: bold;"></div>
								</div>
								<div style="clear: both;">
									<div style="float: left;color: #878787;font-weight: bold;">이 용 권</div>
									<div style="float: left; color: #172A40;font-weight: bold;"></div>
								</div>
								<div style="clear: both;">
									<div style="float: left;color: #878787;font-weight: bold;">시작일시</div>
									<div style="float: left; color: #172A40;font-weight: bold;"></div>
									<input type="hidden" name="startDate" value="">
								</div>
								<div style="clear: both;">
									<div style="float: left;color: #878787;font-weight: bold; margin-bottom: 20px;">종료일시</div>
									<div style="float: left; color: #172A40;font-weight: bold; margin-bottom: 20px;"></div>
								</div>
						
								<div style="clear: both; border-top: 1px solid #172A40">
									<div style="color: #878787;font-weight: bold;text-align: left; padding-bottom: 0px;; margin-top: 20px;">최종금액</div>
									<div style="float: left; color: #172A40;font-weight: bold;font-size: 20px;padding-top: 0px;margin-left:70px; margin-top: 5px;padding-right: 0px;margin-right: 0px;"></div>
									<div style="float: left; color: #172A40;font-weight: bold;padding-left: 0px; margin-left: 0px;">원</div>
								</div>
						

							</div>
							
							<div style="text-align: right; margin: 20px 30px 30px 0px; height: 60px;">
								<button type="button" class="btns" onclick="checkOk(1000);" style="width: 60px; height: 60px;font-weight: bold;">결제<br>하기</button>
							</div>
							
							
							</div>
						</td>
						
					</tr>
					
					<tr>
						<td style="color: #878787;font-weight: bold;font-size: 16px;">이용권</td>
						
						<td colspan="2" style="padding-left: 0px;">
											
							<c:forEach items="${passList}" var="dto">
								<input class="reserve_change" name="passCode" type="radio" value="${dto.passCode}" data-hour="${dto.passHour}" data-tprice="${dto.price}">
								<label>${dto.passName}</label>&nbsp;&nbsp;&nbsp;
							</c:forEach>
			
	 	<!--  
						<input class="reserve_change" name="passCode" type="radio" value="8" checked="checked" data-tprice="8000"><label>8hours</label> 
						<input class="reserve_change" name="passCode" type="radio" value="24" data-tprice="10000"><label>1day</label>
						<input class="reserve_change" name="passCode" type="radio" value="720" data-tprice="200000"><label>30days</label>
		-->					
	
						</td>
						
					</tr>

					<tr>
						<td width="100px" style="color: #878787;font-weight: bold;font-size: 16px;">인원</td>
						<td  colspan="2" style="padding-left: 0px;">
						<input class="reserve_change" name="reserve_mem_number" type="radio" value="1"
							checked="checked"><label>1</label> &nbsp;&nbsp;&nbsp;
							<input class="reserve_change" name="reserve_mem_number" type="radio" value="2"><label>2</label>&nbsp;&nbsp;&nbsp;
							<input class="reserve_change" name="reserve_mem_number" type="radio" value="3"><label>3</label>&nbsp;&nbsp;&nbsp;
							<input class="reserve_change" name="reserve_mem_number" type="radio" value="4"><label>4</label>

						</td>
						
					</tr>

					<tr>
						<td style="color: #878787;font-weight: bold;font-size: 16px;">층</td>
						<td  colspan="2" style="padding-left: 0px;">
							<c:forEach items="${floorList}" var="dto">
								<input name="reserve_floor" type="radio" value="${dto.floorNum}"><label>${dto.floorName}</label>&nbsp;&nbsp;&nbsp;
							</c:forEach>

						</td>
						
					</tr>
				
				</table>

<hr style="margin: 80px auto 30px; border: 1px solid #A3A09B;">

			<div class="seating_plan" style="clear: both; margin: 70px auto 200px 50px;">
				<!-- 배치도 넣을곳 -->
				${dto.placement}
			</div>
		<div style="margin-bottom: 200px;"></div>
			
			
		
			
			
			

		
		</form>

	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="myModalLabel" style="font-family: 나눔고딕, 맑은 고딕, sans-serif; font-weight: bold;">수정</h4>
				      </div>
				      <div class="modal-body"></div>
				    </div>
				  </div>
			</div>


	<!-- timepicker -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

