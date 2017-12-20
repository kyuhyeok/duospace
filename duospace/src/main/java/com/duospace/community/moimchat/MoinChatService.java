package com.duospace.community.moimchat;

import java.util.List;
import java.util.Map;

public interface MoinChatService {
	public List<MoinChat> listFMC(Map<String, Object> map);//친구리스트
	public int fMURtDCnt(Map<String, Object> map);//안읽은 메시지 총 
	public int listFMCDataCount(Map<String, Object> map);//메신저 친구 리스트 개수
	
	public int insertFMess(MoinChat dto);//메시지 보내기
	public MoinChat readFMess(Map<String, Object> map);//해당 메시지 확인
	public List<MoinChat> listFMessContent(Map<String, Object> map);//해당 친구 메시지들
	public int fMCListDataCount(Map<String, Object> map);//메시지 개수
	public int updateReadDate(Map<String, Object> map);//메시지 읽음
	public int updateFMess(Map<String, Object> map);//메시지 삭제업데이트
	public int deleteFMess(MoinChat dto);//메시지 삭제
}
