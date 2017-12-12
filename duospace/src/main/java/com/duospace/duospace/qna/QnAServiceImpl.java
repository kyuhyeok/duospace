package com.duospace.duospace.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duospace.qnaService")
public class QnAServiceImpl implements QnAService{

	@Autowired
	CommonDAO dao;
	
	@Override
	public int insertQna(Qna dto) {
		int result=0;
		try {
			dao.insertData("duospace.qna.insert", dto);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int insertQna(Qna dto, String mode) {
		int result=0;
		try {
			if(mode.equals("created")) {
				int maxNum= dao.selectOne("duospace.qna.maxNum");
				dto.setNum(maxNum+1);
				dto.setGroupNum(dto.getNum());
				dto.setAnswer(0);
			}else {
				dto.setGroupNum(dto.getNum());
				int maxNum= dao.selectOne("duospace.qna.maxNum");
				dto.setNum(maxNum+1);
				dto.setAnswer(1);
			}
			result=dao.insertData("duospace.qna.insert", dto);
			
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}
	
	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list=null;
		try {
			list=dao.selectList("duospace.qna.list", map);
		} catch (Exception e) {
			e.toString();
		}
		return list;
	}

	@Override
	public Qna readQna(int num) {
		Qna dto=null;
		try {
			dto=dao.selectOne("duospace.qna.readQna", num);
		} catch (Exception e) {
			e.toString();
		}
		
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("duospace.qna.dataCount", map);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int updateQna(Qna dto) {
		int result=0;
		try {
			result=dao.updateData("duospace.qna.update",dto);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	@Override
	public int deleteQna(int num) {
		int result=0;
		
		try {
			result=dao.deleteData("duospace.qna.delete", num);
		} catch (Exception e) {
			e.toString();
		}
		return 0;
	}

	@Override
	public Qna preReadQna(Map<String, Object> map) {
		Qna dto=null;
		try {
			dto=dao.selectOne("duospace.qna.preReadQna", map);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}

	@Override
	public Qna nextReadQna(Map<String, Object> map) {
		Qna dto=null;
		try {
			dto=dao.selectOne("duospace.qna.nextReadQna", map);
		} catch (Exception e) {
			e.toString();
		}
		return dto;
	}

	@Override
	public int deleteList(List<Integer> list) {
		int result=0;
		try {
			result=dao.deleteData("duospace.qna.deleteList", list);
		} catch (Exception e) {
			e.toString();
		}
		return result;
	}

	

}
