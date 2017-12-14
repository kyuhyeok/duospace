package com.duospace.admin.seat;

public class Seat {
	private int spotCode;  //지점코드
	private String spotName;   //지점명
	private String region;  //지역 (서울특별시, 경기도,,)
	
	private int floorNum;   //층번호 _ 기본키
	private String floorName;   //층명
	
	private int seatCode;	//좌석번호
	private String seatName;  //좌석명
	private int isUsed; //좌석사용여부
	
	private int isPlaceUsed; //배치도 사용여부
	
	private int placeCode; //배치도코드
	private String placeMent; //배치도
	
	private String created; // 생성일
	
	private int listNum;
	
	
	
	public int getIsPlaceUsed() {
		return isPlaceUsed;
	}
	public void setIsPlaceUsed(int isPlaceUsed) {
		this.isPlaceUsed = isPlaceUsed;
	}
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getPlaceCode() {
		return placeCode;
	}
	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
	}
	public String getPlaceMent() {
		return placeMent;
	}
	public void setPlaceMent(String placeMent) {
		this.placeMent = placeMent;
	}
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
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getFloorNum() {
		return floorNum;
	}
	public void setFloorNum(int floorNum) {
		this.floorNum = floorNum;
	}
	public String getFloorName() {
		return floorName;
	}
	public void setFloorName(String floorName) {
		this.floorName = floorName;
	}
	public int getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	
	
}
