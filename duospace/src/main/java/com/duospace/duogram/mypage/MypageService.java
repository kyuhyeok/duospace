package com.duospace.duogram.mypage;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public int insertAccept(int memberNum);
	public int countAccept(int memberNum);
	public int insertBoard(Mypage dto);
	public int dataCount(Map<String, Object> map);
	public List<Mypage> listMypage(Map<String, Object> map);
	public int deleteBoard(int num, int memberNum);
	public Mypage readBoard(int num);
	public int updateBoard(Mypage dto);
}
