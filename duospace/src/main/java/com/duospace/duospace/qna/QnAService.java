package com.duospace.duospace.qna;

import java.util.List;
import java.util.Map;

public interface QnAService {

	public int insertQna(Qna dto);
	public int insertQna(Qna dto,String mode);
	public List<Qna> listQna(Map<String, Object> map);
	public Qna readQna(int num);
	public int dataCount(Map<String, Object> map);
	public int updateQna(Qna dto);
	public int deleteQna(int num);
	public Qna preReadQna(Map<String, Object> map);
	public Qna nextReadQna(Map<String, Object> map);
	
}
