package com.moerog.index;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.moerog.post.Category;
import com.moerog.post.PostVO;
import com.moerog.util.BasicAction;

public class IndexAction extends BasicAction {

	@SuppressWarnings("unchecked")
	@Override
	protected ActionForward executeAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("IndexAction called");
		
		IndexTO to = new IndexTO();
		List<String> list = new ArrayList<String>();
		for (Category enums : Category.values()) {
			int categoryNo = enums.getCategory();
			String categoryName = enums.name();
			
			logger.info(categoryName);
			
			to.getPostMap().put(categoryName, client.queryForList(
					"post.getIndex", categoryNo));
			to.getPostCount().put(categoryName, (Long)client.queryForObject(
					"post.totalCount", categoryNo));
			logger.info(categoryName + " 포스트 개수: " +
					to.getPostCount().get(categoryName));
			
			addComment(to, categoryName);
			list.add(categoryName);			
		}
		
		request.setAttribute("to", to);		
		request.setAttribute("enums", list);
		
		return mapping.findForward("indexForward");
	}
	
	@SuppressWarnings("unchecked")
	private void addComment(IndexTO to, String categoryName) throws SQLException {
		for (PostVO vo : to.getPostMap().get(categoryName)) {			
			long postId = vo.getPostId();
			
			if ((Long)client.queryForObject("comment.totalCount", postId) > 0) {
				to.getCommentMap().put(postId, client.queryForList("comment.list", postId));
			}
		}
	}
}
