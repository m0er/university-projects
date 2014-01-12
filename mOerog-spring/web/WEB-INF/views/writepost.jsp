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
<body id="writePost">
<jsp:include page="include/header.jsp"/>
<div id="content">
	<div class="category border">
		<h2 class="title">New Post</h2>
	</div>
	<div class="border">
		<form:form action="/post/write" commandName="post">
			<label for="category">카테고리:</label>
			<form:select path="category" id="category">
				<form:option value="null">Select...</form:option>
				<form:option value="1">ESL</form:option>
				<form:option value="2">ClanBase</form:option>
				<form:option value="3">Media</form:option>
			</form:select>
			
			<label for="postTitle">제목:</label>
			<form:input path="title" id="postTitle" cssClass="postForm"/>
			
			<div class="category">
				<h3 class="title">Write Post</h3>
			</div>
			
			<form:textarea path="content" rows="30" cols="50"/>
			<div class="innerFooter">
				<img class="btn" alt="register" src="<spring:url value="/icon/script_save.png"/>" onclick="document.forms[0].submit();"/>
			</div>
			
			<input type="hidden" name="adminNickname" value="${sessionScope.loginUser.nickname}"/>
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