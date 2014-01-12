<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<div class="innerFooter">
	<c:choose>
		<c:when test="${sessionScope.isAdmin eq 'true'}">
			<html:link action="post">
				<img class="btn" src="Icon/script_edit.png" alt="����Ʈ ����" title="�����ϱ�" />
				<html:param name="change"/>
				<html:param name="postId" value="${vo.postId}"/>
				<html:param name="postCategory" value="${vo.postCategory}"/>
				<html:param name="adminNickname" value="${vo.adminNickname}"/>
			</html:link>
			<html:link action="post">
				<img class="btn" src="Icon/script_delete.png" alt="����Ʈ ����" title="�����ϱ�"/>
				<html:param name="delete"/>
				<html:param name="postId" value="${vo.postId}"/>
				<html:param name="postCategory" value="${vo.postCategory}"/>
				<html:param name="adminNickname" value="${vo.adminNickname}"/>
			</html:link>
			<img class="btn" src="Icon/comment_add.png" alt="�ڸ�Ʈ ��" title="�ڸ�Ʈ ��" onclick="showCommentForm(true, ${vo.postId})" />
		</c:when>
		<c:when test="${sessionScope.isLogin eq 'true'}">
			<img class="btn" src="Icon/comment_add.png" alt="�ڸ�Ʈ ��" title="�ڸ�Ʈ ��" onclick="showCommentForm(true, ${vo.postId})" />
		</c:when>
	</c:choose>
</div>
