package com.duospace.community.moimchat;

import java.util.HashSet;
import java.util.Set;

public class CmoimInfo {
	private String cmoimCode;          // 모임
	
	// 채팅방 참여자
	private Set<String> memberSet=new HashSet<>();

	public String getCmoimCode() {
		return cmoimCode;
	}

	public void setCmoimCode(String cmoimCode) {
		this.cmoimCode = cmoimCode;
	}

	public Set<String> getMemberSet() {
		return memberSet;
	}

	public void setMemberSet(Set<String> memberSet) {
		this.memberSet = memberSet;
	}

	
}
