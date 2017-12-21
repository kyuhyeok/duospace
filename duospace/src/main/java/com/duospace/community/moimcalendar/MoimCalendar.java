package com.duospace.community.moimcalendar;

public class MoimCalendar {
	private int moimNum,listNum;//모임코드,모임 리스트번호
	private String subject,content,created;//제목,내용,작성일
	private int hitCount,people;//조회수,모집인원
	private String price,spot,moinDate,name;//회비,모임장소,모임시간,이름
	
	private int cmoimCode,memberNum,writer;//모임코드,멤버번호,작성자

	
	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

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

	public String getMoinDate() {
		return moinDate;
	}

	public void setMoinDate(String moinDate) {
		this.moinDate = moinDate;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}
	
	
}
