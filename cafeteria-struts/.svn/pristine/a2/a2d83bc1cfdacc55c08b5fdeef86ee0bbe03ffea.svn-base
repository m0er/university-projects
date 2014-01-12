<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<div id="plex_register_menu_form">
	<html:form>
		<fieldset>
			<legend>메뉴 등록</legend>
			<p>
				<label>이름:</label>
				<html:text property="title" styleClass="text"/>
			</p>
			<p>
				<label>가격:</label>
				<html:text property="price" styleClass="text"/>
			</p>
			<p>
				<label>판매 위치:</label>
				<input type="text" value="${requestScope.building}" disabled="disabled" name="building" class="text"/>
			</p>
			<p>
				<label>판매 날짜:</label>
				<input id="register_menu_datepicker" type="text" name="provideDateAlt" class="text"/>
			</p>
			<html:hidden property="registerMenu"/>
			<html:submit value="등록하기" styleClass="submit"/>
		</fieldset>
	</html:form>
</div>