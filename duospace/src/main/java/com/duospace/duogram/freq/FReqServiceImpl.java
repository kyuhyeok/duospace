package com.duospace.duogram.freq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.duospace.common.dao.CommonDAO;

@Service("duogram.fRequest")
public class FReqServiceImpl implements FReqService{
	@Autowired
	private CommonDAO  dao;
	
	@Override
	public int insertFResp(FReq dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("from", dto.getFriendNum());
			map.put("to", dto.getMemberNum());
			
			if(readFReq(map)==null) {
				return result;
			}
			
			map.clear();
			
			map.put("from", dto.getMemberNum());
			map.put("to", dto.getFriendNum());
			
			if(readFReq(map)==null) {
				result=dao.insertData("duoGramFReq.insertFReq", dto);
			}else {
				result=1;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<FReq> listFReq(Map<String, Object> map) {
		List<FReq> list=null;
		
		try {
			list=dao.selectList("duoGramFReq.listFReq", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int fReqDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("duoGramFReq.fReqDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public FReq readFReq(Map<String, Object> map) {
		FReq dto=null;
		
		try{
			dto=dao.selectOne("duoGramFReq.readFReq", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int deleteFReq(FReq dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("from", dto.getFriendNum());
			map.put("to", dto.getMemberNum());
			
			if(readFReq(map)!=null) {
				return result;
			}
			result=dao.deleteData("duoGramFReq.deleteFReq", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertFReq(FReq dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("from", dto.getMemberNum());
			map.put("to", dto.getFriendNum());
			
			if(readFReq(map)!=null) {
				result=1;
				return result;
			}else {
				result=dao.insertData("duoGramFReq.insertFReq", dto);
			}	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int deleteFResp(FReq dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("from", dto.getFriendNum());
			map.put("to", dto.getMemberNum());
			
			if(readFReq(map)==null) {
				return result;
			}
			
			map.clear();
			
			map.put("from", dto.getMemberNum());
			map.put("to", dto.getFriendNum());
			
			if(readFReq(map)==null) {
				result=dao.deleteData("duoGramFReq.deleteFReq", map);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int deleteFreind(FReq dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("from", dto.getFriendNum());
			map.put("to", dto.getMemberNum());
			
			if(readFReq(map)==null) {
				return result;
			}
			
			dao.deleteData("duoGramFReq.deleteFReq", map);
			
			map.clear();
			
			map.put("from", dto.getMemberNum());
			map.put("to", dto.getFriendNum());
			
			if(readFReq(map)==null) {
				return result;
			}
			
			result=dao.deleteData("duoGramFReq.deleteFReq", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

}
