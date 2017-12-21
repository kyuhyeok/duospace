<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<style type="text/css"> 
.info{
	width: 720px;
    padding: 5px;
	margin: 0 auto;
}
.info h2{
	margin-left: 90px;
	color: #6275bb;
}
.form-right ul {
	list-style: none;
}
.main{
	margin: 0 auto;
    width: 720px;
    padding: 5px;
    overflow: auto;
    border: 3px solid #5C79B4;
}
.form-left-spot{
	width: 102px;
    height: 150px;
    float: left;
}
.form-left-info{
	font: bold 17px/20px dotum;
    color: #686ec4;
	width: 165px;
    height: 50px;
    float: left;
    overflow: hidden;
    padding: 0 0 0 10px;
    float: left;
}
.form-left-addr{
	font: bold 11px/18px dotum;
    letter-spacing: -1px;
    width: 160px;
    height: 20px;
    overflow: hidden;
}
.form-right{
	width: 355px;
    /* height: 150px; */
    padding: 15px;
    float: left;
}
.form-left-room{
	border: 1px solid #d3d3d3;
    height: 110px;
    width: 150px;
    padding: 2px;
    text-align: center;
    overflow: hidden;
}

.form-left{
	width: 295px;
    height: 160px;
    padding: 15px 0 15px 10px;
    float: left;
    border-left: 1px solid #ededed; 
}
.form-right{
	width: 355px;
    /* height: 150px; */
    padding: 15px;
    float: left;
}
.form-right ul li b{
	border: 1px solid #d3d3d3;
	border-radius: 5px;
	font-size: 13px;
	padding: 3px;
	color: #7A7A7A;
}
.form-right ul li span{
	margin-left: 2px;
}
.footer{
	padding: 20px 0 10px 220px;
    overflow: hidden;
}
</style>

<div class="container">
	<div class="info">
		<h2><i class="fa fa-check" aria-hidden="true"></i> 성공적으로 예약완료 되었습니다!</h2>
	</div>
	<div class="main">
		<div class="form-left">
		<div class="form-left-spot">
			지점 이미지
		</div>
		<div class="form-left-info">
			강남 지점
		</div>
		<div class="form-left-addr">
			서울 강남구 신사동 643-3
		</div>
		<div class="form-left-room">
			<div class="logo">
			 <img>룸 이미지
			</div>
		</div>
		</div>
		<div class="form-right">
			<ul>
				<li>
				<b>예약 번호</b> 
				<span style="color: #ed794d; font-weight: bold;">1</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>지 &nbsp;&nbsp;점</b>
				<span>강남지점</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>좌 &nbsp;&nbsp;석</b> 
				<span>1층 4-9</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>시 작 일</b>
				<span> 2017/12/20 12:30</span>
				 </li>
			</ul>
			<ul>
				<li>
				<b>종 료 일</b> 
				<span>2017/12/21 12:30</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>결제 금액</b> 
				<span>12000</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="footer">
			<div>
			*출력이 불가능할경우, '예매번호' 로 무인발권기/현장 티켓수령이 가능합니다.
			</div>
	</div>
</div>

