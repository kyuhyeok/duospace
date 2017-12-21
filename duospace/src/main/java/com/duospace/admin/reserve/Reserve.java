package com.duospace.admin.reserve;

public class Reserve {

	private int listNum;
	
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
	
	/*룸(Room)*/
	private int roomCode;
	private String roomName;
	private int roomPrice;
	
	
	/*예약(reserv)*/
	private int reservNum;
	private int memberNum;
	private String name;    // 회원 이름
	private String signSpot;
	
	
	/*예약상세(Stres, Rmres)*/
	private int strNum;  //좌석상세코드
	private int rmresNum; //룸상세코드
	private String startDate;
	private String endDate;
	private String userName;
	
	/*예약결제(ReservPay)*/
	private int payCode; //결제코드
	private String payDate;//결제일
	private int pay; //결제액
	private int status;//구분 
	
	

	/*이용권(Pass)*/
	private int passCode;
	private String passName;
	private String passDate;
	private int passPrice;
	private long passHour;
	
	
	/*체크인 (checkIn)*/
	private int checkNum;
	private String checkIn;
	private String checkOut;
	
	
	
	
	
	public int getCheckNum() {
		return checkNum;
	}
	public void setCheckNum(int checkNum) {
		this.checkNum = checkNum;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
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
	public int getRmresNum() {
		return rmresNum;
	}
	public void setRmresNum(int rmresNum) {
		this.rmresNum = rmresNum;
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
	public int getPayCode() {
		return payCode;
	}
	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public int getPassPrice() {
		return passPrice;
	}
	public void setPassPrice(int passPrice) {
		this.passPrice = passPrice;
	}
	public long getPassHour() {
		return passHour;
	}
	public void setPassHour(long passHour) {
		this.passHour = passHour;
	}
	
	
	
}
