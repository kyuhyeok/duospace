<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
*{
	list-style: none;
}
.star_rating a {
    cursor: pointer;
    color: #000000;
    text-decoration: none;
    /*line-height: 150%;*/
}
.star_rating a:hover, a:active {
    color: #FFE400;
    text-decoration: underline;
}
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#FFE400;}
</style>
<script type="text/javascript">
    function SendOk(reservNum) {
        var f = document.boardForm;
		
    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

   		f.action="<%=cp%>/duospace/epilogue/created?reservNum=${reservNum}";
		f.submit();
   		
    }
    $(function(){
    	$( ".star_rating a" ).click(function() {
    		var b=$(this).hasClass("on");
    	    $(this).parent().children("a").removeClass("on");
    	    $(this).addClass("on").prevAll("a").addClass("on");
    	    if(b)
    	    	$(this).removeClass("on");
    	    
    	    var s=0;
    	    $(".star_rating a").each(function(){
    	    	if($(this).hasClass("on"))
    	    		s++;
    	    });
    	    $("#score").val(s);
    	});
    });
</script>

<div class="body-container">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 이용 후기 등록 </h3>
    </div>
    
    <div>
			<form name="boardForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);"><!--submitContent(this): 스마트에디터에서 사용하는 함수 -->
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			  	<td width="120" bgcolor="#eeeeee" style="text-align: center;">
			  		지점명/예약번호
			  	</td>
			  	<td style="padding-left:10px;">
			  		${spotName}/${reservNum}
			  	</td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			  	<td width="100" bgcolor="#eeeeee" style="text-align: center;">
			  	평점
			  	</td>
			  	<td style="padding-left:10px;">
			  		<p class="star_rating">
	   					<a href="#">★</a>
	    				<a href="#">★</a>
	   					<a href="#">★</a>
	    				<a href="#">★</a>
	    				<a href="#">★</a>
					</p>
					<input type="hidden" name="starnum" id="score" value="${dto.starnum}" readonly="readonly">
			  	</td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.user.userName}
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" id="content" style="width: 95%; height: 450px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="70" style="height: 30px;" value="${dto.saveFilename}">
			       </td>
			  </tr>
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="submit" class="btn btn-success btn-sm" onclick="SendOk('${reservNum}');">등록하기</button>
			        <button type="reset" class="btn btn-warning btn-sm">다시입력</button>
			        <button type="button" class="btn btn-danger btn-sm" onclick="javascript:location.href='<%=cp%>/mypage'">등록취소</button>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
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
