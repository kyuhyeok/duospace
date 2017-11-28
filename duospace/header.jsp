<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
</script>
<div class="container">
    <div id="page-header">
        <div class="headder-brand"><a href="<%=cp%>/"><span class="logo"><img src="<%=cp%>/resource/images/DuoSpace.PNG"></span></a></div>
         <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="#">공지사항</a></li>
                        <li class="dropdown">
                            <a id="space" data-target="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Duo Space<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="space">
                                <li><a href="#">1 floor Core Cafe</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">2 floor Open Station</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Other</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                        	<a data-target="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">대여 및 구매<span class="caret"></span></a>
                        	<ul class="dropdown-menu">
                                <li><a href="#">사무용품</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">카페주문</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">악세사리</a></li>
                            </ul>
                        </li>
                        <li><a href="#">예약하기</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
        <div class="header-login">
        	<c:if test="${sessionScope.member.userId=='admin'}">
                <a href="#">관리자</a> <i></i>
            </c:if>
            <c:if test="${empty sessionScope.member}">
                <a href="javascript:dialogLogin();"><span class="glyphicon glyphicon-log-in"></span> 로그인</a> <i></i>
                <a href="#"><span class="glyphicon glyphicon-user"></span> 회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
            	<a href="#"><span class="glyphicon glyphicon-home">POS</span></a>
                <span style="color:blue;">${sessionScope.member.userName}</span>님 <i></i>
                <a href="#"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
	            <a href="#"><span class="glyphicon glyphicon-book">마이 페이지</span></a>
            </c:if>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div id="modalLogin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h2 id="myModalLabel" class="modal-title text-center fc-orange" style="font-family: sans-serif,나눔고딕, 맑은 고딕; font-weight: bold;">LOG IN</h2>
			</div>
			<div class="modal-body">
			    <form name="modalLoginForm" method="post">
			         <div class="form-group">
			            <label class="control-label" for="modalUserId">아이디</label>
			            <input class="form-control" id="modalUserId" name="userId" type="text" style="outline=none; box-shadow:none; background:white;" placeholder="아이디">
			        </div>
			         <div class="form-group">
			            <label class="control-label" for="modalUserPwd">패스워드</label>
			            <input class="form-control" id="modalUserPwd" name="userPwd" type="password" style="outline=none; box-shadow:none; background:white;"placeholder="패스워드">
			        </div>
			        
			        <div class="form-group">
			            <button class="btn btn-lg btn-primary btn-block" type="button" style="color:white; background:black; float:left;" onclick="modalSendLogin();">로그인 <span class="glyphicon glyphicon-ok"></span></button>
                    </div>
                  	<a>　</a>
			         <div style="text-align: center;">
			                  <button type="button" style="background:#eaeaea;" class="btn btn-link" onclick="location.href='<%=cp%>/member/member';">회원가입</button>
			                   <button type="button" style="background:#eaeaea;" class="btn btn-link">아이디찾기</button>
			                   <button type="button" style="background:#eaeaea;" class="btn btn-link">패스워드찾기</button>
			      </div>
			   </form>
			 </div>
		</div>
	</div>
</div>


			   