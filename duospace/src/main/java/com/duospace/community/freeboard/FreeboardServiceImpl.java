package com.duospace.community.freeboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("freeboard.freeboardService")
public class FreeboardServiceImpl implements FreeboardService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertFreeboard(Freeboard dto) {
		int result=0;
		try {
			result=dao.insertData("freeboard.insertFreeboard",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Freeboard> listFreeboard(Map<String, Object> map) {
		List<Freeboard> list=null;
		try {
			list=dao.selectList("freeboard.listFreeboard",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.dataCountFreeboard",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Freeboard readFreeboard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateFreeboard(Freeboard dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public int insertReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("freeboard.insertReply",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list =null;
		try {
			list = dao.selectList("freeboard.listReply",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("freeboard.replyDataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFreeboard(int boardNum, int memberNum) {
		int result=0;
		try {
			result=dao.deleteData("freeboard.deleteFreeboard",boardNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
