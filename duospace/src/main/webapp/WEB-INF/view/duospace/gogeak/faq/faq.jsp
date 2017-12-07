<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DuoSpace</title>
<script type="text/javascript">
	$(function() {

		var expand = 'expanded';
		var content = $('.faq-content');
		//FAQ Accordion
		$('.faq-accordion > li > a').click(function(e) {
			e.preventDefault();
			if ($(this).hasClass(expand)) {
				$(this).removeClass(expand);
				//	          $('.faq-accordion > li > a > div').not(this).css('opacity', '1');//returns li back to normal state
				$(this).parent().children('ul').stop(true, true).slideUp();
			} else {
				//	            $('.faq-accordion > li > a > div').not(this).css('opacity', '0.5');//dims inactive li
				$('.faq-accordion > li > a.expanded').removeClass(expand);
				$(this).addClass(expand);
				content.filter(":visible").slideUp();
				$(this).parent().children('ul').stop(true, true).slideDown();
			}
		}); //accordion function

		content.hide();

	});
</script>
<style type="text/css">
.faq-accordion {
	list-style: none;
	padding-left: 0px;
}

.faq-content {
	list-style: none;
	padding-left: 10px;
}

.faq-accordion>li {
	border-top: 1px solid rgba(198, 198, 198, 0.4);
	color: #666;
	padding: 1.125em 0
}

.faq-accordion li a {
	color: #666;
	padding: 1.125em;
}

.faq-accordion>li:last-child {
	border-bottom: 1px solid rgba(198, 198, 198, 0.4);
}

.faq-accordion>li>a:before {
	content: 'Q.';
	padding-right: 0.313em
}

.faq-accordion>li>a:after {
	color: #ff8300;
	content: '+';
	float: right;
	font-weight: 300;
	margin-right: 1.25em;
	-webkit-transform: scale(2);
	-ms-transform: scale(2);
	transform: scale(2);
	overflow-y: hidden;
}

.faq-accordion>li>a.expanded:after {
	color: #ffa326;
	content: '\2212';
	-webkit-transform: scale(2);
	-ms-transform: scale(2);
	transform: scale(2);
}

.faq-accordion>li>a.expanded {
	font-weight: 700;
	opacity: 1 !important
}

.faq-content {
	background-color: #ececec;
	margin: 20px 0 -20px;
}

.faq-content p:before {
	content: 'A.';
	color: #ff8300;
	float: left;
	font-weight: 700;
	margin-right: .5em
}

.faq-content p {
	margin: 0 1.2em;
	padding: 1.250em 0
}

.faq-hide {
	display: none
}

.faq-selected {
	color: #49494b !important;
	-webkit-transition: all 1s ease;
	transition: all 1s ease;
}
</style>

</head>
<body>
	<div class="container" role="main">
		<div style="margin-top: 50px;"></div>
		<div style="font-weight: bold; font-size: 25px; margin-bottom: 50px;">FAQ
			/ 자주 묻는 질문</div>
		<div role="tabpanel" style="width: 600px">

			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home"
					aria-controls="home" role="tab" data-toggle="tab">예약/결제</a></li>
				<li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" data-toggle="tab">이용권</a></li>
				<li role="presentation"><a href="#messages"
					aria-controls="messages" role="tab" data-toggle="tab">회원가입/로그인</a></li>
				<li role="presentation"><a href="#settings"
					aria-controls="settings" role="tab" data-toggle="tab">카페/대여</a></li>
				<li role="presentation"><a href="#settings"
					aria-controls="settings" role="tab" data-toggle="tab">기타문의</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">

					<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service"
						style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									<li><a href="#">insane ipsdum</a>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여</p>
												</div>
											</li>
										</ul></li>
									<!--Bacon ipsum-->
									<li><a href="#">Beer Ipsum</a>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여.</p>
												</div>
											</li>
										</ul></li>
										
									<!--Beer ipsum-->
									<li><a href="#">Carey ipsum</a>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여baxtrry.</p>
												</div>
											</li>
										</ul></li>
									<!--Carey ipsum-->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="profile">

						<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service"
						style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									<li><a href="#">iㄴㅅㄴㅅㄴㅅㄴㅅㄴㅅ</a>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여</p>
												</div>
											</li>
										</ul></li>
									<!--Bacon ipsum-->
									<li><a href="#">Beer Ipsum</a>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여.</p>
												</div>
											</li>
										</ul></li>
										
									<!--Beer ipsum-->
									<li><a href="#">Carey ipsum</a>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여baxtrry.</p>
												</div>
											</li>
										</ul></li>
									<!--Carey ipsum-->
								</ul>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="messages">.dfdf..</div>
				<div role="tabpanel" class="tab-pane" id="settings">.dvd..</div>
			</div>
		</div>
	</div>
</body>
</html>