<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
//게시글 업데이트
function updateBoard(){
	<c:if test="${sessionScope.user.userId==dto.email}">
	  var cateNum = "${dto.cateNum}";
	  var boardNum = "${dto.boardNum}";
	  var page = "${page}";
	  var query = "cateNum="+cateNum+"&boardNum="+boardNum+"&page="+page;
	  var url = "<%=cp%>/community/update?" + query;

	  location.href=url;
	</c:if>

	<c:if test="${sessionScope.user.userId!=dto.email}">
	 alert("게시물을 수정할 수  없습니다.");
	</c:if>
}
//게시글 삭제
function deleteBoard() {
	<c:if test="${sessionScope.user.userId=='admin' || sessionScope.user.userId==dto.email}">
	  var cateNum = "${dto.cateNum}";
	  var boardNum = "${dto.boardNum}";
	  var page = "${page}";
	  var query = "cateNum="+cateNum+"&boardNum="+boardNum+"&page="+page;
	  var url = "<%=cp%>/community/delete?" + query;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
	</c:if>    
	<c:if test="${sessionScope.user.userId!='admin' && sessionScope.user.userId!=dto.email}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
}

//시작하자마자 1페이지 나옴.
$(function(){
	listPage(1);
});	
	

//댓글 등록
function sendReply(){
	//로그인 확인.
	var uid = "${sessionScope.user.userId}";
	if(! uid){
		location.href='<%=cp%>/member/login';
		return;
	}
	//댓글쓸때 앞뒤공백자르고 
	//내용이없으면 포커스 이벤트 발생해서 내용으로감.
	var content = $.trim($("#replyContent").val());
	if(! content){
		$("#replyContent").focus();
		return;
	}
	//쿼리
	var query = "content="+encodeURIComponent(content);
		query+= "&boardNum=${dto.boardNum}";
	
	var url="<%=cp%>/community/insertReply";
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,datatype:"json"
		,success:function(data){
			var s=data.state;
			if(s=="loginFail") {
				location.href="<%=cp%>/member/login";
				return;
			}
			$("#replyContent").val("");
			listPage(1);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}	

	
//댓글 리스트.
function listPage(page){
	var url="<%=cp%>/community/listReply";
	var boardNum="${dto.boardNum}";
	var cateNum="${cateNum}";
	
	var query = "boardNum="+boardNum;
		query+= "&pageNo="+page;
		query+= "&cateNum"+cateNum;
	//AJAX:TEXT
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data){
			$("#listReply").html(data);
			
		}
		,error:function(e){
			if(e.statues=403){
	    		location.href='<%=cp%>/member/login';
	    		return;
	    	}
	    	console.log(e.responseText);
		}
	});
}

function deleteReply(boardrpNum, page){
	if(! confirm("게시물을 삭제하시겠습니까 ? "))
		return;
	
	var url="<%=cp%>/community/deleteReply";
	
	// AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:{boardrpNum:boardrpNum}
		,datatype:"json"
		,success:function(data){
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

<div style="width: 100%; min-height: 800px; background:#eef0f3; margin-top: 100px;">
	<div style="width: 800px; margin: 10px auto 0px; background: #e4efff;">
		<div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
				<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="center">
						${dto.subject}
					</td>
				</tr>
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td width="50%" align="left" style="padding-left: 5px;">
						이름 : ${dto.name}
					</td>
					<td width="50%" align="right" style="padding-right: 5px;">
						${dto.created} | 조회 ${dto.hitCount}
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
						${dto.content}
					</td>
				</tr>
				
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="left" style="padding-left: 5px;">
						이전글 :
						<c:if test="${not empty preReadDto}">
							<a href="<%=cp%>/community/article?${query}&boardNum=${preReadDto.boardNum}">${preReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
				
				<tr height="35" style="border-bottom: 1px solid #cccccc;">
					<td colspan="2" align="left" style="padding-left: 5px;">
						다음글 :
						<c:if test="${not empty nextReadDto}">
							<a href="<%=cp%>/community/article?${query}&boardNum=${nextReadDto.boardNum}">${nextReadDto.subject}</a>
						</c:if>
					</td>
				</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
				<tr height="45">
					<td width="300" align="left">
					<c:if test="${sessionScope.user.userId==dto.email}">		    
						<button type="button" class="btn1" onclick="updateBoard();">수정</button>
					</c:if>
					<c:if test="${sessionScope.user.userId==dto.email || sessionScope.user.userId=='admin'}">
						<button type="button" class="btn1" onclick="deleteBoard();">삭제</button>
					</c:if>
					</td>
					
					<td align="right">
						<button type="button" class="btn1" onclick="javascript:location.href='<%=cp%>/community/list?cateNum=${cateNum}';">리스트</button>
					</td>
				</tr>
			</table>
		</div>
			 
		<div>
			<table style="width: 100%; margin: 15px auto 0px; border-spacing: 0">
				<tr height="30">
					<td>
						<span style="font-weight: bold;">댓글쓰기</span>
						<span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
					</td>
				</tr>
				
				<tr>
					<td style="padding: 5px 5px 0">
						<textarea id="replyContent" class="boxTA" style="width: 99%; height: 70px;"></textarea>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<button type="button" class="btn1" 
						style="padding: 10px 20px;" onclick="sendReply();">댓글등록</button>
					</td>
				</tr>
			</table>
			<div id="listReply"></div>
		</div>
	</div>
</div>