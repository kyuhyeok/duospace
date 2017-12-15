package com.duospace.duogram;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;
import com.duospace.duogram.mypage.Mypage;

@Service("duogram.duogramService")
public class DuogramServiceImpl implements DuogramService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertAccept(int memberNum) {
		int result=0;
		try {
			result=dao.insertData("duogram.insertAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countAccept(int memberNum) {
		int result=0;
		try {
			result=dao.selectOne("duogram.countAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertBoard(Duogram dto) {
		int result=0;
		try {
			result=dao.insertData("duogram.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duogram.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Duogram> listDuogram(Map<String, Object> map) {
		List<Duogram> list=null;
		try {
			list=dao.selectList("duogram.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int deleteBoard(int num, int memberNum) {
		int result=0;
		
		try {
			Duogram dto=readBoard(num);
			if(dto!=null) {
				if(dto.getMemberNum()!=memberNum && memberNum!=1)
					return result;
			}
			dao.deleteData("duogram.deleteBoard", num);
			result=1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public Duogram readBoard(int num) {
		Duogram dto=null;
		
		try {
			dto=dao.selectOne("duogram.readBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(Mypage dto) {
		int result=0;
		
		try {
			dao.updateData("duogram.updateBoard", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
