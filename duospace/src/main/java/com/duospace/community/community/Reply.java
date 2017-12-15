package com.duospace.community.community;

public class Reply {
	private int boardrpNum, num;
	private String name;
	private String content, created;
	
	private int memberNum,boardNum;
	
	
	public int getBoardrpNum() {
		return boardrpNum;
	}
	public void setBoardrpNum(int boardrpNum) {
		this.boardrpNum = boardrpNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
}
