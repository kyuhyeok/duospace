package com.duospace.community.moimchat;

public class MoinChat {
	private int memberNum, cmoincode, mchatnum;
	private String name;
	private String sendDate,content, proFileSaveFileName; 
	private int unReadCnt;
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getCmoincode() {
		return cmoincode;
	}
	public void setCmoincode(int cmoincode) {
		this.cmoincode = cmoincode;
	}
	public int getMchatnum() {
		return mchatnum;
	}
	public void setMchatnum(int mchatnum) {
		this.mchatnum = mchatnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getProFileSaveFileName() {
		return proFileSaveFileName;
	}
	public void setProFileSaveFileName(String proFileSaveFileName) {
		this.proFileSaveFileName = proFileSaveFileName;
	}
	public int getUnReadCnt() {
		return unReadCnt;
	}
	public void setUnReadCnt(int unReadCnt) {
		this.unReadCnt = unReadCnt;
	}
	
	
}
