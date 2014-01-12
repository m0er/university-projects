<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>anOther World : for Hardcore Gamers</title>
<link rel="stylesheet" type="text/css" href="Style/base.css" />
<link rel="stylesheet" type="text/css" href="Style/style.css" />
<script type="text/javascript" src="Include/header.js"></script>
</head>
<body id="league_esl">
<jsp:include page="Include/header.jsp"/>
<div id="banner1">
	<a href="http://www.esl.eu"><img src="Image/esl_banner_resize.jpg" alt="ESL banner" /></a>
</div>
<div id="content">
	<%-- Tab 부분  --%>
	<c:choose>
		<c:when test="${to.totalCount eq null or to.totalCount eq 0}">
			<div class="empty">
				<p>등록된 포스트가 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="vo" items="${to.list}">
			<div class="display border">
				<h2 class="left">${vo.postTitle}</h2>
				<div class="writer right">
					<p>${vo.postDatetime}</p>
					<p>No.${vo.postId} &nbsp; ${vo.adminNickname}</p>
				</div>
				<div class="contents">
					${vo.postContent}
				</div>
				<%-- 커멘트 부분 --%>
				<%@ include file="Include/comment.jsp" %>
				<%-- 아이콘 부분 --%>
				<%@ include file="Include/icon_post.jsp" %>
			</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<jsp:include page="Include/sidebar.jsp"/>
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