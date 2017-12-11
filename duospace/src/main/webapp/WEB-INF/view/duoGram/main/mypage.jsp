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
			
			out+="<div style='min-height: 220px; margin-bottom: 80px; width: 614px; border: 1px solid rgba(0,0,0,.0975); float:left; background-color: white; border-radius: 3px;'>";
			out+="<div style='height: 30px; padding-left: 15px; padding-right: 15px; margin-top:20px; font-weight: bold; font-size: 16px;'>";
			out+="<div style='margin-top: 5px;'>";
			out+="<div style='float: left;margin-right: 8px;'>";
			out+="<a href='#' style='text-decoration:none; color: black;'>";
			out+="<img src='#' style='font-family: '나눔고딕';'>";
			out+="</a>";
			out+="</div>";
			out+="<div style='float:left;'><a href='#' style='text-decoration:none; color: black; font-family: '나눔고딕';'>"+name+"</a></div>";
			out+="<div style='float:right;'><a href='#' style='text-decoration:none; color: #ccc; font-family: '나눔고딕';'>";
			out+="<img src='<%=cp%>/resource/images/duogram/dot.PNG' style='width: 12px; height: 3px;'></a>";
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
			out+="<div style='float: left; height: 23px; color: #ccc; padding-top: 7px; padding-left: 15px; font-family: '나눔고딕'; font-size: 12px'>"+created+"</div>";
			out+="<div style='float: right; height: 23px; font-size: 14px; padding-top: 7px; padding-right: 15px;'>";
			out+="<a href='#' style='text-decoration:none; color: #999; font-weight: blod; font-family: '나눔고딕';'>"+"댓글x개"+"</a>";
			out+="</div>";
			out+="<div style='float: right; height: 23px; font-size: 14px; padding-top: 7px; padding-right: 5px;'>";
			out+="<a href='#' style='text-decoration:none; font-weight: bold; font-family: '나눔고딕';'>"+"좋아요x개　"+"</a>";
			out+="</div>";
			out+="<div style='height: 50px; margin-left: 15px; margin-right: 15px; border-top: 1px solid rgba(0,0,0,.0975);'>";
			out+="<input type='text' style='border-radius: 4px; margin-top: 17px; margin-bottom: 7.5px; border: none; width: 584px; height: 25px; font-family: '나눔고딕';' placeholder='　댓글 달기'>";
			out+="</div>";
			out+="</div>";
		}
		$("#listDuogramBody").append(out);
	}	
}

// 답글달기
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
</script>

</head>
<body style="margin: 0px; height: 100%; width: 100%; background: #fafafa;">

<!-- 오른쪽 구석 친구 창 -->
<div style="height: 100%; width: 250px; background: white; border-left: 1px solid #ccc; position: fixed; right: 0px; z-index: 2">
</div>
<!-- 윗칸 띄우기 -->
<div style="height: 110px"></div>

<!-- left -->
<!-- mid -->
<div>
<!-- 마이페이지 프로필 -->
<div style="width: 935px; height: 350px; background: black; margin: auto">
<!-- 커버사진 -->
<div align="center" style="background: black; overflow: hidden; max-width: 935px; max-height: 350px;">
	<img  style="vertical-align: middle" src="<%=cp%>/resource/images/duogram/profile3.jpg">
</div>
<!-- 커버사진이 있을 때 -->
<c:if test="">
<!-- 마이프로필 프사 -->
<div style="border-radius: 4px; position: relative; left: 30px; top: 120px ;border: 1px solid rgba(0,0,0,.0975); padding-top: 200px; width: 160px; height: 160px; background:white; border: 1px solid auto">
	<div style="border-radius: 4px; position: relative; bottom: 250px; background: #ccc; margin: auto; width: 150px; height: 150px; border: 1px solid rgba(0,0,0,.0975);">
	</div>
</div>
<!-- 마이프로필 정보 -->
<div style="position: relative; top: 130px; width: 935px; height: 50px; background: white; border: 1px solid #ccc; margin: auto;">
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">마이페이지</a>
	</div>
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">정보</a>
	</div>
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">친구</a>
	</div>
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">타임라인</a>
	</div>
</div>
</c:if>
<!-- 커버사진이 없을 때 -->
<c:if test="">
<!-- 마이프로필 프사 -->
<div style="border-radius: 4px; position: relative; left: 30px; top: 120px ;border: 1px solid rgba(0,0,0,.0975); padding-top: 200px; width: 160px; height: 160px; background:white; border: 1px solid auto">
	<div style="border-radius: 4px; position: relative; bottom: 250px; background: #ccc; margin: auto; width: 150px; height: 150px; border: 1px solid rgba(0,0,0,.0975);">
	</div>
</div>
<!-- 마이프로필 정보 -->
<div style="position: relative; top: 130px; width: 935px; height: 50px; background: white; border: 1px solid #ccc; margin: auto;">
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">마이페이지</a>
	</div>
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">정보</a>
	</div>
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">친구</a>
	</div>
	<div style="padding-right: 50px; float: right; line-height: 45px; font-size: 15px;">
		<a href="#" style="text-decoration:none;">타임라인</a>
	</div>
</div>
</c:if>
</div>



	<div style="width: 935px; margin: auto;">
	<div style="width: 627px;">
		<div style="height: 60px">
		</div>
		
		
		<!-- 왼쪽 글쓰는곳 -->
		<div class="wrap" style="width: 614px; float: left;">
			<div style="margin-bottom: 60px; width: 614px; border: 1px solid rgba(0,0,0,.0975); background-color: white; border-radius: 4px;">
				<!-- 게시글 등록 및 동영상 추가 -->
				<form name="boardForm" method="post">
				<div style="height: 30px; background: #e9ebee; border-bottom: 1px solid #dddfe2;">
					<div align="left" style="margin-left: 15px; margin-right: 15px; padding-bottom: 10px; padding-top: 5px; font-size: 14px; font-weight: bold; font-family: '나눔고딕';">글쓰기
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
							<button type="button" style="border-radius: 4px; border: 1px solid rgba(0,0,0,.0975); width: 250px; height: 28px; text-decoration:none; color: black">첨부파일</button>
						</a>
						<!-- 글 및 동영상 등록 -->
						<button type="button" class="btn pull-right" onclick="sendBoard();" style="border: 2px solid #ccc; background: #ccc; width: 80px; color: white; height: 28px; font-size: 11px; font-family: '나눔고딕'; border-radius: 3px; margin-left: 8px;"> 등록하기 </button>
						<button type="button" class="btn pull-right" style="border: 2px solid #ccc; background: #ccc; width: 80px; color: white; height: 28px; font-size: 11px; font-family: '나눔고딕'; border-radius: 3px; ">동영상 추가</button>
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
	
	<div style="width: 293px; padding: 10px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">
		<a href="#" style="float: left;">
			<img src="">사진
		</a>
			<div style="display: table-cell; vertical-align: middle">
				<a href="#" style="text-decoration:none; color: black; font-size: 14px; font-family: '나눔고딕';">Hajimemasitda</a>
			</div>
			<div style="display: table-cell; vertical-align: middle; color: #999; font-size: 13px; font-family: '나눔고딕';">김종기</div>
	</div>
	
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			친구생일 
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			예약일정
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
		<div style="height: 30px; font-size: 13px; font-weight: bold; font-family: '나눔고딕'; color: #999">
			나의 커뮤니티
			<a href="#"><img src="<%=cp%>/resource/images/duogram/gear.PNG" style="width: 15px; height: 15px;"></a>
		</div>
    </div>
    
    <div style="width: 293px; padding: 10px; min-height: 50px; border-bottom: 1px solid rgba(0,0,0,.0975); float:right; margin-bottom: 20px">	
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
    <div style="border-top: 1px solid rgba(0,0,0,.0975); width: 293px; padding-left: 5px; padding-right: 5px; padding-top: 2px; float: right; color: #ccc; font-size: 11px;">
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