package com.moerog.comment;

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
import static com.moerog.util.WhereFrom.referer;

public class CommentAction extends BasicEventDispatchAction {
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("add() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		CommentVO vo = new CommentVO();
		BeanUtils.copyProperties(vo, lazyForm);
		
		logger.info(vo.getPostId());
		logger.info(vo.getCommentContent());
		logger.info(vo.getWriter());
		
		client.insert("comment.add", vo);
		
		return referer(request, mapping);
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("delete() called");
		
		Map map = new HashMap();
		map.put("commentId", request.getParameter("commentId"));
		map.put("postId", request.getParameter("postId"));
		map.put("writer", request.getParameter("writer"));
		
		logger.info(map.get("commentId"));
		logger.info(map.get("postId"));
		logger.info(map.get("writer"));
		
		client.delete("comment.delete", map);
		
		return referer(request, mapping);
	}
}
