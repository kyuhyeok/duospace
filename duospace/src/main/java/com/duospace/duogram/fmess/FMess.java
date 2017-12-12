package com.duospace.duogram.fmess;

public class FMess {
	private int memberNum, friendNum, num, deleteStatus;
	private String name, friendId;
	private String sendDate, readDate, content, proFileSaveFileName; 
	private int unReadCnt;
	
	
	public String getProFileSaveFileName() {
		return proFileSaveFileName;
	}
	public void setProFileSaveFileName(String proFileSaveFileName) {
		this.proFileSaveFileName = proFileSaveFileName;
	}
	public String getFriendId() {
		return friendId;
	}
	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}
	public int getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(int deleteStatus) {
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
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
