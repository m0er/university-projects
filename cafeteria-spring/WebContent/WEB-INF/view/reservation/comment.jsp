<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>백석대 구내식당 예약 시스템 // 사용자 커멘트 페이지 </title>
		
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
		
		<!-- Page Script -->
		<script type="text/javascript">
			$(document).ready(function() {
				$("select[name=menuId]").change(function() {
					var $list = $("section#list");
					$list.empty();
					
					var url = "<c:url value="/reservation/rate/"/>" + $(this).val();
					$.get(url, function(rateDto) {
						console.log(rateDto);
						$("#stars-rated-wrapper").stars("select", rateDto.averageRate);
						
						$.each(rateDto.rateList, function(i, rate) {
							var $article = $("<article>").text(rate.userId + " " + rate.comment + " " + rate.rateValue + "점").addClass("comment").hide();
							$list.append($article);
						});
						
						$("article.comment").fadeIn("slow");
					});
				});
				
				$("#stars-rated-wrapper").stars({
					inputType: "select",
					cancelShow: false,
					disabled: true
				});
			});
		</script>
		
		<style type="text/css">
		
		</style>
	</head>
<body id="comment">
	<jsp:include page="/WEB-INF/view/include/header.jsp"/>
	
	<section id="comment_contents">
		<nav id="comment_nav">
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
		</nav>
		<section id="comment_content">
			<h2>${originalBuildingName} 커멘트</h2>
			<section id="star-rate">
				<header>학생들의 평가:&nbsp;</header>
		        <article id="stars-rated-wrapper">
		            <select name="rateNumber">
		                <option value="1">맛없어요</option>
		                <option value="2">먹을만 해요</option>
		                <option value="3">보통이에요</option>
		                <option value="4">좋아요</option>
		                <option value="5">완전 맛있어요</option>
		            </select>
		        </article>
	        </section>
			<select class="text" name="menuId">
				<option value="0">메뉴를 선택하세요</option>
				<c:forEach items="${menuList}" var="menu">
					<option value="${menu.id}" class="text">${menu.title}</option>
				</c:forEach>
			</select>
			<section id="list">
			</section>
		</section>
	</section>
</body>
</html>