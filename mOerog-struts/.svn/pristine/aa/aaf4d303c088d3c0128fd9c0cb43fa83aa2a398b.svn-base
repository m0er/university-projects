<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>anOther World : Write Post</title>
<link rel="stylesheet" type="text/css" href="Style/base.css" />
<link rel="stylesheet" type="text/css" href="Style/style.css" />
</head>
<body id="writePost">
<jsp:include page="Include/header.jsp"/>
<div id="content">
	<div class="category border">
		<h2 class="title">New Post</h2>
	</div>
	<div class="border">
		<html:form action="post">
			<label for="category">카테고리:</label>
			<html:select property="postCategory" styleId="category">
				<html:option value="null">Select...</html:option>
				<html:option value="1">ESL</html:option>
				<html:option value="2">ClanBase</html:option>
				<html:option value="3">Media</html:option>
			</html:select>
			<label for="postTitle">제목:</label>
			<html:text property="postTitle" styleId="postTitle" styleClass="postForm"/>
			
			<div class="category">
				<h3 class="title">Write Post</h3>
			</div>
			<html:textarea property="postContent" rows="30" cols="50"></html:textarea>
			<div class="innerFooter">
				<img class="btn" alt="register" src="Icon/script_save.png" onclick="document.forms[0].submit();"/>
			</div>
			<html:hidden property="adminNickname" value="${user.userNickname}"/>
			<html:hidden property="add"/>
		</html:form>
	</div>
</div>
<jsp:include page="Include/sidebar.jsp"/>
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