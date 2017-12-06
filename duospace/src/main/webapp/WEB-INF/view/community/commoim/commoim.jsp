<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
* {
    margin:0; padding:0;
}

*, :after, :before {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.makeCover .title {
    font-size: 14px;
    color:#444444;
    margin-bottom: 11px;
    font-weight: 600;
}

.makeCover .inputBox {
    border:none;
    border-bottom: 1px solid #cccccc;
    line-height: 54px;
    font-size: 30px;
    font-weight: 400;
    color: #333333;
    border-radius: 0;
    outline: 0;
    width: 100%;
}

.makeCover .coverMain {
    position: absolute;
    left: 0;
    top: 0;
    width: 300px;
    height: 225px;
}

.makeCover .coverSelect {
    position: relative;
    height: 225px;
    margin-top: 30px;
    padding-left: 300px;
}

.makeCover .coverMain .cover{
    display: block;
    position: relative;
    font-size: 0;
}

.makeCover .coverList {
padding-left: 30px;
}
.makeCover .coverList .head {
    margin-bottom: 12px;
}
.makeCover .coverList .head h3{
    margin:0;
    height: 23px;
    font-size: 13px;
    font-weight: 400;
    color: #444;
    line-height: 23px;
}
.makeCover .coverList .list{
    margin-left: -10px;
}
.makeCover .coverList .coverSet {
    float: left;
    margin-left: 10px;
    margin-bottom: 10px;
}
.makeCover .coverList .coverSet .coverA {
    display: block;
    position: relative;
    width: 120px;
    height: 90px;
    font-size: 0;
    background-color: #ebebeb;
}

.makeCover .coverList .coverSet .mask {
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    background-color: rgba(46,204,113,.8);
    border-radius: 1px;
}
.makeCover .coverList .coverSet .mask:before {
    position: absolute;
    left: 50%;
    top: 50%;
    margin: -14px 0 0 -14px;
    width: 28px;
    height: 28px;
    overflow: hidden;
    display: inline-block;
    background-repeat: no-repeat;
    background-image: url(<%=cp%>/resource/images/communiti/icon.png);
    background-position: -536px -490px; 
    content: '';
}

.makeCover .coverList .coverSet {
    cursor: pointer;
}
</style>

<script type="text/javascript">
function commoimForm() {
	var f=document.commoimForm;
    var title = f.title.value;
    if (title == null || title == "") {
        alert('모임 이름을 입력하세요');
        f.title.focus();
        return;
    }
}

$(function(){
    	$("body").on("click", ".coverList .coverImg", function(){
    		var index = $(".coverList .coverImg").index(this);
    		$(".coverList .mask").hide();
    		
    		if(index==0) {
    			return;
    		}
    		
            var src=$(this).attr("src");
            $(".coverSelected").attr("src", src);
            $(this).next(".mask").show();
    	});
});  


function sendCommoim(){
	var uid="${sessionScope.user.memberNum}";
	
	
	var isopen=1;
//체크를 하면 비공개방...
	if($("input[name=isopen]:checked").each(function() {
			  isopen = $(this).val();
			}
		)
	)
	var comname=$.trim($("#comname").val()); //ID:comname를 앞뒤공백제거하고 comname에넣는다.
	var regcode=$("form[name=commoimForm] [name=regcode]").val();
	var catecode=$("form[name=commoimForm] [name=catecode]").val();
	var query="comname="+encodeURIComponent(comname);//한글깨짐방지//제목 데이터 입력
		query+="&regcode="+regcode;
		query+="&catecode="+catecode;
		query+="&isopen="+isopen;
		
	var url="<%=cp%>/commoim/insert";

	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data){
			$("#comname").val("");
			$("#regcode").val("");
			$("#catecode").val("");
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
}
</script>


<form name="commoimForm" method="post" style="min-height:650px;">
	<div style="width:840px;  margin: 200px auto 0px;">
		<div class="makeCover">
		      <h2 class="title">제목</h2>
		      <div>
		      	  <input type="text" class="inputBox" id="comname" name="comname" placeholder="모임 이름 입력"> 
		      	  <!-- 지역 설정 -->
		      	  <span>지역 설정: </span>
		      	  <select id="regcode" name="regcode" style="border: none;">
			      	  	<option value="1">당산</option>
			      	  	<option value="2">영등포</option>
		      	  </select>
		      	  <!-- 카테고리설정 -->
		      	  <span>카테고리 설정: </span>
		      	  <select id="catecode" name="catecode" style="border: none;">
			      	  <option value="2">스프링</option>
			      	  <option value="5">자바</option>
		      	  </select>
		      </div>
		      <div class="coverSelect">
		      		<div class="coverMain">
		      		    <span class="cover">
		      		        <img class="coverSelected coverImg" width="300" height="225"
		      		                 src="<%=cp%>/resource/images/communiti/12.JPG" >
		      		    </span>
		      		</div>
		      		<div class="coverList">
		      		     <div class="head">
		      		          <h3>이미지 선택</h3>
		      		     </div>
		      		     <div class="list">
			      		     <div class="coverSet">
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/0.png"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		     <div class="coverSet">
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/8.JPG"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		     <div class="coverSet">
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/7.JPG"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		     <div class="coverSet">
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/6.JPG"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		     <div class="coverSet"> 
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/5.JPG"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		     <div class="coverSet">
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/4.JPG"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		     <div class="coverSet">
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/3.JPG"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		     <div class="coverSet">
			      		          <a href="#" class="coverA">
			      		             <img class="coverImg" width="120" height="90"
			      		                 src="<%=cp%>/resource/images/communiti/2.JPG"/>
			      		             <span class="mask"></span>
			      		          </a>
			      		     </div>
			      		 </div>
		      		</div>
		      </div>
		</div>
		<!-- 비공개 공개 체크박스 -->
		<div style="width: 100%; height: 35px;"align="center">
			비공개방 체크<input type="checkbox" name="isopen" value="0" id="isopen">
		</div>
		<div style="width: 100%; height: 35px;"align="center">
			<table>
				<tr align="center">
					<td align="center">
					<input type="button" value="등록" onclick="sendCommoim();" class="btn">
					<input type="button" value="취소" onclick="javascript:history.back(-1)" class="btn">
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>




