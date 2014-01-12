<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="innerFooter">
	<c:choose>
		<c:when test="${sessionScope.loginUser.admin}">
			<a href="<spring:url value="/post/modifyForm">
						<spring:param name="id" value="${post.id}"/>
						<spring:param name="category" value="${post.category}"/>
						<spring:param name="adminNickname" value="${post.adminNickname}"/>
					</spring:url>">
				<img class="btn" src="<spring:url value="/icon/script_edit.png"/>" alt="포스트 수정" title="수정하기" />
			</a>
			<a href="<spring:url value="/post/delete">
						<spring:param name="id" value="${post.id}"/>
						<spring:param name="category" value="${post.category}"/>
						<spring:param name="adminNickname" value="${post.adminNickname}"/>
					</spring:url>">
				<img class="btn" src="<spring:url value="/icon/script_delete.png"/>" alt="포스트 삭제" title="삭제하기"/>
			</a>
			<img class="btn" src="<spring:url value="/icon/comment_add.png"/>" alt="코멘트 폼" title="코멘트 폼" onclick="showCommentForm(true, '${post.id}')" />
		</c:when>
		<c:when test="${sessionScope.loginUser.login}">
			<img class="btn" src="<spring:url value="/icon/comment_add.png"/>" alt="코멘트 폼" title="코멘트 폼" onclick="showCommentForm(true, '${post.id}')" />
		</c:when>
	</c:choose>
</div>