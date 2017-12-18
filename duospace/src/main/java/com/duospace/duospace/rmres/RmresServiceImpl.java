package com.duospace.duospace.rmres;

import java.util.List;

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





}
