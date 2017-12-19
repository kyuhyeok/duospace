package com.duospace.duogram.friend;

public class Friend {
	private int memberNum, friendNum;
	private String email, name, proFileSaveFileName, reqDate;
	private int fofcnt, fDataCount, friendShip;
	
	public int getFofcnt() {
		return fofcnt;
	}
	public void setFofcnt(int fofcnt) {
		this.fofcnt = fofcnt;
	}
	public int getfDataCount() {
		return fDataCount;
	}
	public void setfDataCount(int fDataCount) {
		this.fDataCount = fDataCount;
	}
	public int getFriendShip() {
		return friendShip;
	}
	public void setFriendShip(int friendShip) {
		this.friendShip = friendShip;
	}
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProFileSaveFileName() {
		return proFileSaveFileName;
	}
	public void setProFileSaveFileName(String proFileSaveFileName) {
		this.proFileSaveFileName = proFileSaveFileName;
	}
	
}
