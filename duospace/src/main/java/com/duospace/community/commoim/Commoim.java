package com.duospace.community.commoim;

public class Commoim {
	private int cmoimCode;//모임코드
	private String comname;//모임이름
	private int isopen;//공개여부
	private String created;//모임생성일
	
	private int catecode,regcode,memberNum;//카테고리,지역,회원번호.(참조키)

	
	public int getCmoimCode() {
		return cmoimCode;
	}

	public void setCmoimCode(int cmoimCode) {
		this.cmoimCode = cmoimCode;
	}

	public int getIsopen() {
		return isopen;
	}

	public void setIsopen(int isopen) {
		this.isopen = isopen;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getComname() {
		return comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public int getCatecode() {
		return catecode;
	}

	public void setCatecode(int catecode) {
		this.catecode = catecode;
	}

	public int getRegcode() {
		return regcode;
	}

	public void setRegcode(int regcode) {
		this.regcode = regcode;
	}
	
	
	
}
