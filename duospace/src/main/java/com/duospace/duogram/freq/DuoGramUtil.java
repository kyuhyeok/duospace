package com.duospace.duogram.freq;

import org.springframework.stereotype.Service;

import com.duospace.common.MyUtil;

@Service("duogram.duoGramUtil")
public class DuoGramUtil extends MyUtil{

	@Override
	public int pageCount(int numPerPage, int dataCount) {
		
		return super.pageCount(numPerPage, dataCount);
	}
	

}
