<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">

</script>
<div style="width: 100%; min-height: 800px; background:#eef0f3; margin-top: 100px;">
	<div style="width: 800px; margin: 10px auto 0px;">
		<div>
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
				<tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					<td width="60" style="color: #787878;">번호</td>
					<td style="color: #787878;">제목</td>
					<td width="100" style="color: #787878;">작성자</td>
					<td width="80" style="color: #787878;">작성일</td>
					<td width="60" style="color: #787878;">조회수</td>
					<td width="50" style="color: #787878;">첨부</td>
				</tr>
			
			<!-- for문 돌리기. -->
				<tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
					<td>번호</td>
					<td align="left" style="padding-left: 10px;">
						<a href="<%=cp%>/community/created">
							제목
						</a>
					</td>
					<td>이름</td>
					<td>내용</td>
					<td>조회수</td>
					<td><a>첨부</a></td>
				</tr>
			</table>
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
				<tr height="40">
					<td align="left" width="100">
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/community/list';" style="background: #fff; border: 1px solid #cccccc;">새로고침</button>
					</td>
					<td align="center">
						<form name="searchForm" action="<%=cp%>/community/list" method="post">
							<input type="hidden" name="cateGoryNum" value="${dto.cateGoryNum}">
							<select name="searchKey" class="selectField">
								<option value="subject">제목</option>
								<option value="userName">작성자</option>
								<option value="content">내용</option>
								<option value="created">등록일</option>
							</select>
							<input type="text" name="searchValue" class="boxTF">
							<button type="button" class="btn" onclick="searchList()" style="background: #ffffff; border: 1px solid #cccccc;">검색</button>
						</form>
					</td>
					<td align="right" width="100">
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/community/created?cateGoryNum=${dto.cateGoryNum}&boardName=${dto.boardName}';" style="background: #ffffff; border: 1px solid #cccccc;">글올리기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>