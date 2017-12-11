package com.duospace.community.community;

public class Community {
	private int boardNum;//게시글번호
	private String subject,content,created;//제목,내용,작성일
	private int hitCount;//조회수
	
	private int cateGoryNum,memberNum;//게시판분류코드,회원번호

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public int getCateGoryNum() {
		return cateGoryNum;
	}

	public void setCateGoryNum(int cateGoryNum) {
		this.cateGoryNum = cateGoryNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	
	
}
