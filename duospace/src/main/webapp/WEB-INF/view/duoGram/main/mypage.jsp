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

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.form.js"></script>

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
	userLoad();
	listPage(1);
});

function userLoad() {
	var blogNum="${blogNum}";
	var q="blogNum="+blogNum;
	
	var url="<%=cp%>/duogram/mypage/readuser";
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			$("#rightName").html(data.name);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

// 글쓰기
function sendBoard() {
	var uid="${sessionScope.user.memberNum}";
	if(!uid){
		location.href="<%=cp%>/member/login";
		return;
	} 
	// 공백이 있으면 다시 채팅창 깜빡이
	var content=$.trim($("#content").val());
	if(! content) {
		$("#content").focus();
		return;
	}
	
	
	var f=document.myPageForm;
	f.answer.value=0;

	var q = new FormData(f);
	var url="<%=cp%>/duogram/mypage/insert";
	
	
	$.ajax({
		type:"post"
		,url:url
        ,processData: false  // file 전송시 필수
        ,contentType: false  // file 전송시 필수
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

// 글 수정
$(function(){
	$("body").on("click", ".updateModalBtn", function(){
		var num = $(this).attr("data-num");
		var page = $(this).attr("data-page");
		var saveFilename = $(this).attr("data-saveFilename");
		var content=$(this).next("span").html();
		
		var f=document.mypageUpdateForm;
		f.num.value=num;
		f.content.value=content;
		f.page.value=page;
		f.saveFilename.value=saveFilename;
		
		$("#updateModelDlg").modal("show");	
	});
});

function updateBoard() {
	var f=document.mypageUpdateForm;
	f.action="<%=cp%>/duogram/mypage/update";
	f.submit();
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
	var url="<%=cp%>/duogram/mypage/list";
	var blogNum="${blogNum}";
	
	// json으로 넘겨 받음
	$.post(url, {pageNo:page, blogNum:blogNum}, function(data){
		printDuogram(data);
	}, "json");
}

//답글달기
function sendReply(num) {
	var uid="${sessionScope.user.memberNum}";
	if(! uid) {
		location.href='<%=cp%>/member/login';
		return;
	}

	var content=$.trim($("#replyContent1").val());
	if(! content){
		$("#replyContent1").focus();
		return;
	}

	var blogNum="${blogNum}";
	var q="content="+encodeURIComponent(content)+"&blogNum="+blogNum+"&num="+num;
	
	var url="<%=cp%>/duogram/mypage/insertReply";
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			var s=data.state;

			$("#replyContent1").val("");
			
			$("#listReplyLayout"+num).show();
			listReplyMethod(num);
			
			$("#listDuogramBody").empty();
			pageNo=1;
			listPage(1);
		}
		,error:function(e){
			console.log(e.responseText);
		}	
	});
}


//게시물 공감 개수
function countLikeBoard(num) {
	var url="<%=cp%>/duogram/mypage/countLikeBoard";
	$.post(url, {num:num}, function(data){
		var count=data.countLikeBoard;
		
		$("#countLikeBoard").html(count);
	}, "json");
}

//게시물 공감 추가
function sendLikeBoard(num) {
	var uid="${sessionScope.user.memberNum}";
	if(! uid) {
		login();
		return;
	}

	msg="게시물에 공감하십니까 ?";
	if(! confirm(msg))
		return;
	
	var query="num="+num;

	$.ajax({
		type:"post"
		,url:"<%=cp%>/duogram/mypage/insertLikeBoard"
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				countLikeBoard(num);
			} else if(state=="false") {
				alert("좋아요는 한번만 가능합니다.");
			} else if(state=="loginFail") {
				login();
			}
		}
		,error:function(e) {
			console.log(e.responseText);
		}
	});
}

// 타임라인 글 리스트
function printDuogram(data) {
	var me="${me}";
	var uid="${sessionScope.user.memberNum}";
	var dataCount=data.dataCount;
	var page=pageNo;
	var replyCount="${replyCount}";
	var countLikeBoard="${countLikeBoard}";
	totalPage=data.total_page;
	
	var out="";
	if(dataCount!=0) { 
		for(var idx=0; idx<data.list.length; idx++) {
			var num=data.list[idx].num;
			var memberNum=data.list[idx].memberNum;
			var content=data.list[idx].content;
			var created=data.list[idx].created;
			var name=data.list[idx].name;
			var replyCount=data.list[idx].replyCount;
			var saveFilename=data.list[idx].saveFilename;
			var countLikeBoard=data.list[idx].countLikeBoard;
			var blogNum=data.list[idx].blogNum;
			
			out+="<div style='min-height: 220px; margin-bottom: 30px; width: 614px; border: 1px solid #dddfe2; float:left; background-color: white; border-radius: 3px;'>";
			out+="<div style='height: 40px; padding-left: 15px; padding-right: 15px; font-weight: bold; font-size: 16px;'>";
			out+="<div style='margin-top: 10px;'>";
			out+="<div style='float: left; margin-right: 8px; max-width: 43px; overflow: hidden; border-radius: 21.5px; max-height: 43px; bottom: 50px'>";
			out+="<a href='' style='text-decoration:none; color: black;'>";
			out+="<img style='width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/dong.png'>";
			out+="</a>";
			out+="</div>";
			out+="<div style='float:left;'>";
			out+="<a href='' style='font-size: 16px; text-decoration:none; font-family: '나눔고딕';'>"+name+"</a>";
			if(memberNum!=blogNum)
				out+=" → "+"<a href='' style='font-size: 16px; text-decoration:none; font-family: '나눔고딕';'>"+blogNum+"</a>";
			out+="</div>";
			out+="<br>";
			out+="<div style='float:left; height: 23px; padding-top: 5px; font-size: 12px; color: #ccc;'>"+created+"</a></div>";
			out+="<div class='dropdown' style='float:right;'>";
			out+="<button aria-expanded='true' data-toggle='dropdown'type='button'>";			
			out+="<span><img src='<%=cp%>/resource/images/duogram/dot.PNG' style='width: 12px; height: 3px;'></span>";
			out+="</button>"
			out+="<ul class='dropdown-menu'>";
			if(uid==memberNum || uid=="1" || uid=="true")
				out+="<li style='border-bottom: 1px solid #ccc; margin-left: 20px; height: 20px;'><button class='button updateModalBtn' data-saveFilename='"+saveFilename+"' data-num='"+num+"' page='"+page+"' tabindex='-1'>수정</button><span style='display:none;'>"+content+"</span>";
			else
				out+="<li style='border-bottom: 1px solid #ccc; margin-left: 20px; height: 20px;'><button class='button' tabindex='-1' style='color:#aaaaaa;'>수정</button>";
			if(uid==memberNum || uid=="1" || uid=="true")
				out+="<li style='margin-left: 20px; height: 20px;'><button onclick='deleteBoard("+num+","+page+");' type='button' tabindex='-1'>삭제</button>";
			else
				out+="<li style='margin-left: 20px; height: 20px;'><button type='button' tabindex='-1' style='color:#aaaaaa;'>삭제</button>";
			out+="</div>";
			out+="</div>";
			out+="</div>";
			out+="<div style='border-top: 1px solid #ccc; margin-bottom: 10px; margin-top: 10px;max-width:100%;height: 100%;overflow: hidden;'>";
			if(saveFilename!=null)
				out+="<img style='width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/uploads/duogram/"+saveFilename+"'>";
			out+="</div>";
			out+="<div style='padding-left: 15px; padding-right: 15px;'>";
			out+="</div>";
			out+="<div class='mypageContent' style='padding-top: 10px; margin-left: 15px; margin-right: 15px; margin-bottom: 15px; width: 584px; font-weight: normal; font-size: 15px; line-height: 1.5em;'>"+content+"</div>";
			out+="<div style='margin: 20px'></div>";
			
			out+="<div style='width: 614px; height: 20px; margin-bottom: 20px;'>";
			out+="<div style='float: left; height: 23px; font-size: 14px; padding-top: 7px; padding-left: 15px;'>";
			out+="<button type='button' onclick='sendLikeBoard("+num+")' style='text-decoration:none; color: rgb(51, 122, 183);font-weight: bold; font-family: '나눔고딕';'>"+"좋아요 "+"<span id='countLikeBoard'>"+countLikeBoard+"개 "+"</span></button>";
			
			out+="</div>";
			out+="<div style='float: left; height: 23px; font-size: 14px; padding-top: 7px; padding-left: 5px;'>";
			out+="<button class='button btnReplyLayout' type='button' style='border:none; font-weight: blod; font-family: '나눔고딕';' data-num='"+num+"'>"+"댓글 "+replyCount+"개"+"</button>";
			out+="</div>";
			out+="</div>";
			
			out+="<div style='margin-bottom: 20px; margin-left: 15px; margin-right: 15px; border-top: 1px solid #dddfe2;'>";
			out+="<textarea id='replyContent1' class='boxTA' type='text' style='border: 1px solid #ccc; margin-top: 17px; width: 490px; height: 50px; font-family: '나눔고딕';' placeholder='　댓글 달기'></textarea>";
			out+="<button type='button' class='btn btn-primary btn-sm bbtn' onclick='sendReply("+num+");' style='float: right; margin-top: 17px; color: white; width: 80px; height: 28px;'>댓글 달기";
			out+="</div>";
			out+="<div id='listReplyLayout"+num+"' style='display: none; margin-bottom: 15px;'></div>"
			out+="</div>";
		}
		$("#listDuogramBody").append(out);
	}
}

// 댓글창 숨기기
$(function(){
	$("body").on("click", ".btnReplyLayout", function(){
		var num = $(this).attr("data-num");
		var isVisible = $("#listReplyLayout"+num).is(":visible");
		
		if(isVisible) {
			$("#listReplyLayout"+num).hide();
		} else {
			$("#listReplyLayout"+num).show();
			
			listReplyMethod(num);
		}
			
	});
});

// 글 삭제
function deleteBoard(num, page) {
	  var blogNum="${blogNum}";
	  var query = "num="+num+"&blogNum="+blogNum+"&page="+page;

	  var url = "<%=cp%>/duogram/mypage/delete?" + query;
	
	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
}

function listReplyMethod(num){
	var url="<%=cp%>/duogram/mypage/listReply";
	// var blogNum="${blogNum}";
	
	var q="num="+num;
	$.ajax
	({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#listReplyLayout"+num).html(a);
		}
		,brforeSend : function(e) {
			e.setRequestHeader("AJAX", true);
		}
	});
}
function deleteReply(replyNum, page) {
	if(! confirm("답글을 삭제하시겠습니까?"))
		return;
	var url="<%=cp%>/duogram/mypage/deleteReply";
	// AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:{replyNum:replyNum}
		,dataType:"json"
		,success:function(data) {
			var s=data.state;
			if(s=="loginFail") {
				location.href="<%=cp%>/member/login";
				return;
			}
			listPage(page);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
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
				<form name="myPageForm" method="post" enctype="multipart/form-data">
				<div style="height: 30px; background: #172A40; border-bottom: 1px solid #dddfe2;">
					<div align="left" class="duo_01" style="margin-left: 15px; color: white; margin-right: 15px; padding-bottom: 10px; padding-top: 5px; font-size: 14px; font-weight: bold; font-family: '나눔고딕';">글쓰기
					</div>
				</div>
				
				<!-- 내용 입력 -->
				<div style="margin-top: 10px; margin-bottom: 10px;">
					<textarea style="border:none; resize: none; width: 584px; height: 60px; font-family: '나눔고딕';" placeholder="내용을 입력해주세요." id="content" name="content"></textarea>
				</div>
				
				<!-- 첨부파일 -->
				<div style="border-top: 1px solid #ccc; margin-bottom: 10px; margin-left: 15px; margin-right: 15px;"></div>
					<div style="height: 40px; padding-left: 15px; padding-right: 15px;">
					<input type="file" name="upload" class="form-control input-sm" style="float: left; height: 30px; width: 250px;">
					<input type="hidden" name="blogNum" value="${blogNum}">
					<input type="hidden" name="answer" value="0">
						<!-- 글 등록 -->
						<button type="button" class="btn btn-primary btn-sm bbtn" onclick="sendBoard();" style="float: right; width: 80px; color: white; height: 28px; font-size: 11px; margin-left: 8px; text-align: center;">등록하기</button>
					</div>
				</form>
			</div>
	
			<!-- 왼쪽 게시글들 -->
			<div id="listDuogramBody"></div>
		</div>
	</div>
	<!-- /왼쪽 게시글들 -->
	
	<!-- 오른쪽 커뮤니티? -->

	<!-- 프로필 사진 -->
		<div style="margin-right: 34px; top: 65px; position: relative; z-index: 1; float: right; margin-top: -230px; width: 220px;">
		<div style="border-radius: 105px; max-width: 210px; height: 210px; border: 1px solid #dddfe2; background:white; border: 1px solid auto">
			<div style="overflow: hidden; border-radius: 102.5px; background: #ccc; margin-left: 2.4px; margin-top: 2.4px; max-width: 205px; max-height: 205px;">
				<img style="width: 100%; height: 100%; vertical-align: middle;" src="<%=cp%>/resource/images/duogram/dong.png">
			</div>
		</div>
		</div>
	
	<!-- 자기소개 -->
	<div style="width: 293px; text-align:center; float: right; background: white; border-radius: 4px; padding: 10px; margin-bottom: 20px; padding-top: 80px; border: 1px solid #dddfe2">
		<div style="width: 273px;text-decoration: none; font-weight: bold; font-size: 22px; color: #23527c;" id="rightName"></div>
		<div style="width: 273px; padding-top: 8px; font-weight: bold; padding-bottom: 5px; font-size: 15px; border-bottom: 1px solid #ccc;">미미쨩♥</div>
		<div style="width: 273px; padding-top: 8px; font-size: 14px; padding-bottom: 10px">나는 미미쨩을 너무너무 사랑한다능 으흐흐 낄낄 꺆꺆</div>
	</div>
	
	<div style="border: 1px solid #dddfe2; marign-left: 10px; width: 293px; float: right; background: white; border-radius: 4px;">

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
    <div style="width: 293px; padding: 10px; float: right; color: #ccc; font-family: '나눔고딕'; font-size: 11px; align: center">
			<span>대표이사: 곽규혁</span>
			<span>사업자등록번호 000-00-000000</span>
			<br>
			<span>주소: 서울특별시 강남구 테헤란로14길 6 남도일빌딩</span>
			<br>
			
    </div>
    <div style="padding-left: 10px; margin-bottom: 10px; border-top: 1px solid #dddfe2; width: 293px; padding-right: 10px; padding-top: 2px; float: right; color: #ccc; font-size: 11px;">
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
<!-- right -->
<!-- /mid -->

<!-- 수정창 -->
<div class="modal fade worp" id="updateModelDlg">
  <div class="wrap" style="width: 614px; position: fixed; top: 300px; left: 650px;">
		<div style="margin-bottom: 60px; width: 614px; border: 1px solid #dddfe2; background-color: white; border-radius: 4px;">
			<!-- 게시글 등록 및 동영상 추가 -->
			<form name="mypageUpdateForm" method="post" enctype="multipart/form-data">
				<div style="height: 40px; padding: 5px; background: #f6f7f9; border-bottom: 3px solid #dddfe2;">
					<div align="left" class="duo_01" style="margin-left: 5px; color: black; margin-right: 5px; padding-bottom: 10px; padding-top: 5px; font-size: 14px; font-weight: bold; font-family: '나눔고딕';">
					게시물 수정
						<button type="button" style="float: right; color: gray;" data-dismiss="modal">×</button>
					</div>
				</div>
				
				<!-- 내용 입력 -->
				<div style="margin-top: 10px; margin-bottom: 10px;">
					<textarea style="border:none; resize: none; width: 584px; height: 60px; font-family: '나눔고딕';" placeholder="내용을 입력해주세요." name="content" id="content"></textarea>
				</div>
				<!-- 첨부파일 -->
				<div style="border-top: 1px solid #ccc; margin-bottom: 10px;"></div>
				<div style="height: 40px; padding-left: 15px; padding-right: 15px;">
					<input type="file" name="upload" class="form-control input-sm" style="float: left; height: 30px; width: 250px;">
					<input type="hidden" name="num">
					<input type="hidden" name="page">
					<input type="hidden" name="saveFilename">
					<input type="hidden" name="blogNum" value="${blogNum}">
					<!-- 글 및 동영상 등록 -->
					<button type="button" class="btn btn-primary btn-sm bbtn" onclick="updateBoard();" style="float: right; width: 80px; color: white; height: 28px; font-size: 11px; margin-left: 8px; text-align: center;">등록하기</button>
				</div>
			</form>
		</div>
  </div>
</div>

</body>
</html>