package com.duospace.duospace.reserve;

public class Reserve {
	
	/*지점(Spot)*/
	private int spotCode;
	private String spotName;
	private String region;
	
	/*층(Floor)*/
	private int floorNum;
	private String floorName;
	
	
	/*배치도(Placement)*/
	private int placeCode;
	private String placement;
	private String created;
	private int isPlaceUsed;
	
	/*좌석(Seat)*/
	private int seatCode;
	private String seatName;
	private int isUsed;
	
	/*예약(reserv)*/
	private int reservNum;
	private int memberNum;
	private String signSpot;
	
	/*예약상세(Stres)*/
	private int strNum;  //좌석상세코드
	private String startDate;
	private String endDate;
	
	
	/*이용권(Pass)*/
	private int passCode;
	private String passName;
	private String passDate;
	private int price;
	private long passHour;
	
	
	
	
	
	public long getPassHour() {
		return passHour;
	}
	public void setPassHour(long passHour) {
		this.passHour = passHour;
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
	public int getPlaceCode() {
		return placeCode;
	}
	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
	}
	public String getPlacement() {
		return placement;
	}
	public void setPlacement(String placement) {
		this.placement = placement;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getIsPlaceUsed() {
		return isPlaceUsed;
	}
	public void setIsPlaceUsed(int isPlaceUsed) {
		this.isPlaceUsed = isPlaceUsed;
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
	public int getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
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
	public String getSignSpot() {
		return signSpot;
	}
	public void setSignSpot(String signSpot) {
		this.signSpot = signSpot;
	}
	public int getStrNum() {
		return strNum;
	}
	public void setStrNum(int strNum) {
		this.strNum = strNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPassCode() {
		return passCode;
	}
	public void setPassCode(int passCode) {
		this.passCode = passCode;
	}
	public String getPassName() {
		return passName;
	}
	public void setPassName(String passName) {
		this.passName = passName;
	}
	public String getPassDate() {
		return passDate;
	}
	public void setPassDate(String passDate) {
		this.passDate = passDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
	

}
