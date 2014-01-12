<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>백석대 구내식당 예약 시스템 // 메인 페이지</title>
		
		<!-- jQuery -->
		<link rel="stylesheet" href="<c:url value="/style/ui-lightness/jquery-ui-1.8.16.custom.css"/>" type="text/css" media="all"/>
		<script type="text/javascript" src="<c:url value="/js/jquery-1.6.4.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.16.custom.min.js"/>"></script>
		
		<!-- Page Styles -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/style/base.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/style/style.css"/>"/>
		
		<!-- Page Script -->
		<script type="text/javascript">
			$(document).ready(function() {
				$("input[type=submit]").button();
			});
		</script>
	</head>
<body id="index">
	<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	
	<section id="index_contents">
		<nav id="index_nav">
			<c:choose>
				<c:when test="${sessionScope.login eq null}">
					<h2>로그인</h2>
					<form id="form" action="<c:url value="/user/login"/>" method="post">
						<p>
							<input type="text" name="id" class="text" autocomplete="off" placeholder="학번/교번"/>
						</p>
						<p>
							<input type="password" name="pw" class="text" autocomplete="off" placeholder="비밀번호"/>
							<input type="submit" value="로그인"/>
						</p>
					</form>
				</c:when>
				<c:otherwise>
					<h2>${sessionScope.login.name}님 로그인</h2>
					<ul>
						<li>
							<a href="<c:url value="/user/logout"/>">로그아웃</a>
						</li>
						<c:choose>
							<c:when test="${sessionScope.login.type eq 'USER'}">
								<li>
									<a href="<c:url value="/reservation/bonbu"/>">본부동</a>
								</li>
								<li>
									<a href="<c:url value="/reservation/prof"/>">교수회관</a>
								</li>
								<li>
									<a href="<c:url value="/reservation/bokji"/>">복지동</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="<c:url value="/reservation/${sessionScope.login.id}"/>">${sessionScope.login.building}</a>
								</li>
								<li>
									<a href="<c:url value="/statistics/${sessionScope.login.id}"/>">통계현황</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
		<section id="index_content">
		</section>
	</section>
</body>
</html>