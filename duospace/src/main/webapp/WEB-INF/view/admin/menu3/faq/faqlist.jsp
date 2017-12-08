<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	$(function() {
		
		$(".nav-tabs li:first").attr("class","active");
		
		var expand = 'expanded';
		var content = $('.faq-content');
		//FAQ Accordion
		$('.faq-accordion > li > div > a').click(function(e) {
			e.preventDefault();
			if ($(this).hasClass(expand)) {
				$(this).removeClass(expand);
				//	          $('.faq-accordion > li > a > div').not(this).css('opacity', '1');//returns li back to normal state
				$(this).parent().parent().children('ul').stop(true, true).slideUp();
			} else {
				//	            $('.faq-accordion > li > a > div').not(this).css('opacity', '0.5');//dims inactive li
				$('.faq-accordion > li > div > a.expanded').removeClass(expand);
				$(this).addClass(expand);
				content.filter(":visible").slideUp();
				$(this).parent().parent().children('ul').stop(true, true).slideDown();
			}
		}); //accordion function

		content.hide();
	
		
	});
function deleteOk(num) {
	if(confirm("삭제하시겠습니까?")){
	location.href='<%=cp%>/admin/faq/delete?num='+num;
	}

}
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

.faq-accordion li div a {
	color: #666;
	padding: 1.125em;
}

.faq-accordion>li:last-child {
	border-bottom: 1px solid rgba(198, 198, 198, 0.4);
}

.faq-accordion>li>div>a:before {
	content: 'Q.';
	padding-right: 0.313em
}


.faq-accordion>li>div>a.expanded {
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
				<c:forEach items="${qlist}" var="qdto">
				<li role="presentation" ${qdto.qnaCode==qnaCode?"class='active'":""}>
					<a href="#reserve${qdto.qnaCode}" data-qnacode="${qdto.qnaCode}" aria-controls="reserve${qdto.qnaCode}" role="tab" data-toggle="tab">${qdto.qnaName}</a>
				</li>
				</c:forEach>
			</ul>
		   </div>

			<!-- Tab panes -->
			<div class="tab-content">
			
			
			
	<c:forEach var="vo" items="${qlist}">
				<div role="tabpanel" class="tab-pane active" id="reserve${vo.qnaCode}">
					<!-- 아코디언 -->
					<div id="faq-wrapper" class="about-service" style="margin-top: 50px">
						<div class="slide-left">
							<div class="faq">
								<ul class="faq-accordion" style="list-style: none;">
									<c:forEach var="dto" items="${list}">
									  <c:if test="${not empty dto.subject}">
										<c:if test="${dto.qnaCode==vo.qnaCode}">
											<li><div><a href="#">${dto.subject}</a>
											<div style="margin-left: 50px;text-align: right; float: right;" >
											<button type="button" class="btn btn-warning btn-xs" onclick="javascript:location.href='<%=cp%>/admin/faq/update?num=${dto.num}&qnaCode=${dto.qnaCode}'">수정</button>
											<button type="button" class="btn btn-danger btn-xs" onclick="deleteOk('${dto.num}');">삭제</button>
											</div>
											</div>
											<ul class="faq-content">
												<li>
													<div>
														<p>${dto.content}</p>
													</div>
												</li>
											</ul>
											</li>
										  </c:if>
										</c:if>
										<c:if test="${empty dto.num}">
										</c:if>
									</c:forEach>	
								</ul>
							</div>
						</div>
					</div>
				</div>
	</c:forEach>
			
			</div>
			
			
		<input type="hidden" name="qnaCode">
		<button type="button" style="margin-top: 30px;"  class="btn btn-success btn-sm" onclick="javascript:location.href='<%=cp%>/admin/faq/created';">등록</button>

			
		</div>
	
		
		</div>
	</div>

