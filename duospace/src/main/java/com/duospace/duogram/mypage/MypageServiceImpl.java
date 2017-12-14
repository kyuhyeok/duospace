package com.duospace.duogram.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duogram.mypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertAccept(int memberNum) {
		int result=0;
		try {
			result=dao.insertData("mypage.insertAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countAccept(int memberNum) {
		int result=0;
		try {
			result=dao.selectOne("mypage.countAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertBoard(Mypage dto) {
		int result=0;
		try {
			result=dao.insertData("mypage.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("mypage.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Mypage> listDuogram(Map<String, Object> map) {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int deleteBoard(int num, String userName) {
		int result=0;
		
		try {
			Mypage dto=readBoard(num);
			if(dto!=null) {
				if(! dto.getName().equals(userName) && ! userName.equals("admin"))
					return result;
			}
			dao.deleteData("mypage.deleteBoard", num);
			result=1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public Mypage readBoard(int num) {
		Mypage dto=null;
		
		try {
			dto=dao.selectOne("mypage.readBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
