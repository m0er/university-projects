<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html" %>

<div id="header">
	<h1><em>It's</em><br /><html:link action="index">REALITY.</html:link></h1>
</div>
<c:choose>
<c:when test="${sessionScope.isLogin eq null or 'false'}">
	<div id="login">
		<p><a onclick="selectMenu(1)">로그인</a> | <a onclick="selectMenu(2)">등록하기</a></p>
		<div id="loginForm" style="display:none">
			<html:form method="POST" action="user">
				<p>User Login</p>
				<p>
					<label for="loginId">ID:</label>
					<html:text property="userId" styleId="loginId" styleClass="login"/>
				</p>
				<p>
					<label for="loginPassword">PW:</label>
					<html:password property="userPword" redisplay="false" styleId="loginPassword" styleClass="login"/>
				</p>
				<html:hidden property="login"/>
				<html:submit value="로그인" styleClass="btn"/>
			</html:form>
		</div>
		<div id="registerForm" style="display:none">
			<html:form method="POST" action="user">
				<p>Register User</p>
				<p>
					<label for="user_id">ID:</label>
					<html:text property="userId" styleId="user_id" styleClass="login"/>
				</p>
				<p>
					<label for="user_password">PW:</label>
					<html:password property="userPword" styleId="user_password" redisplay="false" styleClass="login"/>
				</p>
				<p>
					<label for="user_nickname">nickname:</label>
					<html:text property="userNickname" styleId="user_nickname" styleClass="login"/>
				</p>
				<p>
					<label for="user_email">e-mail:</label>
					<html:text property="userEmail" styleId="user_email" styleClass="login"/>
				</p>
				<html:hidden property="register"/>
				<html:submit value="등록" styleClass="btn"/>
			</html:form>		
		</div>
	</div>
</c:when>
<c:otherwise>
	<div id="logout">
		<p>
			<html:link action="user">
				로그아웃
				<html:param name="logout" value=""/>
			</html:link>
		</p>
	</div>
</c:otherwise>
</c:choose>