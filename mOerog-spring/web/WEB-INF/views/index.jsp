<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="ELFunction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>anOther World : for Hardcore Gamers</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/style/base.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/style/style.css" />" />
<script type="text/javascript" src="<c:url value="/js/header.js" />"></script>
</head>
<body id="homepage">
<jsp:include page="include/header.jsp"/>
<div id="content">
	<c:forEach var="enumValue" items="${enums}">
		<div class="category border">
			<h2 class="title">${f:toUpperCase(enumValue)} | 최신 뉴스</h2>
		</div>
		<c:choose>
			<c:when test="${index.postCount[enumValue] eq 0 or index eq null}">
				<div class="empty">
					<p>등록된 포스트가 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="post" items="${index.postMap[enumValue]}">
					<div class="display border">
						<h2 class="left">${post.title}</h2>
						<div class="writer right">
							<p>${post.created}</p>
							<p>No.${post.id} &nbsp; ${post.adminNickname}</p>
						</div>
						<div class="contents">
							${post.content}
						</div>
						<%@ include file="include/comment.jsp" %>
						<%@ include file="include/icon_post.jsp" %>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<jsp:include page="include/sidebar.jsp"/>
<!--[if IE]>
<style type="text/css" media="screen">
body {behavior: url(csshover.htc);}
#sidebar ul li {float: left; width: 100%;}
#sidebar ul li a {height: 1%;}
#menu a, #menu h2 {font: bold 0.7em/1.4em arial, helvetica, sans-serif;}
#content .innerFooter ul {float: right; list-style-type: none; border-top: 2px solid #e0e0d5; padding: 5px;}
#content .commentForm {padding: 0; margin 0; width: 565px;}
</style>
<![endif]-->
</body>
</html>