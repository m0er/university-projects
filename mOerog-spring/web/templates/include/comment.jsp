<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${commentMap[post.id] != null}">
	<c:forEach var="comment" items="${commentMap[post.id]}">
		<div class="display border">
		<h2 class="left">${comment.writer}</h2>
		<div class="writer right">
			<p>No.${comment.id}&nbsp;${comment.created}</p>
		</div>
		<div class="contents">
			${comment.content}
		</div>
			<%-- 작성자가 로그인한 사람과 같으면 아이콘 출력 --%>
			<c:if test="${sessionScope.loginUser.nickname eq comment.writer}">
				<div class="innerFooter">
					<a href="<spring:url value="/comment/delete">
								<spring:param name="id" value="${comment.id}"/>
								<spring:param name="postId" value="${post.id}"/>
								<spring:param name="writer" value="${comment.writer}"/>
								<spring:param name="category" value="${post.category}"/>
							</spring:url>">
						<img class="btn" src="<spring:url value="/icon/comment_delete.png"/>" alt="삭제" title="코멘트 삭제" />
					</a>
				</div>
			</c:if>
		</div>
	</c:forEach>
</c:if>
<%-- 로그인 했다면 --%>
<c:if test="${sessionScope.loginUser.login}">
	<div id="commentForm${post.id}" style="display:none">
		<form:form action="/comment/add" commandName="comment" id="${post.id}thCommentForm">
			<form:textarea path="content" title="글 남겨주세요"/>
			<div class="innerFooter comment">
				<img class="btn" src="<spring:url value="/icon/script_save.png"/>" alt="코멘트 등록" title="코멘트 등록" onclick="addComment('${post.id}');"/>
			</div>
			<input type="hidden" name="postId" value="${post.id}"/>
			<input type="hidden" name="writer" value="${sessionScope.loginUser.nickname}"/>
			<input type="hidden" name="category" value="${post.category}"/>
		</form:form>
	</div>
</c:if>