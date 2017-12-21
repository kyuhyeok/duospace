package com.duospace.duogram.fmess;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.duospace.community.moimchat.CmoimInfo;
import com.duospace.community.moimchat.MemberInfo;
import com.duospace.member.MemberService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class MySocketHandler extends TextWebSocketHandler {
	private final Logger logger=LoggerFactory.getLogger(MySocketHandler.class);
	private Map<String, WebSocketSession> chatUserMap = new Hashtable<>();
	
	private Map<String, MemberInfo> memberMap = new Hashtable<>();
	
	private Map<String, CmoimInfo> cmoimMap = new Hashtable<>();
	@Autowired
	private FMessService fms;
	
	@Autowired
	private MemberService ms;
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		removeUser(session);
		removemUser(session);
		this.logger.info("remove session id: " + session.getId());
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		logger.info("add session id: "+session.getId()+", ip: "
				+session.getRemoteAddress().getHostName());
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		JSONObject jsonReceive = (JSONObject) JSONSerializer.toJSON(message.getPayload());
		String type=jsonReceive.getString("type");
		if(type==null) return;
		
		if(type.equals("conn")) {
			connectServer(session, jsonReceive);
			updateReadm(session, jsonReceive);
		} else if(type.equals("talk")) {
			receiveTalk(session, jsonReceive);
		} else if(type.equals("close")) {
			removeUser(session);
		} else if(type.equals("mconn")) {
			connectServerm(session, jsonReceive);
			updateReadmm(session, jsonReceive);
		} else if(type.equals("mtalk")) {
			receivemTalk(session, jsonReceive);
		}
	}

	/*
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg=message.getPayload();
	}
	*/
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// this.logger.error("web socket error!", exception);
		// removeGuest(session);
	}
	
	protected void connectServer(WebSocketSession session, JSONObject jsonReceive) {
		try {
			String senderNum = jsonReceive.getString("senderNum");
			String receiveNum = jsonReceive.getString("receiveNum");
			chatUserMap.put(senderNum+"-"+receiveNum, session);
		} catch (Exception e) {
			this.logger.info(e.toString());
		}
	}
	
	protected void updateReadm(WebSocketSession session, JSONObject jsonReceive) {
		try {
			String senderNum = jsonReceive.getString("senderNum");
			String receiveNum = jsonReceive.getString("receiveNum");
			
			Map<String, Object> map=new HashMap<>();
			map.put("memberNum", Integer.parseInt(receiveNum));
			map.put("friendNum", Integer.parseInt(senderNum));
			map.put("num", 0);
			int result=fms.updateReadDate(map);
			if(result==0) return;
			
			JSONObject job=new JSONObject();
			if(chatUserMap.get(receiveNum+"-"+senderNum)==null)	return;
			
			job.put("type", "read");
			sendOneMessage(job.toString(), chatUserMap.get(receiveNum+"-"+senderNum));
		} catch (Exception e) {
			this.logger.info(e.toString());
		}
	}
	
	protected void receiveTalk(WebSocketSession session, JSONObject jsonReceive) {
		String[] userNum=getUserNum(session).split("-");
		String senderNum=userNum[0];
		String receiveNum=userNum[1];
		if(senderNum==null || receiveNum==null) return;

		JSONObject job;
		FMess dto=null;
		try {
			String msg=jsonReceive.getString("message");

			if(msg==null) return;
			
			dto=new FMess();
			dto.setMemberNum(Integer.parseInt(senderNum));
			dto.setFriendNum(Integer.parseInt(receiveNum));
			dto.setContent(msg);
			int result=fms.insertFMess(dto);
			if(result!=1) return;
			
			Map<String, Object> map=new HashMap<>();
			map.put("memberNum", dto.getMemberNum());
			map.put("friendNum", dto.getFriendNum());
			map.put("num", 0);
			dto=fms.readFMess(map);
			
			job=new JSONObject();
			job.put("type", "talk");
			job.put("senderNum", dto.getMemberNum());
			job.put("num", dto.getNum());
			job.put("sendDate", dto.getSendDate());
			job.put("content", dto.getContent());
			job.put("proFileSaveFileName", dto.getProFileSaveFileName());
			
			if(chatUserMap.get(receiveNum+"-"+senderNum)==null) {
				job.put("read", 0);
				sendOneMessage(job.toString(), chatUserMap.get(senderNum+"-"+receiveNum));
				return;
			}
			
			fms.updateReadDate(map);
			job.put("read", 1);
			sendOneMessage(job.toString(), chatUserMap.get(receiveNum+"-"+senderNum));
			sendOneMessage(job.toString(), chatUserMap.get(senderNum+"-"+receiveNum));
		} catch (Exception e) {
			this.logger.info(e.toString());
		}
	}
	
	protected void sendOneMessage(String message, WebSocketSession session) {
		if (session.isOpen()) {
			try {
				session.sendMessage(new TextMessage(message));
			} catch (Exception e) {
				this.logger.error("fail to send message - one : ", e);
			}
		}
	}

	protected String getUserNum(WebSocketSession session) {
		String userNum=null;
		Iterator<String> it = chatUserMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			if(chatUserMap.get(key)==session) {
				userNum=key;
				break;
			}
		}
		return userNum;
	}
	
	protected void removeUser(WebSocketSession session) {
		String userNum=getUserNum(session);
		if(userNum==null) return;
		if(chatUserMap.get(userNum)==null) return;
		try {
			chatUserMap.get(userNum).close();
			chatUserMap.remove(userNum);
		} catch (Exception e) {
			logger.info("removeGuest => " + e.toString());
		}

	}
	
	protected void connectServerm(WebSocketSession session, JSONObject jsonReceive) {
		JSONObject job;
		
		try {
			String memberNum = jsonReceive.getString("memberNum");
			String memberName = jsonReceive.getString("memberName");
			String memberId = jsonReceive.getString("memberId");
			if(memberNum==null) return;
			
			MemberInfo memberInfo=new MemberInfo();
			memberInfo.setSession(session);
			memberInfo.setMemberName(memberName);
			memberInfo.setMemberId(memberId);
			
			String cmoimCode = jsonReceive.getString("cmoimCode");
			
			CmoimInfo cmoimInfo = null;
			
			if(cmoimMap.get(cmoimCode)==null) {
				cmoimInfo=new CmoimInfo();
				cmoimInfo.getMemberSet().add(memberNum);
				cmoimInfo.setCmoimCode(cmoimCode);
				cmoimMap.put(cmoimCode, cmoimInfo);
			}else {
				cmoimInfo=cmoimMap.get(cmoimCode);
				cmoimInfo.getMemberSet().add(memberNum);
			}
			memberInfo.setCmoim(cmoimInfo);
			memberMap.put(memberNum, memberInfo);
			
			List<String> list=new ArrayList<>();
			for(String m:cmoimInfo.getMemberSet()) {
				if(memberMap.get(m)==null) continue;
				
				if(m.equals(memberNum)) continue;
				
				String name=memberMap.get(m).getMemberName();
				String id=memberMap.get(m).getMemberId();
				String p=ms.readMember(id).getProfile();
				list.add(name+":"+id+":"+m+":"+p);
			}
			job=new JSONObject();
			job.put("type", "mtalk");
			job.put("cmd", "join-list");
			JSONArray jarr=new JSONArray();
			jarr.addAll(list);
			job.put("memberList", jarr);
			
			sendOneMessage(job.toString(), session);
			
			job=new JSONObject();
			job.put("type", "mtalk");
			job.put("cmd", "join-add");
			job.put("memberId", memberId);
			job.put("memberName", memberName);
			job.put("memberNum", memberNum);
			job.put("profile", ms.readMember(memberId).getProfile());
			sendMoimMessage(job.toString(),  cmoimInfo.getMemberSet(), memberNum);
		} catch (Exception e) {
			this.logger.info(e.toString());
		}
	}
	
	protected void sendMoimMessage(String message, Set<String> cmoimSet, String out) {
		Iterator<String> it = cmoimSet.iterator();
		while (it.hasNext()) {
			String key=it.next();
			if(out!=null && out.equals(key))  // 자기 자신
				continue;
			
			MemberInfo memberInfo=memberMap.get(key);
			WebSocketSession session=memberInfo.getSession();

			try {
				if (session.isOpen()) {
					session.sendMessage(new TextMessage(message));
				}
			} catch (IOException e) {
				this.logger.error("fail to send message - room : ", e);
				removemUser(session);
			}			
		}
	}
	
	protected void updateReadmm(WebSocketSession session, JSONObject jsonReceive) {
		try {/*
			String senderNum = jsonReceive.getString("senderNum");
			String receiveNum = jsonReceive.getString("receiveNum");
			
			Map<String, Object> map=new HashMap<>();
			map.put("memberNum", Integer.parseInt(receiveNum));
			map.put("friendNum", Integer.parseInt(senderNum));
			map.put("num", 0);
			int result=fms.updateReadDate(map);
			if(result==0) return;
			
			JSONObject job=new JSONObject();
			if(chatMoimMap.get(receiveNum+"*"+senderNum)==null)	return;
			
			job.put("type", "read");
			sendOneMessage(job.toString(), chatMoimMap.get(receiveNum+"-"+senderNum));
			*/
		} catch (Exception e) {
			this.logger.info(e.toString());
		}
	}
	
	protected void receivemTalk(WebSocketSession session, JSONObject jsonReceive) {
		String cmd=jsonReceive.getString("cmd");
		String memberNum=getUserNum(session);
		String memberName=memberMap.get(memberNum).getMemberName();
		if(cmd==null||memberNum==null) return;
		
		MemberInfo memberInfo=memberMap.get(memberNum);
		if(memberInfo==null) return;
		
		CmoimInfo cmoimInfo=memberMap.get(memberNum).getCmoim();
		if(cmoimInfo==null) return;

		JSONObject job;
		try {
			if(cmd.equals("chatMsg")) {
				String msg=jsonReceive.getString("message");
				
				if(msg==null) return;
				
				job=new JSONObject();
				job.put("type", "talk");
				job.put("cmd", "chatMsg");
				job.put("memberNum", memberNum);
				job.put("memberName", memberName);
				job.put("message", msg);
				
				String out=null;
				sendMoimMessage(job.toString(), cmoimInfo.getMemberSet(), out);
			} 
		} catch (Exception e) {
			this.logger.info(e.toString());
		}
	}
	
	protected String getUsermNum(WebSocketSession session) {
		String userNum=null;
		Iterator<String> it = memberMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			MemberInfo memberInfo=memberMap.get(key);
			if(memberInfo.getSession()==session) {
				userNum=key;
				break;
			}
		}
		return userNum;
	}

	protected void removemUser(WebSocketSession session) {
		JSONObject job;
		
		String memberNum=getUsermNum(session);
		if(memberNum==null) return;
		
		MemberInfo memberInfo=memberMap.get(memberNum);
		if(memberInfo==null) return;
		CmoimInfo cmoimInfo=memberInfo.getCmoim();
		String cmoimCode=cmoimInfo.getCmoimCode();
		
		try {
			int cnt=0;
			for(String m:cmoimInfo.getMemberSet()) {
				if(memberMap.get(m)==null) continue;
				cnt++;
			}
			
			if(cnt==0) {
				cmoimMap.remove(cmoimCode);
			} else {
				if(cmoimInfo!=null) {
					job=new JSONObject();
					job.put("type", "talk"); 
					job.put("cmd", "leave"); 
					job.put("memberNum", memberNum);
					sendMoimMessage(job.toString(),  cmoimInfo.getMemberSet(), memberNum);
					
					cmoimInfo.getMemberSet().remove(memberNum);
				}
			}
			
			try {
				memberInfo.getSession().close();
			} catch (Exception e) {
			}
			
			memberMap.remove(memberNum);
			
		} catch (Exception e) {
			logger.info("removeGuest => " + e.toString());
		}

	}
}
