<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function() {
	
	$(".btn-sm:first").click(function(){
		if($("#qnaCode option:selected").val().length==0){
			var tex="질문분류를 선택해 주세요";
			$("#message").text(tex);
			return;
		}
		
		var f=document.faqForm;

		var str=f.subject.value;
		if(! str){
			alert("제목을 입력하세요!");
			f.subject.focus();
			return;
		}
		
		str=f.content.value;
		if(! str){
			alert("내용을 입력하세요!");
			f.content.focus();
			return;
		}
		
		
		f.action="<%=cp%>/admin/faq/${mode}";
		f.submit();
		
	});
	
});

</script>


	<div class="right_col" role="main" style="background: #ffffff; padding: 50px 100px 200px;">

		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>
						FAQ 관리 <small>FAQ Manage</small>
					</h3>
				</div>
				<div class="title_right"></div>
			</div>
			<div class="clearfix"></div>

			
			

		</div>
		
	<div>
			<form name="faqForm" method="post"> 
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			 <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">문의종류</td>
			      <td style="padding-left:10px;"> 
			        <select id="qnaCode" name="qnaCode">
			           <option value="" selected="selected">:: 선택 ::</option>
			           <option value="1" ${dto.qnaCode=='1'?"selected='selected'":""}>예약/결제</option>
			           <option value="2" ${dto.qnaCode=='2'?"selected='selected'":""}>이용권</option>
			           <option value="3" ${dto.qnaCode=='3'?"selected='selected'":""}>카페</option>
			           <option value="4" ${dto.qnaCode=='4'?"selected='selected'":""}>도서예약</option>
			           <option value="5" ${dto.qnaCode=='5'?"selected='selected'":""}>회원가입/로그인</option>
			           <option value="6" ${dto.qnaCode=='6'?"selected='selected'":""}>기타문의</option>
			        </select>
			         <span id="message" style="color: red"></span>
			      </td>
			  </tr>			 
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.subject}">
			      </td>
			  </tr>

			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" id="content" style="width: 95%; height: 270px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  
	

			  </table>
			
			  <table class="buttonTable" style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			      	<c:if test="${mode=='update'}">
			      		<input type="hidden" name="num" value="${dto.num}">
			        </c:if>
			 
			        <button type="button" class="btn btn-success btn-sm">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn btn-warning btn-sm">다시입력</button>
			        <button type="button" class="btn btn-danger btn-sm" onclick="javascript:location.href='<%=cp%>/admin/faq/list'">${mode=='update'?'수정취소':'등록취소'}</button>
			         
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
	
		
		
	</div>

