package com.duospace.community.moimchat;

import java.util.List;
import java.util.Map;

public interface MoimChatService {
	public List<MoimChat> listFMC(Map<String, Object> map);//친구리스트
	public int fMURtDCnt(Map<String, Object> map);//안읽은 메시지 총 
	public int listFMCDataCount(Map<String, Object> map);//메신저 친구 리스트 개수
	
	public int insertFMess(MoimChat dto);//메시지 보내기
	public List<MoimChat> listMoimMember(Map<String, Object> map);//모임회원 리스트
	public int insertReadMess(Map<String, Object> map);//메시지 읽어야 할 사람
	public MoimChat readFMess(Map<String, Object> map);//해당 메시지 확인
	public List<MoimChat> listFMessContent(Map<String, Object> map);//해당 친구 메시지들
	public int fMCListDataCount(Map<String, Object> map);//메시지 개수
	public int updateReadDate(Map<String, Object> map);//메시지 읽음
	public int updateFMess(Map<String, Object> map);//메시지 삭제업데이트
	public int deleteFMess(MoimChat dto);//메시지 삭제
}
