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
    	alert
        var f = document.boardForm;
		
    	var str = f.spotCode.value;
    	if(!str){
    		alert("지점을 선택 하세요.");
    		f.spotCode.focus();
    		return;
    	}
    	var str = f.roomName.value;
        if(!str) {
            alert("룸 이름을 입력하세요. ");
            f.roomName.focus();
            return;
        }
    	
    	var str = f.rcontent.value;
    	if(!str){
    		alert("룸 내용을 입력하세요.");
    		f.rcontent.focus();
    		return;
    	}
    	
    	var str = f.price.value;
    	if(!str){
    		alert("룸 가격을 입력하세요.");
    		f.price.focus();
    		return;
    		
    	}
   		f.action="<%=cp%>/admin/room/${mode}";
		f.submit();
    }
    
function floorList() {
	var spotCode=$("#shop").val();
	if(spotCode==""){
		$("#floor option").each(function(){
			$("#floor option:eq(0)").remove();
		});
		
		$("#floor").append("<option value=''>층 선택</option>");
		return false;
	}
	var url="<%=cp%>/admin/floorList";
	var params="spotCode="+spotCode;
	
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(data){
			$("#floor option").each(function () {
				$("#floor option:eq(0)").remove();
			});
			
			$("#floor").append("<option value=''>층 선택</option>");
			
			for(var idx=0; idx<data.list.length; idx++){
				$("#floor").append("<option value='"+data.list[idx].floorNum+"'>"+data.list[idx].floorName+"</option>");
			}
		}
		,error:function(e){
			alert(e.responseText);
		}
	});
}


    
$(function(){
	$("[placeholder]").css("color","red");
});


    
</script>
<style type="text/css">
</style>

<div class="body-container">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> ${mode=='update'? '룸 수정':'룸 등록'}</h3>
    </div>
    <div>
			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			  	<td width="100" bgcolor="#eeeeee" style="text-align: center;">지점</td>
			  	<td style="padding-left:10px;">
			  		<select name="spotCode" id="shop" onchange="floorList();">
			  			<option selected="selected" value="">지점 선택</option>
			  			<c:forEach var="vo" items="${slist}">
			  				<option value="${vo.spotCode}" ${dto.spotCode==vo.spotCode?"selected='selected'":""}>${vo.spotName}</option>
			  			</c:forEach>
			  		</select>
			  		<span id="message" style="color: red;"></span>
			  	</td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			  	<td width="100" bgcolor="#eeeeee" style="text-align: center;">층</td>
			  	<td style="padding-left:10px;">
			  		<select name="floorNum" id="floor">
			  			<option selected="selected" value="">층 선택</option>
			  		</select>
			  		
			  		<span id="message" style="color: red;"></span>
			  	</td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">룸 이름</td>
			      <td style="padding-left:10px;"> 
			       <input type="text" name="roomName" class="boxTF" style="width: 30%;" value="${dto.roomName}" placeholder="룸 이름">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;">룸 설명</td>
			      <td style="padding-left:10px;">
			        <input type="text" name="rcontent" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.rcontent}" placeholder="룸 설명">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;">룸 가격</td>
			      <td style="padding-left:10px;">
			        <input type="text" name="price" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.price}"  placeholder="룸 가격">
			      </td>
			  </tr>
			   <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53" style="height: 25px;">
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
			        <button type="button" class="btn btn-success btn-sm" onclick="check();">${mode=='update'? '수정완료': '등록하기' }</button>
			        <button type="reset" class="btn btn-warning btn-sm">다시입력</button>
			        <button type="button" class="btn btn-danger btn-sm" onclick="javascript:location.href='<%=cp%>/admin/roomlist?page=${page}'">${mode=='update'?'수정취소':'등록취소'}</button>
			      </td>
			    </tr>
			  </table>
			  <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="spotCode" value="${dto.spotCode}">
			        	 <input type="hidden" name="page" value="${page}">
			         	 <input type="hidden" name="saveFileName" value="${dto.saveFileName}">
			         	 <input type="hidden" name="roomCode" value="${dto.roomCode}">
			  </c:if>
			  
			</form>
			

    </div>
</div>
<script type="text/javascript">
</script>
