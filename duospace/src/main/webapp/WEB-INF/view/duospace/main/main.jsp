<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
$(function(){
	$('.M').mouseover(function(){
		$(this).children().children().children().attr("src",$(this).children().children().children().attr("src").replace(/off\.png$/,'on.png'));
	});	
	$('.M').mouseout(function(){
		$(this).children().children().children().attr("src",$(this).children().children().children().attr("src").replace(/on\.png$/,'off.png'));
	});	
});

</script>
<style type="text/css">
.logo-small {
	color: #6798FD;
    font-size: 50px;
}

.slogo {
	color: #6798FD;
    font-size: 200px;
}

/** panel**/
.panel {
    border: 1px solid #4374D9; 
    border-radius:0;
    transition: box-shadow 0.5s;
}

.panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
}

.panel-footer .btn:hover {
    border: 1px solid #8C8C8C;
    background-color: #4374D9 !important;
    color: white;
}

.panel-heading {
    color: #4374D9 !important;
    background-color: #8C8C8C !important;
    padding: 25px;
    border-bottom: 1px solid #4374D9;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
}

.panel-footer {
    background-color: white !important;
}

.panel-footer h3 {
    font-size: 32px;
}

.panel-footer h4 {
    color: #aaa;
    font-size: 14px;
}

.panel-footer .btn {
    margin: 15px 0;
    background-color: #6798FD;
    color: #ffffff;
}
img{
	max-width: 100%;
	max-height: 650px;
}
.Pic .img{
    border-radius: 43px;
    border: 1px solid #4374D9;
    background: #ffffff;
    width: 86px;
    height: 86px;
    box-sizing: border-box;
    display: table-cell;
    vertical-align: middle;
}
.Pic{
    display: table;
    width: 86px;
    height: 86px;
    margin: 0 auto;
}
li:hover .Pic .img{
	border-radius: 43px;
	border:0;
	transition-duration: 0.3s;
	background: #6798FD;
}
ul{
	list-style: none;
}
.service{
	text-align: center;
}
.subject{
    font-size: 16px;
    line-height: 26px;
}
.cont{
	color: #898989;
}
.service li{
	width: 25%;
    padding-top: 5%;
    display: inline-block;
    vertical-align: top;
    float:left;
}
</style>
<div class="bodyFrame">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<!--페이지-->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!--페이지-->

		<div class="carousel-inner">
			<!--슬라이드1-->
			<div class="item active">
				<img src="<%=cp%>/resource/images/duospace/IMG_6958.jpg"
					style="width: 100%" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
					<h1>
					</h1>
					</div>
				</div>
			</div>
			<!--슬라이드1-->

			<!--슬라이드2-->
			<div class="item">
				<img src="<%=cp%>/resource/images/duospace/IMG_6809.jpg"
					style="width: 100%" data-src="" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
	
					</div>
				</div>
			</div>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<div class="item">
				<img src="<%=cp%>/resource/images/duospace/IMG_0006.jpg"
					style="width: 100%" data-src="" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<div class="intro-text-container">
			<h1>

			</h1>
		</div>
					</div>
				</div>
			</div>
			<!--슬라이드3-->
		</div>

		<!--이전, 다음 버튼-->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span></a> <a
			class="right carousel-control" href="#myCarousel" data-slide="next"><span
			class="glyphicon glyphicon-chevron-right"></span></a>
	</div>


<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4">
      <h3>같이(Duo)</h3>
      <p><b>협업만이 진정한 코워킹인가?</b><br></p>
      <p>
      코워킹스페이스가 기존의 working space(= office)와
      가장 크게 다른 점은 바로'같이'일 하는 공간이라는점입니다.
      문을 열고 들어가면존재하는 우리 팀 만의 독립된 사물실이
      아닌, 한 공간에서 다양한 사람들, 다양한 팀들이 모여
      공간을 공유하고 이에 따라 코워킹 스페이스만의 다양한
      특징들이 생겨납니다.
      </p>
    </div>
    <div class="col-sm-4">
      <h3>공간(Space)</h3>
      <p><b>커뮤니티 VS 자본?</b></p>
      <p>CUAsia에서'커뮤니티'와'자본'에 대해
      다양한 얘기들이 오고 갔습니다. 전통적인 조직구조를
      갖고 있는 대기업이 코워킹 스페이스를 사용하기 시작하면서
      커뮤니티를 해치지는 않을까, 자본을 가지고 대규모로
      코워킹스페이스를 런칭하는 브랜드들이 있는데 이는
      진정한 커뮤니티를 만드는데 방해가 되지는 않을까 등
      주로 '자본의 침투'에 대한 걱정이 중요 포인트였습니다.
      </p>
    </div>
    <div class="col-sm-4">
      <h3>일하는(Working)</h3> 
      <p><b>'일'을 정의하는 방식</b></p>
      <p>
      일한다의 정의 역시 사람마다 생각하는 것이 다 다르고
      개인적인 특성에 따른 영역이기 때문에 코워킹 스페이스
      마다 추구하는 업무환경은 다양하게 나타납니다.
      어떤 코워킹 스페이스는 굉장히 조용한 분위기에서
      집중하는 분위기를 추구한다면, 어떤 코워킹스페이스는
      웬만한 카페보다 더 왁자지껄한 분위기를 만들어서
      자유롭게 대화하는 업무환경을 추구하는 경우가 있습니다.
      </p>
    </div>
  </div>
</div>

<div class="container text-center" style="margin-top: 8%; border-top: 1px solid #D8D8D8;">
		<h2>서비스(Duo Service)</h2>
  <ul class="service">
  
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_9_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>우편물/택배 보관</b>
  			</div>
  			
  			<div class="cont">
  				부재 시에도 안전하게 우편물과<br>
				택배를 보관하여<br>
				전달해 드리고 있습니다.<br>
  			</div>
  	</li>  
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_1_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>컨시어지</b>
  			</div>
  			
  			<div class="cont">
  				외부 클라이언트 응대,<br>
  				업무, 편의 서비스를 위해 커뮤니티<br>
  				매니저가 상주하고 있습니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_2_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>커뮤니티/SNS</b>
  			</div>
  			
  			<div class="cont">
  				커뮤니티/SNS를 통해 다양한<br>
  				클라이언트 응대, 개인업무 및<br>
				편의 서비스를 위해 매니저가<br> 
				상주하고 있습니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_3_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>Core/Cafe</b>
  			</div>
  			
  			<div class="cont">
  				아침을 든든하게 채우는<br>
				빵과 우유, 나른한 오후 시간을 깨우는<br> 
				커피와 차를 이용할 수 있는<br>
				Core/Cafe를 이용해 보세요.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_4_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>인테리어/사무용 가구 완비</b>
  			</div>
  			
  			<div class="cont">
  			듀오 스페이스만의 감성이<br>
  			 묻어나는 인테리어,	넓은 책상<br>
  			 편안한 의자, 2단 서류<br>
  			 서랍장이 준비되어 있습니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_5_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>프로젝트룸</b>
  			</div>
  			
  			<div class="cont">
  				프로젝터용 모니터가 설치되어 있고 <br>
  				 유리 파티션을 이용해 개방감을 살린<br>
  				  프로젝트룸은 대화를 이끌어<br>
  				   갈 수 있는 최적의 장소입니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_6_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>초고속 인터넷</b>
  			</div>
  			
  			<div class="cont">
  				기가 유/무선 초고속 인터넷<br>
  				서비스를 제공합니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_7_off.png">
  				</div>
  			</div>
  			<div class="subject">
  				<b>복합기</b>
  			</div>
  			<div class="cont">
  				각층마다 컬러/흑백 프린터, 스캔,<br>
				복사, 팩스 기능을 탑재한 최신<br>
				복합기를 무료로 편리하게<br> 
				이용하실 수 있습니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_8_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>청소 서비스</b>
  			</div>
  			
  			<div class="cont">
  				전문 청소 인력을 배치하여<br>
  				쾌적한 업무 환경을<br>
  				조성해드리고 있습니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_10_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>철저한 보안</b>
  			</div>
  			
  			<div class="cont">
  				사전 등록된 멤버분들만<br> 
				출입이 가능하며, 개별 도어록과<br>
				보안 카메라가 설치되어 있습니다.<br>
				손님 방문 시 확인 후 출입을<br>
				도와드리고 있습니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_11_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>개인 사물함</b>
  			</div>
  			
  			<div class="cont">
  				오픈오피스 멤버들을 위한 <br>
				개인 사물함이 구비되어 짐을<br>
				편안하게 보관하실 수 있습니다.<br>
  			</div>
  	</li>
  	<li class="M">
  			<div class="Pic">
  				<div class="img">
  					<img src="<%=cp%>/resource/images/duospace/M_con/M_con2_12_off.png">
  				</div>
  			</div>
  			
  			<div class="subject">
  				<b>24시간 운영</b>
  			</div>
  			
  			<div class="cont">
  				듀오 스페이스는 언제나 멤버들을<br>
				위해 열려있습니다.<br>
  			</div>
  	</li>

  </ul>
</div>

<div class="container" style="margin: 10% 0px; border-top: 1px solid #D8D8D8;">
  <div class="text-center">
    <h2>듀오 스페이스(Duo Space)</h2>
    <h4> 다양한 시설을 즐겨 보세요!</h4>
  </div>
  <div class="row">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>1층</h1>
        </div>
        <div class="panel-body">
          <p><strong>1</strong> CoreCafe</p>
          <p><strong>2</strong> Table/Chair</p>
          <p><strong>3</strong> Door</p>
          <p><strong>4</strong> Bread Display</p>
          <p><strong>Endless</strong> Terrace</p>
        </div>
        <div class="panel-footer">
          <h3>CoreCafe</h3>
          <h4>1Floor/CoreCafe</h4>
          <button class="btn btn-lg">둘러보기</button>
        </div>
      </div>      
    </div>     
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
          <button class="btn btn-lg">둘러보기</button>
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
          <button class="btn btn-lg">둘러보기</button>
        </div>
      </div>      
    </div>    
  </div>
</div>
</div>