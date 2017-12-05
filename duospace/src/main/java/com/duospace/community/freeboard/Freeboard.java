package com.duospace.community.freeboard;

public class Freeboard {
	private int boardnum;
	private String subject,content,writer;
	private int hitCount,cmoimcode;
	
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getCmoimcode() {
		return cmoimcode;
	}
	public void setCmoimcode(int cmoimcode) {
		this.cmoimcode = cmoimcode;
	}
	
	
}
