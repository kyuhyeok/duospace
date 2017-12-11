package com.duospace.duogram.fmess;

public class FMess {
	private int memberNum, friendNum;
	private String name;
	private String num, sendDate, readDate, content, deleteStatus; 
	private int unReadCnt;
	
	
	public String getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getFriendNum() {
		return friendNum;
	}
	public void setFriendNum(int friendNum) {
		this.friendNum = friendNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getReadDate() {
		return readDate;
	}
	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUnReadCnt() {
		return unReadCnt;
	}
	public void setUnReadCnt(int unReadCnt) {
		this.unReadCnt = unReadCnt;
	}
	
}
