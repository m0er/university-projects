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
<body id="guestbook">
<jsp:include page="include/header.jsp" flush="false"/>

<div id="content">
	<!-- 방명록 입력 부분 -->
	<div class="category border">
		<h2 class="title">Guestbook</h2>
	</div>
	<%-- 로그인을 했다면 --%>
	<c:if test="${sessionScope.loginUser.login eq 'true'}">
		<form:form action="/guestbook/add" method="post" cssClass="display border right" commandName="guestbook">
			<form:textarea path="content" title="글 남겨주세요"/>
			<input type="hidden" name="writer" value="${sessionScope.loginUser.nickname}"/>
			<div class="innerFooter">
				<img class="btn" alt="등록" src="<c:url value="/icon/script_save.png"/>" title="등록하기" onclick="document.forms[0].submit();" />
			</div>
		</form:form>
	</c:if>
	<!-- 방명록 출력 부분 -->
	<c:choose>
		<%-- 등록된 글이 없다면 --%>
		<c:when test="${list eq null or totalCount == 0}">
		<div class="empty">
			<p>등록된 글이 없습니다.</p>
		</div>
		</c:when>
		<%-- 등록된 글이 있다면 --%>
		<c:otherwise>
			<!-- 글을 출력한 후.. -->
			<c:forEach var="guestbook" items="${list}">
				<div class="display border">
					<h2 class="left">${guestbook.writer}</h2>
					<div class="writer right">
						<p>No.${guestbook.id}&nbsp;${guestbook.created}</p>
					</div>
					<div class="contents">
						${guestbook.content}
					</div>
					<%-- 로그인 한 유저가 글 등록한 사람이라면 --%>
					<c:if test="${sessionScope.loginUser.nickname eq guestbook.writer}">
						<!-- 사용자에 따라 아이콘 출력. -->
						<div class="innerFooter">
							<a href="<spring:url value="/guestbook/delete">
										<spring:param name="id" value="${guestbook.id}" />
										<spring:param name="writer" value="${guestbook.writer}" />
									</spring:url>">
								<img class="btn" src="<c:url value="/icon/script_delete.png"/>" alt="삭제" title="삭제하기" />
							</a>
						</div>
					</c:if>		
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<jsp:include page="include/sidebar.jsp" flush="false"/>
<!--[if IE]>
<style type="text/css" media="screen">
body {behavior: url(csshover.htc);}
#sidebar ul li {float: left; width: 100%;}
#sidebar ul li a {height: 1%;}
#menu a, #menu h2 {font: bold 0.7em/1.4em arial, helvetica, sans-serif;}
#content .innerFooter ul {float: right; list-style-type: none; border-top: 2px solid #e0e0d5; padding: 5px;}
#guestbook #content form {padding: 0;}
#guestbook #content form textarea {margin-left: -5px; width: 565px;}
</style>
<![endif]-->
</body>
</html>