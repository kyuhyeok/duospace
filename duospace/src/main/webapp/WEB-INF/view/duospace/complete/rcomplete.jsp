<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<style type="text/css"> 
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
.info{
	width: 720px;
    padding: 5px;
	margin: 0 auto;
}
.info h2{
	font-family: 'Jeju Gothic';
	margin-left: 120px;
	color: #6275bb; 
}
.form-right ul {
	list-style: none;
}
.main{
	margin: 0 auto;
    width: 950px;
    padding: 5px;
    overflow: auto;
    border: 3px solid #5C79B4;
}
.form-left-spot{
	width: 170px; 
    height: 200px;
    float: left;
    margin-top: 10px;
    
}
.form-left-info{
	font-family: 'Jeju Gothic';
	font-size: 20px;
	font-weight: bold;
    color: #686ec4;
	width: 190px;
    height: 80px;
    float: left;
    overflow: hidden;
    padding: 10px 0 0 10px;
    margin: 0 0 0 10px;
    float: left;
    text-align: center;
}
.form-left-addr{
	font-family: 'Jeju Gothic';
	font-size:13px;
	font-weight: bold;
    width: 200px;
    height: 20px;
    overflow: hidden; 
    margin: 0 0 0 10px;
    text-align: center;
}
.form-right{
	width: 460px;
    /* height: 150px; */
    padding: 20px 15px 15px 15px;
    float: right;
    margin: 0 0 0 10px;
}

.form-left{
	width: 410px; 
    padding: 15px 0 15px 10px;
    float: left;
    border-left: 1px solid #ededed; 
}

.form-right ul li b{
	font-family: 'Jeju Gothic';
	border: 1px solid #d3d3d3;
	border-radius: 5px;
	font-size: 12px;
	padding: 5px;
	color: #7A7A7A;
}
.form-right ul li span{
 	font-family: 'Noto Sans KR';
	font-size: 15px;
	margin-left: 2px;
}
.footer{
	padding: 20px 0 10px 280px;
    overflow: hidden; 
}
.footer-btn{
	padding: 20px 0 10px 520px; 
	margin: 0 auto;
}
.form-left-logo{
	font-size :30px;
    letter-spacing: -1px; 
    width: 220px;
    height: 100px;
    overflow: hidden;
    text-align: right;
    font-family: Airways;
    padding: 25px 50px 15px 15px;
    color: #D9383A;
    border: 1px solid #d3d3d3;
    font-weight: bold;
   

}
</style>

<div class="container-fluid">
	<div class="info">
		<h2><i class="fa fa-check" aria-hidden="true"></i> 성공적으로 예약완료 되었습니다!</h2>
	</div>
	<div class="main">
		<div class="form-left">
		<div class="form-left-spot">
			<img src="<%=cp%>/resource/images/duospace/Room/${dto.saveFileName}" style="width: 150px; height: 190px;">
		</div>
		<div class="form-left-info">
			${dto.spotName}
		</div>
		<div class="form-left-addr">
			${dto.spotAddr2}
		</div>
		<div class="form-left-logo">
			Duo Space
		</div>
		</div>
		<div class="form-right">
			<ul>
				<li>
				<b>예약 번호</b> 
				<span style="color: #ed794d; font-weight: bold;">${dto.reservNum}</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>층</b> 
				<span>${dto.floorName}</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>룸</b> 
				<span>${dto.roomName}</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>시 작 일</b>
				<span> ${dto.startDate}</span>
				 </li>
			</ul>
			<ul>
				<li>
				<b>종 료 일</b> 
				<span>${dto.endDate}</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>인 원 수</b> 
				<span>${dto.people}</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>예 약 자</b> 
				<span>${dto.userName}</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>전화 번호</b> 
				<span>${dto.tel}</span>
				</li>
			</ul>
			<ul>
				<li>
				<b>금액</b> 
				<span>￦<fmt:formatNumber value="${dto.price}" pattern="#,###"/> 원</span>
				
				</li>
			</ul>
		</div>
	</div>
	<div class="footer">
			<div>
			*출력이 불가능할경우, '예매번호' 로 무인발권기/현장 티켓수령이 가능합니다.
			</div>
	</div>
	<div class="footer-btn">
		<button type="button" class="btn btn-primary antosubmit" onclick="javascript:location.href='<%=cp%>/space_main'">확인</button>
	</div>
</div>

