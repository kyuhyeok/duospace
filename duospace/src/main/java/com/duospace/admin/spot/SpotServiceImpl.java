package com.duospace.admin.spot;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duospace.spotService")
public class SpotServiceImpl implements SpotService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertSpot(Spot dto) {
		int result=0;
		try {
			int seq=dao.selectOne("duospace.spot.spotSeq");
			dto.setSpotCode(seq);

			result=dao.insertData("duospace.spot.insert", dto);
			result=dao.insertData("duospace.spot.insert2", dto);
			result=dao.insertData("duospace.spot.insert3", dto);
			result=dao.insertData("duospace.spot.insert4", dto);
			result=dao.insertData("duospace.spot.insert5", dto);
			result=dao.insertData("duospace.spot.insert6", dto);
			result=dao.insertData("duospace.spot.insert7", dto);

			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Spot> listSpot(Map<String, Object> map) {
		List<Spot> list=null;
		try {
			list=dao.selectList("duospace.spot.list", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.spot.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Spot readSpot(int spotCode) {
		Spot dto=null;
		try {
			dto=dao.selectOne("duospace.spot.readSpot", spotCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateSpot(Spot dto) {
		int result=0;
		try {
			result=dao.updateData("duospace.spot.updateSpot", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int deleteListSpot(List<Integer> list) {
		int result=0;
		try {
			result=dao.deleteData("duospace.spot.deleteList", list);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int deleteSpot(int spotCode) {
		int result=0;
		try {
			result=dao.deleteData("duospace.spot.deleteSpot", spotCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
