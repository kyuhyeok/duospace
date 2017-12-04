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

		
		$("button").click(
				function() {
					var usingTicket = $(
							":input:radio[name=reserve_usingTicket]:checked")
							.val();
					//console.log(usingTicket);
					var startDate = $("#date3").val();

					//예약일 날짜/시간 쪼개기
					var time = $(".timepicker").val();
					var si = time.substring(0, 2);
					var bun = time.substring(3, 5);
					var ap = time.substring(6, 8);
					if (ap == 'PM') {
						si = parseInt(si) + 12;
					}

					var arr1 = startDate.split('-');

					//예약 끝 날짜에 값 넣기
					var date1 = new Date(arr1[0], arr1[1], arr1[2], si, bun); //시작일
					var date2 = new Date(arr1[0], arr1[1], arr1[2], si, bun); //종료일
					date2.setHours(date2.getHours() + parseInt(usingTicket));

					var mon = date2.getMonth();
					if (mon == 0)
						mon = 12;

					date1 = arr1[0] + '/' + arr1[1] + '/' + arr1[2] + ' ' + si
							+ ":" + bun;
					date2 = date2.getFullYear() + '/' + pad(mon) + '/'
							+ pad(date2.getDate()) + ' '
							+ pad(date2.getHours()) + ":"
							+ pad(date2.getMinutes());
					$(".timepicker").next().val(date2);

					$(".reserve_total").children().children().eq(0).children()
							.eq(0).children().eq(1).children().eq(1)
							.text(date1);
					$(".reserve_total").children().children().eq(0).children()
							.eq(0).children().eq(2).children().eq(1)
							.text(date2);

				});


		
		$("body").on("click",".reserve_change",function() {
					var usingTicket = $(":input:radio[name=reserve_usingTicket]:checked").val();    //체크한 이용권
				 	var tprice=$(":input:radio[name=reserve_usingTicket]:checked").attr("data-tprice");  //이용권가격
				 	var member = $(":input:radio[name=reserve_mem_number]:checked").val();  //멤버수
				 	var totalPrice=parseInt(tprice)*parseInt(member);  //이용권가격*멤버수
				 	$(".reserve_total").children().children().eq(0).children().eq(0).children().eq(3).children().eq(1).text(member);
					$(".reserve_total  td:eq(3) div:eq(0) div:eq(1) div:eq(2)").text(member);
				 	$(".reserve_total").children().children().eq(0).children().eq(2).children().eq(0).children().eq(1).text(usingTicket+'시간');
				 	$(".reserve_total").children().children().eq(0).children().eq(2).children().eq(1).children().eq(1).text(tprice+'원');
				 	$(".reserve_total  td:eq(3) div:eq(0) div:eq(1) div:eq(0)").text(tprice);
				 	$(".reserve_total  td:eq(3)").children().eq(1).children().eq(1).text(totalPrice);
				 	
				});

	});

	$(function() {
		$('.timepicker').timepicker();

		$("#date3").datepicker({
			showMonthAfterYear : true
		});

	});

	//숫자 2자릿수 맞추기 01:00  02:12 이렇게..
	function pad(n) {
		n = n + '';
		return n.length >= 2 ? n : new Array(2 - n.length + 1).join('0') + n;
	}
</script>

<style type="text/css">
<!--
메뉴스타일-->#container {
	margin: 0 auto;
}

nav {
	margin: 50px 0;
	background-color: #E64A19;
}

nav ul {
	padding: 0;
	margin: 0;
	list-style: none;
	position: relative;
}

nav ul li {
	display: inline-block;
	background-color: #E64A19;
}

nav a {
	display: block;
	padding: 0 10px;
	color: #FFF;
	font-size: 20px;
	line-height: 60px;
	text-decoration: none;
}

nav a:hover {
	background-color: #000000;
}

/* Hide Dropdowns by Default */
nav ul ul {
	display: none;
	position: absolute;
	top: 60px; /* the height of the main nav */
}

/* Display Dropdowns on Hover */
nav ul li:hover>ul {
	display: inherit;
	
}
nav ul li:hover>ul li {
	display: inherit;
	float: left;
}
/* Fisrt Tier Dropdown */
nav ul ul li {
	width: 170px;
	float: none;
	display: list-item;
	position: relative;
}

/* Second, Third and more Tiers	*/
nav ul ul ul li {
	position: relative;
	top: -60px;
	left: 170px;
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
	margin: 100px 0px 50px 0px;
}

.reserve_seat_tb td {
	padding: 20px 0px 20px 20px;
}

.reserve_total tr {
	vertical-align: top;
}

.reserve_total td {
	padding: 10px 15px;
}
</style>

</head>
<body>

	<div class="container" role="main">

		<form name="reserve_seat_form">

			<div>
				<nav>
					<ul>
						<li><a href="#">서울</a> <!-- First Tier Drop Down -->
							<ul>
								<li><a href="#">Duo강남</a></li>
								<li><a href="#">Duo당산</a></li>
								<li><a href="#">Duo목동</a></li>
							</ul></li>

						<li><a href="#">경기</a> <!-- Second Tier Drop Down -->
							<ul>
								<li><a href="#">Duo몰라d</a></li>
								<li><a href="#">Duo어쩔</a></li>
								<li><a href="#">Duo응응</a></li>
							</ul></li>

						<li><a href="#">인천</a> <!-- Third Tier Drop Down -->
							<ul>
								<li><a href="#">Duo그래</a></li>
								<li><a href="#">Duo이응</a></li>
								<li><a href="#">Duo오키</a></li>
							</ul></li>
					</ul>
				</nav>
			</div>

			<div>
				<table class="reserve_seat_tb" style="border: 2px solid #e4e4e4">
					<tr height="50px;">
						<td align="center" colspan="2">좌석 예매</td>
					</tr>
					<tr>
						<td>이용권</td>
						<td><input class="reserve_change" name="reserve_usingTicket" type="radio" value="8" checked="checked" data-tprice="8000"><label>8hours</label> 
							<input class="reserve_change" name="reserve_usingTicket" type="radio" value="24" data-tprice="10000"><label>1day</label>
							<input class="reserve_change" name="reserve_usingTicket" type="radio" value="720" data-tprice="200000"><label>30days</label>
							
	
						</td>
					</tr>

					<tr>
						<td width="100px">인원</td>
						<td><input class="reserve_change" name="reserve_mem_number" type="radio" value="1"
							checked="checked"><label>1</label> 
							<input class="reserve_change" name="reserve_mem_number" type="radio" value="2"><label>2</label>
							<input class="reserve_change" name="reserve_mem_number" type="radio" value="3"><label>3</label>
							<input class="reserve_change" name="reserve_mem_number" type="radio" value="4"><label>4</label>

						</td>
					</tr>

					<tr>
						<td>예약시간</td>
						<td><input type="text" readonly="readonly" id="date3"
							style="margin-right: 3px; width: 100px; text-align: center;"
							placeholder="예약날짜"> <input type="text" class='timepicker'
							placeholder="시간" style="width: 100px; text-align: center;">
							~ <input type="text" readonly="readonly"
							style="text-align: center;"></td>
					</tr>

					<tr>
						<td>층</td>
						<td><input name="reserve_floor" type="radio" value="1"
							checked="checked"><label>1F</label> <input
							name="reserve_floor" type="radio" value="2"><label>2F</label>
							<input name="reserve_floor" type="radio" value="3"><label>3F</label>

						</td>
					</tr>
				</table>

			</div>


			<div class="seating_plan">
				<!-- 배치도 넣을곳 -->
				배<br>치<br>도

			</div>


			<div style="padding: 10px 10px; border: 1px solid;margin: 50px 0px 50px 0px;">
				<table class="reserve_total" style="width: 100%; height: 100px;">
					<tr>
						<td>
							<div style="clear: both;">
								<div style="float: left">지점&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								<div style="float: left">Duo강남</div>
							</div>
							<div style="clear: both;">
								<div style="float: left">시작일시&nbsp;</div>
								<div style="float: left">2017.02.13 7:00</div>
							</div>
							<div style="clear: both;">
								<div style="float: left">종료일시&nbsp;</div>
								<div style="float: left">2017.02.13 15:00</div>
							</div>
							<div style="clear: both;">
								<div style="float: left">인원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								<div style="float: left">4명</div>
							</div>
						</td>
						<td style="border-left: 1px solid">
							<div style="clear: both;">
								<div style="float: left">좌석명&nbsp;</div>
								<div style="float: left">A-50</div>
							</div>
						</td>

						<td style="border-left: 1px solid">
							<div style="clear: both;">
								<div style="float: left">이용권&nbsp;</div>
								<div style="float: left">8시간</div>
							</div>
							<div style="clear: both;">
								<div style="float: left">이용권가격&nbsp;</div>
								<div style="float: left">8000</div>
							</div>
						</td>
						<td style="border-left: 1px solid">
							<div style="clear: both;">
								<div style="float: left">금액&nbsp;</div>
								<div style="float: left">
								   <div style="float: left">8000</div>
								   <div style="float: left">*</div>
								   <div style="float: left">4명</div>
								</div>
							</div>
							<div style="clear: both;">
								<div style="float: left">총금액&nbsp;</div>
								<div style="float: left">32000</div>
							</div>
						</td>
						<td align="right">
							<button type="button" class="btn btn-danger"
								style="height: 90px; width: 100px;">
								결제<br>하기
							</button>
						</td>
					</tr>
				</table>

			</div>
		</form>

	</div>

	<!-- timepicker -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

