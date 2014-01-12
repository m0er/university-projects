<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>백석대 구내식당 예약 시스템 // 예약 페이지</title>
		
		<!-- jQuery -->
		<link rel="stylesheet" href="<c:url value="/style/ui-lightness/jquery-ui-1.8.16.custom.css"/>" type="text/css" media="all"/>
		<script type="text/javascript" src="<c:url value="/js/jquery-1.6.4.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.16.custom.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/jquery.ui.stars.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/quickpager.jquery.js"/>"></script>
		
		<!-- Page Styles -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/style/base.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/style/style.css"/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/js/jquery.ui.stars.min.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value="/style/paging.css"/>"/>
		
		<!-- Page Script -->
		<script type="text/javascript">
			$(document).ready(function() {
				/* jQuery DatePicker 초기화 */
				$.datepicker.setDefaults({
					dateFormat: 'yy-mm-dd',
					showMonthAfterYear: true,	
					monthNames: ['년 1 월','년 2 월','년 3 월','년 4 월','년 5 월','년 6 월','년 7 월','년 8 월','년 9 월','년 10 월','년 11 월','년 12 월'],
					dayNames: ['일', '월', '화', '수', '목', '금', '토'],
					dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
					buttonImageOnly: true,
					buttonText: "달력",
					buttonImage: "<c:url value="/image/calendar.gif"/>"
				});
				
				$("#reservation_datepicker").datepicker({
					showOn: "both"
				});
				
				$("#register_menu_datepicker").datepicker({
					showOn: "both"
				});
				
				$("span#show_reservation_form").click(function() {
					$("#reservation_form").css("display", "block");
				});
				
				$("span#show_menu_register_form").click(function() {
					$("#register_menu_form").css("display", "block");
				});
				
				$("#reservation_form button").button().click(function() {
					var $select = $("#reservation_form2 select");
					$.get("<c:url value="/reservation/searchmenu/location/${building}/date/"/>" + $("#reservation_datepicker").attr("value"),
							function(menuList) {
								$("#reservation_form button").hide();
								$("#reservation_form2").css("display", "block");
								
								$.each(menuList, function(i, menu) {
									console.log(menu);
									var option = $("<option>").attr("value", menu.id).addClass("text").text(menu.title + menu.price + "원");
									$select.append(option);
								});
							},
					"json");
					
					$select.change(function() {
						console.log("menu id: " + $(this).attr("value"));
						
						$(".simplePagerContainer ul.comment").empty();
						$(".simplePagerContainer .simplePagerNav").empty();
						
						if ($(this).attr("value") == 0) {
							$("#reservation_form2 section").fadeOut("slow");
							return;
						}
						
						var url = "<c:url value="/reservation/rate/"/>" + $(this).attr("value");
						console.log(url);
						$.get(url, function(rateDto) {
							console.log(rateDto);
							
							$("#reservation_form2 section").fadeIn("slow");
							$("#stars-rated-wrapper").stars("select", rateDto.averageRate);
							if (rateDto.size == 0) {
								$("#reservation_form2 section").append($("<p>").addClass("norated").text("평가가 없습니다"));
								return;
							}
							
							$("p.norated").remove();
							
							var rateList = rateDto.rateList;
							var $ul = $("ul.comment");
							$.each(rateList, function(i, rate) {
								var $li = $("<li>");
								$li.append($("<span>").text(rate.userId));
								$li.append(" " + rate.comment);
								$ul.append($li);
							});
							
							$("ul.comment").quickPager({
								pageSize: 3
							});
						});
					});
				});
				
				$("#reservation_form2 input[type=submit], #register_menu_form input[type=submit]").button();
				
				$("#dialog-rate-form").dialog({
					autoOpen: false,
					title: "평가해 주세요",
					height: 400,
					width: 450,
					modal: true,
					resizable: false,
					draggable: false,
					show: "slide",
					hide: "fadeOut",
					buttons: {
						"등록": function() {
							var $form = $("#dialog-rate-form form");
							$form.submit();
							$(this).dialog("close");
						}
					}
				});
				
				function hideLunchReservationSection() {
					if ($("#lunch_reservation_list table tr").size() == 1) {
						$("#lunch_reservation_list").hide();
						return true;
					}
					return false;
				}
				
				function hideNormalReservationSection() {
					if ($("#normal_reservation_list table tr").size() == 1) {
						$("#normal_reservation_list").hide();
						return true;
					}
					return false;
				}
				
				$("button[name=cancel]").button().click(function() {
					var $tr = $(this).parent().parent();
					var $button = $(this);
					$tr.hide("slow", function() {
						$tr.remove();
						reservationButtonAjax($button);
						hideLunchReservationSection();
						hideNormalReservationSection();
						
						if (hideLunchReservationSection() && hideNormalReservationSection()) {
							$("#reservation_content h2").remove();
							$("#reservation_content").append($("<p>").attr("id", "empty_reservation").text("등록된 예약이 없습니다."));
						}
					});
				});
				
				function reservationButtonAjax($target) {
					var url = "<c:url value="/"/>";
					console.log(url);
					url += "reservation/" + $target.attr("name") + "/id/" + $target.attr("data-reservation-id");
					console.log(url);
					
					$.get(url,
							function(response) {
								console.log(response);
							}
					);
				}
				
				$("button[name=confirm]").button().click(function() {
					var $target = $(this);
					confirm($target);
					reservationButtonAjax($target);
				});
				
				function confirm($target) {
					var $tr = $target.parent().parent();
					$tr.addClass("confirmed");
					$target.button("option", "disabled", true);
				}
				
				function checkConfirmed() {
					$("table button").each(function() {
						var $target = $(this);
						if ($target.attr("name") == "cancel" && $target.attr("data-confirmed") == "true") {
							$target.children().text("평가하기");
							$target.unbind().click(function() {
								var $dialog = $("#dialog-rate-form");
								var $form = $dialog.children();
								
								if ($("input[name=reservationId]").size() == 0) {
									var $reservationId = $("<input>").attr("type", "hidden").attr("name", "reservationId").attr("value", $target.attr("data-reservation-id"));
									$form.append($reservationId);
								} else {
									$("input[name=reservationId]").attr("value", $target.attr("data-reservation-id"));
								}
								
								if ($("input[name=menuId]").size() == 0) {
									var $menuId = $("<input>").attr("type", "hidden").attr("name", "menuId").attr("value", $target.attr("data-menu-id"));
									$form.append($menuId);
								} else {
									$("input[name=menuId]").attr("value", $target.attr("data-menu-id"));
								}
								
								$dialog.dialog("open");
							});
						} else if ($target.attr("data-confirmed") == "true") {
							confirm($target);
						}
					});
				}
				
				function checkRated() {
					$("table button").each(function() {
						$button = $(this);
						if ($button.attr("data-rated") == "true") {
							var $tr = $button.parent().parent();
							$tr.addClass("rated");
							$button.button("option", "disabled", true);
						}
					});
				}
				
				$("#stars-wrapper").stars({
					inputType: "select",
					captionEl: $("#stars-cap"),
					cancelShow: false,
					callback: function(value, link) {
						$form = $("#dialog-rate-form form");
						if ($("input[name=rateValue]").size() == 0) {
							$rate = $("<input>").attr("type", "hidden").attr("name", "rateValue").attr("value", $(this).attr("value"));
							$form.append($rate);
						} else {
							$("input[name=rateValue]").attr("value", $(this).attr("value"));
						}
					}
				});
				
				$("#stars-rated-wrapper").stars({
					inputType: "select",
					cancelShow: false,
					disabled: true
				});

				// initialize
				hideLunchReservationSection();
				hideNormalReservationSection();
				checkConfirmed();
				checkRated();
			});
		</script>
	</head>
<body id="reservation">
	<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	
	<section id="reservation_contents">
		<nav id="reservation_nav">
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
					<a href="<c:url value="/reservation/${building}"/>">예약 리스트</a>
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
		</nav>
		<section id="reservation_content">
			<jsp:include page="/WEB-INF/view/include/register_menu.jsp"/>
			<jsp:include page="/WEB-INF/view/include/reserve_menu.jsp"/>
			
			<!-- 예약 리스트 출력하는 부분 -->
			<c:choose>
				<c:when test="${normalReservationListSize eq 0 and lunchReservationListSize eq 0}">
					<p id="empty_reservation">등록된 예약이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<h2>${originalBuildingName} 예약 현황</h2>
						<article id="lunch_reservation_list">					
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
								<c:if test="${lunchReservationListSize ne 0}">
									<c:forEach var="reservation" items="${lunchReservationList}">
										<c:if test="${reservation.type eq 'LUNCH'}">
											<tr>
												<td>${reservation.reserveDate}</td>
												<td>${reservation.clientId}</td>
												<td>${reservation.name}</td>
												<td>${reservation.department}</td>
												<td>${reservation.title}</td>
												<td>
													<c:choose>
														<c:when test="${sessionScope.login.type eq 'ADMIN'}">
															<button name="confirm" data-reservation-id="${reservation.id}" data-confirmed="${reservation.confirmed}">판매</button>
														</c:when>
														<c:when test="${sessionScope.login.type eq 'USER' and reservation.clientId eq sessionScope.login.id}">
															<button name="cancel" data-reservation-id="${reservation.id}" data-confirmed="${reservation.confirmed}" data-menu-id="${reservation.menuId}" data-rated="${reservation.rated}">취소</button>
														</c:when>
													</c:choose>
												</td>
											</tr>							
										</c:if>
									</c:forEach>
								</c:if>
							</table>
						</article>
					
						<article id="normal_reservation_list">					
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
								<c:if test="${normalReservationListSize ne 0}">
									<c:forEach var="reservation" items="${normalReservationList}">
										<c:if test="${reservation.type eq 'NORMAL'}">
											<tr>
												<td>${reservation.reserveDate}</td>
												<td>${reservation.clientId}</td>
												<td>${reservation.name}</td>
												<td>${reservation.department}</td>
												<td>${reservation.title}</td>
												<td>
													<c:choose>
														<c:when test="${sessionScope.login.type eq 'ADMIN'}">
															<button name="confirm" data-reservation-id="${reservation.id}" data-confirmed="${reservation.confirmed}">판매</button>
														</c:when>
														<c:when test="${sessionScope.login.type eq 'USER' and reservation.clientId eq sessionScope.login.id}">
															<button name="cancel" data-reservation-id="${reservation.id}" data-confirmed="${reservation.confirmed}" data-menu-id="${reservation.menuId}" data-rated="${reservation.rated}">취소</button>
														</c:when>
													</c:choose>
												</td>
											</tr>							
										</c:if>
									</c:forEach>
								</c:if>
							</table>					
						</article>
				</c:otherwise>
			</c:choose>
			<section id="dialog-rate-form">
				<form action="<c:url value="/reservation/rate"/>" method="post">
					<p>평가: <span id="stars-cap"></span></p>
			        <article id="stars-wrapper">
			            <select name="rateNumber">
			                <option value="1">맛없어요</option>
			                <option value="2">먹을만 해요</option>
			                <option value="3" selected="selected">보통이에요</option>
			                <option value="4">좋아요</option>
			                <option value="5">완전 맛있어요</option>
			            </select>
			        </article>
					<textarea rows="10" cols="10" placeholder="입력하세요" name="comment"></textarea>
					<input type="hidden" value="${building}" name="building"/>
				</form>
			</section>
		</section>
	</section>
</body>
</html>