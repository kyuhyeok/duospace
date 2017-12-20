package com.duospace.community.moimchat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("duogram.moinChatService")
public class MoinChatServiceImpl implements MoinChatService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<MoinChat> listFMC(Map<String, Object> map) {
		List<MoinChat> list=null;
		
		try {
			list=dao.selectList("moinChat.listFMC", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int listFMCDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moinChat.listFMCDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int fMURtDCnt(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moinChat.fMURtDCnt", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertFMess(MoinChat dto) {
		int result=0;
		
		try {
			
			result=dao.insertData("moinChat.insertFMess", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public MoinChat readFMess(Map<String, Object> map) {
		MoinChat dto=null;
		
		try {
			dto=dao.selectOne("moinChat.readFMess", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public List<MoinChat> listFMessContent(Map<String, Object> map) {
		List<MoinChat> list=null;
		
		try {
			list=dao.selectList("moinChat.listFMessContent", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int fMCListDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moinChat.fMListDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int updateReadDate(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moinChat.updateReadDate", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateFMess(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moinChat.updateFMess", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteFMess(MoinChat dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("num", dto.getNum());
			int my=dto.getMemberNum();
			
			dto=null;
			dto=readFMess(map);
			int ds=dto.getDeleteStatus();
			int from=dto.getMemberNum();
			String readDate=dto.getReadDate();
			
			if(my==from) {
				if(readDate!=null) {
					switch(ds) {
					case 1:return result;
					case 2:result=dao.deleteData("moinChat.deleteFMess", map);break;
					default:map.put("deleteStatus", "1");result=dao.updateData("moinChat.updateFMess", map);break;
					}
				}else {
					result=dao.deleteData("moinChat.deleteFMess", map);
				}
			}else {
				switch(ds) {
				case 1:result=dao.deleteData("moinChat.deleteFMess", map);break;
				case 2:return result;
				default:map.put("deleteStatus", "2");result=dao.updateData("moinChat.updateFMess", map);break;
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
