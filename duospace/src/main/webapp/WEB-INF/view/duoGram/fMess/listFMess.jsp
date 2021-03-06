<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">

#dgfmessengers body {
    direction: ltr;
    line-height: 1.34;
    font-size: 12px;
}

#dgfmessengers div {
    display: block;
}

#dgfmessengers ul{
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#dgfmessengers li {
    display: list-item;
    text-align: -webkit-match-parent;
}

#dgfmessengers a {
    color: #4b4f56;
    cursor: pointer;
    text-decoration: none;
}

#dgfmessengers form {
    margin: 0;
    padding: 0;
}

#dgfmessengers button{
	margin: 0;
}

#dgfmessengers h3{
    color: #333;
    font-size: 12px;
    margin: 0;
    padding: 0;
}

#fMCList li:first-child{
    border-top: none;
}

.uiToggleFLayoutm{
	display: none;
	
	background: #ffffff;
	border: 1px solid rgba(100, 100, 100, .4);
	border-radius: 0 0 2px 2px;
    box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
    color: #1d2129;
    overflow: visible;
    position: absolute;
    top: 38px;
    width: 430px;
    z-index: -1;
}

.uiScrollableArealfm {
    direction: ltr;
    height: 100%;
    overflow: hidden;
    position: relative;
}

.uiScrollableAreaWraplfm {
    height: inherit;
    max-height: inherit;
    outline: none;
    overflow-x: hidden;
    overflow-y: scroll;
    position: relative;
    
    margin-right: -30px;
    padding-right: 30px;
}

.uiScrollableAreaBodylfm {
    direction: ltr;
    position: relative;
}

.uiScrollableAreaContentlfm {
    padding-bottom: 0;
}

.messengerHeader{
	background-clip: padding-box;
    background-color: #fff;
    border-bottom: solid 1px #dddfe2;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    padding: 8px 12px 6px;
    position: relative;
    z-index: 100;
}

._4kslfm>li {
    border-color: #dddfe2;
    border-style: solid;
}

._4kglfm>li {
    border-width: 0 0 1px 0;
}

#dgfmessengers .objectListItem {
    padding-bottom: 8px;
    padding-top: 8px;
}
#dgfmessengers .objectListItem>*{
	cursor: default;
}

.messegeContainer{
	border-bottom: 1px solid #dddfe2;
    padding: 6px 30px 6px 12px;
    position: relative;

	color: #1d2129;
    display: block;
    text-decoration: none;
	
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

#dgfmessengers .objectListItem_profile {
	height: 48px;
	margin-right: 2px;
	margin-top: 1px;
	width: 48px; 
	border-radius: 50%; 
	overflow: hidden;
	display: block;
    border: 0;background-color: #eeeeee;
}

#dgfmessengers .uiScrollableAreaTrack {
    bottom: 2px;
    display: block;
    pointer-events: none;
    position: absolute;
    right: 2px;
    top: 2px;
    -webkit-user-select: none;
    width: 7px;
    z-index: 5;
}

#dgfmessengers .RequestOKBtn{
	line-height: 22px;
	
	background-color: #32b0e5;
	border-color:#32b0e5;

	color: #ffffff;

	border: 1px solid;
    border-radius: 2px;
    box-sizing: content-box;
    font-size: 12px;
    -webkit-font-smoothing: antialiased;
    font-weight: bold;
    justify-content: center;
    padding: 0 8px;
    position: relative;
    text-align: center;
    text-shadow: none;
    vertical-align: middle;
    
    cursor: pointer;
    display: inline-block;
    text-decoration: none;
    white-space: nowrap;
}

#dgfmessengers .requestDeleteBtn{
	margin-left: 4px;
	
    line-height: 22px;
    
    background-color: #f6f7f9;
    color: #4b4f56;
    
    border: 1px solid #ced0d4;
    border-radius: 2px;
    box-sizing: content-box;
    font-size: 12px;
    -webkit-font-smoothing: antialiased;
    font-weight: bold;
    justify-content: center;
    padding: 0 8px;
    position: relative;
    text-align: center;
    text-shadow: none;
    vertical-align: middle;
    
    cursor: pointer;
    display: inline-block;
    text-decoration: none;
    white-space: nowrap;
}

#dgfmessengers .friendRequestName{
    color: #333333;
    font-size: 12px;
    font-weight: bold;
}

.author{
	color: #1d2129;
    padding-top: 7px;
    white-space: nowrap;
}

.author>strong:first-child .author>span:first-child{
    display: inline-block;
    max-width: 256px;
    overflow: hidden;
    text-overflow: ellipsis;
    vertical-align: bottom;
    white-space: nowrap;
}

.messegeContent1{
	display: flex;
    flex-direction: row;
    justify-content: flex-start;
}

.messegeContent2{
	flex: 1 1 auto;
    overflow: hidden;
    padding-right: 5px;
    text-overflow: ellipsis;
}

.mTime{
	color: #90949c;
    display: block;
    font-size: 12px;
    padding-top: 2px;
    position: absolute;
    right: 14px;
    top: 20%;
}

.clearfix:after {
    clear: both;
    content: ".";
    display: block;
    font-size: 0;
    height: 0;
    line-height: 0;
    visibility: hidden;
}

.uiHeaderTitle{
	border-right: 4px solid transparent;
    overflow: hidden;
    position: relative;
    white-space: nowrap;
    outline: none;
}

</style>

<div id="dgMessPos" style="position:fixed;top:30px;z-index: 10;">
	<div class="uiToggleFLayoutm" id="dgfmessengers">
	    <ul>
	    	<li style="border-top: none;">
	    		<div>
	    			<div class="uiScrollableArealfm" style="min-height:100px; max-height: 631px;">
	    				<div class="messengerHeader">
							<div class="clearfix" style="zoom:1;">
								<h3 class="uiHeaderTitle">안읽은 메시지 <span id="fMURCnt"></span></h3>
							</div>
	    				</div>
	    				<div class="uiScrollableAreaWraplfm" id="dglfmScroll">
	    					<div class="uiScrollableAreaBodylfm" id="dglfmDoc" style="width: 430px;">
	    						<div class="uiScrollableAreaContentlfm" >
	    							<div style="padding-top: 0;">
	    								<ul class="_4kglfm _4kslfm" id="fMCList">
	    								</ul>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</li>
	    </ul>
	</div>
	<div class="alim" id="reqalimFMess"></div>
</div>

<script type="text/javascript">
function readaFMessCnt() {
	var url="<%=cp%>/duogram/fMURtDCnt";
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,dataType:"json"
		,success:function(data){
			var cnt=data.count;
			if(cnt!=0){
				$("#reqalimFMess").css("display","inline-block");
				$("#reqalimFMess").html(cnt);
				var fmurcnt="("+cnt+")";
				$("#fMURCnt").html(fmurcnt);
			}else{
				$("#reqalimFMess").css("display","none");
				$("#fMURCnt").html('');
			}
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText)
		}
	});
	console.log("메시지 카운트 로드");
}
function dMcl(){
	$('#fMCList').html('');
	pageLFMCNo=1;
	totalPageLFMC=1;
	console.log("채팅방 리스트 삭제 로드");
}
function listFMC(page) {
	var url="<%=cp%>/duogram/listFMC";
	var q="page="+page;
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(data){
			$('#fMCList').prepend(data);
			readaFMessCnt();
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true);
		}
		,error:function(e){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText);
		}
	});
	console.log("채팅방 리스트 로드");
}

</script>
