<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<div id="wrap">
	<div id="profile">
		<c:choose>
			<c:when test="${sessionScope.isLogin eq null or 'false'}">
				<html:form action="user">
					<p>Admin Login</p>
					<p>
						<label for="loginId">ID:</label>
						<html:text property="userId" styleId="loginId" styleClass="login"/>
					</p>
					<p>
						<label for="loginPassword">PW:</label>						
						<html:password property="userPword" styleId="loginPassword" styleClass="login" redisplay="false"/>
					</p>					
					<p>
						<html:hidden property="adminLogin"/>
						<html:submit value="로그인"/>
					</p>
				</html:form>
			</c:when>
			<c:when test="${sessionScope.isAdmin eq 'true'}">		
				<p><a href="mailto:${user.userEmail}">${user.userNickname}</a>&nbsp;:)</p>
				<p class="writePost">
					<html:link action="post" title="포스트 작성">
						포스트 작성
						<html:param name="write"/>
					</html:link>
				</p>
				<p>
					<html:link action="user">
						Logout
						<html:param name="logout" value=""/>
					</html:link>
				</p>
			</c:when>
			<c:otherwise>
				<p>Welcome <strong>${user.userNickname}</strong></p>
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
									<html:link action="post" title="ESL 관련 페이지">
										ESL
										<html:param name="category" value="esl"/>
									</html:link>
								</li>
								<li>
									<html:link action="post" title="ClanBase 관련 페이지">
										ClanBase
										<html:param name="category" value="clanbase"/>
									</html:link>
								</li>
								<li>
									<html:link action="post" title="e-Sports 관련 Media 페이지">
										Media
										<html:param name="category" value="media"/>
									</html:link>
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
						<li><html:link action="guestbook" title="방명록 페이지">Guestbook</html:link></li>
					</ul>
				</li>				
			</ul>
	</div>
	<a href="http://www.esreality.com"><img class="banner3" src="Image/esr_box.gif" alt="esreality banner" /></a>
	<a href="http://clanbase.ggl.com/news.php"><img class="banner2" src="Image/clanbase_banner.jpg" alt="ClanBase Banner" /></a>
</div>