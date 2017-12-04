<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
function dialogLogin() {
    $("#modalUserId").val("");
    $("#modalUserPwd").val("");
	$("#modalLogin").modal("show");	
    $("#modalUserId").focus();

}
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form,body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
	   
	   $(".submenu").children("li").on("mouseover", function(){
		  $(this).children().css("background-color", "#D9383A");
	   });
	   $(".submenu").children("li").on("mouseleave", function(){
		  $(this).children().css("background-color", "#172A40");
	   });
});

function modalSendLogin() {
	var f=document.modalLoginForm;
	
    if(!f.userId.value) {
    	f.userId.focus();
    	return false;
    }	

    if(!f.userPwd.value) {
    	f.userPwd.focus();
    	return false;
    }	

   f.action="<%=cp%>/member/login";
		f.submit();
	}
</script>
<style type="text/css">
.header-login a {
	text-decoration:none;
	letter-spacing: -.06em;
    color: #172A40!important;
    font-weight: 700;
	margin: 0px 5px;
}
.header-login a:hover{
	color: #D9383A!important;
}

.navbar-nav a {
	font-size: 14px;
}

.dropdownmenu ul, .dropdownmenu li {
	margin: 0;
	padding: 0;
}
.dropdownmenu ul {
	list-style: none;
	width: 100%;
}
.dropdownmenu li {
	color: #D9383A;
	float: left;
	position: relative;
	width:auto;
}
.dropdownmenu a {
	background: #172A40;
	color: #FFFFFF;
	display: block;
	font: bold 16px/20px sans-serif;
	padding: 30px 25px;
	text-align: center;
	text-decoration: none;
	-webkit-transition: all .25s ease;
	-moz-transition: all .25s ease;
	-ms-transition: all .25s ease;
	-o-transition: all .25s ease;
	transition: all .25s ease;
}
.submenu {
	left: 0;
	opacity: 0;
	position: absolute;
	top: 35px;
	visibility: hidden;
	z-index: 1;
}
li:hover ul.submenu {
	opacity: 1;
	top: 0px;	/* adjust this as per top nav padding top & bottom comes */
	visibility: visible;
}
.submenu li {
	float: none;
	width: 100%;
}
.submenu a:hover {
	background: #D9383A;
}
.header-login a{
	font-size: 14px;
	color: #172A40; 
}

</style>
<div class="container">
	<div class="container-fluid" style="padding:0px 0px 2% 0px;">
		<div id="page-header" style="margin: 1% 0px; min-height: 20px;">
			<div class="clear">
				<div class="header-login">
					<a href="<%=cp%>/community">커뮤니티</a>
					<c:if test="${sessionScope.member.userId=='admin'}">
					</c:if>
					<c:if test="${empty sessionScope.member}">
						<a href="javascript:dialogLogin();"> 로그인</a>
						<i></i>
						<a href="#">
							회원가입</a>
					</c:if>
					<c:if test="${not empty sessionScope.member}">
						<span style="color: #D9383A;">${sessionScope.member.userName}</span>님 <i></i>
						<a href="#"> 로그아웃</a>
						<a href="#"> 마이 페이지</a>
					</c:if>
					<a href="<%=cp%>/admin">관리자</a>
				</div>
			</div>
		</div>
		<nav class="dropdownmenu" style="height: 100%;margin-top:1%;">
			<ul class="drop_menu">
				<li><a href="<%=cp%>/space_main" style="font-family:Airways; font-size:35px; font-weight: normal; ">Duo Space</a></li>
				<li><a href="<%=cp%>/space_company">회사 소개</a></li>
				<li><a href="#">&nbsp;&nbsp;Duo Space&nbsp;&nbsp;</a>
					<ul class="submenu">
						<li><a href="#">지점 리스트</a></li>
					</ul>
				</li>
				<li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<ul class="submenu">
						<li><a href="#">룸 예약</a></li>
						<li><a href="<%=cp%>/reserve">좌석 예약</a></li>
					</ul>
				</li>
				<li><a href="#">Core/Cafe</a>
					<ul class="submenu">
						<li><a href="#">Cafe메뉴</a></li>
					</ul>
				</li>
				<li><a href="#">도서 대여</a>
					<ul class="submenu">
						<li><a href="#">도서 검색</a></li>
					</ul>
				</li>
				<li><a href="<%=cp%>/review">이용 후기 게시판</a></li>
				<li><a href="#">고객 센터</a>
					<ul class="submenu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">1:1문의</a></li>
					</ul>
				</li>
			</ul>
		</nav>

	</div>
</div>


<div id="modalLogin" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h2 id="myModalLabel" class="modal-title text-center fc-orange"
					style="font-family: sans-serif, 나눔고딕, 맑은 고딕; font-weight: bold;">LOG
					IN</h2>
			</div>
			<div class="modal-body">
				<form name="modalLoginForm" method="post">
					<div class="form-group">
						<label class="control-label" for="modalUserId">아이디</label> <input
							class="form-control" id="modalUserId" name="userId" type="text"
							style="box-shadow: none; background: white;" placeholder="아이디">
					</div>
					<div class="form-group">
						<label class="control-label" for="modalUserPwd">패스워드</label> <input
							class="form-control" id="modalUserPwd" name="userPwd"
							type="password" style="box-shadow: none; background: white;"
							placeholder="패스워드">
					</div>

					<div class="form-group">
						<button class="btn btn-lg btn-primary btn-block" type="button"
							style="color: white; background: black; float: left;"
							onclick="modalSendLogin();">
							로그인 <span class="glyphicon glyphicon-ok"></span>
						</button>
					</div>
					<a> </a>
					<div style="text-align: center;">
						<button type="button" style="background: #eaeaea;"
							class="btn btn-link"
							onclick="location.href='<%=cp%>/member/member';">회원가입</button>
						<button type="button" style="background: #eaeaea;"
							class="btn btn-link">아이디찾기</button>
						<button type="button" style="background: #eaeaea;"
							class="btn btn-link">패스워드찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>