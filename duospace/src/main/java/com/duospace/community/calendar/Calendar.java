package com.duospace.community.calendar;

public class Calendar {
	private int moimNum;//모임코드
	private String subject,content,created;//제목,내용,작성일
	private int hitCount,people;//조회수,모집인원
	private String price,spot,moindate;//회비,모임장소,모임시간
	
	private int cmoimCode,memberNum;//모임코드,멤버번호

	public int getMoimNum() {
		return moimNum;
	}

	public void setMoimNum(int moimNum) {
		this.moimNum = moimNum;
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

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	public String getMoindate() {
		return moindate;
	}

	public void setMoindate(String moindate) {
		this.moindate = moindate;
	}

	public int getCmoimCode() {
		return cmoimCode;
	}

	public void setCmoimCode(int cmoimCode) {
		this.cmoimCode = cmoimCode;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public static Calendar getInstance() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
