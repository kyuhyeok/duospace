package com.duospace.admin.reserve;

import java.util.List;
import java.util.Map;

public interface ReserveService {
	public List<Reserve> reserveList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int delete(int rmresNum) throws Exception;
	
	public int jinanRoomdataCount(Map<String, Object> map);
	public List<Reserve> jinanRoomReserveList(Map<String, Object> map);
	public int jinanSeatdataCount(Map<String, Object> map);
	public List<Reserve> jinanSeatReserveList(Map<String, Object> map);
	
	//지점리스트
	public List<Reserve> spotList();
	public List<Reserve> floorList(int spotCode);
	
	//좌석예약정보
	public Reserve readPlacement(int floorNum);
	public List<Reserve> checkInList();
	
	public List<Reserve> seatReserveList(Map<String, Object> map);
	public int dataCountComSeat(Map<String, Object> map);
	
}
