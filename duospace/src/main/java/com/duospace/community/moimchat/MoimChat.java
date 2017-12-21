package com.duospace.community.moimchat;

public class MoimChat {
	private int memberNum, cmoimCode, mchatNum;
	private String name;
	private String sendDate,content, profile; 
	private int unReadCnt;
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getCmoimCode() {
		return cmoimCode;
	}
	public void setCmoimCode(int cmoimCode) {
		this.cmoimCode = cmoimCode;
	}
	public int getMchatNum() {
		return mchatNum;
	}
	public void setMchatNum(int mchatNum) {
		this.mchatNum = mchatNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getUnReadCnt() {
		return unReadCnt;
	}
	public void setUnReadCnt(int unReadCnt) {
		this.unReadCnt = unReadCnt;
	}
	
	
}
