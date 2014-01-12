<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8"/>
		<title>Login Page</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/style/base.css" />" />
		<link rel="stylesheet" type="text/css" href="<c:url value="/style/style.css" />" />
	</head>
	<body>
		<h2>로그인이 필요합니다:</h2>
		<form action="<c:url value="/j_spring_security_check"/>" method="post">
			<p>User Login</p>
			<p>
				<label for="userId">사용자 ID:</label>
				<input type="text" id="userId" name="userId" class="login"/>
			</p>
			<p>
				<label for="password">패스워드:</label>
				<input type="text" id="password" name="password" class="login"/>
			</p>
			<input type="submit" value="로그인" class="btn" />
		</form>
	</body>
</html>