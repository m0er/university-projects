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
	<!-- ���� �Է� �κ� -->
	<div class="category border">
		<h2 class="title">Guestbook</h2>
	</div>
	<%-- �α����� �ߴٸ� --%>
	<c:if test="${sessionScope.isLogin != null}">
		<html:form action="guestbook" styleClass="display border right">
			<html:textarea property="gbookContent" value="�� �����ּ���."/>
			<div class="innerFooter">
				<img class="btn" alt="���" src="Icon/script_save.png" title="����ϱ�" onclick="document.forms[0].submit();" />
			</div>
			<html:hidden property="add"/>
		</html:form>		
	</c:if>
	<!-- ���� ��� �κ� -->
	<c:choose>
		<%-- ��ϵ� ���� ���ٸ� --%>
		<c:when test="${to.list eq null or to.totalCount == 0}">
		<div class="empty">
			<p>��ϵ� ���� �����ϴ�.</p>
		</div>
		</c:when>
		<%-- ��ϵ� ���� �ִٸ� --%>
		<c:otherwise>
			<!-- ���� ����� ��.. -->
			<c:forEach var="vo" items="${to.list}">
				<div class="display border">
					<h2 class="left">${vo.writer}</h2>
					<div class="writer right">
						<p>No.${vo.gbookId}&nbsp;${vo.gbookDatetime}</p>
					</div>
					<div class="contents">
						${vo.gbookContent}
					</div>
					<%-- �α��� �� ������ �� ����� ����̶�� --%>
					<c:if test="${user.userNickname eq vo.writer}">
						<!-- ����ڿ� ���� ������ ���. -->
						<div class="innerFooter">
							<html:link action="guestbook">
								<img class="btn" src="Icon/script_delete.png" alt="����" title="�����ϱ�" />
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