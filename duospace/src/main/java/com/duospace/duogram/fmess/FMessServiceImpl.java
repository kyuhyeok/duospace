package com.duospace.duogram.fmess;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duogram.fMessService")
public class FMessServiceImpl implements FMessService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<FMess> listFMC(Map<String, Object> map) {
		List<FMess> list=null;
		
		try {
			list=dao.selectList("duoGramFM.listFMC", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int listFMCDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("duoGramFM.listFMCDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int fMURtDCnt(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("duoGramFM.fMURtDCnt", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public FMess readFMess(Map<String, Object> map) {
		FMess fm=null;
		
		try {
			fm=dao.selectOne("duoGramFM.readFMess", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return fm;
	}

	@Override
	public int insertFMess(FMess dto) {
		int result=0;
		
		try {
			result=dao.insertData("duoGramFM.insertFMess", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<FMess> listFMessContent(Map<String, Object> map) {
		List<FMess> list=null;
		
		try {
			list=dao.selectList("duoGramFM.listFMessContent", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int fMCListDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("duoGramFM.fMListDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int ListFMUR(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("duoGramFM.fMListDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateFMess(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("duoGramFM.fMListDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteFMess(FMess dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("num", dto.getNum());
			String ds=readFMess(map).getDeleteStatus();
			
			switch(ds) {
			case "1":return result;
			case "2":result=dao.deleteData("duoGramFM.deleteFMess", map);break;
			default:map.put("deleteStatus", "1");result=dao.updateData("duoGramFM.updateFMess", map);break;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
