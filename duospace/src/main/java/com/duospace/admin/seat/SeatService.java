package com.duospace.admin.seat;

import java.util.List;
import java.util.Map;

public interface SeatService {
	public List<Seat> listSpot();  //지점리스트
	public List<Seat> listFloor(int spotCode);  //지점의 층리스트
	public int dataCount(Map<String, Object> map);  //배치도 카운트
	public List<Seat> listPlacement(Map<String, Object> map);//배치도리스트
	
	public int insertPlacement(Map<String, Object> map); //배치도 등록
	public int insertSeats();   //좌석테이블에 좌석 등록
	public Seat readPlacement();
	public int updatePlacement();
	public int deletePlacement();

	
}
