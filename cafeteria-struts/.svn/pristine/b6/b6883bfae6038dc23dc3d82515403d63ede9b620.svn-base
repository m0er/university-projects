package kr.ac.bu.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.bu.util.BasicEventDispatchAction;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.LazyValidatorForm;

public class IndexAction extends BasicEventDispatchAction {
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("index.list() called");
		
		return mapping.findForward("index");
	}
	
	public ActionForward userLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("index.login() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		IndexVO vo = new IndexVO();
		
		BeanUtils.copyProperties(vo, lazyForm);
		vo.setType("USER");
		
		logger.info(vo.getId());
		logger.info(vo.getPw());
		
		loginProcess(vo, request);		
		
		return mapping.findForward("index");
	}
	
	public ActionForward adminLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("index.adminLogin() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		IndexVO vo = new IndexVO();
		
		BeanUtils.copyProperties(vo, lazyForm);
		vo.setType("ADMIN");
		
		logger.info(vo.getId());
		logger.info(vo.getPw());
		
		loginProcess(vo, request);
		
		return mapping.findForward("index");
	}
	
	private void loginProcess(IndexVO vo, HttpServletRequest request) throws Exception {
		vo = (IndexVO)client.queryForObject("index.getClient", vo);		
		logger.info(vo.getName());
		request.setAttribute("user", vo);
		request.getSession().setAttribute("user", vo);
	}
	
	public ActionForward building(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("index.building() called");
		logger.info(request.getParameter("building"));
		
		request.getSession().setAttribute("building",
				request.getParameter("building"));
		return mapping.findForward("plexRedirect");
	}
	
	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("index.logout() called");
		
		request.getSession().invalidate();
		
		logger.info(request.getSession().getAttribute("user"));
		
		return mapping.findForward("index");
	}
}
