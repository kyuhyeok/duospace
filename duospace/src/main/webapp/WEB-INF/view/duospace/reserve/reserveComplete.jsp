<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript"></script>
<style type="text/css"></style>



<div class="container" role="main">
<div align="center">

<div><h2>예매가 완료 되었습니다.</h2></div>

<table>
	<tr>
		<td>예매번호</td>
		<td>${dto.reservNum}</td>
	</tr>
	<tr>
		<td>지점</td>
		<td>${dto.spotName}</td>
	</tr>
	<tr>
		<td>좌석</td>
		<td>
			<span>${dto.floorName}</span>
			<span>${dto.seatName}</span>
		</td>
	</tr>
	<tr>
		<td>사용 시작일</td>
		<td>${dto.startDate}</td>
	</tr>
	<tr>
		<td>사용 종료일</td>
		<td>${dto.endDate}</td>
	</tr>
	<tr>
		<td>결제금액</td>
		<td>${dto.price}</td>
	</tr>

</table>

<button type="button" onclick="javacript:location.href='<%=cp%>/space_main';">메인화면</button>


</div>
</div>	