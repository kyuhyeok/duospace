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

<style type="text/css">
.wrap {
width: 500px;
}

.wrap textarea {
width: 100%;
resize: none;
overflow-y: hidden; /* prevents scroll bar flash */
padding: 1.1em; /* prevents text jump on Enter keypress */
padding-bottom: 0.2em;
line-height: 1.6;
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
    function sendOk() {
        var f = document.boardForm;

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

   		f.action="<%=cp%>/duogram/${mode}";

        f.submit();
    }
</script>

</head>
<body>
<!-- 왼쪽 글쓰는곳 -->
		<div class="wrap" style="width: 614px; float: left;">
			<div style="margin-bottom: 60px; width: 614px; border: 1px solid rgba(0,0,0,.0975); background-color: white; border-radius: 4px;">
				
				<!-- 게시글 등록 및 동영상 추가 -->
				<div style="height: 30px;background: #e9ebee; border-bottom: 1px solid #dddfe2;">
					<div align="left" style="margin-left: 15px; margin-right: 15px; padding-bottom: 10px; padding-top: 5px; font-size: 14px; font-weight: bold; font-family: '나눔고딕';">글쓰기
					</div>
				</div>
				
				<!-- 내용 입력 -->
				<div style="margin-top: 10px; margin-bottom: 10px;">
					<textarea style="border:none; resize: none; width: 584px; height: 60px; font-family: '나눔고딕';" placeholder="내용을 입력해주세요."></textarea>
				</div>
				
				<!-- 첨부파일 -->
				<div style="border-top: 1px solid #ccc; margin-bottom: 10px; margin-left: 15px; margin-right: 15px;"></div>
					<div style="height: 40px; padding-left: 15px; padding-right: 15px;">
						<a href="#">
							<button type="button" style="border-radius: 4px; border: 1px solid rgba(0,0,0,.0975); width: 250px; height: 28px;">첨부파일</button>
						</a>
						<button class="button pull-right" onclick="sendOk();" style="border: 2px solid #ccc; background: #ccc; width: 80px; color: white; height: 28px; font-size: 11px; font-family: '나눔고딕'; border-radius: 3px; margin-left: 8px;">${mode=='update'?'수정완료':'등록하기'}</button>
						<button class="button pull-right" style="border: 2px solid #ccc; background: #ccc; width: 80px; color: white; height: 28px; font-size: 11px; font-family: '나눔고딕'; border-radius: 3px; ">동영상 추가</button>
				</div>
			</div>
		</div>

</body>
</html>