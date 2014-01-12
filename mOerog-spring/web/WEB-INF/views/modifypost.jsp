<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="moer.moerog.module.post.Category" %>
<%@ page import="moer.moerog.module.post.Post" %>
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
<body id="writePost">
<jsp:include page="include/header.jsp"/>
<div id="content">
	<div class="category border">
		<h2 class="title">Modify Post</h2>
	</div>
	<div class="border">
		<form:form action="/post/modify" commandName="post">
			<p>
				<label for="category">카테고리:</label>
				<form:select path="category" disabled="true">
					<form:option value="${post.category}">
						<%
							Category[] cats = Category.values();
											Post post = (Post) request.getAttribute("post");
											for (int i=0; i<cats.length; i++) {
												if (post.getCategory() == cats[i].ordinal() + 1) {
													out.print(cats[i].name().toUpperCase());
												}
											}
						%>
					</form:option>
				</form:select>
				<label for="postTitle">제목:</label>
				<form:input path="title" id="title" cssClass="postForm"/>
			</p>
			<div class="category">
				<h3 class="title">Modify Post</h3>
			</div>
			<form:textarea path="content" rows="30"/>
			<div class="innerFooter">
				<img class="btn" alt="수정" src="<spring:url value="/icon/script_save.png"/>" onclick="document.forms[0].submit();"/>
			</div>
			<input type="hidden" name="id" value="${post.id}"/>
			<input type="hidden" name="category" value="${post.category}"/>
			<input type="hidden" name="adminNickname" value="${post.adminNickname}"/>
		</form:form>
	</div>
</div>
<jsp:include page="include/sidebar.jsp"/>
<!--[if IE]>
<style type="text/css" media="screen">
#content #wrap_tab {position: relative; top: 10px; left: -30px; margin-top: -20px;}
#league_esl #content .display .left, #league_clanbase #content .display .left {margin-top: 9px;}
#sidebar ul li {float: left; width: 100%;}
#sidebar ul li a {height: 1%;}
#menu a, #menu h2 {font: bold 0.7em/1.4em arial, helvetica, sans-serif;}
#writePost #content form textarea {width: 550px; margin: 0; padding: 0;} 
</style>
<![endif]-->
</body>
</html>