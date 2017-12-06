<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
/*
//댓글버튼
$(function(){
		$("body").on("click",".btnReplyAnswerLayout",function(){//btn클래스 클릭하면.
			var replyNum = $(this).attr("data-replyNum");
			var $trReplyAnswer = $(this).parent().parent().next();//아버지의 아버지의 다음.parent(아버지),child(자식)//td>tr>다음tr
			var isVisible = $trReplyAnswer.is(":visible"); 
			
			if(isVisible){
				$trReplyAnswer.hide();
			}else{
				$trReplyAnswer.show();
				
				listAnswer(replyNum);
			}
		});
	});
*/


function dialogNewWord() {
    $("#modalSubject").val("");
    $("#modalContent").val("");
	$("#modalNewWord").modal("show");
    $("#modalContent").focus();
}



/*
function listpage(){
	var url="";
	var query="";
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,success:function(data){
			$("#moimfreeboardlist").html(data);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}
*/
</script>

<header>
	<div style="width: 100%; height: 25px; background: #D9383A; position: fixed; left: 0px; top: 50px;" align="center">
		<table>
			<tr>
				<td style="padding: 0px 20px;">
					<a style="color: #ffffff;" id="moimfreeboardlist">
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
			<div style="vertical-align: top;margin-right: 20px;float: left;">
				<div>
					<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width:180px;height: 100px; ">
					<h3>자바</h3>
					<span>멤버 1</span>&nbsp;&nbsp;<a>초대</a>
					<hr>
				</div>
			</div>
			<!-- 가운데 글리스트 -->
			<!-- 전체글 -->
			<div style="float: left ">
				<!-- 검색 -->
				<div style="width: 550px; height:30px; margin-bottom: 12px; background: #ffffff; vertical-align: middle; border-radius: 10px;">
					<input type="text" placeholder="글 내용,#태그,@작성자 검색" style="width: 500px;margin-left: 20px; border: none;">
				</div>
				<!-- 글쓰기 -->				
				<div style="width: 550px; margin-bottom: 12px; background: #ffffff; border-radius: 10px; padding: 35px;">					
					<a  href="javascript:dialogNewWord();" style="display: block; width: 100%;height: 100%;">
							멤버들에게 전할소식을 남겨주세요
					</a>
				</div>
				<!-- 새글 올라올곳.. -->
				<div style="margin-bottom: 11px;background-color: #ffffff; border-radius: 10px;">
					<div style="border-radius: 10px;">
						<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px;">
							<a class="profileInner">
								<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width: 40px;height: 40px;">
							</a>
							<span style="margin-right: 72px;padding-top: 2px; white-space: nowrap; clear: #999">
								윤숭열
							</span>
							올린시간...
						</div>
						<!-- 글 리스트.. -->
						<div style="margin: 15px;">
							asdfasdfasdfsadfasdfas<br>
							basdfdsafas<br>
							sadfasdfa<br>
							sdafasdf<br>
						</div>
						<!-- 댓글 및 표정이모티콘 -->
						<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;">
							<div style="margin: 15px; float: left; padding-left: 50px;">
								<button type="button">
									표정짓기
								</button>
							</div>
							<div style="margin: 15px; float: right; padding-right: 50px;">
								<button type="button">
									댓글쓰기
								</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 전체보기 리스트 -->
				<div id="listFreeboard"></div>
				
				<div style="margin-bottom: 11px;background-color: #ffffff; border-radius: 10px;">
					<div style="border-radius: 10px;">
						<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px;">
							<a class="profileInner">
								<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width: 40px;height: 40px;">
							</a>
							<span style="margin-right: 72px;padding-top: 2px; white-space: nowrap; clear: #999">
								윤숭열
							</span>
							올린시간...
						</div>
						<!-- 글 리스트.. -->
						<div style="margin: 15px;">
							...
						</div>
						<!-- 댓글 및 표정이모티콘 -->
						<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;">
							<div style="margin: 15px; float: left; padding-left: 50px;">
								<button type="button">
									표정짓기
								</button>
							</div>
							<div style="margin: 15px; float: right; padding-right: 50px;">
								<button type="button" class="btn btnReplyAnswerLayout">
									댓글쓰기
								</button>
							</div>
						</div>
						<!-- 리플 리스트 -->
						<!-- 
						 <div id="listReply"></div>
						 -->
					</div>
				</div>
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
					<input type="hidden" name="cmoimcode" value="${dto.comimcode}">
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
								<button type="button" class="btn btnReplyAnswerLayout" onclick="sendFreeboard();">
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
