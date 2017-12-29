package com.duospace.community.commaincate;

import java.util.List;
import java.util.Map;

public interface CommaincateService {
	public int insertCommaincate(Commaincate dto);	//분류 생성
	public List<Commaincate> listCommaincate(Map<String, Object> map);//분류 리스트
	public List<Commaincate> listCommainboard(Map<String, Object> map);//분류안에 제목리스트
	public int dataCount(Map<String, Object> map); 	//분류 갯수
	public Commaincate readCommaincate(); 	//read
	public int updateCommaincate(Commaincate dto);	//수정
	public int deleteCommaincate(int num);			//삭제
	
}
