<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="<%=cp%>/resource/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />

<link rel="stylesheet" href="<%=cp%>/resource/css/style.css"
	type="text/css" />
<link rel="stylesheet" href="<%=cp%>/resource/css/layout.css"
	type="text/css" />


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
	
	var q="content="+encodeURIComponent(content);
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

//글 수정
$(function(){
	$("body").on("click", ".updateModalBtn1", function(){
		var num = $(this).attr("data-num");
		var page = $(this).attr("data-page");
		var content=$(this).next("span").html();
		
		var f=document.duogramUpdateForm;
		f.num.value=num;
		f.content.value=content;
		f.page.value=page;
		
		$("#updateModelDlg1").modal("show");
			
	});
});

function updateBoard() {
	var f=document.duogramUpdateForm;
	f.action="<%=cp%>/duogram/update";
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

function listPage(page) {
	var url="<%=cp%>/duogram/list";
	
	// json으로 넘겨 받음
	$.post(url, {pageNo:page}, function(data){
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

	var content=$.trim($("#replyContent").val());
	if(! content){
		$("#replyContent").focus();
		return;
	}
	
	var q="content="+encodeURIComponent(content);
	q+="&num="+num;
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
	var url="<%=cp%>/duogram/countLikeBoard";
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
		,url:"<%=cp%>/duogram/insertLikeBoard"
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
//타임라인 글 리스트
function printDuogram(data) {
	var me="${me}";
	var uid="${sessionScope.user.memberNum}";
	var dataCount=data.dataCount;
	var page=pageNo;
	var replyCount="${replyCount}";
	var friendNum="${friendNum}";
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
			var friendNum=data.list[idx].friendNum;
			
			out+="<div style='min-height: 220px; margin-bottom: 30px; width: 614px; border: 1px solid #dddfe2; float:left; background-color: white; border-radius: 3px;'>";
			out+="<div style='height: 40px; padding-left: 15px; padding-right: 15px; font-weight: bold; font-size: 16px;'>";
			out+="<div style='margin-top: 10px;'>";
			out+="<div style='float: left; margin-right: 8px; max-width: 43px; overflow: hidden; border-radius: 21.5px; max-height: 43px; bottom: 50px'>";
			out+="<a href='<%=cp%>/duogram/"+memberNum+"' style='text-decoration:none; color: black;'>";
			if(memberNum=="4")
				out+="<img style='margin-top: -10px; width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/4/4p.jpg'>";
				if(memberNum=="5")
					out+="<img style='margin-top: -10px; width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/5/5p.jpg'>";
					if(memberNum=="6")
						out+="<img style='margin-top: -10px; width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/6/6p.jpg'>";
						if(memberNum=="7")
							out+="<img style='margin-top: -10px; width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/7/7p.jpg'>";
							if(memberNum=="8")
								out+="<img style='margin-top: -10px; width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/8/8p.jpg'>";
								if(memberNum=="11")
									out+="<img style='margin-top: -10px; width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/11/11p.jpg'>";
									if(memberNum=="13")
										out+="<img style='margin-top: -10px; width: 100%; height: 100%; vertical-align: middle;' src='<%=cp%>/resource/images/duogram/13/13p.jpg'>";
										
			out+="</a>";
			out+="</div>";
			out+="<div style='float:left;'>";
			out+="<a href='<%=cp%>/duogram/"+memberNum+"' style='font-size: 16px; text-decoration:none; font-family: '나눔고딕';'>"+name+"</a>";
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
			
				out+="<li style='margin-left: 20px; height: 20px;'><button type='button' onclick='insFReq("+friendNum+")' tabindex='-1''>친구추가</button>";
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
			out+="<textarea id='replyContent' class='boxTA' type='text' style='border: 1px solid #ccc; margin-top: 17px; width: 490px; height: 50px; font-family: '나눔고딕';' placeholder='　댓글 달기'></textarea>";
			out+="<button type='button' class='btn btn-primary btn-sm bbtn' onclick='sendReply("+num+");' style='float: right; margin-top: 17px; color: white; width: 80px; height: 28px;'>댓글 달기";
			out+="</div>";
			out+="<div id='listReplyLayout"+num+"' style='display: none; margin-bottom: 15px;'></div>"
			out+="</div>";
		}
		$("#listDuogramBody").append(out);
	}
}


//댓글창 숨기기
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

//글 삭제
function deleteBoard(num, page) {
	  var query = "num="+num+"&page="+page;

	  var url = "<%=cp%>/duogram/delete?" + query;
	
	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
}

function listReplyMethod(num){
	var url="<%=cp%>/duogram/listReply";
		var q = "num=" + num;
		$.ajax({
			type : "post",
			url : url,
			data : q,
			success : function(a) {
				$("#listReplyLayout" + num).html(a);
			},
			brforeSend : function(e) {
				e.setRequestHeader("AJAX", true);
			}
		});
	}
</script>

</head>
<body
	style="margin: 0px; height: 100%; width: 100%; background: #fafafa;">

	<!-- 윗칸 띄우기 -->
	<div style="height: 180px"></div>

	<!-- left -->
	<!-- mid -->
	<div>
		<div style="width: 935px; margin: auto;">
			<div style="width: 627px;">
				<!-- 왼쪽 글쓰는곳 -->
				<div class="wrap" style="width: 614px; float: left;">
					<div style="margin-bottom: 60px; width: 614px; border: 1px solid #dddfe2; background-color: white; border-radius: 4px;">
						<!-- 게시글 등록 및 동영상 추가 -->
						<form name="boardForm" method="post" enctype="multipart/form-data">
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
			<div style="width: 308px; float: right;">

				<div
					style="width: 293px; padding: 10px; height: 65px; border-bottom: 1px solid #dddfe2; float: right; margin-bottom: 20px">
					<div
						style="overflow: hidden; float: left; border-radius: 22.5px; max-width: 45px; max-height: 45px;">
						<a href="<%=cp%>/duogram/${sessionScope.user.memberNum}">
							<img style="width: 100%; height: 100%; vertical-align: middle;"
							src="<%=cp%>/resource/images/duogram/5/5p.jpg">
						</a>
					</div>
					
				
				

				<c:if test="${memberNum==5}">
				<div style="padding-top: -10px; padding-left: 10px; display: table-cell; color: #999; font-size: 13px; font-family: '나눔고딕';">김종기</div>
				</c:if>
				<c:if test="${memberNum==4}">
				<div style="padding-top: -10px; padding-left: 10px; display: table-cell; color: #999; font-size: 13px; font-family: '나눔고딕';">박가람</div>
				</c:if>
				<c:if test="${memberNum==6}">
				<div style="padding-top: -10px; padding-left: 10px; display: table-cell; color: #999; font-size: 13px; font-family: '나눔고딕';">김동현</div>
				</c:if>
				<c:if test="${memberNum==7}">
				<div style="padding-top: -10px; padding-left: 10px; display: table-cell; color: #999; font-size: 13px; font-family: '나눔고딕';">숭열</div>
				</c:if>
				<c:if test="${memberNum==8}">
				<div style="padding-top: -10px; padding-left: 10px; display: table-cell; color: #999; font-size: 13px; font-family: '나눔고딕';">김재원</div>
				</c:if>
				<c:if test="${memberNum==11}">
				<div style="padding-top: -10px; padding-left: 10px; display: table-cell; color: #999; font-size: 13px; font-family: '나눔고딕';">곽규혁</div>
				</c:if>
				<c:if test="${memberNum==13}">
				<div style="padding-top: -10px; padding-left: 10px; display: table-cell; color: #999; font-size: 13px; font-family: '나눔고딕';">권예리</div>
				</c:if>

				</div>

				<div
					style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0, 0, 0, .0975); float: right; margin-bottom: 20px">
					<div
						style="font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
						친구생일 <a href="#"><img
							src="<%=cp%>/resource/images/duogram/gear.PNG"
							style="width: 15px; height: 15px;"></a>
							<br>
			박가람 2월 16일
			<br> 
			윤숭열 6월 12일
					</div>
					</div>

				<div
					style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0, 0, 0, .0975); float: right; margin-bottom: 20px">
					<div
						style="font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
						예약일정 <a href="#"><img
							src="<%=cp%>/resource/images/duogram/gear.PNG"
							style="width: 15px; height: 15px;"></a>
							<br>
			2018-1-15 ~ 2018-2-15
					</div>
				</div>

				<div
					style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0, 0, 0, .0975); float: right; margin-bottom: 20px">
					<div
						style="font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
						나의 커뮤니티 <a href="#"><img
							src="<%=cp%>/resource/images/duogram/gear.PNG"
							style="width: 15px; height: 15px;"></a>
							<br>
			자바 웹 개발
			<br>
			자바스크립트 제이쿼리
					</div>
				</div>

				<div
					style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0, 0, 0, .0975); float: right; margin-bottom: 20px">
					<div
						style="font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
						인기 커뮤니티 <a href="#"><img
							src="<%=cp%>/resource/images/duogram/gear.PNG"
							style="width: 15px; height: 15px;"></a>
							<br>
			듀오 그램
			<br>
			질문에 답해드립니다
			<br>
			스프링에 대해서 알고싶다
					</div>
				</div>

				<!-- 기업..내용? -->
				<div
					style="width: 293px; padding: 5px; float: right; color: #ccc; font-family: '나눔고딕'; font-size: 11px; align: center">
					<span>대표이사: 곽규혁</span> <span>사업자등록번호 000-00-000000</span> <br>
					<span>주소: 서울특별시 강남구 테헤란로14길 6 남도일빌딩</span> <br>

				</div>
				<div
					style="border-top: 1px solid rgba(0, 0, 0, .0975); width: 293px; padding-left: 5px; padding-right: 5px; padding-top: 2px; float: right; color: #ccc; font-size: 11px;">
					<span><a href="#"
						style="text-decoration: none; color: #8a8a8a; font-family: '나눔고딕';">
							회사 소개 </a></span> <span>|</span> <span><a href="#"
						style="text-decoration: none; color: #8a8a8a; font-family: '나눔고딕';">
							정책 및 약관 </a></span> <span>|</span> <span><a href="#"
						style="text-decoration: none; color: #8a8a8a; font-family: '나눔고딕';">
							제휴제안 </a></span> <span>|</span> <span><a href="#"
						style="text-decoration: none; color: #8a8a8a; font-family: '나눔고딕';">
							이용약관 </a></span> <span>|</span> <span><a href="#"
						style="text-decoration: none; color: #8a8a8a; font-family: '나눔고딕';">
							개인정보취급방침 </a></span> <span>|</span> <span><a href="#"
						style="text-decoration: none; color: #8a8a8a; font-family: '나눔고딕';">
							고객센터 </a></span> ⓒ 2017 DUOGRAM
				</div>
				<!-- /오른쪽 커뮤니티? -->
			</div>
		</div>
	</div>
	<!-- right -->

	<!-- /mid -->
	<!-- 수정창 -->
	<div class="modal fade worp" id="updateModelDlg1">
		<div class="wrap"
			style="width: 614px; position: fixed; top: 300px; left: 650px;">
			<div
				style="margin-bottom: 60px; width: 614px; border: 1px solid #dddfe2; background-color: white; border-radius: 4px;">
				<!-- 게시글 등록 및 동영상 추가 -->
				<form name="duogramUpdateForm" method="post">
					<div
						style="height: 40px; padding: 5px; background: #f6f7f9; border-bottom: 3px solid #dddfe2;">
						<div align="left" class="duo_01"
							style="margin-left: 5px; color: black; margin-right: 5px; padding-bottom: 10px; padding-top: 5px; font-size: 14px; font-weight: bold; font-family: '나눔고딕';">
							게시물 수정
							<button type="button" style="float: right; color: gray;"
								data-dismiss="modal">×</button>
						</div>
					</div>

					<!-- 내용 입력 -->
					<div style="margin-top: 10px; margin-bottom: 10px;">
						<textarea
							style="border: none; resize: none; width: 584px; height: 60px; font-family: '나눔고딕';"
							placeholder="내용을 입력해주세요." name="content" id="content"></textarea>
					</div>

					<!-- 첨부파일 -->
					<div style="border-top: 1px solid #ccc; margin-bottom: 10px;"></div>
					<div style="height: 40px; padding-left: 15px; padding-right: 15px;">
						<a href="#">
							<button type="button"
								style="border-radius: 4px; border: 1px solid #dddfe2; width: 250px; height: 28px; text-decoration: none; color: black">첨부파일</button>
						</a> <input type="hidden" name="num"> <input type="hidden"
							name="page">
						<!-- 글 및 동영상 등록 -->
						<button type="button" class="btn pull-right"
							onclick="updateBoard();"
							style="border: 2px solid #172A40; background: #172A40; width: 80px; color: white; height: 28px; font-size: 11px; border-radius: 3px; margin-left: 8px; text-align: center;">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>