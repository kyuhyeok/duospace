<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style type="text/css">
/* 
body {
    background: #fff;
    color: #1d2129;
    direction: ltr;
    line-height: 1.34;
    margin: 0;
    padding: 0;
    unicode-bidi: embed;
    font-size: 12px;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

a{	
	color: #365899;
	cursor: pointer;
    text-decoration: none;
}
 */
td {
    text-align: left;
    display: table-cell;
}

textarea{
	text-align: left;
	border: none;
	outline:0;
	width:100%;
	height:18px;
	word-wrap: break-word;
	resize: none;
	max-height: 90px;
	overflow: hidden;
}

img {
    border: 0;
}

time{
	display: block;
    height: 2px;
    text-align: center;
    text-transform: uppercase;
    margin: 16px 0px 15px;
}

time>span{
	color: rgb(144, 148, 156);
    display: inline-block;
    font-size: 10px;
    font-weight: bold;
    position: relative;
    top: -8px;
    padding: 0px 5px;
    
    text-align: center;
    text-transform: uppercase;
}

.contentBox{
	align-items: flex-end;
    display: flex;
    position: relative;
    margin: 10px 9px 10px 8px;
}

._ua1 {
    justify-content: flex-start;
}

._ua0 {
    justify-content: flex-end;
}

.friendProfile{
	position: relative;
	
}

.friendLink{
	display: inline-block;
    height: 28px;
    position: relative;
    width: 28px;
}

.friendLink img {
    border-radius: 50%;
    
    height: 28px;
    width: 28px;
}

.content{
    display: flex;
    flex: 1 1 auto;
    
    flex-direction: row;
    flex-wrap: wrap;
    line-height: 1.28;
    text-align: initial;
    padding: 0px 0px 1px;
}

._my {
    flex-direction: row-reverse;
}

.friendCon{
    flex-direction: column;
    direction: ltr;
    min-height: 24px;
    margin-left: 8px;
    
    clear: left;
    float: left;
    
    position: relative;
}

.myCon{
	flex-direction: column;
    direction: ltr;
    min-height: 24px;
    margin-left: 8px;
    
    clear: right;
    float: right;
    
    position: relative;
}

.textbox{
	border-radius: 12px;
    margin: 2px 0px;
    background-color: rgb(241, 240, 240);
    float: left;
    
    color: rgb(75, 79, 86);
    max-width: 164px;
    word-break:break-all; word-wrap:break-word;
    min-width: 14px;
    position: relative;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-image: initial;
    overflow: hidden;
}

._mycolor{
	background-color: #09504F;
	color: #ffffff;
}

.dgChatTabFlyout {
	z-index: 300;
	
	left: auto;
    right: 10px;
	
	bottom: 10px;
    display: none;
    height: auto;
    position: fixed;
    width: 260px;
    
    box-shadow: none;
}

.dgFlyoutInner{
	background: transparent;
    border: 0;
    border-radius: 3px 3px 0 0;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .3);
}

.dgFlyoutTitlebar:before {
    background-color: rgba(0, 0, 0, .1);
    bottom: -2px;
    content: '';
    height: 1px;
    left: 0;
    position: absolute;
    right: 0;
    z-index: 1;
}

.dgFlyoutTitlebar {
    position: relative;

	background: #f6f7f9;
    color: #191919;
    height: 26px;
    padding-right: 3px;
    z-index: 2;

    border: 0;
}

.titlebarcontent{
    display: flex;
    flex-direction: row;
    outline: none;
    overflow: hidden;
    
    padding-left: 8px;
}

.chatFlyoutTitle{
	color: #4b4f56;
    font-size: 12px;
    line-height: 26px;
    margin: 0 8px 3px 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    
    padding-top: 1px;
    flex: 1 1 0%;
}

.dgfmtitlebarText{
	color: #4b4f56;
}

.dgChatTabClose {
    display: flex;
    list-style: none;
    
    flex: 0 0 18px;
}

.chatclosebtn{
	cursor: pointer;
	opacity: .4;
    transition: opacity .15s;
    width: auto;
    
    display: inline-block;
    height: 26px;
    vertical-align: top;
    
    font-size:20px;
}

.haderAndchatListAndScroll{
	position: relative;
	display: flex;
    flex-direction: column;
    height: 308px;
}

.scrollable{
	background-color: #ffffff;
    border: 0;
    
    background-clip: padding-box;
    
    overflow-x: hidden;
    overflow-y: auto;
    position: relative;
}

.haderAndchatcontent{
	height: 100%;
    width: 100%;
}

.haderAndchatList{
    table-layout: fixed;
    
    border: 0;
    border-collapse: collapse;
    border-spacing: 0;
    
    height: 100%;
    width: 100%;
}

.inputbar{
	position: relative;
	display: flex;
    flex-direction: column;
    height: 308px;
}

.clearfix{
	zoom: 1;
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

.dgFlaoutFooter{
	border-top: 1px solid #dddfe2;
    position: relative;
    background: #ffffff;
    
    min-height: inherit;
}

._552h{
    border-top-width: 0;
    cursor: text;
    max-height: 97px;
    min-height: 16px;
	overflow-x: hidden;
    overflow-y: auto;
    padding: 10px 8px 6px;
    position: relative;
}

._5rp7, ._5rpb, ._5rpu{
    position: relative;
    height: inherit;
    text-align: initial;
}
/* 	
._5rpu[contenteditable="true"] {
    -webkit-user-modify: read-write-plaintext-only;
} 
*/	

._5rp8 {
    left: 0;
    text-align: left;
}

._1p1t {
    color: #cccccc;
    position: absolute;
    z-index: 1;
	right:0;
	bottom: 0;
	text-align: right;
}

._5rpb {
    background-color: rgba(255, 255, 255, 0);
    border-left: .1px solid transparent;
    position: relative;
    z-index: 1;
}
.etcbox{
	font-size: 10px;
	font-weight: bold;
	opacity:0.5;
	margin: 2px 0px;
	color: rgb(75, 79, 86);
	clear: right;
    float: right;
}

</style>
<script type="text/javascript">
var first=1;
var fMNum=0;
var lastData=0;
var friendNum=0;
var socket=''; 
var host="";
var uNum=0;
$(function() {
	$("#dgchatcontent").scrollTop($("#dgchatcontent").prop("scrollHeight"));
	$(".messegeContainer").on("click",function(){
		opchat($(this).attr("data-fnum"),$(this).attr("data-fname"));
	});
});
function opchat(fNum,fName) {
	//var fPs=$(this).attr("data-fmps");
	first=1;
	var isVisible=$("#dgChatTabFlyout").is(":visible");
	
	console.log("채팅방 열기 로드");
	if(isVisible){
		dchatcl();
	}
	friendNum=fNum;
	if(friendNum==0){
		dchatcl();
		return;
	}
	$("#dgChatTabFlyout").show();
	sokectBoot(friendNum, fName);
	listFMCon(friendNum, 0);
	first=0;
	$("#chatinputstream").focus();
	//messScrollDown();
}
function dchatcl(){
	console.log("채팅방 닫기 로드 준비 완료");
	conclose();
	$('#dgChatTabFlyout').empty();
	$('#dgChatTabFlyout').hide();
	first=1;
	fMNum=0;
	lastData=0;
	friendNum=0;
	socket=null; 
	host="";
	uNum=0;
	console.log("채팅방 삭제 로드");
}
function conclose() {
	var obj = {};
    var jsonStr;
    obj.type="close";
    obj.message="";
    jsonStr = JSON.stringify(obj);
    socket.send(jsonStr);
    console.log("연결 끊기 로드");
}
function messScrollDown() {
	<%--
	$("#scrollmess").scrollTop($("#scrollmess")[0].scrollHeight);
	$("#dgchatcontent").scrollTop($("#dgchatcontent").prop("scrollHeight"));
	--%>
	$("#scrollmess").scrollTop($("#scrollmess").prop("scrollHeight"));
	console.log("스크롤 다운 로드");
}
function sokectBoot(fNum,fname){
	var url="<%=cp%>/duogram/chat";
	var q="friendNum="+fNum+"&name="+fname;
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(data){
			$("#dgChatTabFlyout").html(data);
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
	console.log("소켓 부팅 로드");
}
function listFMCon(fNum,fmNum){
	var url="<%=cp%>/duogram/listFMess";
		var q="friendNum="+fNum+"&num="+fmNum;
	if(first==1)
		q+="&first=1";
	else{
		q+="&first=0";
	}
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,success:function(data){
			$('#dgchatcontent').prepend(data);
			fMNum=$('#dgchatcontent').find("div:first").attr("data-fmNum");
			lastData=$('#lastmData').html();
			$('#lastData').remove();
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
	console.log("메시지 리스트 로드");
}
function dMess(num) {
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	var url="<%=cp%>/duogram/deleteFMess";
	var q="num="+num;
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			<%-- var time="#time"+num;
			$(time).remove(); --%>
			var mess="#mess"+num;
			$(mess).remove();
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
}

</script>
<div class="dgChatTabFlyout" id="dgChatTabFlyout">
</div>

