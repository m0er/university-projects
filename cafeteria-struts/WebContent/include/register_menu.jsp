<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<div id="plex_register_menu_form">
	<html:form>
		<fieldset>
			<legend>�޴� ���</legend>
			<p>
				<label>�̸�:</label>
				<html:text property="title" styleClass="text"/>
			</p>
			<p>
				<label>����:</label>
				<html:text property="price" styleClass="text"/>
			</p>
			<p>
				<label>�Ǹ� ��ġ:</label>
				<input type="text" value="${requestScope.building}" disabled="disabled" name="building" class="text"/>
			</p>
			<p>
				<label>�Ǹ� ��¥:</label>
				<input id="register_menu_datepicker" type="text" name="provideDateAlt" class="text"/>
			</p>
			<html:hidden property="registerMenu"/>
			<html:submit value="����ϱ�" styleClass="submit"/>
		</fieldset>
	</html:form>
</div>