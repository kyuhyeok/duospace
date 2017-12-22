<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
a:hover{
	text-decoration: none;
}
</style>
<footer class="footer-tet" role="contentinfo">
    <div class="container" style="mar">
    	<div class="footer-tet-left">
    		<span style="font-family:Airways; font-size: 42px; color: #172A40;">Duo Space</span>
    	</div>
		<div class="footer-tet-right">
			<span><a href="<%=cp%>/space_company"> 회사 소개 </a></span>
			<span> : </span>
			<span><a href="#"> Duo Space 정책 및 약관 </a></span>
			<span>|</span>
			<span><a href="#"> 제휴제안 </a></span>
			<span>|</span>
			<span><a href="<%=cp%>/agreement"> 이용약관 </a></span>
			<span>|</span>
			<span><a href="<%=cp%>/privacy"> 개인정보취급방침 </a></span>
			<span>|</span>
			<span><a href="<%=cp%>/duospace/notice/list"> 고객센터 </a></span>
			<br>
			<span> 대표이사: 곽규혁</span>
			<span> | 사업자등록번호 000-00-000000</span>
			<span> | 통신판매업신고번호 제 0000호</span>
			<br>
			<span> 주소: 서울특별시 강남구 테헤란로14길 6 남도일빌딩 1층, 2층, 3층</span>
			<span> | 개인정보 관리 책임자 상무 김재원</span>
			<span> | TEL: 1544-9999</span>
			<span style="color: #A6A6A6;"> © Duo Space Corp.</span>
		</div>
		
    </div>        
</footer>
