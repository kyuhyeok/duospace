package com.duospace.duospace.rmres;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.duospace.common.dao.CommonDAO;

@Controller("duospace.RmresService")
public class RmresServiceImpl implements RmresService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertRmres(Rmres dto) throws Exception{
		try {
			int num=dao.selectOne("duospace.rmres.reservSeq");
			dto.setReservNum(num);
			dao.insertData("duospace.rmres.insert2", dto);
			dao.insertData("duospace.rmres.insert", dto);
			dao.selectOne("duospace.rmres.colist", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
	}

	@Override
	public List<Rmres> listRmres() {
		List<Rmres> list=null;
		try {
			list=dao.selectList("duospace.rmres.rmlist");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}



	@Override
	public Rmres listComplete(int reservNum) {
		Rmres dto=null;
		try {
			dto=dao.selectOne("duospace.rmres.colist", reservNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}



	@Override
	public int readReserveNum() {
		int reserveNum=0;
		try {
			reserveNum=dao.selectOne("duospace.rmres.readReserveNum");
		} catch (Exception e) {
			e.toString();
		}
		return reserveNum;
	}

	@Override
	public int reservCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.rmres.reservCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	
}
