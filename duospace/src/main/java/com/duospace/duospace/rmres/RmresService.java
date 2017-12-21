package com.duospace.duospace.rmres;

import java.util.List;
import java.util.Map;

public interface RmresService {
	public void insertRmres(Rmres dto) throws Exception;
	public List<Rmres> listRmres(); 
	public Rmres listComplete(int reservNum);
	public int readReserveNum();
	public int reservCount(Map<String,Object> map);
}
