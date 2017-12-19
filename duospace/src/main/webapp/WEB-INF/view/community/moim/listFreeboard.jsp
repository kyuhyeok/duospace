<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!-- textarea 자동늘리기 -->
<style>
.wrap {
	width: 100%;
	}
.wrap textarea {
	width: 100%;
    overflow-y: hidden; /* prevents scroll bar flash */
    padding: 1.1em; /* prevents text jump on Enter keypress */
    
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

	<!-- 글 리스트... --> 
<c:if test="${dataCount != 0}">
	<c:forEach var="vo" items="${list}">
		<div style="margin-bottom: 11px;background-color: #ffffff; border-radius: 10px;">
			<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;border-radius: 10px;">
				<a class="profileInner">
					<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width: 40px;height: 40px;">
				</a>
				<span style="margin-right: 72px;padding-top: 2px; white-space: nowrap; clear: #999">
					이름 : ${vo.name}
				</span>
				올린시간 : ${vo.created}
			</div>
			
			<!-- 글 리스트.. -->
			<div style="margin: 15px;">
				<textarea rows="3" cols="70" style="border: none;" name="content">${vo.content}</textarea>
			</div>
			
			<!-- 댓글 및 표정이모티콘 -->
			<div style="border-top: 1px solid #eef0f3; float: none; height: 50px;" class="dropdown ">
				<div style="margin: 15px; float: left; padding-left: 50px;">
					<button type="button">
						표정짓기
					</button>
				</div>
				<div style="margin: 15px; float: right; padding-right: 50px;">
					<button type="button" class="btn btnReplyLayout">
						댓글쓰기<!-- (댓글카운터갯수 추가하기) -->
					</button>
				</div>
			</div>
			<div style="border-top: 1px solid #eef0f3; float: none; min-height: 60px; display: none;  overflow: auto;" class="reply wrap">
				<!-- 댓글 리스트 -->
				<!-- for문 돌리기. -->
				<div id="listReply">
					<div style="padding-top: 20px;height: 65px;background-color: #fff;padding-left: 15px;">
						<a class="profileInner">
							<img src="<%=cp%>/resource/images/communiti/7.JPG" style="width: 40px;height: 40px;">
						</a>
						<span style="margin-right: 72px;padding-top: 2px; white-space: nowrap; clear: #999">
							이름 : ${vo.name}
						</span>
							올린시간 : ${vo.created}
					</div>
					<div style="padding-top: 20px;min-height: 60px;background-color: #fff;padding-left: 15px; border-bottom: 1px solid #cccccc; overflow: auto;">
						내용..					
					</div>
				</div>
				
				<!-- 댓글 쓰기 -->
				<div style="float: left; min-height: 60px;">
					<textarea id="replyContent" style="width:450px; min-height:60px; border: none;" placeholder="댓글 : " ></textarea>
					<button type="button" class="btn1" style="margin-bottom: 15px;" onclick="sendReply(${vo.boardNum});">보내기</button>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>