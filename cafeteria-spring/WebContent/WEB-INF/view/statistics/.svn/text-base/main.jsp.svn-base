<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>백석대 구내식당 예약 시스템 // 통계 페이지</title>
	
	<!-- jQuery -->
	<link rel="stylesheet" href="<c:url value="/style/ui-lightness/jquery-ui-1.8.16.custom.css"/>" type="text/css" media="all"/>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.6.4.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.16.custom.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.flot.js"/>"></script>
	
	<!-- Page Styles -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/style/base.css"/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value="/style/style.css"/>"/>
	
	<!-- Page Script -->
	<script type="text/javascript">
		$(document).ready(function() {
			$.get("<c:url value="/statistics/today/${sessionScope.login.id}"/>",
					function(statisticsList) {
						if (statisticsList.length == 0) {
							$("#statistics_content h2").text("오늘 예약 현황이 없습니다").attr("id", "empty_reservation");
							return;
						}
						
						var dialog = new Object();
						dialog.yaxis = {min: 0};
						dialog.legend = {backgroundOpacity: 0.3 };
						
						var xaxis = new Object();
						xaxis.ticks = new Array();
						
						var dailySellingDatas = new Array();
						
						$.each(statisticsList, function(i, statistics) {
							var data = new Object();
							data.label = statistics.title;
							
							if (i == 0) {
								data.data = [[0, statistics.count]];
								var tick = [0.01, statistics.title];
								xaxis.ticks.push(tick);
							} else {
								data.data = [[i, statistics.count]];
								var tick = [i, statistics.title];
								xaxis.ticks.push(tick);
							}
							
							data.bars = {show: true, barWidth: 0.5, align: "center"};
							console.log(data);
							
							dailySellingDatas.push(data);
						});
						dialog.xaxis = xaxis;
						
						console.log(dailySellingDatas);
						console.log(dialog);
						
						$.plot($("#placeholder"), dailySellingDatas, dialog);
					}
			);
		});
	</script>
</head>
<body id="statistics">
	<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	
	<section id="statistics_contents">
		<nav id="statistics_nav">
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
						<li>
							<a href="<c:url value="/index"/>">건물선택</a>
						</li>
						<c:choose>
								<c:when test="${sessionScope.login.type eq 'USER'}">
									<li>
										<span id="show_reservation_form" class="menu">예약하기</span>
									</li>
								</c:when>
								<c:when test="${sessionScope.login.type eq 'ADMIN'}">
									<li>
										<span id="show_menu_register_form" class="menu">메뉴 등록</span>
									</li>
								</c:when>
						</c:choose>
						<li>
							<a href="<c:url value="/reservation/${sessionScope.login.id}"/>">예약 리스트</a>
						</li>
						<c:if test="${sessionScope.login.type eq 'ADMIN'}">
							<li>
								<a href="<c:url value="/reservation/comment/${sessionScope.login.id}"/>">커멘트 보기</a>
							</li>
							<li>
								<a href="<c:url value="/statistics/${sessionScope.login.id}"/>">통계현황</a>
							</li>
						</c:if>
					</ul>
				</c:otherwise>
			</c:choose>
		</nav>
		<section id="statistics_content">
			<h2>오늘 예약 현황</h2>
			<div id="placeholder" style="width: 450px; height: 300px;"></div>
		</section>
	</section>
</body>
</html>