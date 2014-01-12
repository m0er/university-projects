<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>백석대 음식 판매 시스템 // 플렉스 페이지</title>
<link rel="stylesheet" type="text/css" href="style/base.css"/>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
<link rel="stylesheet" type="text/css" href="themes/jquery.ui.all.css"/>
<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="js/ui/jquery.effect.core.js"></script>
<script type="text/javascript" src="js/ui/jquery.effect.blind.js"></script>
<script type="text/javascript" src="js/ui/jquery.effect.drop.js"></script>
<script type="text/javascript" src="js/ui/jquery.effect.explode.js"></script>
<script type="text/javascript" src="js/ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="js/plex.page.function.js"></script>
</head>
<body id="plex">
<jsp:include page="include/header.jsp"/>
<div id="plex_contents">
	<div id="plex_nav">
		<c:choose>
			<c:when test="${sessionScope.user.type eq 'USER'}">
				<h2>${sessionScope.user.name}님 로그인</h2>
				<ul>
					<li>
						<html:link action="/index" useLocalEncoding="true">로그아웃
							<html:param name="logout"/>
						</html:link>
					</li>
					<li>
						<html:link action="/index" useLocalEncoding="true">건물선택</html:link>
					</li>
					<li>
						<a href="#" onclick="showReserveMenu();">예약하기</a>
					</li>
					<li>
						<html:link action="plex">리스트</html:link>
					</li>
				</ul>
			</c:when>
			<c:when test="${sessionScope.user.type eq 'ADMIN'}">
				<ul>
					<li>
						<html:link action="/index" useLocalEncoding="true">로그아웃
							<html:param name="logout"/>
						</html:link>
					</li>
					<li>
						<html:link action="/index" useLocalEncoding="true">건물선택</html:link>
					</li>
					<li>
						<!-- 클릭했을 때, 폼 보여주기 -->
						<a href="#" onclick="showRegisterMenu();">메뉴 등록</a>
					</li>
					<li>
						<html:link action="plex">리스트</html:link>
					</li>
				</ul>
			</c:when>
		</c:choose>
	</div>
	<div id="plex_content">
		<div id="plex_register_menu_form" style="display: none">
			<jsp:include page="include/register_menu.jsp"/>
		</div>
		
		<div id="plex_pre_reserve_menu_form" style="display: none">
			<html:form>
				<fieldset>
					<legend>음식 예약</legend>
					<div id="calendar">
						<label>날짜</label>
						<input id="pre_reservation_datepicker" type="text" name="searchDate" class="text"/>
					</div>
					<html:hidden property="searchMenu"/>
					<html:hidden property="building" value="${building}"/>
					<html:submit value="메뉴 검색"/>
				</fieldset>
			</html:form>
		</div>
		
		<c:if test="${requestScope.menu ne null}">
			<div id="plex_reserve_menu_form">
				<jsp:include page="include/reserve_menu.jsp"/>
			</div>
		</c:if>
		
		<!-- 예약 리스트 출력하는 부분 -->
		<c:choose>
			<c:when test="${requestScope.reservations eq null}">
				<p id="plex_empty_reservation">등록된 예약이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<h2>${building} 예약 현황</h2>
				<div id="plex_lunch_reservation_list">					
					<table>
						<caption>점심 예약</caption>
						<tr>
							<th scope="col">예약 날짜</th>
							<th scope="col">학번/교번</th>
							<th scope="col">이름</th>
							<th scope="col">학과/부서</th>
							<th scope="col">음식 이름</th>
							<th scope="col"></th>
						</tr>
						<c:forEach items="${requestScope.reservations}" var="reservation">
							<c:if test="${reservation.type eq 'LUNCH'}">
								<tr>
									<td>${reservation.dateForm}</td>
									<td>${reservation.clientID}</td>
									<td>${reservation.name}</td>
									<td>${reservation.department}</td>
									<td>${reservation.title}</td>
									<td>
										<c:choose>
											<c:when test="${sessionScope.user.type eq 'ADMIN'}">
												<html:link action="plex">
													판매
													<html:param name="id" value="${reservation.id}"/>
													<html:param name="sell"/>
												</html:link>
											</c:when>
											<c:when test="${sessionScope.user.type eq 'USER' and reservation.clientID eq sessionScope.user.id}">
												<html:link action="plex">
													취소
													<html:param name="id" value="${reservation.id}"/>
													<html:param name="cancel"/>
												</html:link>
											</c:when>
										</c:choose>
									</td>
								</tr>							
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div id="plex_normal_reservation_list">					
					<table>
						<caption>일반 예약</caption>
						<tr>
							<th scope="col">예약 날짜</th>
							<th scope="col">학번/교번</th>
							<th scope="col">이름</th>
							<th scope="col">학과/부서</th>
							<th scope="col">음식 이름</th>
							<th scope="col"></th>
						</tr>
						<c:forEach items="${requestScope.reservations}" var="reservation">
							<c:if test="${reservation.type eq 'NORMAL'}">
								<tr>
									<td>${reservation.dateForm}</td>
									<td>${reservation.clientID}</td>
									<td>${reservation.name}</td>
									<td>${reservation.department}</td>
									<td>${reservation.title}</td>
									<td>
										<c:choose>
											<c:when test="${sessionScope.user.type eq 'ADMIN'}">
												<html:link action="plex">
													판매
													<html:param name="id" value="${reservation.id}"/>
													<html:param name="sell"/>
												</html:link>
											</c:when>
											<c:when test="${sessionScope.user.type eq 'USER' and reservation.clientID eq sessionScope.user.id}">
												<html:link action="plex">
													취소
													<html:param name="id" value="${reservation.id}"/>
													<html:param name="cancel"/>
												</html:link>
											</c:when>
										</c:choose>
									</td>
								</tr>							
							</c:if>
						</c:forEach>
					</table>					
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</body>
</html>