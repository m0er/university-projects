package com.moerog.guestbook;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.LazyValidatorForm;

import com.moerog.user.UserVO;
import com.moerog.util.BasicEventDispatchAction;
import static com.moerog.util.WhereFrom.referer;

public class GuestBookAction extends BasicEventDispatchAction {
	
	@SuppressWarnings("unchecked")
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("list() called");
		
		GuestBookTO to = new GuestBookTO();		
		to.setList(client.queryForList("gbook.list"));
		to.setTotalCount((Long)client.queryForObject("gbook.totalCount"));
		
		logger.info("Total Count: " + to.getTotalCount());
		logger.info(to.getList().toString());
		
		request.setAttribute("to", to);
		
		/*
		 * 로그인 등의 처리 후, 다시 guestbook.jsp 페이지를 보여줘야 할 때,
		 * list() 메소드를 호출한 후, guestbook.jsp 페이지로 단순 포워드한다.
		 */
		return mapping.findForward("guestbookForward");
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("add() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		GuestBookVO vo = new GuestBookVO();
		BeanUtils.copyProperties(vo, lazyForm);
		
		logger.info("컨텐츠 내용: " + vo.getGbookContent());
		
		UserVO user = (UserVO)request.getSession().getAttribute("user");		
		logger.info("현재 로그인된 유저: " + user.getUserId());
		
		vo.setWriter(user.getUserNickname());		
		client.insert("gbook.add", vo);
		
		return list(mapping, form, request, response);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("delete() called");
		
		long gbookId = Long.valueOf(request.getParameter("gbookId"));
		Map map = new HashMap();
		
		map.put("gbookId", gbookId);
		UserVO vo = (UserVO)request.getSession().getAttribute("user");
		map.put("writer", vo.getUserNickname());
		
		client.delete("gbook.delete", map);
		
		//return list(mapping, form, request, response);
		return referer(request, mapping);
	}
}
