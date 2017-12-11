package com.duospace.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger=LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		boolean result = false;
		
		try {
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
			String cp=request.getContextPath();
			String uri=request.getRequestURI();
			String queryString=request.getQueryString();  //쿼리스트링==파라미터
			if(info==null) {
				
				if(isAjax(request)) {  //ajax요청인데 로그인이 안되있으면 403에러를 던지겟다
					 					//article.jsp에서 AJAX헤더로 넘길예정 TRUE, FALSE
					response.sendError(403);
					return result;
				}
				
				if(uri.indexOf(cp)==0)
					uri=uri.substring(cp.length());
				if(queryString!=null)
					uri="?"+queryString;
				
				
				//session.setAttribute("preLoginURI", uri); //로그인 전 주소   ex. uri : /bbs/list
				
				response.sendRedirect(cp+"/member/login");
				
				
			}else {
				result=true;
			}
			
		} catch (Exception e) {
			logger.info("pre : "+e.toString());
		}
		
		return result;
	}

	
	//AJAX 요청인지를 확인하는 메소드
	private boolean isAjax(HttpServletRequest req) {
		String header=req.getHeader("AJAX");
		return header !=null && header.equals("true");
	}

}
