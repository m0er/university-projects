package com.moerog.comment;

import java.util.Date;

public class CommentVO {
	private long commentId;
	private Date commentDatetime;
	private String commentContent;
	private long postId;
	private String writer;
	
	public long getCommentId() {
		return commentId;
	}
	public void setCommentId(long commentId) {
		this.commentId = commentId;
	}
	public Date getCommentDatetime() {
		return commentDatetime;
	}
	public void setCommentDatetime(Date commentDatetime) {
		this.commentDatetime = commentDatetime;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public long getPostId() {
		return postId;
	}
	public void setPostId(long postId) {
		this.postId = postId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
