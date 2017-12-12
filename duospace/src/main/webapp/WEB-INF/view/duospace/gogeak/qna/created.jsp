<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
	String cp = request.getContextPath();
	// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
function check() {
    var f = document.createdForm;

	var str = f.subject.value;
    if(! str) {
        alert("제목을 입력하세요... ");
        f.subject.focus();
        return false;
    }
	
	str = f.content.value;
    if(! str) {
        alert("내용을 입력하세요... ");
        f.content.focus();
        return false;
    }
	
    f.action="<%=cp%>/duospace/qna/${mode}";
    return true;
	
}
</script>
<style type="text/css">
.createdTable tr td{
	padding: 5px 10px;
}
</style>

</head>
<body>
	<div class="col-sm-12 body-frame-2" role="main">



<div style="margin-top: 30px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 30px;">1:1 문의</div>


<form name="createdForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
<table class="createdTable" style="width:100%;margin: 50px auto 0px; border-spacing: 0px; border-collapse: collapse;">
  <tr style="border-bottom: 1px solid #e4e4e4;border-top: 1px solid #e4e4e4;" height="40px;">
    <td align="center" width="100px;" bgcolor="#eeeeee">
        문의종류
    </td>
    <td>
  		<select id="qnaCode" name="qnaCode">
			           <option value="" selected="selected">:: 선택 ::</option>
			           <option value="1" ${dto.qnaCode=='1'?"selected='selected'":""}>예약/결제</option>
			           <option value="2" ${dto.qnaCode=='2'?"selected='selected'":""}>이용권</option>
			           <option value="3" ${dto.qnaCode=='3'?"selected='selected'":""}>카페</option>
			           <option value="4" ${dto.qnaCode=='4'?"selected='selected'":""}>도서예약</option>
			           <option value="5" ${dto.qnaCode=='5'?"selected='selected'":""}>회원가입/로그인</option>
			           <option value="6" ${dto.qnaCode=='6'?"selected='selected'":""}>기타문의</option>
		</select>
		<span id="message" style="color: red"></span>
      	
    </td>
  </tr>
  <tr style="border-bottom: 1px solid #e4e4e4;border-top: 1px solid #e4e4e4;" height="40px;">
    <td align="center" width="100px;" bgcolor="#eeeeee">
        제 목
    </td>
    <td>
    	<c:if test="${mode!='reply'}">
  			<input type="text" name="subject" class="boxTF" style="width: 100%;" value="${dto.subject}">
      	</c:if>
      	
      	<c:if test="${mode=='reply'}">
  			<input type="text" name="subject" class="boxTF" style="width: 100%;" value="답변입니다 :) ">
      	</c:if>
    </td>
  </tr>
  <tr style="border-bottom: 1px solid #e4e4e4" height="40px;">
    <td align="center" bgcolor="#eeeeee">
      작성자
    </td>
    <td>
      ${sessionScope.user.userName}
     
    </td>
  </tr>
  <tr style="border-bottom: 1px solid #e4e4e4; max-height: 350px;">
    <td align="center" bgcolor="#eeeeee">
     내용
    </td>
    <td>
        <textarea name="content" id="content" style="width: 95%; height: 270px;">${dto.content}</textarea>
    </td>
  </tr>

  
  <tr>
    <td colspan="2" align="center">
      <c:if test="${mode=='update'}">
      	<input type="hidden" name="searchKey" value="${searchKey}">
      	<input type="hidden" name="searchValue" value="${searchValue}">
      	<input type="hidden" name="page" value="${page}">
      	<input type="hidden" name="searchCode" value="${searchCode}">
      	<input type="hidden" name="num" value="${dto.num}">
      </c:if>
      <c:if test="${mode=='reply'}">
      	<input type="hidden" name="num" value="${dto.num}">  
      	<input type="hidden" name="page" value="${page}">
      </c:if>
      <button type="submit" onclick="sendOk();">${mode=='update'?"수정완료":"등록완료"}</button>
      <button type="reset">다시입력</button>
      <button type="button" onclick="javascript:location.href='<%=cp%>/duospace/qna/list';">${mode=='update'?"수정취소":"수정완료"}</button>
    </td>
  </tr>
</table>
</form>


	</div>
	
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>    
	