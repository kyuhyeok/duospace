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
function sendOk() {
    var f = document.createdForm;

	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요... ");
        f.subject.focus();
        return false;
    }
	
	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요... ");
        f.content.focus();
        return false;
    }

	f.action="<%=cp%>/duospace/notice/${mode}";
    return true;
}


</script>
<style type="text/css">
.createdTable tr td{
	padding: 2px 10px;
}
input[name="subject"]{
	display: block;
	position: relative;
	padding: 5px 8px;
	width: 100%;
	color: #444;
	font-size: 1.6rem;
	outline: 0;
	border: none;
	border-bottom: solid 1px #dddddd;
}
input[name="subject"]:focus{
	border-bottom: solid 2px #172a40;
}
.btns{
	background-color: #172a40;
	color: #ffffff;
	outline: none;
	border: 1px solid #172a40;
	font-family: 'Noto Sans KR', sans-serif;
	padding: 5px 7px;
}
.btns:hover{
	background-color: #172a40;
	color: #ffffff;
}
.paper-toggle{
  clear: both;
  margin: 20px 0;
}

.paper-toggle input:empty
{
	margin-left: -999px;
}

.paper-toggle input:empty ~ label
{
	position: relative;
	float: left;
	line-height: 1.6em;
	width: 150px;
	cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.paper-toggle input:empty ~ label:before, 
.paper-toggle input:empty ~ label:after
{
  position: absolute;
	display: block;
  content: ' ';
  -webkit-transition: all 200ms ease-in;
  transition: all 200ms ease-in;
}

.paper-toggle input:empty ~ label:before
{
    top: 8px;
    left: 115px;
    width: 32px;
    height: 1px;
    background-color: #5a5a5a;
}

input.switch:empty ~ label:after
{
    top: 0px;
    left: 100px;
    width: 1.4em;
    height: 8px;
    bottom: 0.1em;
    margin-left: 0.1em;
    background-color: #fff;
    border-radius: 50%;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    border: solid 2px;
    border-color: #5a5a5a;
}

.paper-toggle input:checked ~ label:before
{
	background-color: #0f9d58;
}

.paper-toggle input:checked ~ label:after
{
	left: 140px;
  background-color: #0f9d58;
  border-color: #0f9d58;
}



</style>

</head>
<body>
	<div class="col-sm-12 body-frame-2" role="main">


<div style="margin-top: 30px;"></div>
<div style="font-weight: bold; font-size: 25px; margin-bottom: 30px;">공지사항</div>


<form name="createdForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
<table class="createdTable" style="margin: 50px auto 0px; border-spacing: 0px; border-collapse: collapse;width: 100%;">
  <tr height="80px;">
    <td width="80px;" style="font-weight: bold;font-size: 20px;">
        제 목
    </td>
    <td>
  		<input type="text" name="subject" value="${dto.subject}">
    </td>
  </tr>
  <tr height="40px;">
    <td colspan="2">
    
     <div class="paper-toggle">
	<input type="checkbox" id="notice" name="notice" class="switch" />
	<label for="notice">공지</label>
	</div>
     
     <input type="checkbox" name="notice" value="1" ${dto.notice=='1'?"checked='checked'":""}>
     
     
    </td> 
  </tr>
  <tr height="350px;">
    <td colspan="2" valign="middle">
     <textarea name="content" id="content" style="width: 95%; height: 270px;">${dto.content}</textarea>
    </td>
  </tr>
 <tr height="40px;">
    <td>
      첨부파일
    </td>
    <td>
       <input type="file" name="upload" class="boxTF">
    </td>
  </tr>
  <c:if test="${mode=='update'}">
  <tr> 
    <td>
    	 등록파일
    </td>
     <td>
      ${dto.originalFilename} &nbsp;&nbsp; <c:if test="${not empty dto.originalFilename}"><a href="<%=cp%>/duospace/deleteFile?page=${page}&num=${dto.num}">x</a></c:if>
    </td>
  </tr>
  </c:if>
  <tr>
    <td colspan="2" align="center">
      <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="num" value="${dto.num}">
			        	 <input type="hidden" name="page" value="${page}">
			         	 <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
			         	 <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
			         	
	  </c:if>
      <button type="button" class="btns" onclick="sendOk();">${mode=='update'?"수정완료":"등록완료"}</button>
      <button type="reset" class="btns">다시입력</button>
      <button type="button" class="btns" onclick="javascript:location.href='<%=cp%>/duospace/notice/list'">${mode=='update'?"수정취소":"등록취소"}</button>
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
	