<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="reservation_form" action="<c:url value="/reservation/register"/>" method="post">
	<fieldset>
		<legend>예약 폼</legend>
		<p>
			<label>날짜:</label>
			<input id="reservation_datepicker" type="text" name="date" class="text"/>
		</p>
		<button type="button">메뉴 검색</button>
	
		<section id="reservation_form2">
			<section>
				<header>다른 학생들의 평가:&nbsp;</header>
		        <article id="stars-rated-wrapper">
		            <select name="rateNumber">
		                <option value="1">맛없어요</option>
		                <option value="2">먹을만 해요</option>
		                <option value="3">보통이에요</option>
		                <option value="4">좋아요</option>
		                <option value="5">완전 맛있어요</option>
		            </select>
		        </article>
		        <article>
		        	<ul class="comment">
		        	</ul>
		        </article>
			</section>
			<p>
				<label>메뉴:</label>
				<select class="text" name="menuId">
					<option value="0">선택하세요</option>
				</select>
			</p>
			<p>
				<label>예약할 식당:</label>
				<input type="text" value="${originalBuildingName}" disabled="disabled" class="text"/>
				<input type="hidden" value="${building}" name="building"/>
			</p>
			<fieldset class="sub">
				<legend class="sub">예약 종류</legend>
				<article id="reservationType">
					<input type="radio" id="radio1" name="type" value="NORMAL" class="radio" checked="checked"/><label class="radioText">일반(점심시간 제외)</label>
					<input type="radio" id="radio2" name="type" value="LUNCH" class="radio"/><label class="radioText">점심(12:00 ~ 14:00) 남은 좌석 수: ${100 - lunchReservationListSize}</label>
				</article>
			</fieldset>
			<input type="submit" value="예약" class="submit"/>
		</section>
	</fieldset>
</form>