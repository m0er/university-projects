<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Meet-Up Meeting List Page</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/hot-sneaks/jquery-ui-1.8.16.custom.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/onoPager-basic.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/onoPager-theme-greyscale.css'/>"/>
	<script type="text/javascript" src="<c:url value="/js/jquery-1.7.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-ui-1.8.16.custom.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.easing.1.3.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.onopager.core.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.onopager.animation.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.onopager.tools.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.onopager.pager.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery.ez-bg-resize.js"/>"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("body").ezBgResize({
				img: "<c:url value='/image/bg.gif'/>"
			});
			
			$("#createMeeting").dialog({
				autoOpen: false,
				modal: true,
				resizable: false,
				title: "Create your meeting!",
				draggable: false,
				width: 400,
				buttons: {
					"Submit": function() {
						$(this).children().submit();
					}
				}
			});
			
			$("#createMeetingButton").click(function() {
				$("#createMeeting").dialog("open");
			});
			
			$(".leave").click(leaveClick);
			$(".join").click(joinClick);
			$(".delete").click(deleteClick);
			
			$("button").addClass("ui-button ui-widget ui-corner-all ui-button-text-only ui-state-default")
				.hover(function() {
					$(this).removeClass("ui-state-default").addClass("ui-state-hover");
				}, function() {
					$(this).removeClass("ui-state-hover").addClass("ui-state-default");
				}
			);
			
			function initButton($button) {
				$button.addClass("ui-button ui-widget ui-corner-all ui-button-text-only ui-state-default")
				.hover(function() {
					$button.removeClass("ui-state-default").addClass("ui-state-hover");
				}, function() {
					$button.removeClass("ui-state-hover").addClass("ui-state-default");
				});
			}
			
			function deleteClick() {
				var $button = $(this);
				var id = $button.attr("data-id");
				var url = "<c:url value='/meeting/delete/${meeting.id}'/>" + id;
				$.get(url, function(data) {
					console.log(data);
					var section = $button.parent().parent();
					$(section).fadeOut("slow", function() {
						$(this).remove();
						if ($("#meetingList").children().size() == 0)
							window.location = "<c:url value='/meeting/list'/>";
					});
				});
			}
			
			function leaveClick() {
				var $button = $(this);
				var $section = $(this).parent().parent();
				var id = $button.attr("data-id");
				var url = "<c:url value='/meeting/leave/'/>" + id;
				$.get(url, function(data) {
					console.log(data);
					$button.remove();
					var $newButton = $("<button>").addClass("join").text("참여하기").attr("data-id", id).click(joinClick);
					addButton($section, $newButton);
					var span = $newButton.parents().find("span")[0];
					$(span).fadeOut("slow", function() {
						$(this).text(parseInt($(span).text()) - 1).fadeIn("slow");
					});
				});
			}
			
			function joinClick() {
				var $button = $(this);
				var $section = $(this).parent().parent();
				var current = $button.parents().find("span")[0];
				var max = $button.parents().find("span")[1];
				if (parseInt($(current).text()) >= parseInt($(max).text())) {
					alert("꽉 찼습니다!");
					return;
				}
				
				var id = $button.attr("data-id");
				var url = "<c:url value='/meeting/join/'/>" + id;
				$.get(url, function(data) {
					console.log(data);
					$button.remove();
					var $newButton = $("<button>").addClass("leave").attr("data-id", id).text("취소하기").click(leaveClick);
					addButton($section, $newButton);
					var span = $newButton.parents().find("span")[0];
					$(span).fadeOut("slow", function() {
						$(this).text(parseInt($(span).text()) + 1).fadeIn("slow");
					});
				});
			}
			
			function addButton($section, $newButton) {
				var $footer = $section.children().last();
				var $children = $footer.children();
				$footer.empty();
				initButton($newButton);
				$footer.append($newButton);
				initButton($children);
				$children.click(deleteClick);
				$footer.append($children);
			}
		});
	</script>
	<style type="text/css">
		body {font-family:Arial, Helvetica, Sans-Serif; font-size:1.2em; margin:0px 20px;}
		form {font-size: 0.8em;}
		textarea {resize: none;}
		label {display: block;}
		input {width: 324px;}
		button {width: 142px; height: 51px;}
		
		#meetingList {
			margin: 10% auto;
			width: 50%;
			font-size: 0.8em;
			line-height: 0.8em;
		}
		
		#meetingList section {margin-bottom: 6%;}
		.title {float: left;}
		.count {float: right; margin-right: 10%;}
		.owner {clear: both;}
		
		#meetingList article {padding: 10px; margin-bottom: 5px;}
		
		#nothing {
			width: 50%;
			text-align: center;
			margin: 35% auto;
			font-size: 1.5em;
		}
		
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
            <c:if test="${sessionScope.login ne null}">
            	<li>Welcome ${sessionScope.login.email}!</li>
            </c:if>
            <li id="createMeetingButton"><a href="#">Create Meeting</a></li>
            <li id="logoutButton"><a href="<c:url value='/user/logout'/>">Logout</a></li>
		</ul>
	</nav>
	<section id="createMeeting">
		<form action="<c:url value="/meeting/add"/>" method="post">
			<label>주제:</label>
			<input type="text" name="title" placeholder="Java study"/>
			<label>모임 시작:</label>
			<input type="datetime" name="open" placeholder="2011-12-10 11:00"/>
			<label>모임 종료:</label>
			<input type="datetime" name="close" placeholder="2011-12-10 15:00"/>
			<label>장소:</label>
			<input type="text" name="location" placeholder="seoul"/>
			<label>최대인원:</label>
			<input type="number" min="1" name="limitAttendee" placeholder="10"/>
			<label>설명:</label>
			<textarea rows="5" cols="30" name="description" placeholder="some description"></textarea>
		</form>
	</section>
	<c:choose>
		<c:when test="${sessionScope.login eq null}">
			<jsp:forward page="/index"/>
		</c:when>
		<c:when test="${count eq 0}">
			<section id="nothing">
				<h1 class="ui-widget">try create your own meeting!</h1>
			</section>
		</c:when>
		<c:otherwise>
			<section id="meetingList">
				<c:forEach items="${meetingList}" var="meeting">
					<section id="${meeting.id}" class="ui-widget">
						<header class="ui-widget-header">
							<p class="title">제목: ${meeting.title}</p>
							<p class="count"><span>${meeting.attendeeCount}</span>/<span>${meeting.limitAttendee}</span>
							<p class="owner">주최자: ${meeting.owner}</p>
							<p>언제? ${meeting.open} ~ ${meeting.close}</p>
							<p>장소: ${meeting.location}</p>
						</header>
						<article class="ui-widget-content">
							${meeting.description}
						</article>
						<footer class="ui-widget">
							<c:choose>
								<c:when test="${meeting.join eq true}">
									<button class="leave" data-id="${meeting.id}">취소하기</button>
								</c:when>
								<c:otherwise>
									<button class="join" data-id="${meeting.id}">참여하기</button>
								</c:otherwise>
							</c:choose>
							<c:if test="${sessionScope.login.email eq meeting.owner}">
								<button class="delete" data-id="${meeting.id}">삭제하기</button>
							</c:if>
						</footer>
					</section>
				</c:forEach>
			</section>
		</c:otherwise>
	</c:choose>
</body>
</html>