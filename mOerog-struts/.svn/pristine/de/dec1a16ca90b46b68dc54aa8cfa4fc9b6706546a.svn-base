package com.moerog.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public final class WhereFrom {
	private static Logger logger = Logger.getLogger(WhereFrom.class);
	
	/**
	 * 블로그에서 로그인(일반 유저, 관리자 모두)을 했을 때, http 헤더 중 referer
	 * 의 정보를 바탕으로 로그인을 했던 페이지로 다시 되돌아가기 위해 사용하는
	 * 메소드.
	 * @param request Http 헤더 정보를 얻기 위해 사용된다.
	 * @param mapping 카테고리가 없는 곳으로 리다이렉트 하기 위해 사용된다.
	 * @return 포워딩 할 액션을 반환한다.
	 */
	public static ActionForward referer(HttpServletRequest request, ActionMapping mapping) {
		String referer = request.getHeader("referer");
		String temp = "http://" + request.getHeader("host") + request.getContextPath();
		String category = (String)request.getSession().getAttribute("category");
		
		logger.info("String referer: " + referer);
		logger.info("String temp: " + temp);
		logger.info("세션에 저장된 카테고리: " + category);
		
		if (category == null || category.isEmpty()) {
			referer = referer.substring(temp.length() + 1, referer.indexOf(".do"));			
			return mapping.findForward(referer + "Redirect");
		} else {
			referer = referer.substring(temp.length() + 1, referer.lastIndexOf(".do") + 3);
			referer += "?category=" + category;
			ActionForward forward = new ActionForward();
			logger.info("category 있는 경우: " + referer);
			forward.setPath("/" + referer);
			forward.setRedirect(true);
			return forward;
		}
	}
}
