package com.moerog.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.moerog.comment.CommentVO;
import com.moerog.post.PostVO;

public class IndexTO {
	private Map<String, List<PostVO>> postMap = new HashMap<String, List<PostVO>>();
	private Map<String, Long> postCount = new HashMap<String, Long>();
	private Map<Long, List<CommentVO>> commentMap = new HashMap<Long, List<CommentVO>>();
	
	public Map<Long, List<CommentVO>> getCommentMap() {
		return commentMap;
	}

	public void setCommentMap(Map<Long, List<CommentVO>> commentMap) {
		this.commentMap = commentMap;
	}

	public Map<String, Long> getPostCount() {
		return postCount;
	}

	public void setPostCount(Map<String, Long> postCount) {
		this.postCount = postCount;
	}

	public Map<String, List<PostVO>> getPostMap() {
		return postMap;
	}

	public void setPostMap(Map<String, List<PostVO>> postMap) {
		this.postMap = postMap;
	}
}
