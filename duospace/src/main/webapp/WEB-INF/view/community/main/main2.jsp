<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">

 
</script>
<div style="background: #eef0f3; "> 
	<div class="container"style="padding-bottom: 30px; margin-top: 80px; width: 1230px; min-height: 800px;">
  		<div style="width: 100%;height: 40px;">
	  		<h1>커뮤니티/1</h1>
  		</div>
  		<!-- 분류  -->
  		<c:forEach var="board" items="${boardList}">
  				<c:set var="cateNum" value="0"/>
  				<c:forEach var="dto" items="${board}">
  					<c:if test="${cateNum==0}">
  						<div style=" background-color: #ffffff; width: 360px;height: 400px; margin: 15px;">
  					</c:if>
  					<c:if test="${cateNum!=0 && cateNum != dto.cateNum}">
  					    </div>
  						<div style=" background-color: #ffffff; width: 360px;height: 400px; margin: 15px;">
  					</c:if>
  					<c:if test="${cateNum==0 || cateNum != dto.cateNum}">
  					    <c:set var="cateNum" value="${dto.cateNum}"/>
  						
  						<div style="padding:30px; width:300px; height:81px; border-bottom: 1px solid #efefef;">
							<a href="<%=cp%>/community/list?cateNum=${dto.cateNum}&boardName=${dto.boardName}">
								<span style="margin: 10px; font-size: large;">제목 :</span>
								<span style="font-size: large;">${dto.boardName}</span>
							</a>
						</div>
						
						<div style="width: 300px; height: 319px;">
  					</c:if>
  					
  					<div style="margin-bottom: 15px;">
						<a href="<%=cp%>/community/article?cateNum=${dto.cateNum}">
								<span style="margin: 10px; font-size: large;">제목 :</span>
								<span style="font-size: large;">${dto.subject}</span>
						</a><br>
					</div>
  				</c:forEach>
  		
				<div style="float: left;">
					<div style=" background-color: #ffffff; width: 360px;height: 400px; margin: 15px;">
						<!-- 분류 제목.. -->
						<div style="padding:30px; width:300px; height:81px; border-bottom: 1px solid #efefef;">
							<a href="<%=cp%>/community/list?cateNum=${board.cateNum}&boardName=${board.boardName}">
								<span style="margin: 10px; font-size: large;">제목 :</span>
								<span style="font-size: large;">${board.boardName}</span>
							</a>
						</div>
						<div style="width: 300px; height: 319px;">
						
						<!-- 내용. -->
							<c:if test="${not empty board.subject}">
								<!-- 제목 for문으로 돌리기. 5개만 나오게...-->
								<div style="margin-bottom: 15px;">
									<a href="<%=cp%>/community/article?cateNum=${board.cateNum}">
										<span style="margin: 10px; font-size: large;">제목 :</span>
										<span style="font-size: large;">${board.subject}</span>
									</a><br>
								</div>
							</c:if>

						</div>
					</div>
				</div>
  		</c:forEach>
	</div>
</div>
		