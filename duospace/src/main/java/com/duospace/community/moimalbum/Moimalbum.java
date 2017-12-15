package com.duospace.community.moimalbum;

import org.springframework.web.multipart.MultipartFile;

public class Moimalbum {
	private int alnum, hitCount, cmoimCode,memberNum;
	private String subject, imageFile, content,created;
	private String name;
	private MultipartFile upload;
	
	public int getAlnum() {
		return alnum;
	}
	public void setAlnum(int alnum) {
		this.alnum = alnum;
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
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
}
