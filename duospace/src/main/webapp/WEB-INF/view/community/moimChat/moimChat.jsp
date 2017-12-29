<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
	String wsURL = "ws://"+request.getServerName()+":"+request.getServerPort()+cp+"/echo.msg";
%>

<style type="text/css">
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
._1p1t {
    color: #cccccc;
    position: absolute;
    z-index: 1;
	right:60px;
	bottom: 0;
	text-align: right;
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
.ids{
	color: #90949c;
    display: block;
    font-size: 12px;
    padding-top: 2px;
    position: absolute;
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
.etcbox{
	font-size: 10px;
	font-weight: bold;
	opacity:0.5;
	margin: 2px 0px;
	color: rgb(75, 79, 86);
	clear: right;
    float: right;
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
</style>
<script type="text/javascript">
var first=1;
var mcNum=0;
var lastData=0;
var mpage=1;
var mtotalpage=1;
$(function() {
	listmoimchat(0);
	first=0;
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
	    obj.cmoimCode="${cmoimCode}";
	    obj.memberId="${sessionScope.user.userId}";
	    jsonStr = JSON.stringify(obj); 
	    socket.send(jsonStr);
	    console.log("chat connected.");
	}
	
	function onClose(evt) {
		console.log('Info: WebSocket error.');
	}
	
	function onMessage(evt) {
    	var data=JSON.parse(evt.data);
    	var type = data.type;

    	console.log(data.message);
    	if(type=="mtalk") {
    		talkProcerss(data);
    	} else if(type=="mread") {
    		<%--if($(".unreadfm").length>0)
    			$(".unreadfm").remove();--%>
    		for(var vo in data.list){
	    		if($("#MCList div[data-urm="+vo.mchatNum+"]").length){
	    			$("#MCList div[data-urm="+vo.mchatNum+"]").html(vo.unReadCnt);
		    		if(Number($("#MCList div[data-urm="+vo.mchatNum+"]").html())==0)
		    			$("#MCList div[data-urm="+vo.mchatNum+"]").remove();
	    		}
    		}
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
            $('._1p1t').html($('#chatinputstream').val().length+'/'+tot);
        }else{
			$('._1p1t').html('');
		}
    	$(this).height(1).height($(this).prop('scrollHeight')-6);
    });
	
	$("#chatsend").on("click",function sendMessage() {
		var msg=$("#chatinputstream").val().trim().replace(/\n/g,"<br>");

		if(! msg.length>0) {
			$("#chatinputstream").focus();
			return;
		}
		
        var obj = {};
        var jsonStr;
        obj.type="mtalk";
        obj.cmd="chatMsg";
        obj.message=msg;
        jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);
        
        $("#chatinputstream").val("");
	});
	
	function talkProcerss(data) {
		var cmd=data.cmd;
		
		if(cmd=="join-list") {
			var memberList=data.memberList;
			for(var i in memberList){
				memberCard(memberList[i]);
			}
		} else if(cmd=="join-add") {
			memberCard(data);
		} else if(cmd=="chatMsg") {
			writeToScreen(data);
			
		} else if(cmd=="leave") {
			var memberNum=data.memberNum;
    		console.log("접속삭제")
			$("#MCList li[data-memberNum="+memberNum+"]").remove();
		}
	}
	$("#dgchatcontent").scrollTop($("#dgchatcontent").prop("scrollHeight"));
    $('#scrollmess').scroll(function() {
	    if ($('#scrollmess').scrollTop()<=50) {
	    	if(lastData>0) {
	    		listmoimchat(mcNum);
	    	}else if(lastData==0){
	    		$('#dgchatcontent').prepend("<time><span>더 이상 메시지가 없습니다.</span></time>");
	    		lastData--;
	    	}
	    }
	});
});

function writeToScreen(data) {
	var msg=data.content;
	var memberNum=data.memberNum;
	var name=data.name;
	var profile=data.profile;
	var unReadCnt=data.unReadCnt;
	var mchatNum=data.mchatNum;
	var sendDate=data.sendDate;
	var profile=data.profile;
	var out='';
	if(memberNum=="${sessionScope.user.memberNum}") {
		out+="<div class='contentBox _ua0' id='mess"+mchatNum+"' data-mcNum='"+mchatNum+"' data-mNum='"+memberNum+"'>";
		out+="<div class='content _my'>";
		out+="<div class='etcbox _ua0' style='width:100%;text-align: right;'>"+sendDate+"</div>";
		out+="<div class='myCon'>";
		out+="<div class='textbox _mycolor' style='padding: 5px 8px 5px;'>";
		out+="<span>"+msg+"</span>";
		out+="</div>";
		out+="</div>";
		out+="<div>";
		out+="<div class='etcbox _ua0' style='text-align:right; cursor: pointer;width: 10px;visibility: hidden;' data-num='dMess("+mchatNum+")'>X</div>";
		if(unReadCnt!=0){
			out+="<div class='etcbox _ua0 unreadfm' style='text-align:right;' data-urm='"+mchatNum+"'>"+unReadCnt+"</div>";
		}
		out+="</div>";
		out+="</div>";
		out+="</div>";
	} else {
		out+="<div class='contentBox _ua1' id='mess"+mchatNum+"' data-mcNum='"+mchatNum+"' data-mNum='"+memberNum+"'>";
		out+="<div class='friendProfile' id='dgchatPS'>";
		out+="<a class='friendLink' href='<%=cp%>/duogram/"+memberNum+"'>";
		if(! profile){
			out+="<img style='background-color: #eeeeee' src='<%=cp%>/resource/images/duogram/person-1701091912.png'>";
		}else{
			out+="<img style='background-color: #eeeeee' src='<%=cp%>/resource/images/duogram/"+memberNum+"/"+profile+"'>";
		}
		out+="</a>";
		out+="</div>";
		out+="<div class='content'>";
		out+="<div class='etcbox _ua1' style='width:100%'>"+sendDate+"</div>";
		out+="<div class='etcbox _ua1' style='width:100%;opacity: 1;'>"+name+"</div>";
		out+="<div class='friendCon'>";
		out+="<div class='textbox' style='padding: 5px 8px 5px;'>";
		out+="<span>"+msg+"</span>";
		out+="</div>";
		out+="</div>";
		out+="<div style='margin-left:8px;'>";
		out+="<div class='etcbox _ua1' style='cursor: pointer;width: 10px;visibility: hidden;' data-num='dMess("+mchatNum+")'>X</div>";
		if(unReadCnt!=0){
			out+="<div class='etcbox _ua0 unreadfm' style='text-align:right;' data-urm='"+mchatNum+"'>"+unReadCnt+"</div>";
		}
		out+="</div>";
		out+="</div>";
		out+="</div>";
	}
	if(data.cmd=="chatMsg")
    	$("#dgchatcontent").append(out);
	else
		$("#dgchatcontent").prepend(out);
    // 스크롤을 최상단에 있도록 설정
    $("#scrollmess").scrollTop($("#scrollmess").prop("scrollHeight"));

}

function memberCard(data) {
	var memberId=data.memberId;
	var memberName=data.name;
	var memberNum=data.memberNum;
	var profile=data.profile;
	if($("#MCList li[data-memberNum="+memberNum+"]").length) return;
	var s='';
	s+="<li class='objectListItem messegeContainer' data-memberNum="+memberNum+">";
	s+="<div class='clearfix' style='zoom: 1;'>";
	s+="<div class='objectListItem_profile' style='float: left;margin-right: 8px;'>";
    if(! profile){
    	s+="<img style='width:50px; height: 50px; margin: -1px;' src='<%=cp%>/resource/images/duogram/person-1701091912.png'>";
    }else{
    	s+="<img style='width:50px; height: 50px; margin: -1px;' src='<%=cp%>/resource/images/duogram/"+memberNum+"/"+profile+"'>";
    }
    s+="</div>";
    s+="<div style='margin: -1px 0;'>";
    s+="<div class='clearfix' style='overflow: hidden;zoom: 1;'>";
    s+="<div class='author'>";
    s+="<strong>"+memberName+"</strong><br>";
    s+="<div class='ids'>"+memberId+"</div>";							
    s+="</div>";
    s+="</div>";
  	s+="</div>";
 	s+="</div>";
	s+="</li>";
	$("#MCList").append(s);
}

function listmoimchat(num){
	var url="<%=cp%>/moim/listmChat";
	var q="cmoimCode="+${cmoimCode}+"&mchatNum="+num;
	if(first==1)
		q+="&first=1";
	else{
		q+="&first=0";
	}
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data){
			var list=data.list;
			console.log(list);
			mcNum=$('#dgchatcontent').find("div:first").attr("data-mchatNum");
			lastData=data.lastData
			for(var i in list){ 
				writeToScreen(list[i]);
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
}

</script>
<div id="moimchatsam" style="width: 240px;height:auto;float: left;margin-left: 20px;margin-bottom: 12px;background: #ffffff;">
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
					<button type="button" id="chatsend" style="width:auto;right:-15px;position:relative;border-radius:5px;border:1px solid #777777;padding: 0 3px;">보내기</button>
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
</div>