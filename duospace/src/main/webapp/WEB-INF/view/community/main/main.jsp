<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">


</script>
<style>
.target_ {
  overflow: hidden; 
  text-overflow: ellipsis;
  white-space: nowrap; 
  width: 100px;
  height: 20px;
}

</style>
<div style="background: #ebebeb;"> 
	<div class="container"style="padding-bottom: 30px; margin-top: 80px; width: 1230px; min-height: 800px;">
  		<div style="width: 100%;height: 40px; margin-top: 50px; margin-bottom: 30px; padding-left: 20px;">
	  		<h1>커뮤니티</h1>
	  		<h3>커뮤니티 갯수 : ${dataCount}</h3>
  		</div>
  		<!-- 
	  		<c:out value="" escapeXml="false"/>
	  		<div style='float: left;'>
  		 -->
  		<!-- 분류  -->
		<c:forEach var="board" items="${boardList}">
			<c:set var="cateNum" value="0"/>
			<c:forEach var="dto" items="${board}">
				<c:if test="${cateNum==0}">
					<c:out value="<div style='float: left;'><div style='background-color: #ffffff; width: 360px;height: 300px; margin: 15px; border-radius: 4px;'>" escapeXml="false"/>
				</c:if>
				<c:if test="${cateNum!=0 && cateNum != dto.cateNum}">
					<c:out value="</div>" escapeXml="false"/>
					<c:out value="<div style='background-color: #ffffff; width: 360px;height: 400px; margin: 15px;'>" escapeXml="false"/>
				</c:if>
				<c:if test="${cateNum==0 || cateNum != dto.cateNum}">
					<c:set var="cateNum" value="${dto.cateNum}"/>
					<div style="padding:10px; width:100%; height:55px; border-bottom: 1px solid #efefef; background: #6d9ac1; text-align: center; border-radius: 4px;">
						<a href="<%=cp%>/community/list?cateNum=${dto.cateNum}">
							<span style="font-size: x-large; color: #ffffff;">${dto.boardName}</span>
						</a>
					</div>
					<c:out value="<div style='width: 100%; height: 219px; padding: 5px 10px;'>" escapeXml="false"/>
				</c:if>
				<div style="margin-bottom: 15px; overflow: hidden; text-overflow: ellipsis;">
					<a href="<%=cp%>/community/article?cateNum=${dto.cateNum}&page=1&boardNum=${dto.boardNum}">
						<span style="font-size: large;" class="target_">ㆍ ${dto.subject}</span>
					</a>
					<br>
				</div>
			</c:forEach>
			<c:if test="${board.size()!=0}">
				<c:out value="</div>" escapeXml="false"/>
			</c:if>
				<c:if test="${boardList.size()!=0}">
				<c:out value="</div></div>" escapeXml="false"/>
			</c:if>
		</c:forEach>
	</div>
</div>
		