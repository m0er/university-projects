<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>

<c:if test="${to.commentMap[vo.postId] != null}">
	<c:forEach var="comment" items="${to.commentMap[vo.postId]}">
		<div class="display border">
		<h2 class="left">${comment.writer}</h2>
		<div class="writer right">
			<p>No.${comment.commentId}&nbsp;${comment.commentDatetime}</p>
		</div>
		<div class="contents">
			${comment.commentContent}
		</div>
			<%-- �ۼ��ڰ� �α����� ����� ������ ������ ��� --%>
			<c:if test="${user.userNickname eq comment.writer}">
				<div class="innerFooter">
					<html:link action="comment">
						<img class="btn" src="Icon/comment_delete.png" alt="����" title="�ڸ�Ʈ ����" />
						<html:param name="delete"/>
						<html:param name="commentId" value="${comment.commentId}"/>
						<html:param name="postId" value="${vo.postId}"/>
						<html:param name="writer" value="${comment.writer}"/>
					</html:link>					
				</div>
			</c:if>
		</div>
	</c:forEach>
</c:if>
<%-- �α��� �ߴٸ� --%>
<c:if test="${sessionScope.isLogin eq 'true'}">
	<div id="commentForm${vo.postId}" style="display:none">
		<html:form action="comment" styleId="${vo.postId}thCommentForm">
			<html:textarea property="commentContent" value="�� �����ּ���."/>
			<div class="innerFooter comment">
				<img class="btn" src="Icon/script_save.png" alt="�ڸ�Ʈ ���" title="�ڸ�Ʈ ���" onclick="addComment(${vo.postId});"/>
			</div>
			<html:hidden property="add"/>
			<html:hidden property="postId" value="${vo.postId}"/>
			<html:hidden property="writer" value="${user.userNickname}"/>
		</html:form>
	</div>
</c:if>