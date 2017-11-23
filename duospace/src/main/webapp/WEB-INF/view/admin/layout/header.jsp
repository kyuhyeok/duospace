<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<<script type="text/javascript">

//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form:eq(0),body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
});
</script>


<nav class="category">
	<ul class="list">
		<li><a href="./?body=1010">설정</a></li>
		<li><a href="./?body=2120">상품관리</a></li>
		<li><a href="./?body=3010">주문배송</a></li>
		<li><a href="./?body=5010">고객CRM</a></li>
		<li><a href="./?body=6010">게시판</a></li>
		<li><a href="./?body=7010">디자인</a></li>
		<li><a href="./?body=15050">모바일</a></li>
		<li><a href="./?body=9010">프로모션</a></li>
		<li><a href="./?body=10410">광고마케팅</a></li>
		<li><a href="./?body=4010">매출정산</a></li>
		<li><a href="./?body=8110">접속통계</a></li>
		<li><a href="./?body=14110">재고관리</a></li>
							<!--
		<li><a href="./?body=16010">스토어</a></li>
		-->
	</ul>
	<div class="favorite">
		<a class="view_layer p_cursor btt" tooltip="퀵메뉴 등록하기" onmouseout="hideToolTip();"></a>
		<div class="box">
			<h2>퀵메뉴</h2>
			<div id="quickMenuSearch">
				<input type="text" id="qmFrom" class="input" value="메뉴 자동검색" onfocus="qmFocus(this,1)" onblur="qmFocus(this,2)" onkeyup="qmSearch(this,event)">
				<ul id="quickSearchList">
				</ul>
			</div>
			<ul class="quickMenu">
										</ul>
			<span class="arrow"></span>
		</div>
	</div>
</nav>
