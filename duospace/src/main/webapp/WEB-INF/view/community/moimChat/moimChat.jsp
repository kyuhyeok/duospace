<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
	String wsURL = "ws://"+request.getServerName()+":"+request.getServerPort()+cp+"/chat.msg";
%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.b{
	background-color:grey;height:1000px;width:500px;
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
.haderAndchatListAndScroll{
	position: relative;
	display: flex;
    flex-direction: column;
    height: 308px;
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
    padding: 6px 8px 6px;
    position: relative;
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
.chattitle{
	height: 34px;border-bottom: 1px solid #dddfe2;background-color:#f0f0f0
}
.objectListItem {
    padding-bottom: 8px;
    padding-top: 8px;
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
.clearfix:after {
    clear: both;
    content: ".";
    display: block;
    font-size: 0;
    height: 0;
    line-height: 0;
    visibility: hidden;
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
ul{
	list-style-type: none;
	margin: 0;
	padding: 0;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
#fMCList li:first-child{
    border-top: none;
}
._4kslfm>li {
    border-color: #dddfe2;
    border-style: solid;
}

._4kglfm>li {
    border-width: 0 0 1px 0;
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
.uiScrollableArealfm {
    direction: ltr;
    height: 100%;
    overflow: hidden;
    position: relative;
}
.id{
	color: #90949c;
    display: block;
    font-size: 12px;
    padding-top: 2px;
    position: absolute;
}
</style>
<script type="text/javascript">
$(function() {
	var socket=null;
	var host="<%=wsURL%>";
	
	if ('WebSocket' in window) {
		socket = new WebSocket(host);
    } else if ('MozWebSocket' in window) {
    	socket = new MozWebSocket(host);
    } else {
    	console.log('Your browser does not support WebSockets');
        return false;
    }

	socket.onopen = function(evt) { onOpen(evt) };
	socket.onclose = function(evt) { onClose(evt) };
	socket.onmessage = function(evt) { onMessage(evt) };
	socket.onerror = function(evt) { onError(evt) };
	
	function onOpen(evt) {
	    var obj = {};
	    var jsonStr;
	    obj.type="mconn";
	    obj.memberNum="${sessionScope.user.memberNum}";
	    obj.cmoinCode="${cmoinCode}";
	    obj.memberName="${sessionScope.user.userName}";
	    obj.memberId="${sessionScope.user.userId}";
	    jsonStr = JSON.stringify(obj); 
	    socket.send(jsonStr);
	    console.log("소켓로딩");
	    console.log("connected.");
	}
	
	function onClose(evt) {
		console.log('Info: WebSocket error.');
	}
	
	function onMessage(evt) {
    	var data=JSON.parse(evt.data);
    	var type = data.type;
    	
    	if(type=="mtalk") {
    		talkProcerss(data);
    	} else if(type=="mread") {
    		if($(".unreadfm").length>0)
    			$(".unreadfm").remove();
    	}
	}

	function onError(evt) {
	}
	
	$('#chatinputstream').on('keydown', function(key) {
    	var tot=100;
		if($(this).val().length > tot) {
			$(this).val($(this).val().substring(0, tot));
		}
    	if($(this).val().length > 0) {
            $('#chatinputstream').html($('#chatinputstream').val().length+'/'+tot);
        }else{
			$('#chatinputstream').html('');
		}
    	$(this).height(1).height($(this).prop('scrollHeight')-6);
    	console.log("메시지 입력 제한 로드");
    });
	
	function sendMessage() {
		var msg=$("#chatinputstream").val().trim();
		console.log("보낼 메시지:"+msg);
		if(! msg.length>0) {
			console.log("메시지 길이"+msg.length);
			$("#chatinputstream").focus();
			return;
		}
		if(friendNum==0) return;
		
		console.log("보낼 준비");
        var obj = {};
        var jsonStr;
        obj.type="mtalk";
        obj.cmd="chatMsg";
        obj.message=msg;
        jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);
		console.log("메시지 보내기")
        
        $("#chatinputstream").val("");
	}
	
	function talkProcerss(data) {
		var cmd=data.cmd;
		
		if(cmd=="join-list") {
			var memberList=data.memberList;
			$.each(memberList, function(index, value){
				var a=value.split(":");
				memberCard(a[0], a[1], a[2], a[3]);
			});
		} else if(cmd=="join-add") {
			var memberId=data.memberId;
			var memberName=data.memberName;
			var memberNum=data.memberNum;
			var profile=data.profile;
			memberCard(memberName, memberId, memberNum, profile);
		} else if(cmd=="chatMsg") {
			var msg=data.message;
			var memberNum=data.memberNum;
			var memberName=data.memberName;
			
			writeToScreen(msg);
			
		} else if(cmd=="leave") {
			var memberNum=data.memberNum;
    		
			$("#MCList li[data-memberNum="+memberNum+"]").remove();
		}
		
	}
	$("#dgchatcontent").scrollTop($("#dgchatcontent").prop("scrollHeight"));
    $('#scrollmess').scroll(function() {
	    if ($('#scrollmess').scrollTop()<=50) {
	    	if(lastData>0) {
	    		listFMCon(friendNum, fMNum);
	    	}else if(lastData==0){
	    		$('#dgchatcontent').prepend("<time><span>더 이상 메시지가 없습니다.</span></time>");
	    		lastData--;
	    	}
	    }
	});
});

function writeToScreen(message) {
    var $chatContainer = $("#chatMsgContainer");
    $chatContainer.append("<p>");
    $chatContainer.find("p:last").css("wordWrap","break-word"); // 강제로 끊어서 줄 바꿈
    $chatContainer.find("p:last").html(message);

    while ($chatContainer.find("p").length > 50) {
    	$chatContainer.find("p:first").remove();
	}
}

function writeToScreenlist(message) {
    var $chatContainer = $("#chatMsgContainer");
    $chatContainer.append("<p>");
    $chatContainer.find("p:last").css("wordWrap","break-word"); // 강제로 끊어서 줄 바꿈
    $chatContainer.find("p:last").html(message);

    while ($chatContainer.find("p").length > 50) {
    	$chatContainer.find("p:first").remove();
	}
}

function memberCard(memberName, memberId, memberNum, profile) {
	var s='';
	s+="<li class="objectListItem messegeContainer" data-memberNum="${vo.friendNum}">";
	s+="<div class="clearfix" style="zoom: 1;">";
	s+="<div class="objectListItem_profile" style="float: left;margin-right: 8px;">";
    if(profile==''){
    	s+="<img style='width:50px; height: 50px; margin: -1px;' src='<%=cp%>/resource/images/duogram/person-1701091912.png'>";
    }else{
    	s+="<img style='width:50px; height: 50px; margin: -1px;' src='<%=cp%>/resource/images/duogram/"+memberNum+"/"+profile+"'>";
    }
    s+="</div>";
    s+="<div style='margin: -1px 0;'>";
    s+="<div class='clearfix' style='overflow: hidden;zoom: 1;'>";
    s+="<div class='author'>";
    s+="<strong>"+memberName+"</strong><br>";
    s+="<div class='id'>"+memberId+"</div>";							
    s+="</div>";
    s+="</div>";
  	s+="</div>";
 	s+="</div>";
	s+="</li>";
	$("#MCList").append(s);
}

function listmoimchat(cmoim){
	var url="<%=cp%>/duogram/listFMess";
	var q="cmoimCode="+cmoim;
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			var memberList=data.memberList;
			var me="${sessionScope.user.memberNum}";
			$.each(memberList, function(index, value){
				var a=value.split(":");
				var s='';
				if(a[2]==me)
					s+="<div class='chatcontentbox _my' data-memberNum='"+a[2]+"'>"+a[0]+"("+a[1]+")</div>";
				else{
					s+="<div class='chatcontentbox _other' data-memberNum='"+a[2]+"'>"+a[0]+"("+a[1]+")</div>";
				}
				$("#chatRoomJoinList").prepend(s);
			});
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

</script><div class="b">
<div style="width: 240px;height:auto;float: left;margin-left: 20px;margin-bottom: 12px;background: #ffffff;">
	<div class="chattitle">
		<div align="left" style="width: 110px; float: left; margin-top: 5px;margin-left: 10px;">모임채팅</div>
	</div>
 		<div class="haderAndchatListAndScroll">
        <div style="display: flex;flex-grow: 1;flex-shrink: 1;background: #ffffff;overflow: hidden;">
            <div class="scrollable" id="scrollmess">
                <div class="haderAndchatcontent">
                    <table class="haderAndchatList">
                        <tbody>
                            <tr style="border: 0;border-collapse: collapse;border-spacing: 0;">
                                <td style="padding: 0;vertical-align: bottom;">
                                    <div id="dgchatcontent" style="width:100%;">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="dgFlaoutFooter" style="border-bottom: 1px solid #dddfe2;">
          <div class="_552h">
            <div class="_5rp7 _5rp8">
				<div class="_5rpb" style="float:left">
                    <div class="_1p1t" style="white-space: pre-wrap;user-select: none" id="placeholder_chat"></div>
                    <textarea id="chatinputstream" placeholder="메시지를 입력하세요..."></textarea>
                </div>
                <div style="float:left">
					<button type="button" style="width:auto;right:-15px;position:relative;" onclick="sendMessage();">보내기</button>
	            </div>
            </div>
      	</div>
      	</div>
	</div>
	<div class="chattitle">
    	<div align="left" style="width: 110px; float: left; margin-top: 5px;margin-left: 10px;">접속멤버</div>
	</div>
	<div class="uiScrollableArealfm" style="min-height:100px; max-height: 300px;">
		<div class="uiScrollableAreaWraplfm" id="dglfmScroll">
			<div class="uiScrollableAreaBodylfm" id="dglfmDoc" style="width: 240px;">
				<div class="uiScrollableAreaContentlfm" >
					<div style="padding-top: 0;">
						<ul class="_4kglfm _4kslfm" id="MCList">
	               		</ul>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div></div>