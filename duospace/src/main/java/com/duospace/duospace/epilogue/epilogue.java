package com.duospace.duospace.epilogue;

import org.springframework.web.multipart.MultipartFile;

public class epilogue {
	private int reservNum, memberNum, hitCount, starnum;
	private String subject, content, created, saveFilename, userId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReservNum() {
		return reservNum;
	}
	public void setReservNum(int reservNum) {
		this.reservNum = reservNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	private MultipartFile upload;
	private int replyCount;
	
	
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getStarnum() {
		return starnum;
	}
	public void setStarnum(int starnum) {
		this.starnum = starnum;
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
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
}
