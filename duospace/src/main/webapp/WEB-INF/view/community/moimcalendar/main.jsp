<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);	
	if(strYear != null)
	{	
	  year = Integer.parseInt(strYear);
	  month = Integer.parseInt(strMonth);	 	
	}else{ 	
	}
	//년도/월 셋팅
	cal.set(year, month, 1);	
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;	
	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));	 
%>

<!-- textarea 자동늘리기 -->
<style>
.wrap {
	width: 100%;
	}
.wrap textarea {
	width: 100%;
    overflow-y: hidden; /* prevents scroll bar flash */
    padding: 1.1em; /* prevents text jump on Enter keypress */
    
    }
</style>
<script>
  $(document).ready(function() {
    $('.wrap').on( 'keyup', 'textarea', function (e){
      	$(this).css('height', 'auto' );
      	$(this).height( this.scrollHeight );
    });
    $('.wrap').find( 'textarea' ).keyup();
  });
</script>



<div style="margin-bottom: 11px;background-color: #ffffff; border-radius: 10px; overflow: -webkit-paged-y">
	<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px; padding-right: 15px;">
	
		<div style="float: right;">
			<a class="btn1" style="border: none;" href="javascript:dialogMoimCalendar();">일정 만들기</a>
		</div>
		
		<div align="center">
			<b style="font-size: x-large;">${year}年 ${month}月</b>
		</div>
		
		<div style="width: 100%; overflow: auto;">
			<table style="width: 100%">
				<tr style="height: 25px; border-bottom: 1px solid #cccccc;">
					<td align="center" ><font color="red">일</font></td>
					<td align="center" >월</td>
					<td align="center" >화</td>
					<td align="center" >수</td>
					<td align="center" >목</td>
					<td align="center" >금</td>
					<td align="center" ><font color="blue">토</font></td>
				</tr>
				<tr>
					<%
					//처음 빈공란 표시
					for(int index = 1; index < start ; index++ )
					{
					  out.println("<TD >&nbsp;</TD>");
					  newLine++;
					}
					for(int index = 1; index <= endDay; index++)
					{
				       String color = "";
				       if(newLine == 0){          color = "RED";
				       }else if(newLine == 6){    color = "#529dbc";
				       }else{                     color = "BLACK"; };
				       
				       String sUseDate = Integer.toString(year); 
				       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
				       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
				       int iUseDate = Integer.parseInt(sUseDate);
				       String backColor = "#ffffff";
				       if(iUseDate == intToday ) {
				             backColor = "#FFEBFE";
				       }
				       out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
				       String subject="z";
				       %>
				     <%--  
				       <c:if test="<%=index%>==${dto.moinDate}">
				       		"<%=subject%>"=${dto.subject}
				       </c:if> --%>
				      
				       <font color='<%=color%>'>
				             <%=index%> <%-- <%=subject%> --%>
				       </font>
				       <%
				       //기능 제거 
				       out.println("</TD>");
				       newLine++;
				       if(newLine == 7)
				       {
				         out.println("</TR>");
				         if(index <= endDay)
				         {
				           out.println("<TR>");
				         }
				         newLine=0;
				       }
					}
					//마지막 공란 LOOP
					while(newLine > 0 && newLine < 7)
					{
					  out.println("<TD>&nbsp;</TD>");
					  newLine++;
					}
					%>
				</tr>
			</table>
		</div>
	</div>
</div>
<c:if test="${dataCount != 0}">
	<c:forEach var="dto" items="${list}">
		<div style="margin-bottom: 11px;background-color: #ffffff; border-radius: 10px; overflow: -webkit-paged-y" onclick="<%=cp%>">
			<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px; padding-right: 15px;">
				<!-- 리스트 출력 -->
				<div style="float: left; width: 50px; height: 71px; margin: auto;">
					<div style="text-align: center; padding-top: 50%;">
						<h3 style="font-size: x-large;">${dto.moinDate}</h3>
						목요일
					</div>
				</div>
				<!-- 글 리스트.. -->
				<div style="float: left; width: 470px; height: 110px;">
					<div style="float: left; width: 107px;height: 110px; padding: inherit; margin: 5px;">
						<h3 style="font-size: large;">제목 </h3>
						<h3 style="font-size: large;"> ${dto.subject} </h3>
					</div>
					<div style="float: left; width: 107px;height: 110px; padding: inherit; margin: 5px;">
						<h4 style="font-size: small;">내용 </h4>
						<h4 style="font-size: small;"> ${dto.content} </h4>
					</div>
					<div style="float: left; width: 107px;height: 110px; padding: inherit; margin: 5px;">
						<h4 style="font-size: small;">인원 </h4>
						<h4 style="font-size: small;"> ${dto.people} </h4>
					</div>
					<div style="float: left; width: 107px;height: 110px; padding: inherit; margin: 5px;">
						<h4 style="font-size: small;">장소 </h4>
						<h4 style="font-size: small;"> ${dto.spot} </h4>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>