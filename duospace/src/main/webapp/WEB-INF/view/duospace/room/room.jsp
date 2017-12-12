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
<style type="text/css">
<!--
메뉴스타일-->#container {
	margin: 0 auto;
}

nav ul {
	padding: 0;
	margin: 0;
	list-style: none;
	position: relative;
}

nav ul li {
	display: inline-block;

}

nav a {
	color: #000000;
	display: block;
	padding: 0 10px;
	font-size: 14px;
	line-height: 60px;
	text-decoration: none;
}

nav a:hover { 
	color: #ffffff;
	text-decoration:none;
	background-color: #333333;
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
	width: 90px;
	float: none;
	display: list-item;
	position: relative;
}

/* Second, Third and more Tiers	*/
nav ul ul ul li {
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
</head>
<body>
<div>
	<nav>
			<ul>
	<c:forEach var="dto" items="${rlist}">
				<li><a href="#">${dto.region}</a>
					<ul>
						<c:forEach var="vo" items="${slist}">
						<c:if test="${dto.region==vo.region}">
							<li style="text-align: center;"><a href="#">${vo.spotName}</a></li>
						</c:if>
						</c:forEach>
					</ul></li>
	</c:forEach>
			</ul>
				</nav>
			</div>

<div class="container" style="margin: 8% 0px; border-top: 1px solid #D8D8D8;">
  <div class="text-center">
    <h2 style="margin: 5% 0px;">룸 예약(Room Reservation)</h2>
    <h4 style="margin-bottom: 5%;"> 독립된 공간으로 마음껏 대화를 나눠 보세요!</h4>
  </div>
  <div class="row">
   <c:forEach var="dto" items="${list}">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>${dto.roomName}</h1> 
        </div>
        <div class="panel-body-img" style="width: 100%">
          <img src="<%=cp%>/resource/images/duospace/Room/${dto.saveFileName}">
        </div>
        <div class="panel-footer">
          <h3>\<fmt:formatNumber value="${dto.price}" pattern="#,###"/>/1월</h3>
          <h4>${dto.rcontent}</h4>
          <button class="btn btn-lg">예약하기</button>
        </div>
      </div>      
    </div>   
    </c:forEach>  
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>2층</h1>
        </div>
        <div class="panel-body">
          <p><strong>1</strong> Project Room</p>
          <p><strong>2</strong> Open Station</p>
          <p><strong>3</strong> Booth Zone</p>
          <p><strong>4</strong> Canteen</p>
          <p><strong>Endless</strong> Elevator Hall</p>
        </div>
        <div class="panel-footer">
          <h3>Project Room</h3>
          <h4>2Floor</h4>
          <button class="btn btn-lg">예약하기</button>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Other</h1>
        </div>
        <div class="panel-body">
          <p><strong>1</strong> Toilet</p>
          <p><strong>2</strong> Information</p>
          <p><strong>3</strong> Lounge</p>
          <p><strong>4</strong> Lobby</p>
          <p><strong>Endless</strong> Parking</p>
        </div>
        <div class="panel-footer">
          <h3>Information</h3>
          <h4>Toilet/Information</h4>
          <button class="btn btn-lg">예약하기</button>
        </div>
      </div>      
    </div>    
  </div>
</div>			
</body>
</html>
