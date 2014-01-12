<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form id="register_menu_form" action="<c:url value="/reservation/menu/add"/>" method="post">
	<fieldset>
		<legend>메뉴 등록</legend>
		<p>
			<label>이름:</label>
			<input type="text" name="title" class="text"/>
		</p>
		<p>
			<label>가격:</label>
			<input type="text" name="price" class="text"/>
		</p>
		<p>
			<label>판매 위치:</label>
			<input type="text" value="${originalBuildingName}" disabled="disabled" class="text"/>
			<input type="hidden" value="${building}" name="building"/>
		</p>
		<p>
			<label>판매 날짜:</label>
			<input id="register_menu_datepicker" type="text" name="provideString" class="text"/>
		</p>
		<input type="submit" value="등록하기" class="submit">
	</fieldset>
</form>
