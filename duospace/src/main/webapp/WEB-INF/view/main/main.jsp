<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
$(document).ready(function() {
    $('.start').removeClass('start');  
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
				<img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg"
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
				<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg"
					style="width: 100%" data-src="" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
	
					</div>
				</div>
			</div>
			<!--슬라이드2-->

			<!--슬라이드3-->
			<div class="item">
				<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg"
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


<div class="container">
  <div class="row" style="margin: 0px ">
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

<div class="container">
  <div class="row">
    <div class="col-sm-8">
      <h2>듀오 스페이스(Duo Space)</h2>
      <h4>우리 회사는...</h4>      
      <p>회사소개</p>
      <button class="btn btn-default btn-lg">들어 가기</button>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal slogo"></span>
    </div>
  </div>
</div>

<div class="container bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe slogo"></span>
    </div>
    <div class="col-sm-8">
      <h2>Duo Value</h2>
      <h4><strong>MISSION:</strong> 2017년 한 해 프로젝트</h4>      
      <p><strong>VISION:</strong> 2020년 우리의 목표 Global 성장기업</p>
    </div>
  </div>
</div>

<div class="container text-center">
  <h1>서비스</h1>
  <h4>What we offer</h4>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-off logo-small"></span>
      <h4>POWER</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart logo-small"></span>
      <h4>LOVE</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small"></span>
      <h4>JOB DONE</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
  <br><br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-leaf logo-small"></span>
      <h4>GREEN</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate logo-small"></span>
      <h4>CERTIFIED</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench logo-small"></span>
      <h4 style="color:#303030;">HARD WORK</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
</div>
<div class="container">
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