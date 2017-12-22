<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.sidebtn a{
	text-decoration:none;
	border: 1px solid #d3d3d3;
	border-radius: 5px;
	font-size: 12px;
	padding: 7px;
	color: #7A7A7A; 
}
.sidebtn a:hover{
	color: tomato;
}
.reserveList tr th{
	text-align: center;
}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-11">
			<div class="row">
				<div class="col-md-10">
					<div class="row">
						<div class="col-sm-12">
							<h2>예약 내역</h2>
							<hr>
						</div>
						<div class="table-d">
							<table class="reserveList" style="border-spacing: 0px; border-collapse: collapse; width: 100%">
								<tr style="background: #eeeeee; border-top: 1px solid black; border-bottom: 1px solid black; text-align: center;" height="35px;">
									<th style="width: 100px;">룸</th>
									<th>예약번호</th>
									<th>룸 이름</th>
									<th>지점 이름</th>
									<th>가격</th>
									<th>예약자명</th>
									<th>인원수</th>
									<th>후기/취소</th>
								</tr>
								<c:forEach var="dto" items="${mylist}">
									<tr style="border-bottom: 1px solid #8C8C8C; text-align: center;">
										<td>
											<img src="<%=cp%>/resource/images/duospace/Room/${dto.saveFileName}" width="100px;" height="100px;">
										</td>
										<td>
											<span style="color: #ed794d; font-weight: bold;">${dto.reservNum}</span>
										</td>
										<td>${dto.roomName}</td>
										<td>${dto.spotName}</td>
										<td>￦<fmt:formatNumber value="${dto.price}" pattern="#,###"/></td>
										<td>${dto.userName}</td>
										<td>${dto.people}</td>
										<td class="sidebtn">
											<a href="<%=cp%>/duospace/epilogue/created?reservNum=${dto.reservNum}&spotName=${dto.spotName}">이용 후기 등록</a><br><br>
											<a href="#">예약 취소</a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
