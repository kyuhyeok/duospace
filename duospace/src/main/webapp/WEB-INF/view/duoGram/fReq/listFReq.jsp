<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
#dgFReqlistview body {
    direction: ltr;
    line-height: 1.34;
    font-size: 12px;
}

#dgFReqlistview div {
    display: block;
}

#dgFReqlistview ul{
	list-style-type: none;
	margin: 0;
	padding: 0;
}

#dgFReqlistview li {
    display: list-item;
    text-align: -webkit-match-parent;
}

#dgFReqlistview a {
    color: #365899;
    cursor: pointer;
    text-decoration: none;
}

#dgFReqlistview form {
    margin: 0;
    padding: 0;
}

#dgFReqlistview button{
	margin: 0;
	outline: 0;
}

#dgFReqlistview h3{
    color: #333;
    font-size: 12px;
    margin: 0;
    padding: 0;
}

.uiToggleFLayoutFReq{
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

.uiScrollableAreaFReq {
    direction: ltr;
    height: 100%;
    overflow: hidden;
    position: relative;
}

.uiScrollableAreaWrapFReq {
    height: inherit;
    max-height:inherit;
    outline: none;
    overflow-x: hidden;
    overflow-y: scroll;
    position: relative;
    
    margin-right: -30px;
    padding-right: 30px;
}

.uiScrollableAreaBodyFReq {
    direction: ltr;
    position: relative;
}

.uiScrollableAreaContentFReq {
    padding-bottom: 0;
}

._4ks>li {
    border-color: #dddfe2;
    border-style: solid;
}

._4kg>li {
    border-width: 1px 0 0 0;
}

.objectListItem {
    padding-bottom: 8px;
    padding-top: 8px;
}

.objectListItem_profile {
	height: 48px;
	margin-right: 2px;
	margin-top: 1px;
	width: 48px; 
	border-radius: 50%; 
	overflow: hidden;
	display: block;
    border: 0;background-color: #eeeeee;
}

.uiScrollableAreaTrack {
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

.RequestOKBtn{
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

.requestDeleteBtn{
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

.friendRequestName{
    color: #333333;
    font-size: 12px;
    font-weight: bold;
}

.friendRequestTitle{
	background-clip: padding-box;
    background-color: #ffffff;
    border-bottom: solid 1px #dddfe2;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    padding: 8px 12px 6px;
    position: relative;
    text-align: left;
}
.alim{
padding: 0px 4px;
background-color:red;
color:#ffffff;
border-radius: 5px;
position:relative; 
right:-375px;top:20px;
display: none;
cursor: pointer;
font-weight: 1000;
text-align:center;
}	
</style>

<div id="dgFReqPos" style="position: fixed;top:30px;z-index: 10;">
	<div class="uiToggleFLayoutFReq" id="dgFReqlistview">
	    <ul>
	    	<li style="border-top: none;">
	    		<div>
	    			<!-- 더보기 윗화면 -->
	    			<div class="uiScrollableAreaFReq" style="min-height:100px; max-height: 631px;">
	    				<!-- 스크롤 가능 영역 -->
	    				<div class="uiScrollableAreaWrapFReq" id="dgFReqScroll" style="position: relative;">
	    					<div class="uiScrollableAreaBodyFReq" id="dgFReqDoc" style="width: 430px;">
	    						<div class="uiScrollableAreaContentFReq">
	    							<div style="height: 31px;"></div>
	    							<div style="padding-top: 0;">
	    								<ul class="_4kg _4ks" id="friendRequestList">
	    								</ul>
	    							</div>
	    							<div>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    				<div class="uiScrollableAreaTrack" style="opacity: 0;visibility: hidden;">
	    					<div style="height: 539.75px;top: 0px;">
	    					</div>
	    				</div>
	    				<div style="left: 0px;top: 0px;opacity: 1;width: 622px;display: block;z-index: 4;
	    							height: 0;position: absolute;outline: none;">
							<div style="bottom: 0px;position: absolute;">
								<div style="width: 430px;position: absolute;top: 0;">
									<div class="friendRequestTitle" style="z-index: 1;">
										<div style="zoom:1">
											<h3 style="outline: none;">친구요청 <span id="fReqCnt"></span></h3>
										</div>
									</div>
								</div>
							</div>
	    				</div>
	    			</div>
	    		</div>
	    	</li>
	    </ul>
	</div>
	<div class="alim" id="reqalimFReq"></div>
</div>

<script type="text/javascript">
var pageFReqNo=1;		//친구 현재 페이지
var totalPageFReq=1;	//친구 전체 페이지
var pageLFMCNo=1;		//메시지방 현재 페이지
var totalPageLFMC=1;	//메시지방 전체 페이지
$(document).click(function(){
	$('#dgFReqlistview').hide();
	$('#dgfmessengers').hide();
	dReqcl();
	dMcl();
});
$(window).resize(function() {
	var xp=5;
	var yp=-350;
	$("#dgFReqPos").css("top",$("#dgFReq").offset().top+xp);
	$("#dgFReqPos").css("left",$("#dgFReq").offset().left+yp);

	$("#dgMessPos").css("top",$("#dgMess").offset().top+xp);
	$("#dgMessPos").css("left",$("#dgMess").offset().left+yp);
});
$(function() {
	var xp=5;
	var yp=-350;
	$("#dgFReqPos").css("top",$("#dgFReq").offset().top+xp);
	$("#dgFReqPos").css("left",$("#dgFReq").offset().left+yp);

	$("#dgMessPos").css("top",$("#dgMess").offset().top+xp);
	$("#dgMessPos").css("left",$("#dgMess").offset().left+yp);
	
	$("#totalsearch").on("keydown", function(event){
		if(event.keyCode==13){
			var searchVal=$("#totalsearch").val().trim();
			if(!searchVal) return;
			location.href="<%=cp%>/duogram/search?searchValue="+encodeURIComponent(searchVal);
		}
	});
	
	$("body").on("click", "#dgFReq", function(event){
		event.stopPropagation();
		var isVisible=$("#dgFReqlistview").is(":visible");
		
		if(isVisible){
			$('#dgFReqlistview').hide();
			$('#dgfmessengers').hide();
			dReqcl();
		}else {
			$('#dgFReqlistview').show();
			$('#dgfmessengers').hide();
			listFRPage(1);
			dMcl();
		}
	});
	readaFReqCnt();
	readaFMessCnt();
	setInterval(readaFReqCnt(), 10000);
	setInterval(readaFMessCnt(), 10000);
	$("body").on("click", "#dgFReqlistview", function(event){
		event.stopPropagation();
	});
	$("body").on("click", "#dgMess", function(event){
		event.stopPropagation();
		var isVisible=$("#dgfmessengers").is(":visible");
		
		if(isVisible){
			$('#dgfmessengers').hide();
			$('#dgFReqlistview').hide();
			dMcl();
		}else {
			$('#dgfmessengers').show();
			$('#dgFReqlistview').hide();
			listFMC(1);
			dReqcl();
		}
	});
	//요청무한스크롤
	$('#dgFReqScroll').scroll(function() {
	    if ($('#dgFReqScroll').scrollTop() + 100 >= $('#dgFReqDoc').height() - $('#dgFReqScroll').height()) {
	    	if(pageFReqNo<totalPageFReq) {
	    		++pageFReqNo;
	    		listFRPage(pageFReqNo);
	    	}
	    }
	});
	//메신저무한스크롤
	$('#dglfmScroll').scroll(function() {
	    if ($('#dglfmScroll').scrollTop() + 100 >= $('#dglfmDoc').height() - $('#dglfmScroll').height()) {
	    	if(pageLFMCNo<totalPageLFMC) {
	    		++pageLFMCNo;
	    		listFMC(pageLFMCNo);
	    	}
	    }
	});
	console.log("요청 및 메신저 창 토글 로드");
});
function readaFReqCnt() {
	var url="<%=cp%>/duogram/readFReqCnt";
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,dataType:"json"
		,success:function(data){
			var cnt=data.count;
			if(cnt!=0){
				$("#reqalimFReq").css("display","inline-block");
				$("#reqalimFReq").html(cnt);
				var freqcnt="("+cnt+")";
				$("#fReqCnt").html(freqcnt);
			}else{
				$("#reqalimFReq").css("display","none");
				$("#fReqCnt").html('');
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
			console.log(e.responseText);
		}
	});
	console.log("요청 카운트 로드");
}
function dReqcl() {
	$('#friendRequestList').html('');
	pageFReqNo=1;
	totalPageFReq=1;
	console.log("요청 삭제 로드");
}
function listFRPage(page) {
	if(! $("#friendRequestList").length>0) return;
	var url="<%=cp%>/duogram/listFReq";
	var q="pageNo="+page;
	//AJAX:TEXT
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(data){
			$("#friendRequestList").html(data);
			pageFReqNo=page;
			totalPageFReq=$("#total_Freqpage").html();
			$("#total_Freqpage").remove();
			readaFReqCnt();
		}
		,error:function(e){
			console.log(e.responseText);
		}
	});
	console.log("요청 리스트 로드");
}
function fReqOk(friendNum) {
	var q="friendNum="+friendNum;
	var url="<%=cp%>/duogram/insertFResp";
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			<%--
			var s=data.state;
			
			if(s=="loginFail"){
				location.href="<%=cp%>/member/login";
				return;
			} --%>
			listFRPage(1);
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
	console.log("요청리스트 삭제 로드");
}
function delFResp(friendNum) {
	var url="<%=cp%>/duogram/deleteFResp";
	var q="friendNum="+friendNum;
	
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			<%--
			var s=data.state;
			if(s=="loginFail"){
				location.href="<%=cp%>/member/login";
				return;
			}--%>
			listFRPage(1);
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true)
		}
		,error:function(e){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText)
		}
	});
	console.log("요청 삭제 로드");
}
function insFReq(friendNum) {
	var url="<%=cp%>/duogram/insertFReq";
	var q="friendNum="+friendNum;
	
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true)
		}
		,error:function(e){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText)
		}
	});
	console.log("요청 로드");
}
</script>