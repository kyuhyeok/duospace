package com.duospace.admin.spot;

public class Spot {
	public int spotCode;
	public String spotName, spotAddrNum, spotAddr1, spotAddr2, Manager, Tel;
	public int getSpotCode() {
		return spotCode;
	}
	public void setSpotCode(int spotCode) {
		this.spotCode = spotCode;
	}
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public String getSpotAddrNum() {
		return spotAddrNum;
	}
	public void setSpotAddrNum(String spotAddrNum) {
		this.spotAddrNum = spotAddrNum;
	}
	public String getSpotAddr1() {
		return spotAddr1;
	}
	public void setSpotAddr1(String spotAddr1) {
		this.spotAddr1 = spotAddr1;
	}
	public String getSpotAddr2() {
		return spotAddr2;
	}
	public void setSpotAddr2(String spotAddr2) {
		this.spotAddr2 = spotAddr2;
	}
	public String getManager() {
		return Manager;
	}
	public void setManager(String manager) {
		Manager = manager;
	}
	public String getTel() {
		return Tel;
	}
	public void setTel(String tel) {
		Tel = tel;
	}
}
