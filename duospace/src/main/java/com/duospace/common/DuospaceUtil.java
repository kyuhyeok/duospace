package com.duospace.common;

import org.springframework.stereotype.Service;

@Service("duospace.util")
public class DuospaceUtil {
	
	/* 페이지수 구하기
	 * numPerPage : 한페이지당 데이터 갯수
	 * dataCount : 전체 데이터 수
	 * 
	 * */
	public int pageCount(int numPerPage, int dataCount) {
		int count=0;
		
		count=dataCount/numPerPage;
		if(dataCount%numPerPage !=0)
			count++;
		
		return count;
	}
	
	/* 페이징 처리 (get방식)
	 * current_page : 현재표시할 페이지
	 * total_page : 전체페이지 수
	 * list_url : 링크를 처리할 uri
	 * return : 페이징 결과
	 */
	public String pagingMethod(int current_page, int total_page, String list_url) {
		StringBuffer sb = new StringBuffer();
		
		int numPerBlock = 10;
		int currentPageSetup;
		int n, page;
		
		if(current_page<1 || total_page<1)
			return "";
		
		if(list_url.indexOf("?")!=-1)
			list_url += "&";
		else
			list_url += "?";
		
		//currentPageSetup : 맨앞에 나타나는 페이지번호
		currentPageSetup = (current_page/numPerBlock)*numPerBlock;
		if(current_page%numPerBlock ==0)
			currentPageSetup=currentPageSetup-numPerBlock;
		
		n = current_page -  numPerBlock;
		if(total_page > numPerBlock && currentPageSetup >0) {
			
		}
	
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
