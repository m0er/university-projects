<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<div id="wrap">
	<div id="profile">
		<c:choose>
			<c:when test="${sessionScope.loginUser eq null or sessionScope.loginUser.login eq false}">				
				<form:form action="/user/adminlogin" method="post" commandName="user">
					<p>Admin Login</p>
					<p>
						<label for="loginId">ID:</label>
						<form:input path="userId" id="loginId" cssClass="login"/>
					</p>
					<p>
						<label for="loginPassword">PW:</label>
						<form:password path="password" id="loginPassword" cssClass="login"/>
					</p>					
					<p>
						<input type="submit" value="로그인"/>
					</p>
				</form:form>
			</c:when>
			<c:when test="${sessionScope.loginUser.admin}">
				<p><a href="mailto:${sessionScope.loginUser.email}">${sessionScope.loginUser.nickname}</a>&nbsp;:)</p>
				<p class="writePost">
					<a href="<spring:url value="/post/form" />">포스트 작성</a>
				</p>
				<p>
					<a href="<spring:url value="/user/logout" />">Logout</a>
				</p>
			</c:when>
			<c:otherwise>
				<p>Welcome <strong>${sessionScope.loginUser.nickname}</strong></p>
			</c:otherwise>
		</c:choose>
		<p class="ccl"><a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/2.0/kr/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc-nd/2.0/kr/88x31.png" title="저작자표시-비영리-변경금지" /></a></p>
	</div>
	<div id="sidebar">
			<ul>
				<li><h2>info.</h2>					
					<ul>
						<li><a>News-</a>
							<ul>
								<li>
									<a href="<spring:url value="/post/list">
												<spring:param name="category" value="1"/>
											</spring:url>" title="ESL 관련 페이지">
									ESL</a>
								</li>
								<li>
									<a href="<spring:url value="/post/list">
												<spring:param name="category" value="2"/>
											</spring:url>" title="ClanBase 관련 페이지">
									ClanBase</a>
								</li>
								<li>
									<a href="<spring:url value="/post/list">
												<spring:param name="category" value="3"/>
											</spring:url>" title="e-Sports 관련 Media 페이지">
									Media</a>
								</li>
							</ul>
						</li>		
					</ul>
				</li>
			</ul>
			<ul>
				<li><h2>Talk!</h2>
					<ul>
						<li><a href="#">Board</a></li>
					</ul>
				</li>
			</ul>
			<ul>
				<li><h2>hello?</h2>
					<ul>
						<li>
							<a href="<spring:url value="/guestbook/list" />" title="ClanBase 관련 페이지">Guestbook</a>
						</li>
					</ul>
				</li>				
			</ul>
	</div>
	<a href="http://www.esreality.com"><img class="banner3" src="<c:url value="/image/esr_box.gif" />" alt="esreality banner" /></a>
	<a href="http://clanbase.ggl.com/news.php"><img class="banner2" src="<c:url value="/image/clanbase_banner.jpg" />" alt="ClanBase Banner" /></a>
</div>