package com.duospace.common;

import org.springframework.stereotype.Service;

@Service("myUtil")
public abstract class MyUtil {
	//********************************************
	// 총페이지 수 구하기
	public int pageCount(int numPerPage, int dataCount) {
		int pageCount=0;
		
		if(dataCount > 0) {
			if(dataCount % numPerPage == 0)
				pageCount=dataCount/numPerPage;
			else
				pageCount=dataCount/numPerPage+1;
		}
		
		return pageCount;
	}
}
