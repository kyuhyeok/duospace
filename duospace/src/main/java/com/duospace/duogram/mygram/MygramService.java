package com.duospace.duogram.mygram;

public interface MygramService {
	public int countAccept(int memberNum);
	public int insertGram(Mygram dto, String pathname);
}
