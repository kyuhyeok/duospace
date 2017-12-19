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
			result=dao.insertData("mypage.mypageInsertAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countAccept(int memberNum) {
		int result=0;
		try {
			result=dao.selectOne("mypage.mypageCountAccept", memberNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertBoard(Mypage dto) {
		int result=0;
		try {
			result=dao.insertData("mypage.mypageInsertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("mypage.mypageDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Mypage> listMypage(Map<String, Object> map) {
		List<Mypage> list=null;
		try {
			list=dao.selectList("mypage.mypageListBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int deleteBoard(int num, int memberNum) {
		int result=0;
		
		try {
			Mypage dto=readBoard(num);
			if(dto!=null) {
				if(dto.getMemberNum()!=memberNum && memberNum!=1)
					return result;
			}
			dao.deleteData("mypage.deleteMypage", num);
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

	@Override
	public int updateBoard(Mypage dto) {
		int result=0;
		
		try {
			dao.updateData("mypage.updateBoard", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("mypage.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("mypage.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("mypage.replyDataCount", map);
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
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}
}
