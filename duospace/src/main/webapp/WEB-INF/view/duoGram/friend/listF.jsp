<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style type="text/css">
body {
    background: #ffffff;
    color: #1d2129;
    direction: ltr;
    line-height: 1.34;
    margin: 0;
    padding: 0;
    unicode-bidi: embed;
	
	overflow-y: scroll;
}
.timelineLayout body, .timelineLayout button, .timelineLayout input, .timelineLayout label, .timelineLayout select, .timelineLayout td, .timelineLayout textarea {
    font-family: Helvetica, Arial, sans-serif;
    font-size: 12px;
}
#globalContainer{
	margin: 0 auto;
	position: relative;
	zoom: 1;
	width: 851px;/*981px*/
	clear: both;
	/*padding-right: 205px;*/
}
#content {
    margin: 0;
    outline: none;
    padding: 0;
    width: auto;
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
#mainContainer {
    margin-left: -1px;
    display: block;
    width: 100%;
}
.timelineLayout #contentCol {
    background: none;
    padding-top: 0;
}
#contentCol {
    background-color: #fff;
    padding-top: 15px;
}
.hasRightCol #contentArea {
    width: 714px;
}
.hasLeftCol #contentArea, .hasRightCol #contentArea {
    float: left;
    margin-right: 0;
}
.timelineLayout #contentArea {
    position: relative;
    width: 851px !important;
}
#contentArea {
    margin-right: -1px;
    outline: none;
    padding-left: 1px;
    word-wrap: break-word;
}
.friendNumelem{
	color: #89919c;
    font-size: 11px;
    font-weight: normal;
    padding-left: 6px;
	white-space: nowrap;
	line-height: 3.05;
}
._2w3 {
    margin: 10px 0 0 0;
    width: 851px;
}
._2w3>._30f {
    background: #ffffff;
    border: 1px solid #ced0d4;
    border-radius: 3px;
    margin-bottom: 10px;
    min-height: 406px;
}
._45e7, ._30f {
    position: relative;
}
._3cz {
    background: #f6f7f9;
    border-bottom: 1px solid #d3d6db;
    border-radius: 2px 2px 0 0;
    margin-bottom: 15px;
    min-height: 43px;
    padding-top: 10px;
}
._3c- {
    font-family: Helvetica, Arial, sans-serif;
    font-size: 20px;
    font-weight: bold;
    height: 24px;
    line-height: 1;
    margin: 0 12px 5px;
}
.lfloat {
    float: left;
}
._ohe {
    float: left;
}
h1, h2, h3, h4, h5, h6 {
    color: #1d2129;
    font-size: 13px;
    margin: 0;
    padding: 0;
}
._3c_:hover ._3sz, ._3s- ._3sz, ._33hy ._554b:hover, ._4o52:hover ._3sz, ._3c- a {
    color: #4b4f56;
}
._51sx {
    vertical-align: middle;
}
a {
    color: #4b4f56;
    cursor: pointer;
    text-decoration: none;
}
._3s- ._3d0 {
    display: inherit;
}
._3d0 {
    border-radius: 2px;
    color: #89919c !important;
    font-size: 12px;
    margin-left: 5px;
    padding: 1px;
    transition-duration: .2s;
    transition-property: background-color, color;
}
._1_ca {
    height: 30px;
    padding: 8px 0 0;
}
._6ph, ._69l {
    padding-right: 12px;
}
._6ph {
    height: 24px;
    line-height: 24px;
    vertical-align: middle;
}
.rfloat {
    float: right;
}
._ohf {
    float: right;
}
._6ph .fbProfileBrowserTypeahead {
    line-height: 0;
}
.uiTypeahead {
    background: #fff;
    border: solid #bdc7d8;
    border-width: 1px 0;
    cursor: default;
    position: relative;
}
.uiTypeahead .wrap {
    border: solid #bdc7d8;
    border-width: 0 1px;
}
.uiTypeahead .innerWrap {
    overflow: hidden;
    zoom: 1;
}
html .uiTypeahead .uiSearchInput {
    background-color: #fff;
}
.uiTypeahead .textInput {
    background-color: transparent;
    border: 0;
    box-sizing: border-box;
    outline: 0;
    width: 100%;
}
.uiSearchInput {
    background: #fff;
    border: 1px solid #7596c8;
    border-top-color: #4267b2;
    display: inline-block;
}
.uiSearchInput span {
    border: 0;
    border-top: 1px solid #ededed;
    display: inline-block;
    padding: 1px 0 2px;
    position: relative;
}
.uiSearchInput input {
    border: 0;
    margin: 0 22px 0 5px;
    outline: none;
    padding: 1px 5px 2px 0;
    width: 190px;
}
.inputtext, .inputpassword {
    padding-bottom: 4px;
}
textarea, .inputtext, .inputpassword {
    border: 1px solid #bdc7d8;
    margin: 0;
    padding: 3px;
    -webkit-appearance: none;
    -webkit-border-radius: 0;
}
.uiSearchInput button {
    background-repeat: no-repeat;
    background-size: auto;
    background-position: 0 0;
    background-color: #ebebeb;
    border: 0;
    cursor: pointer;
    display: block;
    height: 19px;
    padding: 0;
    position: absolute;
    right: 0;
    top: 0;
    width: 42px;
}
button {
    margin: 0;
}
button:focus{
	outline:none; 
}
._3i9 {
    padding: 0 14px 0 15px;
}

._1qp6 .fbProfileBrowserListContainer, ._262m {
    margin-left: -13px;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}
/*--친구 리스트*/
._1qp6 .fbProfileBrowserListContainer .fbProfileBrowserListItem, html ._262m ._698 {
    border: 1px solid #e9ebee;
    display: inline-block;
    margin: 0 0 13px 13px;
    padding: 0 10px 0 0;
    position: relative;
    vertical-align: top;
    width: 390px;
}<%--
.uiList>li:first-child {
    border-width: 0;
}--%>
._4kg>li {
    border-width: 1px 0 0 0;
}
	
._698 ._5qo4 {
    margin: -1px;
}
	
._5q6s {
    position: relative;
}
.lfloat {
    float: left;
}
._8t {
    margin-right: 10px;
}
._8o, ._8o .img {
    display: block;
}
	
._605a ._262m .img {
    border-radius: 0;
}
._s0:only-child {
    display: block;
}

._rv {
    height: 100px;
    width: 100px;
}
img {
    border: 0;
}
	
._42ef {
    overflow: hidden;
}

._6a {
    display: inline-block;
}
._6b {
    vertical-align: middle;
}
._ohf {
    float: right;
}
._5t4x {
    margin-left: 10px;
}
.FriendButton {
    display: inline-block;
    vertical-align: top;
}
.uiProfileBlockContent {
    overflow: hidden;
}
.fcb {
    color: #333333;
}
.fwb {
    font-weight: bold;
}
.fsl {
    font-size: 14px;
}

a._39g5 {
    color: #90949c;
}
	/*--친구추가 버튼*/
html ._4jy0:focus {
    box-shadow: 0 0 1px 2px rgba(88, 144, 255, .75), 0 1px 1px rgba(0, 0, 0, .15);
    outline: none;
}
eeVKsWys53f.css:178
._4jy1:active, ._4jy1._42fs {
    background-color: #29487d;
    border-color: #29487d;
}
._4jy0:active {
    transition: none;
}
._4jy1:hover {
    background-color: #365899;
    border-color: #365899;
}
._42ft:hover {
    text-decoration: none;
}
._4jy3, ._4jy3._42fr:active, ._4jy3._42fr._42fs {
    line-height: 22px;
}
._4jy1 {
    background-color: #4267b2;
    border-color: #4267b2;
}
._4jy1, ._4jy2 {
    color: #ffffff;
}
._4jy0 {
    transition: 200ms cubic-bezier(.08,.52,.52,1) background-color, 200ms cubic-bezier(.08,.52,.52,1) box-shadow, 200ms cubic-bezier(.08,.52,.52,1) transform;
}
._4jy0 {
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
}
._42ft {
    cursor: pointer;
    display: inline-block;
    text-decoration: none;
    white-space: nowrap;
}
	/*친구추가 버튼--*/
	/*--친구 요청 전송됨 버튼*/
html .FriendButton .enableFriendListFlyout, .FriendButton .enableFriendListFlyout .uiButtonText, .FriendButton .enableFriendListFlyout input {
    cursor: default;
}
._42ft+._42ft {
    margin-left: 4px;
}
._517h, ._59pe:focus, ._59pe:hover {
    background-color: #f6f7f9;
    border-color: #ced0d4;
    color: #4b4f56;
}
._517h:hover {
    background-color: #e9ebee;
}
._5f0v {
    outline: none;
}
	/*친구 요청 전송됨 버튼--*/
	/*--친구 버튼*/
._2agf._4o_4 {
    display: inline-flex;
}
._2agf {
    word-wrap: normal;
}
	/*친구 버튼--*/

/*친구 리스트--*/
/*--함께 아는 친구*/
.uiContextualLayerPositioner {
    height: 0;
    position: absolute;
    z-index: 202;
}
.uiLayer {
    outline: none;
}
	
.uiContextualLayer {
    position: absolute;
}

._53ip ._53il {
    padding-top: 10px;
}
._53ip ._5v-0 {
    padding-bottom: 10px;
}
._53ip ._53ij {
    border: 1px solid #8c8c8c;
    border: 1px solid rgba(0, 0, 0, .45);
    border-bottom: 1px solid #666;
    box-shadow: 0 3px 8px rgba(0, 0, 0, .3);
}
._53ij {
    background: #ffffff;
    position: relative;
}
.mvs {
    margin-top: 5px;
    margin-bottom: 4px;
}
.FlyoutFriendMenu {
    max-width: 300px;
	/*min-width: 192px;*/
    min-width: 120px;
}
.uiMenu {
    background-color: #ffffff;
    padding: 3px 0;
    overflow-y: auto;
}
.FriendListActionMenu {
    padding-top: 0;
}
.uiMenuItem {
    white-space: nowrap;
}
.uiMenuItem:hover ,.uiMenuItem:active ,.uiMenuItem:hover span ,.uiMenuItem:active span {
    background-color: #365899;
    border-color: #365899;
	color: #ffffff;
}

.FriendListCancel {
    position: relative;
}
.uiMenuItem .itemAnchor {
    border: solid #fff;
    border-width: 1px 0;
    color: #111;
    display: block;
    font-weight: normal;
    line-height: 16px;
    padding: 1px 16px 1px 22px;
    text-decoration: none;
}
.uiMenuItem .itemLabel {
    display: block;
    max-width: 300px;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.fsm {
    font-size: 12px;
}
	
.uiContextualLayerAboveLeft>.uiTooltipX, .uiContextualLayerAboveRight>.uiTooltipX, .uiContextualLayerAboveCenter>.uiTooltipX {
    margin-bottom: 1px;
    padding-bottom: 4px;
}
.uiTooltipX {
    max-width: 334px;
    word-wrap: break-word;
    position: relative;
    zoom: 1;
}

.uiTooltipX .tooltipContent {
    background-color: #282828;
    border-radius: 2px;
    color: #fff;
    font-size: 12px;
    line-height: 16px;
    padding: 6px 8px;
    text-align: left;
}

.accessible_elem {
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px, 1px, 1px, 1px);
    height: 1px;
    overflow: hidden;
    position: absolute;
    white-space: nowrap;
    width: 1px;
}
/*함께 아는 친구--*/
</style>
</head>

<body>
<div id="globalContainer" class="timelineLayout">
	<div class="clearfix" id="content" style="min-height: 100px;">
		<div id="mainContainer">
			<div id="contentCol" class="clearfix hasRightCol">
				<div id="contentArea" role="main">
					<div class="_5h60" id="pagelet_timeline_main_column">
						<div class="_5h60" id="pagelet_main_column_personal">
							<div class="_36d" id="timeline-medley">
								<div class="_2w3">
									<div class="_5h60 _30f" id="pagelet_timeline_medley_friends" style="min-height: 0px;">
										<div class="_3cz">
											<div class="clearfix">
												<h3 class="_3c- lfloat _ohe" id="medley_header_friends">
													<a class="_51sx" href="#">친구</a>
												</h3>
												<span class="_3d0" id="userfriendcnt" style="font-size: 16px;margin-left: -4px;">(208)</span>
												<div class="_6ph rfloat _ohf">
													<div class="uiTypeahead fbProfileBrowserTypeahead" id="u_fetchstream_14_28">
														<div class="wrap" style="width: fit-content;">
															<input type="hidden" autocomplete="off" class="hiddenInput">
															<div class="innerWrap">
																<span class="uiSearchInput textInput" id="u_fetchstream_14_29">
																	<span>
																		<input type="text" class="inputtext" maxlength="100" placeholder="친구 검색" autocomplete="off" spellcheck="false">
																		<button type="submit">검색</button>
																	</span>
																</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div id="collection_wrapper_2356318349" class="_3i9">
											<div class="_5h60 _30f" id="userfriendListf">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><%--
	<div class="uiContextualLayerPositioner uiLayer hidden_elem" style="width: 757px; top: 534px; opacity: 1; left: 541px;">
		<div class="uiContextualLayer uiContextualLayerBelowLeft" style="">
			<div class="uiTooltipX">
				<div class="tooltipContent" id="js_45">
					<span>함께 아는 친구</span>
					<div><span class="accessible_elem">&nbsp;</span>윤**</div>
					<div><span class="accessible_elem">&nbsp;</span>Mi**</div>
					<div><span class="accessible_elem">&nbsp;</span>길**</div>
					<div><span class="accessible_elem">&nbsp;</span>오**</div>
					<div><span class="accessible_elem">&nbsp;</span>Seo**</div>
					<div><span class="accessible_elem">&nbsp;</span>서**</div>
					<div><span class="accessible_elem">&nbsp;</span>Ki**</div>
					<div><span class="accessible_elem">&nbsp;</span>안**</div>
					<div><span class="accessible_elem">&nbsp;</span>배**</div>
					<div><span class="accessible_elem">&nbsp;</span>Su**</div>
					<div><span class="accessible_elem">&nbsp;</span>Ji**</div>
					<div><span class="accessible_elem">&nbsp;</span>이**</div>
					<div><span class="accessible_elem">&nbsp;</span>박**</div>
					<div><span class="accessible_elem">&nbsp;</span>임**</div>
					<div><span class="accessible_elem">&nbsp;</span>김**</div>
					<div><span class="accessible_elem">&nbsp;</span>외 3명...</div>
				</div>
			</div>
		</div>
	</div>
	<div class="uiContextualLayerPositioner _53ip uiLayer" id="js_2hq" style="width: 948px; left: 350px; top: 530px; opacity: 1;">
		<div class="uiContextualLayer uiContextualLayerBelowLeft" role="dialog">
			<div class="_5v-0 _53il">
				<div class="_53ij">
					<div class="mvs FlyoutFriendMenu addToListsClosed friendButtonFlyout" id="friendFlyoutContent">
						<div role="menu" class="uiMenu FriendListActionMenu" id="u_0_ad">
							<ul class="uiMenuInner">
								<li class="uiMenuItem FriendListUnfriend"><a class="itemAnchor" role="menuitem" href="#" rel="async-post"><span class="itemLabel fsm">친구 끊기</span></a></li>
								<li class="uiMenuItem FriendListCancel hidden_elem"><a class="itemAnchor" role="menuitem" href="#"><span class="itemLabel fsm">친구 요청 취소</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>--%>
</div>
<script type="text/javascript">
var pagefNo=1;
var totalPageF=1;
var blogNum=0;
var friendcnt=0;
$(function(){
	$(".FriendRequestOutgoing").mouseenter(function(){
		var fNum=$(this).attr("data-fnum");
		$(this).parent().append(flayout(fNum, 1));
		$(this).next().css("left", $(this).offset().left + 0);
		$(this).next().css("top", $(this).offset().left + 10);
		$(this).next().show();
	});
	$(".FriendRequestOutgoing").mouseleave(function(){
		$(this).next().remove();
	});
	$(".FriendRequestFriends").mouseenter(function(){
		var fNum=$(this).attr("data-fnum");
		$(this).parent().append(flayout(fNum, 2));
		$(this).next().css("left", $(this).offset().left + 0);
		$(this).next().css("top", $(this).offset().left + 10);
		$(this).next().show();
	});
	$(".FriendRequestFriends").mouseleave(function(){
		$(this).next().remove();
	});
	blogNum=Number("${blogNum}");
	readfcnt();
	listFPage(1, blogNum);
});
function readfcnt(){
	var url="<%=cp%>/duogram/deleteFReq";
	var q="blogNum="+blogNum;
	
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			if($('#userfriendcnt').length>0)
				$('#userfriendcnt').html(data.count);
			friendcnt=data.count;
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true)
		}
		,error:function(data){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText)
		}
	});
}
function listFPage(page, blogN) {
	var url="<%=cp%>/duogram/listF";
	var q="blogNum="+blogN+"&pageNo="+page;
	
	//AJAX:TEXT
	$.ajax({
		url:url
		,data:q
		,success:function(data){
			$("#userfriendListf").html(data);
			pagefNo=page;
			totalPageF=$("#total_Fpage").html();
			$("#total_Fpage").remove();
			userfriendList
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true)
		}
		,error:function(e){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText);
		}
	});
	console.log("친구리스트 로딩 완료");
}
function flayout(fnum, seri){
	var s="<div class='uiContextualLayerPositioner _53ip uiLayer' style='width: 948px; left: 350px; top: 530px; opacity: 1;display:none;'>";
	s+="<div class='uiContextualLayer uiContextualLayerBelowLeft'>";
	s+="<div class='_5v-0 _53il'>";
	s+="<div class='_53ij'>";
	s+="<div class='mvs FlyoutFriendMenu addToListsClosed friendButtonFlyout'>";
	s+="<div class='uiMenu FriendListActionMenu'>";
	s+="<ul class='uiMenuInner'>";
	if(seri==1||seri=='1'){
		s+="<li class='uiMenuItem FriendListCancel hidden_elem' onclick='freqcancle("+fnum+")'>";
		s+="<a class='itemAnchor' href=''><span class='itemLabel fsm'>친구 요청 취소</span></a></li>";
	}else if(seri==2||seri=='2'){
		s+="<li class='uiMenuItem FriendListUnfriend' onclick='fcancle("+fnum+")'>";
		s+="<a class='itemAnchor' href=''><span class='itemLabel fsm'>친구 끊기</span></a></li>";
	}
	s+="</ul>";
	s+="</div>";
	s+="</div>";
	s+="</div>";
	s+="</div>";
	s+="</div>";
	s+="</div>";
	return "s";
}
//친구요청하기
function ftof(fnum){
	insFReq(fnum);
	var s="<button class='_42ft _4jy0 FriendRequestOutgoing enableFriendListFlyout outgoingButton enableFriendListFlyout hidden_elem _4jy3 _517h _51sy' type='button'>친구 요청 전송됨</button>";
	var f="#friendBtn"+fnum;
	$(f).html(s);
}
function freqcancle(fnum){
	var url="<%=cp%>/duogram/deleteFReq";
	var q="friendNum="+fnum;
	
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			listFPage(1);
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true)
		}
		,error:function(data){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText)
		}
	});
}
function fcancle(fnum){
	var url="<%=cp%>/duogram/deleteFreind";
	var q="friendNum="+fnum;
	
	//AJAX:JSON
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			listFPage(1);
		}
		,beforeSend:function(e){
			e.setRequestHeader("AJAX", true)
		}
		,error:function(data){
			if(e.status==403){
				location.href='<%=cp%>/member/login';
				return;
			}
			console.log(e.responseText)
		}
	});
}
</script>