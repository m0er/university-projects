<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>백석대 음식 판매 시스템 // 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="style/base.css"/>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
<script type="text/javascript">
function login() {
	var element = document.createElement("input");
	element.type = "hidden";	
	
	if (document.commonForm.admin.checked) {		
		element.name = "adminLogin";			
	} else {
		element.name = "userLogin";		
	}

	element.value = "";
	document.commonForm.appendChild(element);
	document.commonForm.submit();
}

function empty(element) {
	element.value = "";

	if (element.id == "pw") {
		element.type = "password";
	}
}
</script>
</head>
<body id="index">
<jsp:include page="include/header.jsp"/>
<div id="index_contents">
	<div id="index_nav">
		<c:choose>
			<c:when test="${sessionScope.user eq null}">
				<h2>로그인</h2>
				<html:form styleId="form">
					<p>		
						<html:text property="id" styleId="id" value="아이디" onfocus="empty(this);" styleClass="text"/>		
						<input type="checkbox" name="admin"/>운영자
					</p>
					<p>
						<html:text property="pw" styleId="pw" value="비밀번호" onfocus="empty(this);" styleClass="text"/>
						<input type="button" onclick="login();" value="로그인"/>		
					</p>	
				</html:form>
			</c:when>
			<c:otherwise>
				<h2>${sessionScope.user.name}님 로그인</h2>
				<ul>
					<li>
						<html:link action="/index" useLocalEncoding="true">로그아웃
							<html:param name="logout"/>
						</html:link>
					</li>
					<li>
						<html:link action="/index" useLocalEncoding="true">본부동
							<html:param name="building" value="bonbu"/>
						</html:link>
					</li>
					<li>
						<html:link action="/index" useLocalEncoding="true">교수회관
							<html:param name="building" value="prof"/>
						</html:link>
					</li>
					<li>
						<html:link action="/index" useLocalEncoding="true">복지동
							<html:param name="building" value="bokji"/>
						</html:link>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="index_content">
		
	</div>
</div>
</body>
</html>