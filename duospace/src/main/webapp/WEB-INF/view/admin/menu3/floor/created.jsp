<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/cssjs/postcode/1506320738556/170925.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
*{
	list-style: none;
}
.body-container{
	background: #ffffff;
}

</style>
<script type="text/javascript">
    function check() {
    	
        var f = document.boardForm;

    	var str = f.spotCode.value;
        if(!str) {
            alert("지점을 입력하세요. ");
            f.spotCode.focus();
            return;
        }
		
        var str=f.floorName.value;
        if(!str){
        	alert("층을 입력하세요.");
        	f.floorName.focus();
        	return;
        }

   		f.action="<%=cp%>/admin/floor/${mode}";
		f.submit();
    }
    
</script>

<div class="body-container">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 층 등록 </h3>
    </div>
    <div>
			<form name="boardForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr>
			  	<td width="100" bgcolor="#eeeeee" style="text-align: center;">지 점</td>
			  	<td style="padding-left:10px;">
			  		<select name="spotCode" id="sdbox">
			  			<option selected="selected" value="">지점 선택</option>
			  			<c:forEach var="dto" items="${list}">
			  				<option value="${dto.spotCode}">${dto.spotName}</option>
			  			</c:forEach>
			  		</select>
			  		<span id="message" style="color: red;"></span>
			  	</td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">층 등록</td>
			      <td style="padding-left:10px;"> 
			         <select name="floorName">
			         	<option value="" selected="selected">층 선택</option>
			         	<option value="B1층" ${dto.floorName=='B1층'?"selected='selected'":""}>B1층</option>
			         	<option value="1층" ${dto.floorName=='1층'?"selected='selected'":""}>1층</option>
			         	<option value="2층" ${dto.floorName=='2층'?"selected='selected'":""}>2층</option>
			         	<option value="3층" ${dto.floorName=='3층'?"selected='selected'":""}>3층</option>
			         	<option value="4층" ${dto.floorName=='4층'?"selected='selected'":""}>4층</option>
			         	<option value="Other" ${dto.floorName=='Other'?"selected='selected'":""}>Other</option>
			         </select>
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.user.userName}
			      </td>
			  </tr>
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn btn-success btn-sm" onclick="check();">등록하기</button>
			        <button type="reset" class="btn btn-warning btn-sm">다시입력</button>
			        <button type="button" class="btn btn-danger btn-sm" >등록취소</button>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
</div>
<script type="text/javascript">
</script>
