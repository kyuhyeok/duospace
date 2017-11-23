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
					<span class="intro-text-1 start"> 👋 </span>
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
				<span class="intro-text-1 start"> 👋 </span> <span
					class="intro-text-2 start"> Hi </span> <span
					class="intro-text-3 start"> Coworking </span> <span
					class="intro-text-4 start"> Duo Space  </span>
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
</div>

<div class="container">
  <div class="main-row" style="margin: 0px ">
    <div class="col-sm-4">
      <h3>같이(duo)</h3>
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
      <h3>일하는(working)</h3> 
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