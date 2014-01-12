<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>anOther World: for Hardcore Gamers</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/style/base.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/style/style.css"/>"/>
<script type="text/javascript" src="<c:url value="/js/header.js"/>"></script>
</head>
<body id="league_esl">
<jsp:include page="include/header.jsp" flush="false"/>
<div id="banner1">
	<a href="http://www.esl.eu"><img src="<spring:url value="/image/esl_banner_resize.jpg"/>" alt="ESL banner" /></a>
</div>
<div id="content">
	<%-- Tab 부분  --%>
	<c:choose>
		<c:when test="${totalCount eq 0 or postList eq null}">
			<div class="empty">
				<p>등록된 포스트가 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="post" items="${postList}">
			<div class="display border">
				<h2 class="left">${post.title}</h2>
				<div class="writer right">
					<p>${post.created}</p>
					<p>No.${post.id} &nbsp; ${post.adminNickname}</p>
				</div>
				<div class="contents">
					${post.content}
				</div>
				<%-- 커멘트 부분 --%>
				<%@ include file="include/comment.jsp" %>
				<%-- 아이콘 부분 --%>
				<%@ include file="include/icon_post.jsp" %>
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<jsp:include page="include/sidebar.jsp" flush="false"/>
<!--[if IE]>
<style type="text/css" media="screen">
#content #wrap_tab {position: relative; top: 10px; left: -30px; margin-top: -20px;}
#league_esl #content .display .left, #league_clanbase #content .display .left {margin-top: 9px;}
#sidebar ul li {float: left; width: 100%;}
#sidebar ul li a {height: 1%;}
#menu a, #menu h2 {font: bold 0.7em/1.4em arial, helvetica, sans-serif;}
</style>
<![endif]-->
</body>
</html>