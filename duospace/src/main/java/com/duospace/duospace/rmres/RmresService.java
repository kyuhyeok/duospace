package com.duospace.duospace.rmres;

import java.util.List;

public interface RmresService {
	public void insertRmres(Rmres dto) throws Exception;
	public List<Rmres> listRmres(); 
}
