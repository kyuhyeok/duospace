package com.duospace.admin.seat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("admin.seatService")
public class SeatServiceImpl implements SeatService{

	@Autowired
	CommonDAO dao;
	
	
	/**
	 * created 배치도페이지에서 지점리스트 출력
	 *  return : 전체 지점리스트
	 */
	@Override
	public List<Seat> listSpot() {
		List<Seat> list=null;
		try {
			list=dao.selectList("duospace.seat.spot_list");

		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.seat.dataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	
	/**
	 * 배치도리스트에서 배치도가 존재하는 지점의 리스트만 보여줌
	 * parameter : map (검색키,검색값,시작,끝)
	 * return : 배치도가 존재하는 지점리스트
	 */
	@Override
	public List<Seat> listPlacement(Map<String, Object> map) {
		List<Seat> list=null;
		try {
			list=dao.selectList("duospace.seat.spotList_Ok", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	/**
	 * 선택한 지점의 전체 층리스트를 가져옴
	 * 배치도 정보 없음
	 * created에서쓰임
	 */
	@Override
	public List<Seat> listTotalFloor(int spotCode) {
		List<Seat> list=null;
		try {
			list=dao.selectList("duospace.seat.totalFloorList", spotCode);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	
	
	/**
	 * 선택한 지점의 전체 층리스트를 가져옴
	 * 배치도 정보도 있음
	 * article에서 쓰임
	 */
	@Override
	public List<Seat> listFloor(int spotCode) {
		List<Seat> fList=null;
		try {
			fList=dao.selectList("duospace.seat.floorList", spotCode);
		} catch (Exception e) {
			e.toString();
		}
		
		return fList;
	}

	/**
	 * 배치도 저장
	 */
	@Override
	public int insertPlacement(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.insertData("duospace.seat.insertPlacement", map);	
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	
	/**
	 * 가장큰 배치도 번호 가져오기==최근 저장된 배치도 번호
	 */
	@Override
	public int maxPlacementNum() {
		int result=0;
		try {
			result=dao.selectOne("duospace.seat.maxPlacementNum");
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	
	/**
	 * 좌석 넣기
	 */
	@Override
	public int insertSeats(List<Seat> list) {
		int result=0;
		try {
			
			for(Seat dto:list) {
				dao.insertData("duospace.seat.insertSeat", dto);
			}
			result=1;
			
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public Seat readSpot(int spotCode) {
		Seat dto = null;
		try {
			dto=dao.selectOne("duospace.seat.readSpot", spotCode);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}

	@Override
	public Seat readPlacement(int placeCode) {
		Seat dto = null;
		try {
			dto=dao.selectOne("duospace.seat.readPlacement", placeCode);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}
	
	/**
	 * 기존 배치도 수정(insert) & 좌석정보 수정 & 좌석insert
	 */
	
	@Override
	public int updatePlacement(Map<String, Object> map) {
		int result=0;
		try {
			dao.updateData("duospace.seat.updateSeat", map.get("placeCode"));  //기존 좌석 사용여부 0으로 수정
			dao.updateData("duospace.seat.updatePlacement", map.get("placeCode"));//기존 배치도 사용여부 0으로 수정
			result=dao.insertData("duospace.seat.insertPlacement", map); //배치도insert
			int placementCode= dao.selectOne("duospace.seat.maxPlacementNum");  //입력한 배치도번호 가져오기
			
			@SuppressWarnings("unchecked")
			List<Seat> sList = (List<Seat>)(map.get("sList"));  //sList : 좌석이름만 들어잇음
			
			for(Seat dto: sList) {
				dto.setPlaceCode(placementCode);
				dao.insertData("duospace.seat.insertSeat", dto);
			}
			
		} catch (Exception e) {
			e.toString();
		}
	
		return result;
	}

	@Override
	public int deletePlacement(int placeCode) {
		int result=0;
		try {
			result=dao.updateData("duospace.seat.updatePlacement",placeCode);//기존 배치도 사용여부 0으로 수정
			dao.updateData("duospace.seat.updateSeat", placeCode);  //기존 좌석 사용여부 0으로 수정
		} catch (Exception e) {
			e.toString();
		}
		
		return result;
	}



	@Override
	public List<Seat> seatList(int placeCode) {
		List<Seat> list=null;
		try {
			list=dao.selectList("duospace.seat.seatList", placeCode);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}




	







	

	

}
