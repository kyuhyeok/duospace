package com.duospace.duogram;

import java.util.List;
import java.util.Map;

public interface DuogramService {
	public int insertAccept(int memberNum);
	public int countAccept(int memberNum);
	public int insertBoard(Duogram dto);
	public int dataCount();
	public List<Duogram> listDuogram(Map<String, Object> map);
}
