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
function formCheck() {
	var f=document.allForm;
    var title = f.title.value;
    if (title == null || title == "") {
        alert('클럽 이름을 입력하세요');
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

</script>


<div style="width:840px; margin: 30px auto;">
	<div class="makeCover">
	      <h2 class="title">제목</h2>
	      <div>
	      	  <input type="text" class="inputBox" id="subject" placeholder="클럽 이름 입력">
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
</div>

<div style="background-color:white;">
<label style=margin:100px auto; for="check1" class="uCheck -checkbox">
		<input type="radio" value="secret" name="bandOpenType" id="check1" class="checkInput">
		<span class="checkLabel">
		<span class="shape">
		</span>
		<span class="text" style="background-color:#dcdcdc">
			<strong style="font-size: 20px;"> 비공개 클럽 </strong>
			<br>
			<span class="msg">클럽에 있는 게시글이 공개되지 않습니다. 초대를 통해서만 가입할 수 있습니다.</span>
		</span>
		</span>
		</label>

		<label style=margin:100px auto;  for="check2" class="uCheck -checkbox">
		<input type="radio" value="secret" name="bandOpenType" id="check2" class="checkInput">
		<span class="checkLabel">
		<span class="shape">
		</span>
		<span class="text" style="background-color:#dcdcdc">
			<strong style="font-size: 20px;"> 공개클럽 </strong>
			<br>
			<span class="msg">누구나 클럽을 찾을 수 있고, 게시물을 볼 수 있습니다. </span>
		</span>
		</span>
		</label>
		
		<label style=margin:100px auto; for="check3" class="uCheck -checkbox">
		<input type="radio" value="secret" name="bandOpenType" id="check3" class="checkInput">
		<span class="checkLabel">
		<span class="shape">
		</span>
		<span class="text" style="background-color:#dcdcdc">
			<strong style="font-size: 20px;"> 회원전용클럽 </strong><br>
			<span class="msg">클럽에 가입된 멤버만 게시물을 확인할 수 있습니다.</span>
		</span>
		</span>
		</label>
</div>
		
		<table>
		<tr heigth="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr heigth="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
		<tr align="center">
			<td>&nbsp;</td>
		<td colspan="4"><input type=button value="등록" onclick="javascript:writeCheck();">
			<input type=button value="취소" onclick="javascript:history.back(-1)">
			<td>&nbsp;</td>
		</tr>
		</table>




