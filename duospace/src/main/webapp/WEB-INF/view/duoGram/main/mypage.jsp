<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- textarea에 글을 길게 쓰면 자동으로 길이가 늘어난다. -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Bootstrap core CSS -->
<link href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css" type="text/css"/>

<style type="text/css">
.duo_01 {
	font-family:"duo_1";
	src: url("/duospace/resource/font/duogram/duo_1.ttf") format("truetype");
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

<script type="text/javascript">
var pageNo=1;
var totalPage=1;

$(function(){
	listPage(1);
});

function sendBoard() {
	var uid="${sessionScope.user.memberNum}";
	if(!uid){
		location.href="<%=cp%>/member/login";
		return;
	} 
	// 공백이 있으면 뭐?
	var content=$.trim($("#content").val());
	if(! content) {
		$("#content").focus();
		return;
	}
	
	var blogNum="${blogNum}";
	var q="content="+encodeURIComponent(content)+"&blogNum="+blogNum;
	
	var url="<%=cp%>/duogram/insert";
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			$("#content").val("");
			
			// 글쓰기 후 새로고침
			$("#listDuogramBody").empty();
			pageNo=1;
			listPage(1);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
// 무한스크롤
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

// 타임라인 페이징처리
function listPage(page) {
	var url="<%=cp%>/duogram/list";
	var blogNum="${blogNum}";
	
	// json으로 넘겨 받음
	$.post(url, {pageNo:page, blogNum:blogNum}, function(data){
		printDuogram(data);
	}, "json");
}

//답글달기
function sendReply() {
	var uid="${sessionScope.user.memberNum}";
	if(! uid) {
		location.href='<%=cp%>/member/login';
		return;
	}
	
	var content=$.trim($("#replyContent").val());
	if(! content){
		$("#replyContent").focus();
		return;
	}
	
	var blogNum="${blogNum}";
	var q="content="+encodeURIComponent(content)+"&blogNum="+blogNum;
	q+="&num=${dto.num}";
	q+="&answer=0";
		
	var url="<%=cp%>/duogram/insertReply";
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			var s=data.state;

			$("#replyContent").val("");
			listPage(1);
		}
		,error:function(e){
			console.log(e.responseText);
		}
		
	});
}

//답글버튼
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

// 타임라인 글 리스트
function printDuogram(data) {
	// console.log(data);
	var uid="${sessionScope.user.memberNum}";
	var dataCount=data.dataCount;
	var page=pageNo;
	totalPage=data.total_page;
	
	var out="";
	if(dataCount!=0) { 
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var memberNum=data.list[idx].memberNum;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			var name=data.list[idx].name;
			
			out+="<div style='min-height: 220px; margin-bottom: 30px; width: 614px; border: 1px solid #dddfe2; float:left; background-color: white; border-radius: 3px;'>";
			out+="<div style='height: 40px; padding-left: 15px; padding-right: 15px; font-weight: bold; font-size: 16px;'>";
			out+="<div style='margin-top: 10px;'>";
			out+="<div style='float: left; margin-right: 8px; max-width: 43px; overflow: hidden; border-radius: 21.5px; max-height: 43px; bottom: 50px'>";
			out+="<a href='#' style='text-decoration:none; color: black;'>";
			out+="<img style='width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/dong.png'>";
			out+="</a>";
			out+="</div>";
			out+="<div style='float:left; height: '><a href='#' style='font-size: 16px; text-decoration:none; font-family: '나눔고딕';'>"+name+"</a></div>";
			out+="<br>"
			out+="<div style='float:left; height: 23px; padding-top: 5px; font-size: 12px; color: #ccc;'>"+created+"</a></div>";
			out+="<div class='dropdown' style='float:right;'>";
			out+="<button aria-expanded='true' data-toggle='dropdown'type='button'>";			
			out+="<span><img src='<%=cp%>/resource/images/duogram/dot.PNG' style='width: 12px; height: 3px;'></span>";
			out+="</button>"
			out+="<ul class='dropdown-menu'>";
			out+="<li style='margin-left: 20px; height: 20px;'><button type='button' tabindex='-1'>수정</button>";
			out+="<li style='margin-left: 20px; height: 20px;'><button onclick='deleteGram();' type='button' tabindex='-1'>삭제</button>";
			out+="</div>";
			out+="</div>";
			out+="</div>";
			out+="<div style='border-top: 1px solid #ccc; margin-bottom: 10px; margin-top: 10px;max-width:100%;height: 100%;overflow: hidden;'>";
			out+="<a>";
			out+="<img style='max-width:100%;border: 0;	src='https://scontent-icn1-1.xx.fbcdn.net/v/t15.0-10/24133944_966022340205707_6194669685078753280_n.jpg?oh=cf7e75a1afcae89eabb2928519009a28&oe=5A9CE0E2'>";
			out+="</a>";
			out+="</div>";
			out+="<div style='padding-left: 15px; padding-right: 15px;'>";
			out+="</div>";
			out+="<div style='padding-top: 10px; margin-left: 15px; margin-right: 15px; margin-bottom: 15px; width: 584px; font-weight: normal; font-size: 15px; line-height: 1.5em;'>"+content+"</div>";
			out+="<div style='margin: 20px'></div>";
			out+="<div style='float: left; height: 23px; font-size: 14px; padding-top: 7px; padding-left: 15px;'>";
			out+="<a href='#' style='text-decoration:none; font-weight: bold; font-family: '나눔고딕';'>"+"좋아요x개　"+"</a>";
			out+="</div>";
			out+="<div style='float: left; height: 23px; font-size: 14px; padding-top: 7px; padding-left: 5px;'>";
			out+="<a href='#' style='text-decoration:none; font-weight: blod; font-family: '나눔고딕';'>"+"댓글x개"+"</a>";
			out+="</div>";
			out+="<div style='height: 30px; margin-left: 15px; margin-right: 15px; border-top: 1px solid #dddfe2;'>";
			out+="<input type='text' style='border-radius: 4px; margin-top: 17px; border: none; width: 500px; height: 25px; font-family: '나눔고딕';' placeholder='　댓글 달기'>";
			out+="<button type='button' onclick='sendReply();' style='float: right; margin-top: 17px; border-radius: 4px; color: white; border: none; background: #172A40; width: 80px; height: 28px;'>"+"댓글 달기";
			out+="</div>";
			out+="</div>";
		}
		$("#listDuogramBody").append(out);
	}
}

function deleteBoard() {
	<c:if test="${sessionScope.user.name=='admin' || sessionScope.user.num==dto.num}">
	  var num = "${dto.num}";
	  var page = "${page}";
	  var query = "num="+num+"&page="+page;
	  var url = "<%=cp%>/bbs/delete?" + query;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
	</c:if> 
	
	<c:if test="${sessionScope.member.userId!='admin' && sessionScope.user.num!=dto.num}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
}

</script>

</head>
<body style="margin: 0px; height: 100%; width: 100%; background: #e9ebee;">

<!-- left -->
<!-- mid -->
	<div style="height: 32px;">
	</div>
	<div style="width: 935px; margin: auto;">
	<div style="width: 627px;">
		<!-- 왼쪽 글쓰는곳 -->
		<div class="wrap" style="width: 614px; float: left;">
			<div style="margin-bottom: 60px; width: 614px; border: 1px solid #dddfe2; background-color: white; border-radius: 4px;">
				<!-- 게시글 등록 및 동영상 추가 -->
				<form name="boardForm" method="post">
				<div style="height: 30px; background: #172A40; border-bottom: 1px solid #dddfe2;">
					<div align="left" class="duo_01" style="margin-left: 15px; color: white; margin-right: 15px; padding-bottom: 10px; padding-top: 5px; font-size: 14px; font-weight: bold; font-family: '나눔고딕';">글쓰기
					</div>
				</div>
				
				<!-- 내용 입력 -->
				<div style="margin-top: 10px; margin-bottom: 10px;">
					<textarea style="border:none; resize: none; width: 584px; height: 60px; font-family: '나눔고딕';" placeholder="내용을 입력해주세요." id=content></textarea>
				</div>
				
				<!-- 첨부파일 -->
				<div style="border-top: 1px solid #ccc; margin-bottom: 10px; margin-left: 15px; margin-right: 15px;"></div>
					<div style="height: 40px; padding-left: 15px; padding-right: 15px;">
						<a href="#">
							<button type="button" style="border-radius: 4px; border: 1px solid #dddfe2; width: 250px; height: 28px; text-decoration:none; color: black">첨부파일</button>
						</a>
						<!-- 글 및 동영상 등록 -->
						<button type="button" class="btn pull-right" onclick="sendBoard();" style="border: 2px solid #172A40; background: #172A40; width: 80px; color: white; height: 28px; font-size: 11px;  border-radius: 3px; margin-left: 8px; text-align: center;">등록하기</button>
						<button type="button" class="btn pull-right" style="border: 2px solid #172A40; background: #172A40; width: 80px; color: white; height: 28px; font-size: 11px; border-radius: 3px; text-align: center;">동영상추가</button>
					</div>
					</form>
				</div>
	
			<!-- 왼쪽 게시글들 -->
			<div id="listDuogramBody"></div>
		</div>
	</div>
	<!-- /왼쪽 게시글들 -->
	
	<!-- 오른쪽 커뮤니티? -->
	<div style="background: white;">
	<div style="marign-left: 10px; width: 293px; float: right;">

    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid #dddfe2; float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			친구생일 
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid #dddfe2; float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			예약일정
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid #dddfe2; float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			나의 커뮤니티
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid #dddfe2; float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			인기 커뮤니티
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <!-- 기업..내용? -->
    <div style="width: 293px; padding: 5px; float: right; color: #ccc; font-family: '나눔고딕'; font-size: 11px; align: center">
			<span>대표이사: 곽규혁</span>
			<span>사업자등록번호 000-00-000000</span>
			<br>
			<span>주소: 서울특별시 강남구 테헤란로14길 6 남도일빌딩</span>
			<br>
    		
    </div>
    <div style="margin-bottom: 20px; border-top: 1px solid #dddfe2; width: 293px; padding-left: 5px; padding-right: 5px; padding-top: 2px; float: right; color: #ccc; font-size: 11px;">
    	<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 회사 소개 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 정책 및 약관 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 제휴제안 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 이용약관 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 개인정보취급방침 </a></span>
		<span>|</span>
		<span><a href="#" style="text-decoration:none; color: #8a8a8a; font-family: '나눔고딕';"> 고객센터 </a></span>
    	ⓒ 2017 DUOGRAM
    </div>
    <!-- /오른쪽 커뮤니티? -->
</div>
</div>
</div>
<!-- right -->
<!-- /mid -->

</body>
</html>