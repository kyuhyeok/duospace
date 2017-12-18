package com.duospace.duospace.reserve;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duospace.reserveService")
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public List<Reserve> regionList() {
		List<Reserve> list=null;
		try {
			list=dao.selectList("duospace.reserveSeat.regionList");
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public List<Reserve> spotList() {
		List<Reserve> list=null;
		try {
			list=dao.selectList("duospace.reserveSeat.spotList");
		} catch (Exception e) {
			e.toString();
		}
		return list;	}
	
	@Override
	public List<Reserve> floorList(int spotCode) {
		List<Reserve> list=null;
		try {
			list=dao.selectList("duospace.reserveSeat.floorList", spotCode);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	/**
	 * 선택한 층의 배치도
	 */
	@Override
	public Reserve readPlacement(int floorNum) {
		Reserve dto = null;
		try {
			dto = dao.selectOne("duospace.reserveSeat.readPlacement", floorNum);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}


	/**
	 * 이용권리스트
	 */
	@Override
	public List<Reserve> passList() {
		List<Reserve> list=null;
		try {
			list=dao.selectList("duospace.reserveSeat.passList");
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	
	/**
	 * 선택한 배치도&시간 에 따른 예약내역
	 */
	@Override
	public List<Reserve> reserveList(Map<String, Object> map) {
		List<Reserve> list=null;
		try {
			list=dao.selectList("duospace.reserveSeat.reserveList", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	/**
	 * reserv테이블에 입력
	 * 예약1, 예약2
	 */
	@Override
	public void insertReserve(Map<String, Object> map) throws Exception{
		try {
			int seq=dao.selectOne("duospace.reserveSeat.seq");
			map.put("reservNum", seq);
			dao.insertData("duospace.reserveSeat.insert1", map);
			dao.insertData("duospace.reserveSeat.insert2", map);
		} catch (Exception e) {
			throw e;
		}

	}

	@Override
	public int readSeatCode(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.reserveSeat.readSeatCode", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}



	

}
