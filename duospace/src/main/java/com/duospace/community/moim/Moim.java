package com.duospace.community.moim;

public class Moim {
	private int moimnum;//모임번호
	private String comname;//모임이름
	private int isopen;//공개여부
	
	private int cmoimcode,permission;
	private String joindate;
	
	public int getMoimnum() {
		return moimnum;
	}
	public void setMoimnum(int moimnum) {
		this.moimnum = moimnum;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
	public int getIsopen() {
		return isopen;
	}
	public void setIsopen(int isopen) {
		this.isopen = isopen;
	}
	public int getCmoimcode() {
		return cmoimcode;
	}
	public void setCmoimcode(int cmoimcode) {
		this.cmoimcode = cmoimcode;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
		
	
	
	
}
