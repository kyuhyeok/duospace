<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div style="margin-bottom: 11px;background-color: #ffffff; border-radius: 10px; overflow: -webkit-paged-y">
	<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px; padding-right: 15px;">
		<div style="min-height: 30px;width: 100%">
			<div style="float: left;">
				<h2 style="font-size: x-large;">
					멤버${Count}
				</h2> 
			</div>	
			<div style="float: right;">
				<button> 초대하기 </button>
			</div>
		</div>
		<div style="margin: 10px auto 0px; ">
			<input style="height: 30px; width: 450px; border: #cccccc;" placeholder="멤버 검색" >
		</div>
		<hr>
		<div>
			<c:forEach var="dto" items="${list}">
				<div style="width: 100%;height: 90px;">
					<div style="float: left; margin-top: 25px;">
						<c:if test="${dto.memberNum==7}">
							<img src="<%=cp%>/resource/images/duogram/7/7p.jpg" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>
						<c:if test="${dto.memberNum==4}">
							<img src="<%=cp%>/resource/images/duogram/4/4p.jpg" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>
						<c:if test="${dto.memberNum==5}">
							<img src="<%=cp%>/resource/images/duogram/5/5p.jpg" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>	
						<c:if test="${dto.memberNum==6}">
							<img src="<%=cp%>/resource/images/duogram/6/6p.jpg" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>	
						<c:if test="${dto.memberNum==3}">
							<img src="<%=cp%>/resource/images/duogram/3/3p.jpg" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>
						<c:if test="${dto.memberNum==8}">
							<img src="<%=cp%>/resource/images/duogram/8/8p.jpg" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>	
						<c:if test="${dto.memberNum==11}">
							<img src="<%=cp%>/resource/images/duogram/11/11p.jpg" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>	
						<c:if test="${dto.memberNum==1}">
							<img src="<%=cp%>/resource/images/communiti/11.JPG" style="width: 40px;height: 40px; border-radius: 50%;">
						</c:if>	
					</div>
					<div style="float: left; margin: 15px; margin-top:25px; min-height: 25px;">
						<div>
							이름 : ${dto.name}
						</div>
						<div>
							가입날${dto.joindate}
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>