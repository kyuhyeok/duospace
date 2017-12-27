package com.duospace.community.moimchat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duospace.common.dao.CommonDAO;

@Service("moim.moimChatService")
public class MoimChatServiceImpl implements MoimChatService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<MoimChat> listFMC(Map<String, Object> map) {
		List<MoimChat> list=null;
		
		try {
			list=dao.selectList("moimChat.listFMC", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int fMURtDCnt(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moimChat.fMURtDCnt", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int listFMCDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moimChat.listFMCDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertFMess(MoimChat dto) {
		int result=0;
		
		try {
			result=dao.insertData("moimChat.insertFMess", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<MoimChat> listMoimMember(Map<String, Object> map) {
		List<MoimChat> list=null;
		
		try {
			list=dao.selectList("moimChat.listMoimMember", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertReadMess(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.insertData("moimChat.insertReadMess", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public MoimChat readFMess(Map<String, Object> map) {
		MoimChat dto=null;
		
		try {
			dto=dao.selectOne("moimChat.readFMess", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<MoimChat> listUnReadMess(Map<String, Object> map) {
		List<MoimChat> list=null;
		
		try {
			list=dao.selectList("moimChat.listUnReadMess", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<MoimChat> listFMessContent(Map<String, Object> map) {
		List<MoimChat> list=null;
		
		try {
			list=dao.selectList("moimChat.listFMessContent", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int fMCListDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moimChat.fMListDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int updateReadDate(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moimChat.updateReadDate", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateFMess(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("moimChat.updateFMess", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteFMess(MoimChat dto) {
		int result=0;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("num", "");
			int my=dto.getMemberNum();
			
			dto=null;
			dto=readFMess(map);
			int ds=0;
			int from=dto.getMemberNum();
			String readDate="";
			
			if(my==from) {
				if(readDate!=null) {
					switch(ds) {
					case 1:return result;
					case 2:result=dao.deleteData("moimChat.deleteFMess", map);break;
					default:map.put("deleteStatus", "1");result=dao.updateData("moimChat.updateFMess", map);break;
					}
				}else {
					result=dao.deleteData("moimChat.deleteFMess", map);
				}
			}else {
				switch(ds) {
				case 1:result=dao.deleteData("moimChat.deleteFMess", map);break;
				case 2:return result;
				default:map.put("deleteStatus", "2");result=dao.updateData("moimChat.updateFMess", map);break;
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
