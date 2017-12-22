package com.duospace.community.moimchat;

import org.springframework.web.socket.WebSocketSession;

public class MemberInfo {
	private String memberName, memberId, profile;
	private WebSocketSession session;
	private CmoimInfo cmoim;	//모임 정보
	
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public WebSocketSession getSession() {
		return session;
	}
	public void setSession(WebSocketSession session) {
		this.session = session;
	}
	public CmoimInfo getCmoim() {
		return cmoim;
	}
	public void setCmoim(CmoimInfo cmoim) {
		this.cmoim = cmoim;
	}
	
}
