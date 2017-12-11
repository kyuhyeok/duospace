<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">

//모달 글쓰기창 띄우기.
function dialogNewWord() {
    $("#modalSubject").val("");
    $("#modalContent").val("");
	$("#modalNewWord").modal("show");
    $("#modalContent").focus();
}

//<!-- 자유글 쓰기 -->
function sendFreeboard(){
	var uid="${sessionScope.user.memberNum}";
	
	var url="<%=cp%>/freeboard/insertFreeboard";
	
	var Content = $.trim($("#modalContent").val());
	var cmoimCode = "${cmoimCode}";
	
	var query = "content="+encodeURIComponent(Content);
		query += "&cmoimCode="+cmoimCode;
		
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#modalContent").val("");
			
			location.href="<%=cp%>/community/moim/moim?cmoimCode=${cmoimCode}";
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}

//<!-- list 페이지처리 -->
var pageNo=1;
var totalPage=1;

// 스크롤바 존재 여부
function checkScrollBar() {
    var hContent = $("body").height();
    var hWindow = $(window).height();
    if(hContent>hWindow) { 
        return true;    
    }
    return false;
}
//페이지 바로출력.
$(function(){
	listPage(1);
});

//무한 스크롤
$(function(){
	$(window).scroll(function() {
	    if ($(window).scrollTop() + 100 >= $(document).height() - $(window).height()) {
	    	if(pageNo<totalPage) {
	    		++pageNo;
	    		listPage(pageNo);
	    	}
	    }
	});
});

function listPage(page) {
	var url="<%=cp%>/freeboard/list";
	var cmoimCode="${cmoimCode}";//값설정..
	var query="cmoimCode="+cmoimCode;
		query+="&pageNo="+page;
	//ajax:text
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data){
			$("#listFreeboard").html(data);
		}
		,error:function(e){
			consloe.log(e.responseText);
		}
	});
}
//댓글버튼
/*
$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		var replyNum = $(this).attr("data-replyNum");
		
		var $trReplyAnswer = $(this).parent().parent().next();
		var isVisible = $trReplyAnswer.is(":visible");
		
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
			
			listAnswer(replyNum);
		}
			
	});
});
*/
</script>

<header>
	<div style="width: 100%; height: 25px; background: #D9383A; position: fixed; left: 0px; top: 50px;" align="center">
		<table>
			<tr>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moimfreeboardlist" href="<%=cp%>/community/moim/moim?cmoimCode=${cmoimCode}">
						전체글<!-- freeboardNum -->
					</a>
				</td>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moimalbum">
						사진첩
					</a>
				</td>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moim">
						일정
					</a>
				</td>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moimmember">
						멤버
					</a>
				</td>
			</tr>
		</table>
	</div>
</header>

<div style="width: 100%; min-height: 800px; background:#eef0f3; margin-top: 100px;">
	<div style="width: 1050px;min-height: 800px; margin: auto;">
			<!-- 프로필 -->
			<div style="vertical-align: top;margin-right: 20px;float: left; width: 180px;">
				<div>
					<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width:180px;height: 100px; ">
					<h3>자바</h3>
					<span>멤버 1</span>&nbsp;&nbsp;<a>초대</a>
					<hr>
				</div>
			</div>
			<!-- 가운데 글리스트 -->
			<div style="float: left; width: 550px; min-height: 800px;" >
				<!-- 전체글 -->
				<!-- 새글 올라올곳.. -->		
				<div id="listFreeboard"></div>
					<!-- 리플 리스트 -->
					<!-- 
					 <div id="listReply"></div>
					 -->
			</div>
			
			<!-- 사이드. -->
			<div style="float: left;margin-left: 20px;margin-bottom: 12px;">
				<!-- 채팅DIV -->
				<div>
					<div style="width: 240px;height: 34px;background: #fff; border-bottom: 1px solid #efefef;">
						<div align="left" style="width: 110px; float: left; margin-top: 5px;margin-left: 10px;">
							 채팅 
						</div>
						
						<div style="float: right; margin-right: 15px;margin-top:5px;">
							 <a>새 채팅</a> 
						</div>
						
					</div>
					<div style="border-top: 1px solid #ccc; width: 240px; height: 63px; background: #fff; ">
						<a>
						
						</a>
					</div>
				</div>
			</div>
			
			<div style="float: left;margin-left: 20px;">
				<!-- 채팅DIV -->
				<div>
					<div style="width: 240px;height: 34px;background: #fff; border-bottom: 1px solid #efefef;">
						<div align="left" style="width: 110px; float: left; margin-top: 5px;margin-left: 10px;">
							 채팅 
						</div>
						
						<div style="float: right; margin-right: 15px;margin-top:5px;">
							 <a>새 채팅</a> 
						</div>
						
					</div>
					<div style="border-top: 1px solid #ccc; width: 240px; height: 63px; background: #fff; ">
						<a>
						
						</a>
					</div>
				</div>
			</div>
	</div>
</div>


<div id="modalNewWord" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h2 id="myModalLabel" class="modal-title text-center fc-orange"
					style="font-family: sans-serif, 나눔고딕, 맑은 고딕; font-weight: bold;">글쓰기</h2>
			</div>
			<div class="modal-body">
				<form name="modalNewWordForm" method="post">
					<input type="hidden" name="cmoimCode" value="${dto.comimCode}">
					<div class="form-group">
						<textarea rows="10" cols="78" style="border: none;" id="modalContent" name="content" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="form-group">
						<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;">
							<div style="margin: 15px; float: left; padding-left: 50px;">
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
								<a>
									<img src="<%=cp%>/resource/images/communiti/icon_plus.png" style="width: 30px;height: 30px;">
								</a>
							</div>
							<div style="margin: 15px; float: right; padding-right: 50px;">
								<button type="button" class="btn" onclick="sendFreeboard();">
									글쓰기
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
