<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="ELFunction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>anOther World : for Hardcore Gamers</title>
<link rel="stylesheet" type="text/css" href="Style/base.css" />
<link rel="stylesheet" type="text/css" href="Style/style.css" />
<script type="text/javascript" src="Include/header.js"></script>
</head>
<body id="homepage">
<jsp:include page="Include/header.jsp"/>
<div id="content">
	<c:forEach var="enum" items="${enums}">
		<div class="category border">
			<h2 class="title">${util:toUpperCase(enum)} | 최신 뉴스</h2>
		</div>
		<c:choose>
			<c:when test="${to.postCount[enum] eq 0}">
				<div class="empty">
					<p>등록된 포스트가 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${to.postMap[enum]}">
					<div class="display border">
						<h2 class="left">${vo.postTitle}</h2>
						<div class="writer right">
							<p>vo.${vo.postDatetime}</p>
							<p>No.${vo.postId} &nbsp; ${vo.adminNickname}</p>
						</div>
						<div class="contents">
							${vo.postContent}
						</div>
						<%@ include file="Include/comment.jsp" %>		
						<%@ include file="Include/icon_post.jsp" %>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<jsp:include page="Include/sidebar.jsp"/>
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