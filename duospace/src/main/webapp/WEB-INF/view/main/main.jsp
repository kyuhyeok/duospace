<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div class="jumbotron" style="background-color: transparent !important;">
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
						<div class="intro-text-container">
			<h1>
				<span class="intro-text-1 start"> 👋 </span> <span
					class="intro-text-2 start"> Hi </span> <span
					class="intro-text-3 start"> Coworking </span> <span
					class="intro-text-4 start"> Duo Space 입니다. </span>
			</h1>
		</div>
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
						<div class="intro-text-container">
			<h1>
				<span class="intro-text-1 start"> 👋 </span> <span
					class="intro-text-2 start"> Hi </span> <span
					class="intro-text-3 start"> Coworking </span> <span
					class="intro-text-4 start"> Duo Space 입니다. </span>
			</h1>
		</div>
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
					class="intro-text-4 start"> Duo Space 입니다. </span>
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
