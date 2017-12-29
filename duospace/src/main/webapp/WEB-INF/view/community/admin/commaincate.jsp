<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
function sendOk() {

	str = $("#content_1").val().trim();
    if(!str) {
        alert("게시판 이름을 적으세요. ");
        $("#content_1").focus();
        return;
    }
	url="<%=cp%>/commaincate/submit";
	
	var query="boardName="+str;
		
    $.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			
			
			var out="";
				out+="<tr style='padding-top: 15px;' id='del"+data.cateNum+"'>";	
				out+="<td>";	
				out+="<input type='text' name='cateNum' value='"+data.cateNum+"' readonly='readonly' disabled='disabled'>";	
				out+="</td>";	
				out+="<td>";	
				out+="<input type='text' name='cateName' value='"+data.boardName+"' id='cate"+data.cateNum+"' readonly='readonly' disabled='disabled'>";	
				out+="</td>";	
				out+="<td>";	
				out+="<button class='btn1' id='update"+data.cateNum+"' onclick='update("+data.cateNum+")'>수정</button>";	
				out+="<button class='btn1' id='updatesubmit"+data.cateNum+"' style='display: none;' onclick='updatesubmit("+data.cateNum+")'>완료</button>";	
				out+="<button class='btn1' onclick='del("+data.cateNum+")'>삭제</button>";	
				out+="</td>";	
				out+="</tr>";		
			$("#boardlist").prepend(out);
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}
var cateName="";
function update(num){
	cateName=$("#cate"+num).val();
	$("#cate"+num).removeAttr("readonly");
	$("#cate"+num).removeAttr("disabled");
	$("#update"+num).hide();
	$("#updatesubmit"+num).show();
}

function updatesubmit(num){
	var url="<%=cp%>/commaincate/updatecate";
	var query="cateNum="+num+"&boardName="+encodeURIComponent($("#cate"+num).val());
	
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#cate"+num).attr("readonly","readonly");
			$("#cate"+num).attr("disabled","disabled");
			$("#update"+num).show();
			$("#updatesubmit"+num).hide();
		}
		,error:function(e){
			$("#cate"+num).val(cateName);
			$("#cate"+num).attr("readonly","readonly");
			$("#cate"+num).attr("disabled","disabled");
			$("#update"+num).show();
			$("#updatesubmit"+num).hide();
			console.log(e.responseText);
		}
	});
}




function del(num){
	
	if(! confirm("게시글을 삭제하시겠습니까?"))
		return;
	
	var url="<%=cp%>/commaincate/deletecate";
	var query="cateNum="+num;
	
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#del"+num).remove();//선택한 태그 삭제.
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}


</script>
<div style="background: #eef0f3; "> 
	<div class="container"style="padding-bottom: 30px; margin-top: 80px; width: 1230px; min-height: 800px;">
  		<div style="width: 100%; margin: 1px; padding: 1px;">
	  		<h1>관리자</h1>
  		</div>
  		<div>
	  		<table>
	  			<tr style="margin: 1px;">
	  				<td>
	  					<input type="text" id="content_1" name="content_1" placeholder="분류 이름" >
	  				</td>
	  				<td style="margin: 1px" colspan="2">
	  					<button type="button" class="btn" style="background: #fff; border: 1px solid #cccccc;" onclick="sendOk();">분류 생성</button>
	  				</td>
	  			</tr>
	  		</table>
		<div>
			<h2>분류 리스트</h2>
		</div>
	  		<table id="boardlist">
				<c:forEach var="vo" items="${list}">
		  			<tr style="padding-top: 15px;" id="del${vo.cateNum}">
		  				<td>
		  					<input type="text" name="cateNum" value="${vo.cateNum}" readonly="readonly" disabled="disabled">
		  				</td>
		  				<td>
		  					<input type="text" name="cateName" value="${vo.boardName}" id="cate${vo.cateNum}" readonly="readonly" disabled="disabled">
		  				</td>
		  				<td>
		  					<button class="btn1" id="update${vo.cateNum}" onclick="update(${vo.cateNum})">수정</button>
		  					<button class="btn1" id="updatesubmit${vo.cateNum}" style="display: none;" onclick="updatesubmit(${vo.cateNum})">완료</button>
		  					<button class="btn1" onclick="del(${vo.cateNum})">삭제</button>
		  				</td>
		  			</tr>
				</c:forEach>
	  		</table>
  		</div>
  </div>
</div>