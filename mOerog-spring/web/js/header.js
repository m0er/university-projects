function selectMenu(menu) {
	if (document.getElementById("loginForm").style.display == "block") {
		document.getElementById("loginForm").style.display = "none";
		return;
	}
	else if (document.getElementById("registerForm").style.display == "block") {
		document.getElementById("registerForm").style.display = "none";
		return;
	}
	if (menu==1) {
		document.getElementById("loginForm").style.display = "block";
	}
	else if (menu==2) {
		document.getElementById("registerForm").style.display = "block";
	}
}

function showCommentForm(show, postID) {
	if (document.getElementById("commentForm" + postID).style.display == "block") {
		document.getElementById("commentForm" + postID).style.display = "none";
		return;
	}
	if (show==true) {
		document.getElementById("commentForm" + postID).style.display = "block";
	}
}

function addComment(postId) {
	document.getElementById(postId + "thCommentForm").submit();
}
