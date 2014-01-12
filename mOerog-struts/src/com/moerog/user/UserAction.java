package com.moerog.user;

import static com.moerog.util.WhereFrom.referer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.LazyValidatorForm;

import com.moerog.util.BasicEventDispatchAction;
import com.moerog.util.DesEncrypter;

public class UserAction extends BasicEventDispatchAction {
		
	public ActionForward register(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("register() called.");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		UserVO vo = new UserVO();
		BeanUtils.copyProperties(vo, lazyForm);
		
		logger.info(vo.getUserId());
		logger.info(vo.getUserPword());
		logger.info(vo.getUserNickname());
		logger.info(vo.getUserEmail());
		
		vo.setUserPword(DesEncrypter.encrypt(vo.getUserPword())); // ¾ÏÈ£È­
		
		client.insert("user.register", vo);

		return referer(request, mapping);
	}
	
	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("login() called.");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		UserVO requestUser = new UserVO();
		BeanUtils.copyProperties(requestUser, lazyForm);
		
		logger.info(requestUser.getUserId());
		logger.info(requestUser.getUserPword());
		
		UserVO registerUser = (UserVO)client.queryForObject(
				"user.getUser", requestUser.getUserId());
		if (DesEncrypter.decrypt(registerUser.getUserPword()).equals(
				requestUser.getUserPword())) {
			request.getSession().setAttribute("isLogin", "true");
			request.getSession().setAttribute("user", registerUser);
			logger.info("login complete");
		}
		
		return referer(request, mapping);
	}
	
	public ActionForward adminLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("adminLogin() called.");
		
		UserVO requestAdmin = new UserVO();
		requestAdmin.setUserId(request.getParameter("userId"));
		requestAdmin.setUserPword(request.getParameter("userPword"));
		
		logger.info(requestAdmin.getUserId());
		logger.info(requestAdmin.getUserPword());
		
		UserVO registerAdmin = (UserVO)client.queryForObject(
				"user.getAdmin", requestAdmin.getUserId());
		if (DesEncrypter.decrypt(registerAdmin.getUserPword()).equals(
				requestAdmin.getUserPword())) {
			request.getSession().setAttribute("isLogin", "true");
			request.getSession().setAttribute("isAdmin", "true");
			request.getSession().setAttribute("user", registerAdmin);
			logger.info("admin login");
		}
		
		return referer(request, mapping);
	}
	
	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("logout() called.");
		
		ActionForward forward = referer(request, mapping);
		request.getSession().invalidate();
		
		return forward;
	}
}
