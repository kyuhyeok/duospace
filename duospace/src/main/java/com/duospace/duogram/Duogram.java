package com.duospace.duogram;

import org.springframework.web.multipart.MultipartFile;

public class Duogram {
	private MultipartFile upload;  // <input type='file' name='upload' ..
	private int replyNum, num, answer, memberNum, friendNum;
	private String Intro, CoverSaveFileName, ProFileSaveFileName;
	private String company, school, home, created, updated, content;
	
	
	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
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

	public String getIntro() {
		return Intro;
	}

	public void setIntro(String intro) {
		Intro = intro;
	}

	public String getCoverSaveFileName() {
		return CoverSaveFileName;
	}

	public void setCoverSaveFileName(String coverSaveFileName) {
		CoverSaveFileName = coverSaveFileName;
	}

	public String getProFileSaveFileName() {
		return ProFileSaveFileName;
	}

	public void setProFileSaveFileName(String proFileSaveFileName) {
		ProFileSaveFileName = proFileSaveFileName;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getUpdated() {
		return updated;
	}

	public void setUpdated(String updated) {
		this.updated = updated;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
