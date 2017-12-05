<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!-- header -->
<form>
	<div style="background: #172A40; position: fixed; top:0px; margin: 0px; width: 100%; height:80px; border-bottom: 15px solid #A7C7C5" align="center">
		<table style="height: 80px; width: 935px; margin: 0px;">
			<tr>
				<td align="left" width="311px">
    	  			<input type="text" style="border: 1px solid #ccc; border-radius: 10px; 
      				height: 25px; width: 160px; background: #eee; color: black;" placeholder="                 검색">
				</td>
				
				<td align="center"> 
					<a href="<%=cp%>/duogram" class="logo" style="font-size: 46px; text-decoration:none; color: white;">Duo Gram</a>			
				</td>
			
				<td align="right" width="311px">
					<a href="#" style="font-family:'나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> 친구 |</a>
					<a href="<%=cp%>/space_main" style="font-family:'나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> DuoSpace |</a>
					<a href="<%=cp%>/community" style="font-family:'나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> Community |</a>
					<a href="<%=cp%>/main" style="font-family: '나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> HOME   |</a>
					<a href="#" style="font-family: '나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> 기록 |</a>
					<a href="#" style="font-family: '나눔고딕'; font-size: 12px; color: white; font-weight: bold; text-decoration:none;"> 마이페이지</a>
				</td>
			</tr>
		</table>
</div>
</form>
<!-- /header -->