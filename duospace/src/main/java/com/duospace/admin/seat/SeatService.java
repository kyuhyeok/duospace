package com.duospace.admin.seat;

import java.util.List;
import java.util.Map;

public interface SeatService {
	public List<Seat> listSpot();  //지점리스트
	public List<Seat> listFloor(int spotCode);  //지점의 층리스트(배치도 있음)
	public List<Seat> listTotalFloor(int spotCode);  //지점의 층리스트(배치도 없음)
	
	public int dataCount(Map<String, Object> map);  //배치도 카운트
	public List<Seat> listPlacement(Map<String, Object> map);//배치도가 있는 지점의 리스트
	
	public int insertPlacement(Map<String, Object> map); //배치도 등록
	public int maxPlacementNum(); //가장큰 배치도 번호 가져오기
	public int insertSeats(List<Seat> list);   //좌석테이블에 좌석 등록
	public Seat readSpot(int spotCode);
	public int updatePlacement(Map<String, Object> map);
	public int deletePlacement(int placeCode);
	public Seat readPlacement(int placeCode);
	public List<Seat> seatList(int placeCode);
	
}
