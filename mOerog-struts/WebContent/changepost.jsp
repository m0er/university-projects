<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.moerog.post.Category" %>
<%@ page import="com.moerog.post.PostVO" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>anOther World : Write Post</title>
<link rel="stylesheet" type="text/css" href="Style/base.css" />
<link rel="stylesheet" type="text/css" href="Style/style.css" />
<script type="text/javascript" src="Include/header.js"></script>
</head>
<body id="writePost">
<jsp:include page="Include/header.jsp"/>
<div id="content">
	<div class="category border">
		<h2 class="title">Modify Post</h2>
	</div>
	<div class="border">
		<html:form action="post">
			<p>
				<label for="category">카테고리:</label>
				<html:select property="postCategory" disabled="true">
					<html:option value="${vo.postCategory}">
						<%
							Category[] cats = Category.values();
							PostVO vo = (PostVO)request.getAttribute("vo");
							for (int i=0; i<cats.length; i++) {
								if (vo.getPostCategory() == cats[i].ordinal() + 1) {
									out.print(cats[i].name().toUpperCase());
								}
							}
						%>
					</html:option>
				</html:select>			
				<label for="postTitle">제목:</label>
				<html:text property="postTitle" value="${vo.postTitle}" styleClass="postForm"/>
			</p>
			<div class="category">
				<h3 class="title">Modify Post</h3>
			</div>
			<html:textarea property="postContent" rows="30" value="${vo.postContent}"/>
			<div class="innerFooter">
				<img class="btn" alt="수정" src="Icon\script_save.png" onclick="document.forms[0].submit();"/>
			</div>
			<html:hidden property="modify"/>
			<html:hidden property="adminNickname" value="${vo.adminNickname}"/>
			<html:hidden property="postId" value="${vo.postId}"/>
			<html:hidden property="postCategory" value="${vo.postCategory}"/>
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