<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Meet-Up Main page</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/hot-sneaks/jquery-ui-1.8.16.custom.css'/>"/>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.7.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.16.custom.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.ez-bg-resize.js"/>"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("body").ezBgResize({
				img: "<c:url value='/image/meetup1.png'/>"
			});
			
			$("#join").dialog({
				autoOpen: false,
				modal: true,
				resizable: false,
				title: "Join to MeetUp!",
				draggable: false,
				buttons: {
					"Join": function() {
						$(this).children().submit();
					}
				}
			});
			
			$("#login").dialog({
				autoOpen: false,
				modal: true,
				resizable: false,
				title: "Login to MeetUp!",
				draggable: false,
				buttons: {
					"Login": function() {
						$(this).children().submit();
					}
				}
			});
			
			$("#joinButton").click(function() {
				$("#join").dialog("open");
			});
			
			$("#loginButton").click(function() {
				$("#login").dialog("open");
			});
		});
	</script>
	<style type="text/css">
		body {font-family:Arial, Helvetica, Sans-Serif; font-size:1.2em; margin:0px 20px;}
		label {display: block;}
		
		/* menu position */
		nav {position: absolute; top: 0; right: 0;}
		
		/* menu */
        nav ul { margin:0px; padding:0px; list-style:none; color:#fff; line-height:45px; display:inline-block; float:left; z-index:1000; }
        nav ul a { color:#fff; text-decoration:none; }
        nav ul > li {background:#172322 none repeat scroll 0 0; cursor:pointer; float:left; position:relative;padding:0px 10px;}
        nav ul > li a:hover {color:#B0D730;}
        nav ul .logo {background:transparent none repeat scroll 0% 0%; padding:0px; background-color:Transparent;}
        nav ul .logo img {width: 150px; height: 45px;}
        
        /* corners*/
        nav ul .corner_inset_left { position:absolute; top:0px; left:-12px;}
        nav ul .corner_inset_right { position:absolute; top:0px; left:150px;}
        nav ul .last { background:transparent none repeat scroll 0% 0%; margin:0px; padding:0px; border:none; position:relative; border:none; height:0px;}
        nav ul .corner_left { position:absolute; left:0px; top:0px;}
        nav ul .corner_right { position:absolute; left:132px; top:0px;}
        nav ul .middle { position:absolute; left:18px; height: 20px; width: 115px; top:0px;}
	</style>
</head>
<body>
	<nav>
		<ul>
			<li class="logo">
				<a href="<c:url value="/index"/>">
                	<img style="float:left;" alt="meet-up menu title" src="<c:url value="/image/vimeo-nav/meetup-menu-left.png"/>"/>
                </a>
            </li>
            <c:choose>
            	<c:when test="${sessionScope.login ne null}">
            		<li>Welcome ${sessionScope.login.email}!</li>
		            <li id="logoutButton"><a href="<c:url value='/user/logout'/>">Logout</a></li>
		            <li><a href="<c:url value='/meeting/list'/>">Meeting List</a></li>
            	</c:when>
            	<c:otherwise>
		            <li id="loginButton"><a href="#">Login</a></li>
		            <li id="joinButton"><a href="#">Join</a></li>
            	</c:otherwise>
            </c:choose>
		</ul>
	</nav>
	<c:choose>
		<c:when test="${sessionScope.login eq null}">
			<section id="join">
				<form action="<c:url value="/user/add"/>">
					<label for="email">email</label>
					<input type="text" name="email" class="ui-widget-content ui-corner-all"/>
					<label for="password">password</label>
					<input type="password" name="password" autocomplete="off" class="ui-widget-content ui-corner-all"/>
				</form>
			</section>
			<section id="login">
				<form action="<c:url value="/user/login"/>">
					<label for="email">email</label>
					<input type="text" name="email" class="ui-widget-content ui-corner-all"/>
					<label for="password">password</label>
					<input type="password" name="password" class="ui-widget-content ui-corner-all"/>
				</form>
			</section>
		</c:when>
	</c:choose>
</body>
</html>