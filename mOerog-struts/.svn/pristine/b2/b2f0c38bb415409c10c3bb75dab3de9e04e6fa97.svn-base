<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>anOther World: for Hardcore Gamers</title>
<link rel="stylesheet" type="text/css" href="Style/base.css"/>
<link rel="stylesheet" type="text/css" href="Style/style.css"/>
<script type="text/javascript" src="Include/button.js"></script>
<script type="text/javascript" src="Include/header.js"></script> 
</head>
<body id="guestbook">
<jsp:include page="Include/header.jsp" flush="false"/>

<div id="content">
	<!-- 방명록 입력 부분 -->
	<div class="category border">
		<h2 class="title">Guestbook</h2>
	</div>
	<%-- 로그인을 했다면 --%>
	<c:if test="${sessionScope.isLogin != null}">
		<html:form action="guestbook" styleClass="display border right">
			<html:textarea property="gbookContent" value="글 남겨주세요."/>
			<div class="innerFooter">
				<img class="btn" alt="등록" src="Icon/script_save.png" title="등록하기" onclick="document.forms[0].submit();" />
			</div>
			<html:hidden property="add"/>
		</html:form>		
	</c:if>
	<!-- 방명록 출력 부분 -->
	<c:choose>
		<%-- 등록된 글이 없다면 --%>
		<c:when test="${to.list eq null or to.totalCount == 0}">
		<div class="empty">
			<p>등록된 글이 없습니다.</p>
		</div>
		</c:when>
		<%-- 등록된 글이 있다면 --%>
		<c:otherwise>
			<!-- 글을 출력한 후.. -->
			<c:forEach var="vo" items="${to.list}">
				<div class="display border">
					<h2 class="left">${vo.writer}</h2>
					<div class="writer right">
						<p>No.${vo.gbookId}&nbsp;${vo.gbookDatetime}</p>
					</div>
					<div class="contents">
						${vo.gbookContent}
					</div>
					<%-- 로그인 한 유저가 글 등록한 사람이라면 --%>
					<c:if test="${user.userNickname eq vo.writer}">
						<!-- 사용자에 따라 아이콘 출력. -->
						<div class="innerFooter">
							<html:link action="guestbook">
								<img class="btn" src="Icon/script_delete.png" alt="삭제" title="삭제하기" />
								<html:param name="delete" value=""/>
								<html:param name="gbookId" value="${vo.gbookId}"/>
							</html:link>
						</div>
					</c:if>		
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<jsp:include page="Include/sidebar.jsp" flush="false"/>
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