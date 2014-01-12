<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function priceSelect() {
	var e = document.getElementById("menu");
	alert(e.tabindex);
}
</script>

<div id="plex_reserve_form">	
	<html:form>
		<fieldset>
			<legend>음식 예약</legend>
			<p>
				<label>날짜:</label>
				<input type="text" name="searchDate" value="${requestScope.searchDate}" disabled="disabled" class="text"/>		
			</p>
			<p>
				<label>메뉴:</label>
				<html:select property="menuID" styleClass="text">
					<c:forEach var="food" items="${requestScope.menu}">
						<option value="${food.id}" class="text">${food.title} ${food.price}원</option>
					</c:forEach>
				</html:select>
			</p>
			<p>
				<label>예약할 식당:</label>
				<html:text property="building" value="${building}" disabled="true" styleClass="text"/>
			</p>			
			<fieldset class="sub">
				<legend class="sub">예약 종류</legend>
				<html:radio property="type" value="NORMAL" styleClass="radio"/><label class="radioText">일반(점심시간 제외)</label>
				<html:radio property="type" value="LUNCH" styleClass="radio"/><label class="radioText">점심(12:00 ~ 14:00)</label>
			</fieldset>			
			<html:hidden property="clientID" value="${sessionScope.user.id}"/>
			<html:hidden property="reserve"/>
			<html:submit value="예약" styleClass="submit"/>
		</fieldset>
	</html:form>
</div>
