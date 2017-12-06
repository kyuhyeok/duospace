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




	<div class="right_col" role="main" style="background: #ffffff; padding: 50px 100px 200px;">

		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>
						FAQ 관리 <small>FAQ Manage</small>
					</h3>
				</div>
				<div class="title_right"></div>
			</div>
			<div class="clearfix"></div>

	
		<div style="margin-top: 50px;"></div>

		<div role="tabpanel" style="width: 100%;">

			<!-- Nav tabs -->
		   <div id="qnaCode">
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
					<a href="#home" data-qnacode="1" aria-controls="home" role="tab" data-toggle="tab">예약/결제</a>
				</li>
				<li role="presentation">
					<a href="#profile" data-qnacode="2" aria-controls="profile" role="tab" data-toggle="tab">이용권</a>
				</li>
				<li role="presentation">
					<a href="#messages" data-qnacode="5" aria-controls="messages" role="tab" data-toggle="tab">회원가입/로그인</a>
				</li>
				<li role="presentation">
					<a href="#settings" data-qnacode="3" aria-controls="settings" role="tab" data-toggle="tab">카페/대여</a>
				</li>
				<li role="presentation">
					<a href="#settings" data-qnacode="6" aria-controls="settings" role="tab" data-toggle="tab">기타문의</a>
				</li>
			</ul>
		   </div>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">

					<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									<li><a href="#">질문1</a>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여</p>
												</div>
											</li>
										</ul></li>
									<!--Bacon ipsum-->
									<li><a href="#" style="width: 100px">질문2</a>
									<span style="margin-left: 80%;">
									<button type="button">수정</button>
									<button type="button">삭제</button>
									</span>
										<ul class="faq-content">
											<li>
												<div>
													<p>아코디언 답이구여.</p>
												</div>
											</li>
										</ul></li>
										
									<!--Beer ipsum-->
									<li><a href="#">질문3</a> 
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
				<div role="tabpanel" class="tab-pane" id="profile">질문1</div>
				<div role="tabpanel" class="tab-pane" id="messages">질문1</div>
				<div role="tabpanel" class="tab-pane" id="settings">질문1</div>
			</div>
		</div>
	
	<div></div>


		<hr style="border: 1px solid #cccccc;margin: 50px auto 30px;">

		<button type="button" class="btn btn-success btn-sm" onclick="javascript:location.href='<%=cp%>/admin/faq/created'">등록</button>

			<table id="faq" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<th class="bar">구분</th>
					<th colspan="2">질문내용</th>
				</tr>
				<tr onclick="fnAnswer(0);" class="off">
					<td class="init">수강신청</td>
					<td>수강등록 및 결제는 방문시에만 가능한가요?</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="answer">
					<td>&nbsp;</td>
					<td colspan="2">KH정보교육원에서 개강하는 모든 실업자 교육과정은 전액 국비지원과정으로 진행됩니다. 국비지원과정 지원서(노동부 양식)작성및 수강등록을 하셔야 되므로 방문하셔야 됩니다.</td>
				</tr>
				<tr onclick="fnAnswer(1);" class="off">
					<td class="init">수강신청</td>
					<td>과목별 수강료는 어떻게 되나요?</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="answer">
					<td>&nbsp;</td>
					<td colspan="2">KH정보교육원에서 진행하는 모든 실업자 교육과정은 전액 국비지원과정이므로 수강료가 0원 입니다.</td>
				</tr>
				<tr onclick="fnAnswer(2);" class="off">
					<td class="init">수강신청</td>
					<td>수강신청은 아무 때나 가능한가요?</td>
					<td>&nbsp;</td>
				</tr>

		</table>


		</div>
	</div>

