package com.duospace.duogram.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public int insertAccept(int memberNum);
	public int countAccept(int memberNum);
	public int insertBoard(Mypage dto);
	public int dataCount(Map<String, Object> map);
	public List<Mypage> listDuogram(Map<String, Object> map);
}
