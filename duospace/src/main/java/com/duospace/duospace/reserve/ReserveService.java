package com.duospace.duospace.reserve;

import java.util.List;
import java.util.Map;

public interface ReserveService {
	
	public List<Reserve> regionList(); //지역 리스트
	public List<Reserve> spotList(); //총 지점리스트
	public List<Reserve> floorList(int spotCode);  //선택한 지점의 층 리스트
	public Reserve readPlacement(int floorNum); //선택한 층의 배치도
	public List<Reserve> passList(); //이용권정보
	public List<Reserve> reserveList(Map<String, Object> map); // 해당 좌석의 예약정보
}
