package com.duospace.duogram;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.duospace.common.dao.CommonDAO;

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
	public int insertReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("duogram.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}		
		return result;
	}
	
	@Override
	public int replyCountAnswer(int answer) {
		int result=0;
		try {
			result=dao.selectOne("duogram.replyCountAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Duogram readGram(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateGram(Duogram dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteGram(int membernum, String pathname, String name) {
			int result=0;

			try{
				Duogram dto=readGram(membernum);
				if(dto!=null) {
					if(! dto.getName().equals(name) && ! name.equals("admin"))
						return result;
				}
				
				// 댓글, 좋아요/싫어요 는 ON DELETE CASCADE 로 자동 삭제
				
				dao.deleteData("duogram.deleteGram", membernum);
				result=1;
			} catch(Exception e) {
			}
			return result;
	}

}
