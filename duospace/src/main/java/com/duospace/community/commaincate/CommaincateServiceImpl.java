package com.duospace.community.commaincate;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("commaincate.commaincateService")
public class CommaincateServiceImpl implements CommaincateService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertCommaincate(Commaincate dto) {
		int result=0;
		try {
			result=dao.insertData("commaincate.insertcommaincate",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public List<Commaincate> listCommaincate(Map<String, Object> map) {
		List<Commaincate> cateList=null;
		try {
			cateList=dao.selectList("commaincate.listcommaincate",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return cateList;
	}

	@Override
	public List<Commaincate> listCommainboard(Map<String, Object> map) {
		List<Commaincate> boardList=null;
		try {
			boardList = dao.selectList("commaincate.listcommainboard",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return boardList;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("commaincate.dataCountCommaincate",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int deleteCommaincate(int num) {
		int result =0;
		try {
			result = dao.deleteData("commaincate.deletecate",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public Commaincate readCommaincate() {
		Commaincate dto = null;
		try {
			dto=dao.selectOne("commaincate.readCommaincate");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}



	@Override
	public int updateCommaincate(Commaincate dto) {
		int result =0;
		try {
			result = dao.updateData("commaincate.updatecate",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}





}
