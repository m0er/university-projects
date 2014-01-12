package com.moerog.post;

import static com.moerog.util.WhereFrom.referer;

import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.LazyValidatorForm;

import com.moerog.util.BasicEventDispatchAction;

public class PostAction extends BasicEventDispatchAction {
	
	@SuppressWarnings("unchecked")
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("list() called");
		
		String category = getCategory(request);
		int categoryNo = Category.valueOf(category).getCategory();
		
		logger.info("ī�װ� ��ȣ: " + categoryNo);
		logger.info("ī�װ� �̸�: " + category);
		
		PostTO to = new PostTO();
		to.setList(client.queryForList("post.list",	categoryNo));
		
		addComment(to);
		
		to.setTotalCount((Long)client.queryForObject("post.totalCount", categoryNo));
		
		logger.info("ī�װ��� �ۼ��� ����Ʈ ����: " + to.getTotalCount());
		logger.info("����Ʈ�� ��ϵ� Ŀ��Ʈ ����Ʈ ����: " + to.getCommentMap().size());
		
		request.setAttribute("to", to);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/" + category + ".jsp");
		forward.setRedirect(false);
		logger.info("�������� ���: " + forward.getPath());
		return forward;
	}

	@SuppressWarnings("unchecked")
	private void addComment(PostTO to) throws SQLException {
		for (PostVO vo : to.getList()) {			
			long postId = vo.getPostId();
			
			if ((Long)client.queryForObject("comment.totalCount", postId) > 0) {
				to.getCommentMap().put(postId, client.queryForList("comment.list", postId));
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	private String getCategory(HttpServletRequest request) {
		Enumeration<String> e = request.getParameterNames();
		String category = null;
		while (e.hasMoreElements()) {
			if (((String)e.nextElement()).equals("category")) {
				category = request.getParameter("category");
				
				if (category.equals("undefiend")) {
					continue;
				}
				
				request.getSession().setAttribute("category", category);
				logger.info("request�� ī�װ� ������ ���� ��: " + category);
			}
		}
		
		if (category == null) {
			category = (String)request.getSession().getAttribute("category");
			logger.info("request�� ī�װ� ������ ���� ��: " + category);
		}
		
		return category;
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("add() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		PostVO vo = new PostVO();
		BeanUtils.copyProperties(vo, lazyForm);
		
		logger.info(vo.getPostCategory());
		logger.info(vo.getPostTitle());
		
		client.insert("post.add", vo);
		form = null; // �� �ʱ�ȭ
		/*
		 * ����Ʈ �ۼ��� ������ ī�װ��� �ۼ� �Ϸ� �� �̵��Ѵ�.
		 */
		return selectCategory(mapping, request, response, lazyForm, vo);
	}

	private ActionForward selectCategory(ActionMapping mapping,
			HttpServletRequest request, HttpServletResponse response,
			LazyValidatorForm lazyForm, PostVO vo) throws Exception {
		Category[] enums = Category.values();		
		for (Category category : enums) {
			if (category.ordinal() + 1 == vo.getPostCategory()) {
				String path = category.name();
				logger.info("����Ʈ �ۼ� ��, ���õ� ī�װ�: " + path);
				request.getSession().setAttribute("category", path);				
				return list(mapping, lazyForm, request, response);
			}
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("delete() called");
		
		Map map = new HashMap();
		map.put("postId", Long.valueOf(request.getParameter("postId")));
		map.put("postCategory", Integer.valueOf(request.getParameter("postCategory")));
		map.put("adminNickname", request.getParameter("adminNickname"));
		
		client.delete("post.delete", map);
		
		return referer(request, mapping); // redirect
	}
	
	public ActionForward write(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("write() called");
				
		return mapping.findForward("writepost");
	}
	
	public ActionForward modify(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("modify() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		PostVO vo = new PostVO();
		BeanUtils.copyProperties(vo, lazyForm);
		
		client.update("post.modify", vo);
		
		return  list(mapping, form, request, response);
	}
	
	public ActionForward change(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("change() called");
		
		PostVO vo = new PostVO();
		vo.setAdminNickname(request.getParameter("adminNickname"));
		vo.setPostCategory(Integer.valueOf(request.getParameter("postCategory")));
		vo.setPostId(Long.valueOf(request.getParameter("postId")));
		vo = (PostVO)client.queryForObject("post.getPost", vo);
		request.setAttribute("vo", vo);
		
		logger.info(vo.getAdminNickname());
		logger.info(vo.getPostTitle());
		logger.info(vo.getPostContent());
		
		return mapping.findForward("changepost");
	}
}
