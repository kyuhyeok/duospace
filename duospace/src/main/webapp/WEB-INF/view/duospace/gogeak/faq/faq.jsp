<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
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
 
 
 
 
	<div class="col-sm-12 body-frame-2">



<div style="margin-top: 30px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 30px;">자주 묻는 질문</div>


	<div>
 
	
		<div style="margin-top: 50px;"></div>
 
		<div role="tabpanel" style="width: 100%;">
 
			<!-- Nav tabs -->
		   <div id="qnaCode">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
					<a href="#reserve" data-qnacode="1" aria-controls="reserve" role="tab" data-toggle="tab">예약/결제</a>
				</li>
				<li role="presentation">
					<a href="#ticket" data-qnacode="2" aria-controls="ticket" role="tab" data-toggle="tab">이용권</a>
				</li>
				<li role="presentation">
					<a href="#cafe" data-qnacode="3" aria-controls="cafe" role="tab" data-toggle="tab">카페</a>
				</li>
				<li role="presentation">
					<a href="#book" data-qnacode="4" aria-controls="book" role="tab" data-toggle="tab">대여</a>
				</li>
				<li role="presentation">
					<a href="#member" data-qnacode="5" aria-controls="member" role="tab" data-toggle="tab">회원가입/로그인</a>
				</li>
				<li role="presentation">
					<a href="#others" data-qnacode="6" aria-controls="others" role="tab" data-toggle="tab">기타문의</a>
				</li>
			</ul>
		   </div>
		   
			<!-- Tab panes -->
			<div class="tab-content">
			
				<!-- 예약 -->
				<div role="tabpanel" class="tab-pane active" id="reserve">
 
					<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									
									<c:forEach items="${list}" var="dto">
									 <c:if test="${dto.qnaCode==1}">
									<li><a href="#">${dto.subject}</a>
								
										<ul class="faq-content">
											<li>
												<div>
													<p>${dto.content}</p>
												</div>
											</li>
										</ul></li>
									 </c:if>
									</c:forEach>	
									
									
								</ul>
							</div>
						</div>
					</div>			
				</div>
				
				
				<!-- 이용권 -->
				<div role="tabpanel" class="tab-pane" id="ticket">
						<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									<c:forEach items="${list}" var="dto">
									 <c:if test="${dto.qnaCode==2}">
									<li><a href="#">${dto.subject}</a>
								
										<ul class="faq-content">
											<li>
												<div>
													<p>${dto.content}</p>
												</div>
											</li>
										</ul></li>
									 </c:if>
									</c:forEach>
									
								</ul>
							</div>
						</div>
					</div>

				</div>
				<div role="tabpanel" class="tab-pane" id="cafe">
						<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									
								<c:forEach items="${list}" var="dto">
									 <c:if test="${dto.qnaCode==3}">
									<li><a href="#">${dto.subject}</a>
								
										<ul class="faq-content">
											<li>
												<div>
													<p>${dto.content}</p>
												</div>
											</li>
										</ul></li>
									 </c:if>
									</c:forEach>
									
								</ul>
							</div>
						</div>
					</div>
				
				
				</div>
				
				<!-- 대여 -->
				<div role="tabpanel" class="tab-pane" id="book">

							<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									
									<c:forEach items="${list}" var="dto">
									 <c:if test="${dto.qnaCode==4}">
									<li><a href="#">${dto.subject}</a>
								
										<ul class="faq-content">
											<li>
												<div>
													<p>${dto.content}</p>
												</div>
											</li>
										</ul></li>
									 </c:if>
									</c:forEach>
									
								</ul>
							</div>
						</div>
					</div>


				</div>
				
				<!-- 회원 -->
				<div role="tabpanel" class="tab-pane" id="member">

						<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									
									<c:forEach items="${list}" var="dto">
									 <c:if test="${dto.qnaCode==5}">
									<li><a href="#">${dto.subject}</a>
								
										<ul class="faq-content">
											<li>
												<div>
													<p>${dto.content}</p>
												</div>
											</li>
										</ul></li>
									 </c:if>
									</c:forEach>
									
								</ul>
							</div>
						</div>
					</div>

				</div>
				
				<!-- 기타 -->
				<div role="tabpanel" class="tab-pane" id="others">

						<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									
									<c:forEach items="${list}" var="dto">
									 <c:if test="${dto.qnaCode==6}">
									<li><a href="#">${dto.subject}</a>
								
										<ul class="faq-content">
											<li>
												<div>
													<p>${dto.content}</p>
												</div>
											</li>
										</ul></li>
									 </c:if>
									</c:forEach>
									
								</ul>
							</div>
						</div>
					</div>
			
				</div>
			</div>
		</div>
	
		</div>
		<div style="margin-bottom: 200px;"></div>
	</div>
 