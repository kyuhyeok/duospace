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
//모달 일정생성창 띄우기.
function dialogCalendar(){
	$("#modalContent1").val("");
	$("#modalCalendar").modal("show");
	$("#modalContent1").focus()
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
			
			location.href="<%=cp%>/community/moim${cmoimCode}";
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

//자유게시판 전체글 리스트
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
			console.log(e.responseText);
		}
	});
}

//일정게시판 전체글 리스트
function calendar(){
	
	var url="<%=cp%>/community/moim${cmoimCode}/calendar";
	
	var cmoimCode="${cmoimCode}";//값설정..
	var query="cmoimCode="+cmoimCode;
	
	//ajax:text
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data){
			$("#listFreeboard").html(data);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}

//댓글 리스트.
function listReply(boardNum){
	var listReplyId="#listReply"+boardNum;
	
	var url="<%=cp%>/freeboard/listReply";
	
	var query="boardNum="+boardNum;
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data){
			$(listReplyId).html(data);
		}
		,beforeSend : function(e){
			e.setRequestHeader("AJAX",true);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}


//댓글버튼
$(function(){
	$("body").on("click", ".btnReplyLayout", function(){
		var boardNum = $(this).attr("data-boardNum");
		
		var $trReply = $(this).parent().parent().next();
		var isVisible = $trReply.is(":visible");
		
		if(isVisible) {
			$trReply.hide();
		} else {
			$trReply.show();
			
			listReply(boardNum);//댓글 누르면 밑에 리스트가나온다.
		}
			
	});
});

//댓글쓰기
function sendReply(boardNum){
	var uid="${sessionScope.user.memberNum}";
	if(! uid){
		location.href='<%=cp%>/member/login';
		return;
	}
	
	var content = $.trim($("#replyContent").val());
	if(! content){
		$("#replyContent").focus();
		return;
	}
	var query ="content="+encodeURIComponent(content);
		query+="&cmoimCode=${cmoimCode}";
		query+="&boardNum="+boardNum;
		
	var url="<%=cp%>/freeboard/insertReply";
	$.ajax({
		type:"post"			
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			var s=data.state;
			if(s=="loginFail"){
				location.href="<%=cp%>/user/login";
				return;
			}
			$("#replyContent").val("");
			listReply(boardNum);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}




</script>

<header>
	<div style="width: 100%; height: 25px; background: #D9383A; position: fixed; left: 0px; top: 50px;" align="center">
		<table>
			<tr>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moimfreeboardlist" href="<%=cp%>/community/moim${cmoimCode}">
						전체글<!-- freeboardNum -->
					</a>
				</td>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moimalbum" href="<%=cp%>/moimalbum/list">
						사진첩
					</a>
				</td>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moimcalendar" onclick="calendar();">
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
	<div style="width: 1050px; margin: auto; margin-bottom: 10px; overflow:auto;">
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
			</div>
			
			<!-- 사이드. -->
				<!-- 채팅DIV -->
			<!-- <div style="float: left;margin-left: 20px;margin-bottom: 12px;">
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
			 -->
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

<!-- 자유게시판 글쓰기 모달 -->
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

<!-- 일정생성 모달. -->
<div id="modalCalendar" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 480px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h2 id="myModalLabel" class="modal-title text-center fc-orange"
					style="font-family: sans-serif, 나눔고딕, 맑은 고딕; font-weight: bold;">일정 만들기</h2>
			</div>
			<div class="modal-body">
				<form name="modalCalendarForm" method="post">
					<input type="hidden" name="cmoimCode" value="${dto.comimCode}">
					<div class="form-group" style="overflow: auto;"><!-- 중간에 작성란. -->
						<div>
							<div> 
								<input type="text"  placeholder="일정 제목" style="width: 440px; height: 31px;">
							</div>
							<div>
								<textarea placeholder="일정 설명" maxlength="1500" style="overflow: hidden; width: 440px;height: 81px; margin-top: 5px;"></textarea>
							</div>
						</div>
						
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								시작
							</div>
							<div style="float: left;">
								<input placeholder="2017-12-21">
							</div>
							<div style="float: left;">
								<input placeholder="오전 01:00">
							</div>
						</div>
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								모집인원
							</div>
							<div style="float: left;">
								<select style="width: 174px;height: 26px;">
									<option>2명</option>
									<option>3명</option>
									<option>4명</option>
									<option>5명</option>
									<option>10명</option>
									<option>20명</option>
								</select>
							</div>
						</div>
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								모집장소
							</div>
							<div style="float: left;">
								<input placeholder="모집장소를 입력해주세요">
							</div>
						</div>
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								모집시간
							</div>
							<div style="float: left;">
								<input placeholder="오전 01:00">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;">
							<div style="margin: 15px; padding-right: 50px;" align="center">
								<button type="button" class="btn" onclick="sendCalendar();">
									완료
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
