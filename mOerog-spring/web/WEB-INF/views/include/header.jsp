<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="header">
	<h1><em>It's</em><br /><a href="<c:url value="/index" />">REALITY.</a></h1>
</div>
<c:choose>
<c:when test="${sessionScope.loginUser eq null or sessionScope.loginUser.login eq false}">
	<div id="login">
		<p><a onclick="selectMenu(1)">로그인</a> | <a onclick="selectMenu(2)">등록하기</a></p>
		<div id="loginForm" style="display:none">
			<form:form action="/user/login" method="post" commandName="user">
				<p>User Login</p>
				<p>
					<label for="loginId">ID:</label>
					<form:input path="userId" id="loginId" cssClass="login"/>
				</p>
				<p>
					<label for="loginPassword">PW:</label>
					<form:password path="password" id="loginPassword" cssStyle="login"/>
				</p>
				<input type="submit" value="로그인" class="btn" />
			</form:form>
		</div>
		<div id="registerForm" style="display:none">
			<form:form method="post" action="/user/register" commandName="user">
				<p>Register User</p>
				<p>
					<label for="user_id">ID:</label>
					<form:input path="userId" id="user_id" cssClass="login"/>
				</p>
				<p>
					<label for="user_password">PW:</label>
					<form:password path="password" id="user_password" cssClass="login"/>
				</p>
				<p>
					<label for="user_nickname">nickname:</label>
					<form:input path="nickname" id="user_nickname" cssClass="login"/>
				</p>
				<p>
					<label for="user_email">e-mail:</label>
					<form:input path="email" id="user_email" cssClass="login"/>
				</p>
				<input type="submit" value="등록" class="btn"/>
			</form:form>
		</div>
	</div>
</c:when>
<c:otherwise>
	<div id="logout">
		<p>
			<a href="<c:url value="/user/logout" />">로그아웃</a>
		</p>
	</div>
</c:otherwise>
</c:choose>