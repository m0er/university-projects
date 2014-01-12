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
		
		logger.info("카테고리 번호: " + categoryNo);
		logger.info("카테고리 이름: " + category);
		
		PostTO to = new PostTO();
		to.setList(client.queryForList("post.list",	categoryNo));
		
		addComment(to);
		
		to.setTotalCount((Long)client.queryForObject("post.totalCount", categoryNo));
		
		logger.info("카테고리에 작성된 포스트 개수: " + to.getTotalCount());
		logger.info("포스트에 등록된 커멘트 리스트 개수: " + to.getCommentMap().size());
		
		request.setAttribute("to", to);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/" + category + ".jsp");
		forward.setRedirect(false);
		logger.info("포워딩할 경로: " + forward.getPath());
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
				logger.info("request에 카테고리 정보가 있을 때: " + category);
			}
		}
		
		if (category == null) {
			category = (String)request.getSession().getAttribute("category");
			logger.info("request에 카테고리 정보가 없을 때: " + category);
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
		form = null; // 폼 초기화
		/*
		 * 포스트 작성시 선택한 카테고리로 작성 완료 후 이동한다.
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
				logger.info("포스트 작성 후, 선택된 카테고리: " + path);
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
