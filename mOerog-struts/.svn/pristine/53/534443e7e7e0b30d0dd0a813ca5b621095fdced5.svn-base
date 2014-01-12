package com.moerog.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moerog.comment.CommentVO;

public class PostTO {
	private List<PostVO> list;
	private long totalCount;
	private Map<Long, List<CommentVO>> commentMap = new HashMap<Long, List<CommentVO>>();
	
	public Map<Long, List<CommentVO>> getCommentMap() {
		return commentMap;
	}
	public void setCommentMap(Map<Long, List<CommentVO>> commentMap) {
		this.commentMap = commentMap;
	}
	public List<PostVO> getList() {
		return list;
	}
	public void setList(List<PostVO> list) {
		this.list = list;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
}
