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
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}

    function check() {
    	alert
        var f = document.boardForm;

    	var str = f.spotName.value;
        if(!str) {
            alert("지점을 입력하세요. ");
            f.spotName.focus();
            return;
        }

    	str = f.region.value;
    		if(str.length==0){
    			var tex="지역을 선택해 주세요";
    			$("#message").text(tex);
    			return;
    		}
    	str = f.tel.value;
        if(!str || str=="/^\d{2,3}-\d{3,4}-\d{4}$/") {
            alert("잘못된 지점 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.");
            f.tel.focus();
            return;
        }
		
        str=f.spotAddrNum.value;
        if(!str){
        	alert("우편번호를 입력하세요. ")
        	f.spotaddrnum.focus();
        	return;
        }
        
        str=f.spotAddr1.value;
        if(!str){
        	alert("주소를 입력하세요. ")
        	f.spotaddr1.focus();
        	return;
        }
        
        str=f.manager.value;
        if(!str || str=="/^[가-힣]+$/"){
        	alert("매니저 이름을 입력하세요. 매니저 이름은 한글만 가능합니다.")
        	f.manager.focus();
        	return;
        }
   		f.action="<%=cp%>/admin/spot/${mode}";
		f.submit();
    }
    
</script>

<div class="body-container">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 지점 등록 </h3>
    </div>
    <div>
			<form name="boardForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">지 점 명</td>
			      <td style="padding-left:10px;"> 
			        듀오스페이스 - <input type="text" name="spotName" class="boxTF" style="width: 10%;" value="${dto.spotName}">
			      </td>
			  </tr>
			  <tr>
			  	<td width="100" bgcolor="#eeeeee" style="text-align: center;">지역명</td>
			  	<td style="padding-left:10px;">
			  		<select name="region" id="sdbox">
			  			<option selected="selected" value="">시/도 선택</option>
			  			<option value="서울특별시" ${dto.region=='서울특별시'?"selected='selected'":""}>서울특별시</option>
			  			<option value="인천광역시" ${dto.region=='인천광역시'?"selected='selected'":""}>인천광역시</option>
			  			<option value="대전광역시" ${dto.region=='대전광역시'?"selected='selected'":""}>대전광역시</option>
			  			<option value="광주광역시" ${dto.region=='광주광역시'?"selected='selected'":""}>광주광역시</option>
			  			<option value="대구광역시" ${dto.region=='대구광역시'?"selected='selected'":""}>대구광역시</option>
			  			<option value="울산광역시" ${dto.region=='울산광역시'?"selected='selected'":""}>울산광역시</option>
			  			<option value="부산광역시" ${dto.region=='부산광역시'?"selected='selected'":""}>부산광역시</option>
			  			<option value="경기도" ${dto.region=='경기도'?"selected='selected'":""}>경기도</option>
			  			<option value="강원도" ${dto.region=='강원도'?"selected='selected'":""}>강원도</option>
			  			<option value="충청북도" ${dto.region=='충청북도'?"selected='selected'":""}>충청북도</option>
			  			<option value="충청남도" ${dto.region=='충청남도'?"selected='selected'":""}>충청남도</option>
			  			<option value="전라북도" ${dto.region=='전라북도'?"selected='selected'":""}>전라북도</option>
			  			<option value="전라남도" ${dto.region=='전라남도'?"selected='selected'":""}>전라남도</option>
			  			<option value="경상북도" ${dto.region=='경상북도'?"selected='selected'":""}>경상북도</option>
			  			<option value="경상남도" ${dto.region=='경상남도'?"selected='selected'":""}>경상남도</option>
			  			<option value="제주도" ${dto.region=='제주도'?"selected='selected'":""}>제주도</option>
			  		</select>
			  		<span id="message" style="color: red;"></span>
			  	</td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">지점주소</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" id="sample4_postcode" placeholder="우편번호" name="spotAddrNum" value="${dto.spotAddrNum}">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="spotAddr1" value="${dto.spotAddr1}">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="spotAddr2" value="${dto.spotAddr2}">
					<span id="guide" style="color:#999"></span>
			      </td>
			  </tr>
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;">지점 전화번호</td>
			      <td style="padding-left:10px;">
			        <input type="text" name="tel" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.tel}">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.user.userName}
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">매니저 이름</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="manager" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.manager}">
			      </td>
			  </tr>
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			      <c:if test="${mode=='update'}">
			      <input type="hidden" name="page" value="${page}">
			      <input type="hidden" name="spotCode" value="${dto.spotCode}">
			      </c:if>
			        <button type="button" class="btn btn-success btn-sm" onclick="check();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn btn-warning btn-sm">다시입력</button>
			        <button type="button" class="btn btn-danger btn-sm" onclick="javascript:location.href='<%=cp%>/admin/spotlist'">${mode=='update'?'수정취소':'등록취소'}</button>
			      </td>
			    </tr>
			  </table>
			</form>
			

    </div>
</div>
<script type="text/javascript">
</script>
