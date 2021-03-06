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
		int pageCount=0;
		
		
		if(dataCount > 0) {
			if(dataCount % numPerPage == 0)
				pageCount=dataCount/numPerPage;
			else
				pageCount=dataCount/numPerPage+1;
		}
		
		
		return pageCount;
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
			sb.append("<a href='" + list_url + "page=1'><img src='/duospace/resource/images/duospace/icon/btn_page_first.gif'></a>");
			sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'><img src='/duospace/resource/images/duospace/icon/btn_page_prev.gif'></a>");
		}
		// 바로가기(페이지번호)
				page = currentPageSetup + 1;
				while (page <= total_page && page <= (currentPageSetup + numPerBlock)) {
					if (page == current_page) {
						sb.append("&nbsp;<span style='color:#172a40;font-weight: bold;text-decoration: underline;'>" + page + "</span>");
					} else {
						sb.append("&nbsp;<a href='" + list_url + "page=" + page + "' style='color: #172a40;font-weight: bold;'>" + page + "</a>");
					}
					page++;
				}

				// 다음(10페이지 후), 마지막
				n = current_page + numPerBlock;
				if (n > total_page)
					n = total_page;
				if (total_page - currentPageSetup > numPerBlock) {
					sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'><img src='/duospace/resource/images/duospace/icon/btn_page_next.gif'></a>");
					sb.append("&nbsp;<a href='" + list_url + "page=" + total_page + "'><img src='/duospace/resource/images/duospace/icon/btn_page_last.gif'></a>");
				}

				return sb.toString();
	}
	
	
	
	  public String paging2Method(int current_page, int total_page, String list_url) {
	      StringBuffer sb = new StringBuffer();
	      
	      int numPerBlock = 5;
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
	         sb.append("<a href='" + list_url + "page=1'><button type=\"button\" class=\"btn btn-info btn-sm\">처음</button></a>");
	         sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'><button type=\"button\" class=\"btn btn-default btn-sm\">이전</button></a>");
	      }
	      // 바로가기(페이지번호)
	            page = currentPageSetup + 1;
	            while (page <= total_page && page <= (currentPageSetup + numPerBlock)) {
	               if (page == current_page) {
	                  sb.append("&nbsp;<button type=\"button\" class=\"btn btn-default btn-sm active\">" + page + "</button>");
	               } else {
	                  sb.append("&nbsp;<a href='" + list_url + "page=" + page + "' style='color: #7c7b7b'><button type=\"button\" class=\"btn btn-default btn-sm\">" + page + "</button></a>");
	               }
	               page++;
	            }

	            // 다음(10페이지 후), 마지막
	            n = current_page + numPerBlock;
	            if (n > total_page)
	               n = total_page;
	            if (total_page - currentPageSetup > numPerBlock) {
	               sb.append("&nbsp;<a href='" + list_url + "page=" + n + "'><button type=\"button\" class=\"btn btn-default btn-sm\">다음</button></a>");
	               sb.append("&nbsp;<a href='" + list_url + "page=" + total_page + "'><button type=\"button\" class=\"btn btn-info btn-sm\">끝</button></a>");
	            }

	            return sb.toString();

	
	
	
	
	
	
	
	  }
	  
	  public String checkNull(String str) {
	         String strTmp;
	         if (str == null)
	             strTmp = "";
	         else
	             strTmp = str;
	         return strTmp;
	     }
	  
	  
	  public String htmlToStr(String sText) {
		  
		  sText=checkNull(sText);
		  
		  sText=sText.replace("&lt;", "<");
		  sText=sText.replace("&gt;", ">");
		  sText=sText.replace("&amp;", "&");
		  sText=sText.replace("&#37;", (char)37 + "");
		  sText=sText.replace("&quot;", (char)34 + "");
		  sText=sText.replace("&#39;", (char)39 + "");
		  sText=sText.replace("&#35;","#");
		  sText=sText.replace("<br>","\n");
		  sText=sText.replace("&nbsp;"," ");
		 
		  
		  return sText;
	  }
	  
	  
	  public String strToHtml(String str) {
			if(str==null||str.length()==0)
				return "";

	    	 str=str.replaceAll("&", "&amp;");
	    	 str=str.replaceAll("#", "&#35;");
	    	 str=str.replaceAll("\"", "&quot;");
	    	 str=str.replaceAll(">", "&gt;");
	    	 str=str.replaceAll("<", "&lt;");
	    	 str=str.replaceAll("%", "&#37;");
	    	 str=str.replaceAll("'", "#39;");
	    	 str=str.replaceAll(" ", "&nbsp;");
	    	 str=str.replaceAll("\n", "<br>");
	    	 
	    	 return str;
	     }
	
	  
	
	
	
}
