package com.duospace.community.freeboard;

public class Freeboard {
	private int boardnum,listNum;//자유게시판코드
	private String content,created,name;//내용,작성일
	private int hitCount,cmoimCode,writer;//조회수,코뮤니티코드,작성자
	
	
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getCmoimCode() {
		return cmoimCode;
	}
	public void setCmoimCode(int cmoimCode) {
		this.cmoimCode = cmoimCode;
	}
	
	
	
}
