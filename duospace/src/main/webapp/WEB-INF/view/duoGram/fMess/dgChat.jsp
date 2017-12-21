<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
	String wsURL = "ws://"+request.getServerName()+":"+request.getServerPort()+cp+"/echo.msg";
%>
<script type="text/javascript">
$(function(){
    uNum = "${sessionScope.user.memberNum}";
    if(! uNum) {
    	location.href="<%=cp%>/member/login";
    	return;
    }

	<%--var socket=null; var host="<%=wsURL%>";--%>
	socket=null;
	host="<%=wsURL%>";
	
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
	    obj.type="conn";
	    obj.senderNum=uNum;
	    friendNum="${friendNum}";
	    if(friendNum==0) return;
	    obj.receiveNum=friendNum;
	    jsonStr = JSON.stringify(obj);  
	    socket.send(jsonStr);
		console.log("소켓로딩");
	    console.log(uNum+":"+friendNum+' is connected.');
	}

	function onClose(evt) {
		console.log('Info: WebSocket error.');
	}

	function onMessage(evt) {
    	var data=JSON.parse(evt.data); 
    	var type = data.type;
    	
    	if(type=="talk") {
    		writeToScreen(data);
    	} else if(type=="read"){
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
            $('._1p1t').html($('#chatinputstream').val().length+'/'+tot);
        }else{
			$('._1p1t').html('');
		}
    	$(this).height(1).height($(this).prop('scrollHeight')-6);
    	console.log("메시지 입력 제한 로드");
    	if (event.keyCode == 13) {
	    	  console.log("엔터 인식");
	          sendMessage();
	          return false;
	      }
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
        obj.type="talk";
        obj.message=msg;
        jsonStr = JSON.stringify(obj);
        socket.send(jsonStr);
		console.log("메시지 보내기")
        
        $("#chatinputstream").val("");
	}
	$('.chatclosebtn').on('click', function(){
		$('#dgChatTabFlyout').hide();
		console.log("채팅방 닫기 로딩");
		dchatcl();
	});
	//메시지 무한 스크롤
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

function writeToScreen(vo) {
	var out='';
	if(vo.senderNum=="${sessionScope.user.memberNum}") {
		out+="<div class='contentBox _ua0' id='mess"+vo.num+"' data-fmNum='"+vo.num+"'>";
		out+="<div class='content _my'>";
		out+="<div class='etcbox _ua0' style='width:100%;text-align: right;'>"+vo.sendDate+"</div>";
		out+="<div class='myCon'>";
		out+="<div class='textbox _mycolor' style='padding: 5px 8px 5px;'>";
		out+="<span>"+vo.content+"</span>";
		out+="</div>";
		out+="</div>";
		out+="<div>";
		out+="<div class='etcbox _ua0' style='text-align:right; cursor: pointer;width: 10px;' onclick='dMess("+vo.num+")'>X</div>";
		if(vo.read=='0'){
			out+="<div class='etcbox _ua0 unreadfm' style='text-align:right;'>안읽음</div>";
		}
		out+="</div>";
		out+="</div>";
		out+="</div>";
	} else {
		out+="<div class='contentBox _ua1' id='mess"+vo.num+"' data-fmNum='"+vo.num+"'>";
		out+="<div class='friendProfile' id='dgchatPS'>";
		out+="<a class='friendLink' href='<%=cp%>/duogram/"+senderNum+"'>";
		if(vo.proFileSaveFileName==''){
			out+="<img style='background-color: #eeeeee' src='<%=cp%>/resource/images/duogram/person-1701091912.png'>";
		}else{
			out+="<img style='background-color: #eeeeee' src='<%=cp%>/resource/images/duogram/"+vo.senderNum+"/"+vo.proFileSaveFileName+"'>";
		}
		out+="</a>";
		out+="</div>";
		out+="<div class='content'>";
		out+="<div class='etcbox _ua1' style='width:100%'>"+vo.sendDate+"</div>";
		out+="<div class='friendCon'>";
		out+="<div class='textbox' style='padding: 5px 8px 5px;'>";
		out+="<span>"+vo.message+"</span>";
		out+="</div>";
		out+="</div>";
		out+="<div style='margin-left:8px;'>";
		out+="<div class='etcbox _ua1' style='cursor: pointer;width: 10px;' onclick='dMess("+vo.num+")'>X</div>";
		out+="</div>";
		out+="</div>";
		out+="</div>";
	}
    $("#dgchatcontent").append(out);

    // 스크롤을 최상단에 있도록 설정
    $("#scrollmess").scrollTop($("#scrollmess").prop("scrollHeight"));
}
</script>
<div class="dgFlyoutInner">
	<!-- Title bar -->
	<div class="clearfix dgFlyoutTitlebar">
		<div class="titlebarcontent">
			<div class="chatFlyoutTitle" id="chatFlyoutTitle">
				<a class="dgfmtitlebarText" href="<%=cp%>/duogram/${friendNum}" data-fmnum="${friendNum}">${name}</a>
			</div>
			<ul class="dgChatTabClose">
				<li>
					<div class="chatclosebtn" aria-label="클릭하면 창이 닫힙니다.">X</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- /Title bar -->
	<!-- 바디 -->
	<div class="haderAndchatListAndScroll">
		<div style="display: flex;flex-grow: 1;flex-shrink: 1;background: #ffffff;overflow: hidden; border-bottom: 1px solid #dddddd">
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
		<!-- 입력 -->
		<div class="dgFlaoutFooter">
			<div class="_552h">
				<div class="_5rp7 _5rp8">
					<div class="_5rpb">
						<div class="_1p1t" style="white-space: pre-wrap;user-select: none" id="placeholder_chat"></div>
						<textarea id="chatinputstream" placeholder="메시지를 입력하세요..."></textarea>
					</div>
				</div>
			</div>
		</div>
		<!-- /입력 -->
	</div>
	<!-- /바디 -->
</div>
