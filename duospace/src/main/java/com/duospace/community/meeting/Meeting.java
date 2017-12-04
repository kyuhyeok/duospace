package com.duospace.community.meeting;

public class Meeting {
	private int num,moimnum;//번호, 모임번호
	private String subject,content,created;//제목 내용 날짜
	private int hitcount,people;//조회수,모집인원
	private String writer,price,spot,moindate;//작성자 회비 모임장소 모임시간	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMoimnum() {
		return moimnum;
	}
	public void setMoimnum(int moimnum) {
		this.moimnum = moimnum;
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
	public int getHitcount() {
		return hitcount;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
}
