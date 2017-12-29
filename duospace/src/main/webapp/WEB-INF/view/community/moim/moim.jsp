<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- 날짜Jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">


//날짜 창띠우기.
$(function() {
	$("#modalMoimMoinDate").datepicker();
});


//모달 글쓰기창 띄우기.
function dialogNewWord() {
    $("#modalSubject").val("");
    $("#modalContent").val("");
	$("#modalNewWord").modal("show");
    $("#modalContent").focus();
}


//모달 일정생성창 띄우기.
function dialogMoimCalendar(){
	$("#modalMoimContent").val("");
	$("#modalMoimCalendar").modal("show");
	$("#modalMoimContent").focus()
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


//일정 만들기
function sendMoimCalendar(){
	
	var url="<%=cp%>/moimCalendar/insertMoimCalendar";

	
	var	subject = $.trim($("#modalMoimSubject").val()); 
	if(! subject){
		$("#modalMoimSubject").focus();
		return;
	}
	var content = $.trim($("#modalMoimContent").val());
	if(! content){
		$("#modalMoimContent").focus();
		return;
	}
	var moinDate = $.trim($("#modalMoimMoinDate").val());
	if(! moinDate){
		$("#modalMoimMoinDate").focus();
		return;
	}
	var people = $.trim($("#modalPeople").val());
	if(! people){
		$("#modalPeople").focus();
		return;
	}
	var spot = $.trim($("#modalSpot").val());
	if(! spot){
		$("#modalSpot").focus();
		return;
	}
	var price = $.trim($("#modalPrice").val());
	if(! price){
		$("#modalPrice").focus();
		return;
	}
	
	var cmoimCode = "${cmoimCode}";
	
	var query = "content="+encodeURIComponent(content);
		query += "&cmoimCode="+cmoimCode;
		query += "&subject="+encodeURIComponent(subject);
		query += "&moinDate="+moinDate;
		query += "&people="+people;
		query += "&spot="+encodeURIComponent(spot);
		query += "&price="+encodeURIComponent(price);
		//alert(query);
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#modalMoimContent").val("");
			$("#modalMoimSubject").val("");
			$("#modalPeople").val("");
			$("#modalSpot").val("");
			$("#modalPrice").val("");
			
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
function moimcalendar(){
	
	var url="<%=cp%>/community/moim${cmoimCode}/moimcalendar";
	
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

//모임 멤버리스트
function moimmember(){
	
	var url="<%=cp%>/community/moim${cmoimCode}/moimmember";
	
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
				location.href="<%=cp%>/member/login";
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

//글 삭제
function deleteFreeboard(boardNum){
	
	if(! confirm("게시글을 삭제하시겠습니까?"))
		return;
	
	var url="<%=cp%>/freeboard/deleteFreeboard";
	
	var query="boardNum="+boardNum;
		query+="&cmoimCode=${cmoimCode}";
		
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			var s=data.state;
			if(s=="loginFail"){
				location.href="<%=cp%>/member/login";
				return;
			}
			listPage(1);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}



</script>



<!-- 프로필 -->
<div style="vertical-align: top;margin-right: 20px;float: left; width: 180px;">
	<div>
		<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width:180px;height: 100px; ">
		<h3>자바 웹 개발</h3>
		<span>멤버 ${dataCount}</span>&nbsp;&nbsp;&nbsp;<a>초대</a>
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
<div id="moimchatdiv" style="width: 240px;height:auto;float: left;margin-left: 20px;margin-bottom: 12px;"></div>
	<!-- /채팅DIV -->


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
					<div class="form-group" style="min-height: 200px;">
						<textarea rows="10" cols="78" style="border: none; min-height: 200px;" id="modalContent" name="content" placeholder="내용을 입력하세요." ></textarea>
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
<div id="modalMoimCalendar" class="modal fade" tabindex="-1" role="dialog"
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
				<form name="modalMoimCalendarForm" method="post">
					<input type="hidden" name="cmoimCode" value="${dto.comimCode}">
					<div class="form-group" style="overflow: auto;"><!-- 중간에 작성란. -->
						<div>
							<div> 
								<input type="text"  placeholder="일정 제목" style="width: 440px; height: 31px; border: 1px solid #cccccc;" id="modalMoimSubject" name="moimSubject">
							</div>
							<div>
								<textarea placeholder="일정 설명" maxlength="1500" style="overflow: hidden; width: 440px;height: 81px; margin-top: 5px; border: 1px solid #cccccc;" id="modalMoimContent" name="moimContent"></textarea>
							</div>
						</div>
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								모집날
							</div>
							<div style="float: left;">
								<input placeholder="2017-12-21" style="border: 1px solid #cccccc;" id="modalMoimMoinDate" name="moinDate">
							</div>
						</div>
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								모집인원
							</div>
							<div style="float: left;">
								<select style="width: 174px;height: 26px; border: 1px solid #cccccc;" id="modalPeople" name="modalPeople">
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
									<option value="5">5명</option>
									<option value="10">10명</option>
									<option value="20">20명</option>
								</select>
							</div>
						</div>
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								모집장소
							</div>
							<div style="float: left;">
								<input placeholder="모집장소를 입력해주세요" style="border: 1px solid #cccccc;"id="modalSpot" name="modalSpot">
							</div>
						</div>
						<div align="center" style="margin-top: 5px; height: 32px;">
							<div style="width:89px; height: 18px; padding-right: 10px; font-size: 13px; font-weight: 400;float: left;" >
								회비
							</div>
							<div style="float: left;">
								<input placeholder="￦10.000원" style="border: 1px solid #cccccc;" id="modalPrice" name="modalPrice">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;">
							<div style="margin: 15px; padding-right: 50px;" align="center">
								<button type="button" class="btn" onclick="sendMoimCalendar();">
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
