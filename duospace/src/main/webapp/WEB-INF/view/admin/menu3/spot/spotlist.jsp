<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	$('#ck_main').click(function(){
		if($(this).prop('checked')){
			$('input[name=ck_sub]').prop('checked',true);
		}else{
			$('input[name=ck_sub]').prop('checked', false);
		}
	});
});

function searchList() {
	var f=document.searchForm;
	f.submit();
}
$(function() {
	listPage(1);
});

function dataListDel(  ){
	
	if( !$('input[name="ck_sub"]').is(':checked') ){
		alert('선택 후 진행해 주십시오');
		return;
	}
	if( !confirm("삭제 처리를 진행하시겠습니까?")){
		return;
	};
	
	var r_prseqarr = [];
	$( 'input[name="ck_sub"]:checked').each(function(i){
		r_prseqarr[i] = $(this).val();
	});
	$('input[name="r_prseqarr"]').val(r_prseqarr.join(','));
	$('input[name="r_page"]').val(1);
		handling.submit( '', 'productlistdel' );
}
function listpage(page){
	var url="<%=cp%>/admin/spotlist";
	var spotCode="${dto.spotCode}";
	
	var q="spotCode="+spotCode+"&page="+page;
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(a){
			$("#spotlist").html(a);
		}
		,beforeSend : function(e) {
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status==403){
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}
	});
	
}
function deleteSpot(spotCode, page) {
	var uid="${sessionScope.user.userId}";
	if(! uid){
		location.href="<%=cp%>/member/login";
		return;
	}
	if(! confirm("게시물을 삭제하시겠습니까?"))
		return;
	var url="<%=cp%>/admin/spot/deleteSpot";
	var q="spotCode="+spotCode;
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			var s=data.state;
			if(s=="loginFail"){
				location.href="<%=cp%>/member/login";
				return;
			}
			
			listPage(page);
		}
		,beforeSend : function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status==403){
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(e.responseText);
		}
	});
}



</script>
</head>
<body>
	

				<div id="list"></div>

			</form>

		</div>
	</div>
