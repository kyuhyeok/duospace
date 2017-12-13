package com.duospace.duogram.socket;

import java.util.Calendar;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.duospace.duogram.socket.MySocketHandler;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class MySocketHandler extends TextWebSocketHandler {
	private final Logger logger=LoggerFactory.getLogger(MySocketHandler.class);

	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();

	public MySocketHandler() {
		super();
		this.logger.info("create SocketHandler instance!");
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);

		sessionSet.remove(session);
		this.logger.info("remove session!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);

		sessionSet.add(session);

		this.logger.info("add session id : " + session.getId());
		this.logger.info("연결 ip : " + session.getRemoteAddress().getHostName());
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);

		this.logger.info("receive message : " + message.getPayload());

		JSONObject jsonReceive = (JSONObject) JSONSerializer.toJSON(message.getPayload());
		String cmd=jsonReceive.getString("cmd");

		if(cmd.equals("message")) {
			String msg= "받음: "+ jsonReceive.getString("chatMsg");
		
			JSONObject job=new JSONObject();
			job.put("cmd", "message");
			job.put("chatMsg", msg);
		
			sendMessage(job.toString(), session);
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
		try {
			session.close();
		} catch (Exception e) {
		}
		sessionSet.remove(session);
	}

	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!");
		
		return super.supportsPartialMessages();
	}

	public void sendMessage(String message, WebSocketSession out) {
		for (WebSocketSession session : this.sessionSet) {
			if (out != null && session == out)
				continue;

			if (session.isOpen()) {
				try {
					session.sendMessage(new TextMessage(message));
				} catch (Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}

	// init-method(@PostConstruct)
	// 클라이언트에게 3초마다 한번씩 시간을 전송
	public void init() throws Exception {
		Thread thread = new Thread() {
			@Override
			public void run() {
				while (true) {
					try {
						Calendar cal=Calendar.getInstance();
						int hour=cal.get(Calendar.HOUR);
						int minute=cal.get(Calendar.MINUTE);
						int second=cal.get(Calendar.SECOND);
						
						JSONObject job=new JSONObject();
						job.put("cmd", "time");
						job.put("hour", hour);
						job.put("minute", minute);
						job.put("second", second);
						
						sendMessage(job.toString(),  null);
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						e.printStackTrace();
						break;
					}
				}
			}
		};
		thread.start();
	}
}
